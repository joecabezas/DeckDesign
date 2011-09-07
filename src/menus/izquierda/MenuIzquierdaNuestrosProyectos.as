package menus.izquierda
{
	import com.as3joelib.utils.Singleton;
	import config.ApplicationConfiguration;
	import menus.izquierda.photogrid.PhotoGrid;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuIzquierdaNuestrosProyectos extends MenuIzquierdaBlackTemplate
	{
		//ui
		private var grid:PhotoGrid;
		
		public function MenuIzquierdaNuestrosProyectos()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.grid = new PhotoGrid();
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			//set title
			this.setTitle(ApplicationConfiguration.STR_NUESTROS_PROYECTOS.toUpperCase(), ApplicationConfiguration.COLOR_QUIENES_SOMOS);
			
			this.addChild(this.grid);
		}
	
	}

}