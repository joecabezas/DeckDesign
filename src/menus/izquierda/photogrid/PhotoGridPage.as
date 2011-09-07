package menus.izquierda.photogrid
{
	import com.as3joelib.ui.UISwitcher;
	import com.as3joelib.utils.ObjectUtil;
	import com.somerandomdude.coordy.layouts.twodee.Grid;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class PhotoGridPage extends Sprite
	{
		private var items:Vector.<PhotoGridNode>
		
		private var data:Object;
		
		//ui
		private var layout:ILayout2d;
		
		public function PhotoGridPage(data:Object)
		{
			this.data = data;
			
			this.setup();
			this.setupItems();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.items = new Vector.<PhotoGridNode>;
			
			var grid_size:Number = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH * 0.9;
			this.layout = new Grid(grid_size, grid_size*2, 3, 9, 10, 10, 0, 0);
		}
		
		private function setupItems():void 
		{
			trace('PhotoGridPage.setupItems');
			
			for each(var i:Object in this.data) {				
				//items del menu
				this.items.push(new PhotoGridNode(String(i.imagen_chica)));
				
				//items del contenido
				//this.menu_content.addNode(new MenuContentNode(String(i.content_title), String(i.content_text)));
			}
		}
		
		private function agregarListeners():void
		{
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