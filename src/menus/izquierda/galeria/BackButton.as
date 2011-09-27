package menus.izquierda.galeria
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.as3joelib.ui.Button;
	import com.as3joelib.ui.UISwitcher;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class BackButton extends Button
	{
		//events
		public static const CLICK_BACK_BUTTON:String = 'clickBackButton';
		
		private var fondo_normal:Sprite;
		private var fondo_hover:Sprite;
		
		private var tf:TextField;
		
		//switcher
		private var switcher:UISwitcher;
		
		public function BackButton()
		{
			this.setup();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.fondo_normal = new Sprite();
			this.fondo_normal.graphics.beginFill(ApplicationConfiguration.COLOR_BACKGROUND_APPLICATION);
			this.fondo_normal.graphics.drawRect(0, 0, ApplicationConfiguration.MENU_IZQUIERDA_WIDTH*0.8, 30);
			this.fondo_normal.graphics.endFill();
			
			this.fondo_hover = new Sprite();
			this.fondo_hover.graphics.beginFill(0x555555);
			this.fondo_hover.graphics.drawRect(0, 0, ApplicationConfiguration.MENU_IZQUIERDA_WIDTH*0.8, 30);
			this.fondo_hover.graphics.endFill();
			
			this.tf = TextFieldGenerator.crearTextField('Volver', { size: 12, color: 0xffffff, align: TextFieldGenerator.TEXTFORMAT_ALIGN_RIGHT, autosize: TextFieldGenerator.AUTOSIZE_NONE, width:ApplicationConfiguration.MENU_IZQUIERDA_WIDTH * 0.8, height:30 - 5 } );
			
			this.switcher = new UISwitcher();
			this.switcher.addItem(this.fondo_normal);
			this.switcher.addItem(this.fondo_hover);
			
			this.switcher.hideAllItems();
			this.switcher.switchTo(this.fondo_normal);
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo_normal);
			this.addChild(this.fondo_hover);
			this.addChild(this.tf);
			this.tf.y = 5;
		}
		
		override protected function onClick(e:MouseEvent):void {
			this.dispatchEvent(new Event(CLICK_BACK_BUTTON, true));
		}
		
		override protected function onRollOver(e:MouseEvent):void
		{
			this.switcher.switchTo(this.fondo_hover, false);
		}
		
		override protected function onRollOut(e:MouseEvent):void
		{
			this.switcher.switchTo(this.fondo_normal);
		}
	}

}