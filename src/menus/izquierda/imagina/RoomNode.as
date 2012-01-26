package menus.izquierda.imagina
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.as3joelib.ui.Button;
	import com.greensock.TweenLite;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class RoomNode extends Button
	{
		//eventos
		public static const CLICK_ROOM_NODE:String = 'clickRoomNode';
		
		private var _data:Object;
		
		private var fondo_normal:Sprite;
		private var fondo_over:Sprite;
		
		private var txt_number:TextField;
		private var number:uint;
		
		public function RoomNode(data:Object, number:uint)
		{
			this._data = data;
			this.number = number;
			
			this.toggle = true;
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.fondo_normal = new Sprite();
			this.fondo_normal.graphics.beginFill(0x00add7);
			this.fondo_normal.graphics.drawRect(0, 0, ApplicationConfiguration.ROOM_NODE_SIZE * 0.7, ApplicationConfiguration.ROOM_NODE_SIZE * 0.7);
			this.fondo_normal.graphics.endFill();
			
			this.fondo_over = new Sprite();
			this.fondo_over.graphics.beginFill(ApplicationConfiguration.COLOR_IMAGINA_TUS_ESPACIOS);
			this.fondo_over.graphics.drawRect(0, 0, ApplicationConfiguration.ROOM_NODE_SIZE * 0.7, ApplicationConfiguration.ROOM_NODE_SIZE * 0.7);
			this.fondo_over.graphics.endFill();
			
			this.txt_number = TextFieldGenerator.crearTextField(String(this.number), {size: ApplicationConfiguration.SUBMENU_TEXT_SIZE, color: 0xffffff});
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo_normal);
			this.addChild(this.fondo_over);
			this.fondo_over.alpha = 0;
			
			this.addChild(this.txt_number);
			this.txt_number.x = 3;
			this.txt_number.y = -1;
		}
		
		override protected function onClick(e:MouseEvent):void
		{
			this.dispatchEvent(new Event(CLICK_ROOM_NODE, true));
		}
		
		override protected function onRollOver(e:MouseEvent):void
		{
			TweenLite.to(this.fondo_over, 0.3, {alpha: 1});
		}
		
		override protected function onRollOut(e:MouseEvent):void
		{
			TweenLite.to(this.fondo_over, 0.3, {alpha: 0});
		}
		
		public function getData():Object
		{
			return this._data;
		}
	
	}

}