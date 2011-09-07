package menus.izquierda.photogrid
{
	import com.as3joelib.ui.UISwitcher;
	import com.as3joelib.utils.Singleton;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class PhotoGrid extends Sprite
	{
		//constantes de diseño
		private const ELEMENTOS_POR_PAGINA:uint = 12;
		
		private var items:Vector.<Object>;
		
		private var pages:Vector.<PhotoGridPage>;
		private var pages_switcher:UISwitcher;
		
		private var paginator:PhotoGridPaginator;
		
		public function PhotoGrid()
		{
			this.setup();
			this.setupItems();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.items = new Vector.<Object>;
			
			this.pages = new Vector.<PhotoGridPage>;
			
			this.pages_switcher = new UISwitcher();
		}
		
		private function setupItems():void
		{
			trace('PhotoGrid.setupItems');
			for each(var i:Object in Singleton.getInstance().data.json.data.secciones.nuestros_proyectos.items) {
				this.items.push(i);
			}
			
			//determinar cuantas paginas tengo
			var n_pages:uint = Math.ceil(this.items.length / ELEMENTOS_POR_PAGINA);
			
			//crear cada pagina, dando los items correspondientes
			for (var j:uint = 0; j < n_pages; j++) {
				var p:PhotoGridPage = new PhotoGridPage(this.items.slice(j * ELEMENTOS_POR_PAGINA, (j + 1) * ELEMENTOS_POR_PAGINA));
				
				this.pages.push(p);
			}
			
			this.paginator = new PhotoGridPaginator(n_pages);
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			for each(var p:PhotoGridPage in this.pages) {
				this.addChild(p);
				this.pages_switcher.addItem(p);
			}
			this.pages_switcher.hideAllItems();
			this.pages_switcher.switchToIndex(0);
			
			this.addChild(this.paginator);
			this.paginator.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH - 20;
			this.paginator.y = ApplicationConfiguration.MENU_IZQUIERDA_HEIGHT - 20;
		}
	
	}

}