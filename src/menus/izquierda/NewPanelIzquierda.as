package menus.izquierda
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import com.somerandomdude.coordy.layouts.twodee.VerticalLine;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class NewPanelIzquierda extends Sprite
	{
		private var _srt_titulo:String;
		private var _srt_subtitulo:String;
		private var _srt_texto:String;
		
		private var _txt_titulo:TextField;
		private var _txt_subtitulo:TextField;
		private var _txt_texto:TextField;
		
		//ui
		private var layout:ILayout2d;
		
		public function NewPanelIzquierda(titulo, subtitulo, texto)
		{
			this._srt_titulo = titulo;
			this._srt_subtitulo = subtitulo;
			this._srt_texto = texto;
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			var opciones:Object;
			
			opciones = { size: ApplicationConfiguration.SUBMENU_TEXT_SIZE, border: false, align: TextFieldGenerator.TEXTFORMAT_ALIGN_RIGHT, autosize: TextFieldGenerator.AUTOSIZE_NONE, /*color: this.normal_color,*/ width: ApplicationConfiguration.MENU_IZQUIERDA_WIDTH, height:50 };
			this._txt_titulo = TextFieldGenerator.crearTextField(this._srt_titulo, opciones);
			
			opciones = {size: ApplicationConfiguration.SUBMENU_TEXT_SIZE, border: false, align: TextFieldGenerator.TEXTFORMAT_ALIGN_RIGHT, autosize: TextFieldGenerator.AUTOSIZE_NONE, /*color: this.normal_color,*/ width: ApplicationConfiguration.MENU_IZQUIERDA_WIDTH, height:50};
			this._txt_subtitulo = TextFieldGenerator.crearTextField(this._srt_titulo, opciones);
			
			opciones = {size: ApplicationConfiguration.SUBMENU_TEXT_SIZE, border: false, align: TextFieldGenerator.TEXTFORMAT_ALIGN_RIGHT, autosize: TextFieldGenerator.AUTOSIZE_NONE, /*color: this.normal_color,*/ width: ApplicationConfiguration.MENU_IZQUIERDA_WIDTH, height:50};
			this._txt_texto = TextFieldGenerator.crearTextField(this._srt_titulo, opciones);
			
			this.layout = new VerticalLine(5);
			this.layout.x = -12;
			this.layout.y = 100;
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