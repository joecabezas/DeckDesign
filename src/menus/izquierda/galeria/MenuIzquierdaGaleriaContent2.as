package menus.izquierda.galeria
{
	import com.somerandomdude.coordy.layouts.twodee.Grid;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuIzquierdaGaleriaContent2 extends Sprite
	{
		//vars
		
		//ui
		private var fondo:Sprite;
		
		private var linear_carrousel:LinearCarrousel;
		
		//data
		private var data:Vector.<Object>;
		
		private var window:NodeWindow;
		
		//si los datos son null, entonces dibujar solo el fondo
		public function MenuIzquierdaGaleriaContent2(data:Object = null)
		{
			//this.data = data;
			if (data)
			{
				//copiar datos
				this.data = new Vector.<Object>;
				for (var i:int = 0; i < data.items.length; i++)
				{
					this.data.push(data.items[i]);
				}
			}
			
			this.setup();
			this.setupItems();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.fondo = new Sprite();
			this.fondo.graphics.beginFill(ApplicationConfiguration.COLOR_BACKGROUND_APPLICATION);
			this.fondo.graphics.drawRect(0, 0, ApplicationConfiguration.MAIN_CONTENT_WIDTH, ApplicationConfiguration.MAIN_CONTENT_HEIGHT);
			this.fondo.graphics.endFill();
			
			if (this.data)
				this.linear_carrousel = new LinearCarrousel(this.data.reverse());
		}
		
		private function setupItems():void
		{
		}
		
		private function agregarListeners():void
		{
		}
		
		public function addWindow(n:GaleriaImageNode):void
		{
			this.window = new NodeWindow(n.getUrlBig(), n.getTitle(), n.getText());
			this.addChild(this.window);
			
			this.window.x = 155;
			this.window.y = 35;
			
			this.swapChildren(this.window, this.linear_carrousel);
		}
		
		public function removeWindow():void
		{
			if (this.window && this.contains(this.window))
			{
				this.removeChild(this.window);
			}
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo);
			
			if (this.linear_carrousel)
			{
				this.addChild(this.linear_carrousel);
				
				//this.linear_carrousel.x = ApplicationConfiguration.MAIN_CONTENT_WIDTH / 2 - this.linear_carrousel.width / 2 - 70;
				this.linear_carrousel.x = 155;
				this.linear_carrousel.y = 450;
				
				var item:Object = this.data[0];
				this.addWindow(new GaleriaImageNode(item.imagen_chica, item.imagen_grande, item.content_title, item.content_text));
			}
		}
	
	}

}