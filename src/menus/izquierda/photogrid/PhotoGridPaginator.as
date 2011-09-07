package menus.izquierda.photogrid
{
	import com.somerandomdude.coordy.layouts.twodee.HorizontalLine;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class PhotoGridPaginator extends Sprite
	{
		private var items:Vector.<PhotoGridPaginatorNode>;
		private var n_pages:uint;
		
		//ui
		private var layout:ILayout2d;
		
		public function PhotoGridPaginator(n_pages:int = 1)
		{
			this.n_pages = n_pages;
			
			this.setup();
			this.setupItems();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.items = new Vector.<PhotoGridPaginatorNode>;
			
			this.layout = new HorizontalLine(5);
		}
		
		private function setupItems():void
		{
			for (var i:int = 0; i < this.n_pages; i++) {
				var pn:PhotoGridPaginatorNode = new PhotoGridPaginatorNode();
				
				this.items.push(pn);
			}
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			for each(var i:PhotoGridPaginatorNode in this.items) {
				this.addChild(i);
				this.layout.addNode(i, false);
			}
			this.layout.updateAndRender();
		}
	}

}