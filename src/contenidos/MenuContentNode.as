package contenidos
{
	import com.as3joelib.generators.TextFieldGenerator;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuContentNode extends Sprite
	{
		//ui
		private var fondo:Sprite;
		private var title:TextField;
		private var content:TextField;
		
		//strings
		private var str_title:String;
		private var str_content:String;
		
		public function MenuContentNode(title:String, content:String)
		{
			this.str_title = title;
			this.str_content = content;
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.fondo = new Sprite();
			this.fondo.graphics.beginFill(ApplicationConfiguration.COLOR_BACKGROUND_APPLICATION);
			this.fondo.graphics.drawRect(0, 0, ApplicationConfiguration.MAIN_CONTENT_WIDTH * 0.4, 100);
			this.fondo.graphics.endFill();
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			//fondo
			this.addChild(this.fondo);
			
			//set title
			this.setTitle(str_title);
			
			//add content text
			this.setContent(str_content);
			
			//actualizar tamaño del fondo, segun el tamaño del texto
			this.fondo.height = (this.fondo.height == this.height)? this.fondo.height : this.height + 20;
		}
		
		public function setTitle(texto:String, color:uint = ApplicationConfiguration.COLOR_QUIENES_SOMOS):void {
			var opciones:Object = {
				size: 16,
				//border: true,
				align: TextFieldGenerator.TEXTFORMAT_ALIGN_LEFT,
				autosize: TextFieldGenerator.AUTOSIZE_NONE,
				color: color,
				
				width: ApplicationConfiguration.MAIN_CONTENT_WIDTH * 0.4 - 20,
				height: 50
			};
			this.title = TextFieldGenerator.crearTextField(str_title, opciones);
			
			this.title.x = 20;
			this.title.y = 20;
			
			this.addChild(this.title);
		}
		
		public function setContent(texto:String, color:uint = 0xffffff):void {
			var opciones:Object = {
				size: 12,
				//border: true,
				//align: TextFieldGenerator.TEXTFORMAT_ALIGN_LEFT,
				//autosize: TextFieldGenerator.AUTOSIZE_LEFT,
				//multiline: true,
				wordwrap: true,
				
				color: color,
				
				width: ApplicationConfiguration.MAIN_CONTENT_WIDTH * 0.4 - 20 -10
			};
			this.content = TextFieldGenerator.crearTextField(str_content, opciones);
			
			this.content.x = 20;
			this.content.y = 50;
			
			this.addChild(this.content);
		}
	}

}