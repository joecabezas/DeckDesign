package menus.izquierda.galeria
{
	import com.as3joelib.graphics.primitives.TriangleIcon;
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
		static public const VELOCIDAD:Number = 0.5;
		
		private var direccion:int = -1;
		
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
		
		//buttons
		private var _left_button:TriangleIcon;
		private var _right_button:TriangleIcon;
		
		public function LinearCarrousel(data:Object)
		{
			this.data = data;
			
			this.setup();
			this.setupItems();
			this.dibujar();
			this.agregarListeners();
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
				this.items.push(new GaleriaImageNode(i, item.imagen_chica, item.imagen_grande, item.content_title, item.content_text));
				
				//TODO: permitir mas de 9
				//if (i >= 5)
				//	break;
			}
			
			var triangle_params:Object = {fillColor: 0x555555, lineAlpha: 0};
			this._left_button = new TriangleIcon(triangle_params);
			this._right_button = new TriangleIcon(triangle_params);
		}
		
		private function agregarListeners():void
		{
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			this._slide.addEventListener(MouseEvent.ROLL_OVER, onRollOverSlide);
			this._slide.addEventListener(MouseEvent.ROLL_OUT, onRollOutSlide);
			
			this._left_button.addEventListener(MouseEvent.CLICK, onClickLeftButton);
			this._right_button.addEventListener(MouseEvent.CLICK, onClickRightButton);
		}
		
		private function onClickRightButton(e:MouseEvent):void
		{
			this.direccion = 1;
		}
		
		private function onClickLeftButton(e:MouseEvent):void
		{
			this.direccion = -1;
		}
		
		private function onRollOverSlide(e:MouseEvent):void
		{
			this._shouldStop = true;
		}
		
		private function onRollOutSlide(e:MouseEvent):void
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
			
			this._slide.x += this.direccion * VELOCIDAD;
			
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
				this._slide.mask = this._mascara;
				this._slide.x = 0;
			}
			
			if (this._slide.x > 0)
			{
				if (this._slide && this.contains(this._slide))
				{
					this.removeChild(this._slide);
				}
				
				this._indice_primera_imagen_del_slide--;
				
				this._indice_primera_imagen_del_slide = (this._indice_primera_imagen_del_slide < 0) ? this.items.length - 1 : this._indice_primera_imagen_del_slide;
				
				//trace('this._indice_primera_imagen_del_slide', this._indice_primera_imagen_del_slide);
				
				this._slide = this.crearNuevoSlide(this._indice_primera_imagen_del_slide);
				this.addChild(this._slide);
				this._slide.mask = this._mascara;
				this._slide.x = -500 / CANTIDAD_ELEMENTOS_A_MOSTRAR;
			}
		}
		
		private function crearNuevoSlide(starting_index:int):Sprite
		{
			var sprite:Sprite = new Sprite();
			this.layout = new HorizontalLine();
			
			var s:String = '';
			
			//agregar ultimo elemento al principio
			sprite.addChild(this.items[this.items.length - 1]);
			
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
			this._slide.x = -500 / CANTIDAD_ELEMENTOS_A_MOSTRAR;
			
			this.addChild(this._mascara);
			this._slide.mask = this._mascara;
			
			//this.addChild(this._left_button);
			//this._left_button.width = this._slide.height * 0.9;
			//this._left_button.height = 20;
			//this._left_button.y = this._mascara.height / 2;
			//this._left_button.x = -this._left_button.height / 2 - 5;
			//this._left_button.rotation = -90;
			//
			//this.addChild(this._right_button);
			//this._right_button.width = this._slide.height * 0.9;
			//this._right_button.height = 20;
			//this._right_button.y = this._mascara.height / 2;
			//this._right_button.x = this._mascara.width + this._right_button.height / 2 + 5;
			//this._right_button.rotation = 90;
		}
	
	}

}