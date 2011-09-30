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
	public class BtnOk extends Button
	{
		//eventos
		public static const CLICK_OK_BUTTON:String = 'clickOkButton';
		
		private var fondo:Sprite;
		private var txt_ok:TextField;
		
		public function BtnOk()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.fondo = new Sprite();
			this.fondo.graphics.beginFill(ApplicationConfiguration.COLOR_BACKGROUND_APPLICATION);
			this.fondo.graphics.lineStyle(1, 0xcccccc);
			this.fondo.graphics.drawRect(0, 0, 90, 30);
			this.fondo.graphics.endFill();
			
			this.txt_ok = TextFieldGenerator.crearTextField('Listo', { size:16, color:0xcccccc } );
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo);
			this.addChild(this.txt_ok);
			this.txt_ok.x = this.fondo.width/2 - this.txt_ok.textWidth/2;
			this.txt_ok.y = this.fondo.height/2 - this.txt_ok.textHeight/2 - 3;
		}
		
		override protected function onClick(e:MouseEvent):void {
			this.dispatchEvent(new Event(CLICK_OK_BUTTON, true));
		}
	}

}