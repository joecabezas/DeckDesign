package menus.izquierda.galeria
{
	import com.somerandomdude.coordy.layouts.twodee.Grid;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuIzquierdaGaleriaContent extends Sprite
	{
		//vars
		private var items:Vector.<GaleriaImageNode>
		
		//ui
		private var fondo:Sprite;
		private var layout:ILayout2d;
		
		//data
		private var data:Object;
		
		//si los datos son null, entonces dibujar solo el fondo
		public function MenuIzquierdaGaleriaContent(data:Object = null)
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
			
			this.fondo = new Sprite();
			this.fondo.graphics.beginFill(ApplicationConfiguration.COLOR_BACKGROUND_APPLICATION);
			this.fondo.graphics.drawRect(0, 0, ApplicationConfiguration.MAIN_CONTENT_WIDTH, ApplicationConfiguration.MAIN_CONTENT_HEIGHT);
			this.fondo.graphics.endFill();
			
			this.layout = new Grid(ApplicationConfiguration.MAIN_CONTENT_WIDTH * 0.8, ApplicationConfiguration.MAIN_CONTENT_HEIGHT * 0.8, 5, 4, 10, 10);
			this.layout.x = ApplicationConfiguration.MAIN_CONTENT_WIDTH * 0.1;
			this.layout.y = ApplicationConfiguration.MAIN_CONTENT_HEIGHT * 0.1;
		}
		
		private function setupItems():void {
			if (!this.data)
				return;
			
			for each(var i:Object in this.data.items) {
				//trace(i.imagen_grande);
				this.items.push(new GaleriaImageNode(i.imagen_chica, i.imagen_grande, i.content_title, i.content_text));
			}
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo);
			
			//dibujar los items
			for each(var n:GaleriaImageNode in this.items) {
				this.addChild(n);
				this.layout.addNode(n, false);
			}
			this.layout.updateAndRender();
		}
	
	}

}