package contenidos
{
	import com.greensock.loading.ImageLoader;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class ProyectosContent extends Sprite
	{
		private var fondo:Sprite;
		private var image_loader:ImageLoader;
		
		public function ProyectosContent()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.fondo = new Sprite();
			this.fondo.graphics.beginFill(ApplicationConfiguration.COLOR_BACKGROUND_APPLICATION);
			this.fondo.graphics.drawRect(0, 0, ApplicationConfiguration.MAIN_CONTENT_WIDTH, ApplicationConfiguration.MAIN_CONTENT_HEIGHT);
			this.fondo.graphics.endFill();
			
			this.image_loader = new ImageLoader('',{width: ApplicationConfiguration.MAIN_CONTENT_WIDTH, height:ApplicationConfiguration.MAIN_CONTENT_HEIGHT});
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo);
			this.addChild(this.image_loader.content);
		}
		
		public function loadImageUrl(s:String):void {
			this.image_loader.url = s;
			this.image_loader.load();
		}
	
	}

}