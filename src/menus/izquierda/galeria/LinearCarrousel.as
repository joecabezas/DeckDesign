package menus.izquierda.galeria
{
	import com.somerandomdude.coordy.layouts.twodee.HorizontalLine;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class LinearCarrousel extends Sprite
	{
		//constantes
		public static const CANTIDAD_ELEMENTOS_A_MOSTRAR:int = 9;
		
		//vars
		private var data:Object;
		private var items:Vector.<GaleriaImageNode>;
		
		//ui
		private var layout:ILayout2d;
		
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
			this.layout = new HorizontalLine();
			
			this.items = new Vector.<GaleriaImageNode>;
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
				if (i >= CANTIDAD_ELEMENTOS_A_MOSTRAR -1)
					break;
			}
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			for each (var n:GaleriaImageNode in this.items)
			{
				this.addChild(n);
				this.layout.addNode(n, false);
			}
			this.layout.updateAndRender();
		}
	
	}

}