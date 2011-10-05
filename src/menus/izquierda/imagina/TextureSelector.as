package menus.izquierda.imagina
{
	import com.as3joelib.ui.UISwitcher;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	import menus.izquierda.photogrid.PhotoGrid;
	import menus.izquierda.photogrid.PhotoGridNode;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class TextureSelector extends Sprite
	{
		private var data:Object;
		private var texture_grid:TextureGrid;
		private var btn_ok:Sprite;
		
		private var switcher:UISwitcher;
		
		public function TextureSelector(data:Object)
		{
			this.data = data;
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.texture_grid = new TextureGrid(this.data);
			this.btn_ok = new BtnOk();
			
			this.switcher = new UISwitcher();
			this.switcher.addItem(this.texture_grid);
			this.switcher.addItem(this.btn_ok);
			this.switcher.hideAllItems();
			this.switcher.switchTo(this.texture_grid);
		}
		
		private function agregarListeners():void
		{
			this.addEventListener(PhotoGridNode.CLICK_PHOTO_GRID_NODE, clickPhotoGridNode);
			this.addEventListener(BtnOk.CLICK_OK_BUTTON, clickOkButton);
		}
		
		private function clickOkButton(e:Event):void
		{
			//this.switcher.switchTo(this.photo_grid);
		}
		
		private function clickPhotoGridNode(e:Event):void
		{
			//this.switcher.switchTo(this.btn_ok);
		}
		
		private function dibujar():void
		{
			this.addChild(this.texture_grid);
			
			this.texture_grid.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH * 0.1;
			this.texture_grid.y = ApplicationConfiguration.MENU_IZQUIERDA_HEIGHT * 0.55;
			
			this.addChild(this.btn_ok);
			this.btn_ok.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH * 0.9 - this.btn_ok.width;
			this.btn_ok.y = ApplicationConfiguration.MENU_IZQUIERDA_HEIGHT * 0.9;
		}
	
	}

}