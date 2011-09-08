package menus.izquierda.photogrid
{
	import com.as3joelib.ui.Button;
	import com.as3joelib.ui.UISwitcher;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class PhotoGridPaginatorNode extends Button
	{
		//constantes de eventos
		public static const CLICK_PAGINATOR_NODE:String = 'clickPaginatorNode';
		
		//constantes de diseño
		private static const WIDTH:Number = 7;
		private static const HEIGHT:Number = 12;
		
		private var asset_default:Sprite;
		private var asset_over:Sprite;
		
		private var switcher:UISwitcher;
		
		private var _page_number:uint;
		
		public function PhotoGridPaginatorNode(page_number:uint)
		{
			this._page_number = page_number;
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{			
			this.asset_default = new Sprite();
			this.asset_default.graphics.beginFill(0xffffff);
			this.asset_default.graphics.drawRect(0, 0, WIDTH, HEIGHT);
			this.asset_default.graphics.endFill();
			
			this.asset_over = new Sprite();
			this.asset_over.graphics.beginFill(ApplicationConfiguration.COLOR_QUIENES_SOMOS);
			this.asset_over.graphics.drawRect(0, 0, WIDTH, HEIGHT);
			this.asset_over.graphics.endFill();
			
			this.switcher = new UISwitcher();
			this.switcher.addItem(this.asset_default);
			this.switcher.addItem(this.asset_over);
			this.switcher.hideAllItems();
			this.switcher.switchTo(this.asset_default);
			
			this.switcher.animation_in_object = { duration:0.3, alpha:1 };
			this.switcher.animation_out_object = { duration:0.3, alpha:0 };
			
			//toggle ON
			this.toggle = true;
			
			//dejar seleccionado si es el primero
			if (this.page_number == 0)
				this.selected = true;
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.asset_default);
			this.addChild(this.asset_over);
		}
		
		//overrides
		
		override protected function onClick(e:MouseEvent):void {
			this.dispatchEvent(new Event(PhotoGridPaginatorNode.CLICK_PAGINATOR_NODE, true));
		}
		
		override protected function onRollOver(e:MouseEvent):void {
			this.switcher.switchTo(this.asset_over);
		}
		
		override protected function onRollOut(e:MouseEvent):void {
			if(!this.selected)
				this.switcher.switchTo(this.asset_default);
		}
		
		override protected function onSelectedChange():void {
			if (this.selected) {
				this.switcher.switchTo(this.asset_over);
			} else {
				this.switcher.switchTo(this.asset_default);
			}
		}
		
		public function get page_number():uint
		{
			return this._page_number;
		}
	}

}