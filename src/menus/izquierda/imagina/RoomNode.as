package menus.izquierda.imagina
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.as3joelib.ui.Button;
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
		
		private var fondo:Sprite;
		private var txt_number:TextField;
		private var number:uint;
		
		public function RoomNode(data:Object, number:uint)
		{
			this._data = data;
			this.number = number;
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.fondo = new Sprite();
			this.fondo.graphics.beginFill(ApplicationConfiguration.COLOR_BACKGROUND_APPLICATION);
			this.fondo.graphics.drawRect(0, 0, ApplicationConfiguration.ROOM_NODE_SIZE*0.6, ApplicationConfiguration.ROOM_NODE_SIZE);
			this.fondo.graphics.endFill();
			
			this.txt_number = TextFieldGenerator.crearTextField(String(this.number), { size: 16, color:0xffffff} );
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo);
			this.addChild(this.txt_number);
			this.txt_number.x = 1;
		}
		
		override protected function onClick(e:MouseEvent):void {
			this.dispatchEvent(new Event(CLICK_ROOM_NODE, true));
		}
		
		public function getData():Object {
			return this._data;
		}
	
	}

}