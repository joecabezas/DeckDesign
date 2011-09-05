package contenidos
{
	import com.as3joelib.ui.UISwitcher;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuContent extends Sprite
	{
		public var items:Vector.<MenuContentNode>;
		
		//ui
		private var switcher:UISwitcher;
		
		public function MenuContent()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.items = new Vector.<MenuContentNode>;
			
			this.switcher = new UISwitcher();
			this.switcher.animation_in_object = {duration:0.3, alpha:1}
			this.switcher.animation_out_object = {duration:0.3, alpha:0}
		}
		
		public function addNode(n:MenuContentNode):void {
			this.items.push(n);
			this.switcher.addItem(n);
			
			this.addChild(n);
			
			this.switcher.hideAllItems();
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			for each(var i:MenuContentNode in this.items) {
				this.addChild(i);
			}
		}
		
		public function switchTo(n:int, y:Number):void {
			this.switcher.animation_in_object.y = y;
			this.switcher.animation_out_object.y = y+20;
			this.switcher.switchTo(this.items[n]);
		}
		
		public function hideAllItems():void {
			this.switcher.hideAllItems(false);
		}
	
	}

}