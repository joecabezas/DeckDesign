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
	public class SlidePanel extends Sprite
	{
		//constantes de diseño
		private static const WIDTH:Number = ApplicationConfiguration.MAIN_CONTENT_WIDTH * 0.4;
		private static const HEIGHT:Number = 100;
		
		private var fondo:Sprite;
		private var boton:SlidePanelButton;
		//txt
		private var titulo:TextField;
		private var contenido:TextField;
		
		private var mascara:Sprite;
		
		public function SlidePanel()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.fondo = new Sprite();
			this.fondo.graphics.beginFill(ApplicationConfiguration.COLOR_BACKGROUND_APPLICATION);
			this.fondo.graphics.drawRect(0, 0, WIDTH, HEIGHT);
			this.fondo.graphics.endFill();
			
			this.mascara = new Sprite();
			this.mascara.graphics.beginFill(ApplicationConfiguration.COLOR_CONTACTO);
			this.mascara.graphics.drawRect(0, 0, WIDTH + 50, HEIGHT);
			this.mascara.graphics.endFill();
			
			this.boton = new SlidePanelButton();
			
			this.titulo = TextFieldGenerator.crearTextField('Titulo', {size: 16, 
				//border: true,
					align: TextFieldGenerator.TEXTFORMAT_ALIGN_LEFT, autosize: TextFieldGenerator.AUTOSIZE_NONE, color: ApplicationConfiguration.COLOR_QUIENES_SOMOS,
					
					width: this.fondo.width - 20});
			
			this.contenido = TextFieldGenerator.crearTextField('Contenido', {size: 10, 
				//border: true,
				//align: TextFieldGenerator.TEXTFORMAT_ALIGN_LEFT,
				//autosize: TextFieldGenerator.,
					wordwrap: true, color: 0xffffff,
					
					width: this.fondo.width - 20});
		}
		
		private function agregarListeners():void
		{
			this.addEventListener(SlidePanelButton.CLICK_SLIDE_PANEL_BUTTON, onClickSlidePanelButton);
		}
		
		private function onClickSlidePanelButton(e:Event):void
		{
			if (SlidePanelButton(e.target).selected)
			{
				this.aparecer();
			}
			else
			{
				this.esconder(0.5);
			}
		}
		
		private function esconder(duration:Number):void
		{
			TweenLite.to(this.fondo, duration, {x: this.fondo.x - this.fondo.width});
			TweenLite.to(this.titulo, duration, {x: this.titulo.x - this.fondo.width});
			TweenLite.to(this.contenido, duration, {x: this.contenido.x - this.fondo.width});
			TweenLite.to(this.boton, duration, {x: this.boton.x - this.fondo.width});
		}
		
		private function aparecer():void
		{
			TweenLite.to(this.fondo, 0.5, {x: 0});
			TweenLite.to(this.titulo, 0.5, {x: 10});
			TweenLite.to(this.contenido, 0.5, {x: 10});
			TweenLite.to(this.boton, 0.5, {x: this.fondo.width + 2});
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo);
			this.addChild(this.boton);
			this.boton.x = this.fondo.width + 2;
			
			this.addChild(this.titulo);
			this.titulo.x = 10;
			this.titulo.y = 10;
			
			this.addChild(this.contenido);
			this.contenido.x = 10;
			this.contenido.y = 35;
			
			//mask
			this.addChild(this.mascara);
			this.mask = this.mascara
			
			//aparecer escondido
			this.esconder(0);
		}
		
		public function setData(d:Object):void
		{
			this.titulo.text = d.content_title;
			this.contenido.text = d.content_text;
		}
	}

}