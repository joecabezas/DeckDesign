package menus.izquierda.galeria
{
	import com.greensock.TweenLite;
	import com.somerandomdude.coordy.layouts.twodee.HorizontalLine;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class LinearCarrousel extends Sprite
	{
		//constantes
		public static const CANTIDAD_ELEMENTOS_A_MOSTRAR:int = 9;
		static public const VELOCIDAD:Number = -0.4;
		
		//vars
		private var data:Object;
		private var items:Vector.<GaleriaImageNode>;
		
		private var _indice_primera_imagen_del_slide:int = 0;
		
		//ui
		private var layout:ILayout2d;
		
		//sprites
		private var _slide:Sprite;
		private var _mascara:Sprite;
		private var _shouldStop:Boolean = false;
		
		public function LinearCarrousel(data:Object)
		{
			this.data = data;
			
			this.setup();
			this.setupItems();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.items = new Vector.<GaleriaImageNode>;
			
			this._mascara = new Sprite();
			this._mascara.graphics.beginFill(0xff0000, 0.5);
			this._mascara.graphics.drawRect(0, 0, 500, 500 / CANTIDAD_ELEMENTOS_A_MOSTRAR);
			this._mascara.graphics.endFill();
		}
		
		private function setupItems():void
		{
			if (!this.data)
				return;
			
			for (var i:int = 0; i < this.data.length; i++)
			{
				var item:Object = this.data[i];
				this.items.push(new GaleriaImageNode(item.imagen_chica, item.imagen_grande, item.content_title, item.content_text));
				
					//TODO: permitir mas de 9
					//if (i >= 5)
					//	break;
			}
		}
		
		private function agregarListeners():void
		{
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			this.addEventListener(MouseEvent.ROLL_OVER, onRollOver);
			this.addEventListener(MouseEvent.ROLL_OUT, onRollOut);
		}
		
		private function onRollOver(e:MouseEvent):void
		{
			this._shouldStop = true;
		}
		
		private function onRollOut(e:MouseEvent):void
		{
			this._shouldStop = false;
		}
		
		private function onEnterFrame(e:Event):void
		{
			//trace(this.items.length);
			if (this.items.length <= CANTIDAD_ELEMENTOS_A_MOSTRAR)
				return;
			
			if (this._shouldStop)
				return;
			
			this._slide.x += VELOCIDAD;
			
			if (this._slide.x < -500 / CANTIDAD_ELEMENTOS_A_MOSTRAR)
			{
				if (this._slide && this.contains(this._slide))
				{
					this.removeChild(this._slide);
				}
				
				this._indice_primera_imagen_del_slide++;
				
				this._indice_primera_imagen_del_slide = this._indice_primera_imagen_del_slide % this.items.length;
				//trace('_indice_primera_imagen_del_slide:', _indice_primera_imagen_del_slide);
				
				this._slide = this.crearNuevoSlide(this._indice_primera_imagen_del_slide);
				this.addChild(this._slide);
				this._slide.x = 0;
			}
		}
		
		private function crearNuevoSlide(starting_index:int):Sprite
		{
			var sprite:Sprite = new Sprite();
			this.layout = new HorizontalLine();
			
			var s:String = '';
			
			for (var i:int = 0; i < CANTIDAD_ELEMENTOS_A_MOSTRAR + 1; i++)
			{
				var index:int = (starting_index + i) % this.items.length; //deberia ser items.length an ves de CANTI....
				
				if (index >= this.items.length)
					break;
				
				s += index + ',';
				
				sprite.addChild(this.items[index]);
				this.layout.addNode(this.items[index], false);
			}
			this.layout.updateAndRender();
			
			//trace(s);
			
			return sprite;
		}
		
		private function dibujar():void
		{
			this._slide = this.crearNuevoSlide(this._indice_primera_imagen_del_slide);
			this.addChild(this._slide);
			
			this.addChild(this._mascara);
			this.mask = this._mascara;
		}
	
	}

}