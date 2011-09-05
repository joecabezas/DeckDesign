package menus.izquierda
{
	import com.as3joelib.generators.TextFieldGenerator;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuIzquierdaBlackTemplate extends Sprite
	{		
		//ui
		private var fondo:Sprite;
		private var titulo:TextField;
		
		public function MenuIzquierdaBlackTemplate()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.fondo = new Sprite();
			this.fondo.graphics.beginFill(ApplicationConfiguration.COLOR_BACKGROUND_APPLICATION);
			this.fondo.graphics.drawRect(0, 0, ApplicationConfiguration.MENU_IZQUIERDA_WIDTH, ApplicationConfiguration.MENU_IZQUIERDA_HEIGHT);
			this.fondo.graphics.endFill();
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo);
		}
	
		public function setTitle(texto:String, color:uint = 0xffffff):void {
			var opciones:Object = {
				size: 19,
				//border: true,
				align: TextFieldGenerator.TEXTFORMAT_ALIGN_CENTER,
				autosize: TextFieldGenerator.AUTOSIZE_NONE,
				color: color,
				
				width: ApplicationConfiguration.MENU_IZQUIERDA_WIDTH
			};
			this.titulo = TextFieldGenerator.crearTextField(texto, opciones);
			this.titulo.height = this.titulo.textHeight;
			
			this.titulo.y = 20;
			
			this.addChild(this.titulo);
		}
	}

}