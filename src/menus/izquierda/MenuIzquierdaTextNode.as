package menus.izquierda
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.as3joelib.ui.Button;
	import config.ApplicationConfiguration;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuIzquierdaTextNode extends Button
	{
		//constantes de eventos
		public static const MENU_IZQUIERDA_TEXT_NODE_CLICK:String = 'menuIzquierdaTextNodeClick';
		public static const MENU_IZQUIERDA_TEXT_NODE_ROLLOVER:String = 'menuIzquierdaTextNodeRollOver';
		public static const MENU_IZQUIERDA_TEXT_NODE_ROLLOUT:String = 'menuIzquierdaTextNodeRollOut';
		
		private var str:String;
		private var textfield:TextField;
		
		//diseño
		private var normal_color:uint;
		private var over_color:uint;
		
		public function MenuIzquierdaTextNode(str:String, over_color:uint = ApplicationConfiguration.COLOR_QUIENES_SOMOS, normal_color:uint = 0xffffff)
		{
			this.str = str;
			this.over_color = over_color;
			this.normal_color = normal_color;
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			var opciones:Object = {size: 12, border: false, align: TextFieldGenerator.TEXTFORMAT_ALIGN_RIGHT, autosize: TextFieldGenerator.AUTOSIZE_NONE, color: this.normal_color, width: ApplicationConfiguration.MENU_IZQUIERDA_WIDTH, height:20};
			this.textfield = TextFieldGenerator.crearTextField(this.str, opciones);
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.textfield);
		}
		
		//herencia
		
		override protected function onRollOver(e:MouseEvent):void
		{
			this.textfield.textColor = this.over_color;
			this.dispatchEvent(new Event(MENU_IZQUIERDA_TEXT_NODE_ROLLOVER, true));
		}
		
		override protected function onRollOut(e:MouseEvent):void
		{
			this.textfield.textColor = this.normal_color;
			this.dispatchEvent(new Event(MENU_IZQUIERDA_TEXT_NODE_ROLLOUT, true));
		}
	}

}