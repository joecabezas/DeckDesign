package form.components
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.as3joelib.ui.Button;
	import com.as3joelib.ui.UISwitcher;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class ButtonComponent extends Button
	{
		private var fondo_normal:Sprite;
		private var fondo_hover:Sprite;
		
		private var label:String;
		private var textfield_label:TextField;
		
		private var desired_height:Number;
		private var desired_width:Number;
		
		//ui
		private var switcher:UISwitcher;
		
		public function ButtonComponent(label:String = '', dw:Number = 120, dh:Number = 30)
		{
			this.desired_width = dw;
			this.desired_height = dh;
			this.label = label;
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.fondo_normal = new Sprite();
			this.fondo_normal.graphics.beginFill(ApplicationConfiguration.COLOR_BACKGROUND_APPLICATION);
			this.fondo_normal.graphics.drawRect(0, 0, this.desired_width, this.desired_height);
			this.fondo_normal.graphics.endFill();
			
			this.fondo_hover = new Sprite();
			this.fondo_hover.graphics.beginFill(ApplicationConfiguration.COLOR_QUIENES_SOMOS);
			this.fondo_hover.graphics.drawRect(0, 0, this.desired_width, this.desired_height);
			this.fondo_hover.graphics.endFill();
			
			this.textfield_label = TextFieldGenerator.crearTextField(this.label, {color: 0xffffff, size: 14, border: false, autosize: TextFieldGenerator.AUTOSIZE_RIGHT, align: TextFieldGenerator.TEXTFORMAT_ALIGN_RIGHT});
			
			this.switcher = new UISwitcher();
			
			this.switcher.addItem(this.fondo_normal);
			this.switcher.addItem(this.fondo_hover);
			
			this.switcher.hideAllItems();
			this.switcher.switchTo(this.fondo_normal);
			
			this.switcher.animation_in_object = {duration: 0.3, alpha: 1};
			this.switcher.animation_out_object = {duration: 0.3, alpha: 0};
		}
		
		private function agregarListeners():void
		{
		}
		
		override protected function onRollOver(e:MouseEvent):void
		{
			this.switcher.switchTo(this.fondo_hover, false);
		}
		
		override protected function onRollOut(e:MouseEvent):void
		{
			this.switcher.switchTo(this.fondo_normal, true);
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo_normal);
			this.addChild(this.fondo_hover);
			
			this.addChild(this.textfield_label);
			this.textfield_label.x = (this.desired_width - this.textfield_label.width) / 2;
			this.textfield_label.y = (this.desired_height - this.textfield_label.height) / 2;
		
		}
	
	}

}