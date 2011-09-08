package menus.izquierda.photogrid
{
	import com.as3joelib.ui.UISwitcher;
	import com.as3joelib.utils.ObjectUtil;
	import com.somerandomdude.coordy.layouts.twodee.Grid;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class PhotoGridPage extends Sprite
	{
		private var items:Vector.<PhotoGridNode>
		
		private var data:Object;
		private var page_number:uint;
		
		//ui
		private var layout:ILayout2d;
		
		public function PhotoGridPage(data:Object, page_number:uint)
		{
			this.data = data;
			this.page_number = page_number;
			
			this.setup();
			this.setupItems();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.items = new Vector.<PhotoGridNode>;
			
			var grid_size:Number = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH * 0.9;
			this.layout = new Grid(grid_size, grid_size*3, 3, 9, 10, 10, 0, 0);
		}
		
		private function setupItems():void 
		{
			trace('PhotoGridPage.setupItems');
			
			for each(var d:Object in this.data) {
				this.items.push(new PhotoGridNode(d));
			}
		}
		
		private function agregarListeners():void
		{
			this.addEventListener(PhotoGridNode.CLICK_PHOTO_GRID_NODE, onClickPhotoGridNode);
		}
		
		private function onClickPhotoGridNode(e:Event):void
		{
			this.deseleccionarTodosExcepto(PhotoGridNode(e.target));
		}
		
		private function deseleccionarTodosExcepto(n:PhotoGridNode):void {
			for each(var i:PhotoGridNode in this.items) {
				if(n != i)
					i.selected = false;
			}
		}
		
		private function dibujar():void
		{
			//menu items
			for each (var i:PhotoGridNode in this.items)
			{
				this.addChild(i);
				this.layout.addNode(i);
			}
		}
	}

}