package form.components
{
	import com.as3joelib.generators.TextFieldGenerator;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class TextComponent extends Sprite
	{
		private var fondo:Sprite;
		
		private var textfield_input:TextField;
		
		private var label:String;
		private var textfield_label:TextField;
		
		private var desired_height:Number;
		private var desired_width:Number;
		
		public function TextComponent(label:String = '', dw:Number = 300, dh:Number = 30)
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
			this.fondo = new Sprite();
			this.fondo.graphics.beginFill(0xffffff);
			this.fondo.graphics.drawRect(0, 0, this.desired_width, this.desired_height);
			this.fondo.graphics.endFill();
			
			this.textfield_input = TextFieldGenerator.crearTextField('asdasd', {
				size: 14,
				border: true,
				autosize:TextFieldGenerator.AUTOSIZE_NONE
				type: TextFieldGenerator.TEXTFIELD_TYPE_INPUT,
				selectable:true,

				width:this.desired_width,
				height:this.desired_height,
			});
			
			this.textfield_label = TextFieldGenerator.crearTextField(this.label, {size: 16, border: true, autosize: TextFieldGenerator.AUTOSIZE_RIGHT, align: TextFieldGenerator.TEXTFORMAT_ALIGN_RIGHT});
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo);
			this.addChild(this.textfield_input);
			this.addChild(this.textfield_label);
		}
		
		public function get text():String
		{
			return this.textfield_input.text;
		}
	
	}

}