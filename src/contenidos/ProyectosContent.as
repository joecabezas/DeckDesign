package contenidos
{
	import com.as3joelib.utils.Singleton;
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
			
			if (!Singleton.getInstance().data.json.data.secciones.nuestros_proyectos.items[0])
				return;
				
			var url:String = Singleton.getInstance().data.json.data.secciones.nuestros_proyectos.items[0].imagen_grande;
			this.image_loader = new ImageLoader(url, { width: ApplicationConfiguration.MAIN_CONTENT_WIDTH, height:ApplicationConfiguration.MAIN_CONTENT_HEIGHT } );
			this.image_loader.load();
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo);
			
			if(this.image_loader)
				this.addChild(this.image_loader.content);
		}
		
		public function loadImageUrl(s:String):void {
			this.image_loader.url = s;
			this.image_loader.load();
		}
	
	}

}