package menus.izquierda.imagina
{
	import com.as3joelib.ui.Button;
	import config.ApplicationConfiguration;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class DragPoint extends Button
	{
		//eventos
		public static const DRAG_POINT_MOVE:String = 'dragPointMove';
		
		public function DragPoint()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.useHandCursor = true;
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.graphics.beginFill(0xcccccc);
			this.graphics.lineStyle(2);
			this.graphics.drawCircle(0, 0, 10);
			this.graphics.endFill();
		}
		
		override protected function onMouseDown(e:MouseEvent):void {
			this.startDrag(true, new Rectangle(0, 0, ApplicationConfiguration.MAIN_CONTENT_WIDTH, ApplicationConfiguration.MAIN_CONTENT_HEIGHT));
		}
		
		override protected function onMouseUp(e:MouseEvent):void {
			this.stopDrag();
		}
		
		override protected function onMouseMove(e:MouseEvent):void {
			this.dispatchEvent(new Event(DRAG_POINT_MOVE, true));
		}
	
	}

}