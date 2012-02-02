package menus.izquierda
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import com.somerandomdude.coordy.layouts.twodee.VerticalLine;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class NewPanelIzquierda extends Sprite
	{
		private var _str_titulo:String;
		private var _str_subtitulo:String;
		private var _str_texto:String;
		
		private var _txt_titulo:TextField;
		private var _txt_subtitulo:TextField;
		private var _txt_texto:TextField;
		
		//ui
		private var layout:ILayout2d;
		
		public function NewPanelIzquierda(titulo:String, subtitulo:String, texto:String)
		{
			this._str_titulo = titulo;
			this._str_subtitulo = subtitulo;
			this._str_texto = texto;
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			var opciones:Object;
			
			opciones = {
				size: ApplicationConfiguration.SUBMENU_TEXT_SIZE + 1,
				border: false,
				//align: TextFieldGenerator.TEXTFORMAT_ALIGN_RIGHT,
				autosize: TextFieldGenerator.AUTOSIZE_RIGHT,
				color: ApplicationConfiguration.COLOR_QUIENES_SOMOS,
				width: ApplicationConfiguration.MENU_IZQUIERDA_WIDTH
				//height:50
			};
			this._txt_titulo = TextFieldGenerator.crearTextField(this._str_titulo, opciones);
			
			opciones = {
				size: 14,
				//border: true,
				align: TextFieldGenerator.TEXTFORMAT_ALIGN_LEFT,
				autosize: TextFieldGenerator.AUTOSIZE_RIGHT,
				color: ApplicationConfiguration.COLOR_QUIENES_SOMOS,
				
				width: ApplicationConfiguration.MAIN_CONTENT_WIDTH * 0.4 - 20,
				height: 50
			};
			this._txt_subtitulo = TextFieldGenerator.crearTextField(this._str_subtitulo, opciones);
			
			opciones = {
				size: 12,
				//border: true,
				align: TextFieldGenerator.TEXTFORMAT_ALIGN_JUSTIFY,
				autosize: TextFieldGenerator.AUTOSIZE_RIGHT,
				//multiline: true,
				wordwrap: true,
				
				color: 0xffffff,
				
				width: ApplicationConfiguration.MAIN_CONTENT_WIDTH * 0.24
			};
			this._txt_texto = TextFieldGenerator.crearTextField(this._str_texto, opciones);
			
			this.layout = new VerticalLine(15);
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this._txt_titulo);
			this.layout.addNode(this._txt_titulo);
			
			this.addChild(this._txt_subtitulo);
			this.layout.addNode(this._txt_subtitulo);
			
			this.addChild(this._txt_texto);
			this.layout.addNode(this._txt_texto);
		}
	
	}
}