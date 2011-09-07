package menus.izquierda.photogrid
{
	import com.greensock.loading.ImageLoader;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class PhotoGridNode extends Sprite
	{
		private var img_loader:ImageLoader;
		
		private var img_url:String
		
		public function PhotoGridNode(img_url:String)
		{
			this.img_url = img_url;
			
			this.setup();
			this.load();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.img_loader = new ImageLoader(this.img_url, { width:ApplicationConfiguration.PHOTO_GRID_NODE_SIZE, height:ApplicationConfiguration.PHOTO_GRID_NODE_SIZE } );
		}
		
		private function load():void 
		{
			this.img_loader.load();
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.img_loader.content);
		}
	
	}

}