package menus.izquierda.photogrid
{
	import com.as3joelib.ui.UISwitcher;
	import com.as3joelib.utils.ObjectUtil;
	import com.as3joelib.utils.Singleton;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class PhotoGrid extends Sprite
	{
		//constantes de diseño
		public static const SELECT_NODE:String = 'selectNode';
		
		//constantes de diseño
		private const ELEMENTOS_POR_PAGINA:uint = 6;
		
		private var _data:Object;
		private var items:Vector.<Object>;
		private var selected_item_index:uint;
		
		private var pages:Vector.<PhotoGridPage>;
		private var pages_switcher:UISwitcher;
		
		private var paginator:PhotoGridPaginator;
		
		public function PhotoGrid(data:Object)
		{
			this._data = data;
			
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
			this.pages_switcher.animation_in_object = {duration: 0.3, alpha: 1};
			this.pages_switcher.animation_out_object = {duration: 0.3, alpha: 0};
		}
		
		private function setupItems():void
		{
			trace('PhotoGrid.setupItems');
			for each (var i:Object in this._data)
			{
				this.items.push(i);
			}
			
			//determinar cuantas paginas tengo
			var n_pages:uint = Math.ceil(this.items.length / ELEMENTOS_POR_PAGINA);
			
			//crear cada pagina, dando los items correspondientes
			for (var j:uint = 0; j < n_pages; j++)
			{
				var p:PhotoGridPage = new PhotoGridPage(this.items.slice(j * ELEMENTOS_POR_PAGINA, (j + 1) * ELEMENTOS_POR_PAGINA), j);
				
				this.pages.push(p);
			}
			
			this.paginator = new PhotoGridPaginator(n_pages);
		}
		
		private function agregarListeners():void
		{
			this.addEventListener(PhotoGridPaginatorNode.CLICK_PAGINATOR_NODE, onClickPaginatorNode);
		}
		
		private function onClickPaginatorNode(e:Event):void
		{
			trace('pagina ' + PhotoGridPaginatorNode(e.target).page_number);
			this.pages_switcher.switchToIndex(PhotoGridPaginatorNode(e.target).page_number);
		}
		
		private function dibujar():void
		{
			for each (var p:PhotoGridPage in this.pages)
			{
				this.addChild(p);
				this.pages_switcher.addItem(p);
				
				//p.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH * 0.07;
				p.y = ApplicationConfiguration.MENU_IZQUIERDA_HEIGHT * 0.2;
			}
			this.pages_switcher.hideAllItems();
			this.pages_switcher.switchToIndex(0);
			
			this.addChild(this.paginator);
			this.paginator.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH - 20 - this.paginator.width;
			this.paginator.y = ApplicationConfiguration.MENU_IZQUIERDA_HEIGHT - 20 + 5;
		}
		
		public function selectNodeByIndex(index:uint):void
		{
		
		}
	}

}