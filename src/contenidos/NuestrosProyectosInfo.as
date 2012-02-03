package contenidos
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.as3joelib.ui.Button;
	import com.as3joelib.ui.UISwitcher;
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
	public class NuestrosProyectosInfo extends Sprite
	{
		//constantes de diseño
		private static const WIDTH:Number = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH - 12 - 5;
		private static const HEIGHT:Number = 180;
		
		private var fondo:Sprite;
		
		//txt
		private var titulo:TextField;
		private var contenido:TextField;
		
		public function NuestrosProyectosInfo()
		{
			this.setup();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.fondo = new Sprite();
			//ApplicationConfiguration.COLOR_BACKGROUND_APPLICATION
			this.fondo.graphics.beginFill(0xff0000);
			this.fondo.graphics.drawRect(0, 0, WIDTH, HEIGHT);
			this.fondo.graphics.endFill();
			
			this.titulo = TextFieldGenerator.crearTextField(
				'Titulo',
				{
					size: 16, 
					//border: true,
					align: TextFieldGenerator.TEXTFORMAT_ALIGN_LEFT,
					autosize: TextFieldGenerator.AUTOSIZE_NONE,
					color: ApplicationConfiguration.COLOR_QUIENES_SOMOS,
					width: this.fondo.width - 10
				}
			);
			
			this.contenido = TextFieldGenerator.crearTextField(
				'Contenido',
				{
					size: 12, 
					//border: true,
					align: TextFieldGenerator.TEXTFORMAT_ALIGN_JUSTIFY,
					wordwrap: true, color: 0xffffff,
					width: this.fondo.width - 10
				}
			);
		}
		
		private function dibujar():void
		{
			//this.addChild(this.fondo);
			
			this.addChild(this.titulo);
			this.titulo.x = 0;
			this.titulo.y = 3;
			
			this.addChild(this.contenido);
			this.contenido.x = 0;
			this.contenido.y = 22;
		}
		
		public function setData(d:Object):void
		{
			this.titulo.text = d.content_title;
			this.contenido.text = d.content_text;
		}
	}

}