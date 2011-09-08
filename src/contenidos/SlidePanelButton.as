package contenidos
{
	import com.as3joelib.ui.Button;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class SlidePanelButton extends Button
	{
		//eventos
		public static const CLICK_SLIDE_PANEL_BUTTON:String = 'clickPanelButton';
		
		//constantes de diseño
		private static const WIDTH:Number = 10;
		private static const HEIGHT:Number = 100;
		
		private var fondo:Sprite;
		private var flecha:Sprite;
		
		public function SlidePanelButton()
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
			
			this.flecha = new Sprite();
			this.flecha.graphics.beginFill(0xffffff);
			this.flecha.graphics.moveTo(5, 0);
			this.flecha.graphics.lineTo(5, 10);
			this.flecha.graphics.lineTo(0, 5);
			this.flecha.graphics.lineTo(5, 0);
			this.flecha.graphics.endFill();
			
			this.toggle = true;
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo);
			this.addChild(this.flecha);
			this.flecha.x = this.fondo.width/2 - this.flecha.width / 2;
			this.flecha.y = this.fondo.height/2 - this.flecha.height / 2;
		}
		
		//overrides
		
		override protected function onClick(e:MouseEvent):void
		{
			this.dispatchEvent(new Event(CLICK_SLIDE_PANEL_BUTTON, true));
		}
		
		override protected function onRollOver(e:MouseEvent):void
		{
		}
		
		override protected function onRollOut(e:MouseEvent):void
		{
		}
	}

}