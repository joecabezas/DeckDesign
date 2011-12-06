package menus.izquierda.galeria
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.as3joelib.graphics.primitives.TriangleIcon;
	import com.greensock.layout.ScaleMode;
	import com.greensock.loading.ImageLoader;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import com.somerandomdude.coordy.layouts.twodee.VerticalLine;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class NodeWindow extends Sprite
	{
		private var imgl:ImageLoader;
		private var txt_title:TextField;
		private var txt_text:TextField;
		
		private var img_url:String
		private var str_title:String;
		private var str_text:String;
		
		private var _left_button:TriangleIcon;
		private var _right_button:TriangleIcon;
		
		private var _actual_node_index:uint;
		private var _data:Vector.<Object>;
		
		//private var layout:ILayout2d;
		
		public function NodeWindow(data:Vector.<Object>, node:GaleriaImageNode)
		{
			this._data = data;
			
			this.img_url = node.getUrlBig();
			this.str_title = node.getTitle();
			this.str_text = node.getText();
			
			this._actual_node_index = node.getIndex();
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.imgl = new ImageLoader(this.img_url, {bgAlpha: 0, width: 500, height: 500 * 3 / 4, scaleMode: ScaleMode.PROPORTIONAL_INSIDE, centerRegistration: false});
			imgl.load();
			
			this.txt_title = TextFieldGenerator.crearTextField(this.str_title, {color: 0xffffff});
			this.txt_text = TextFieldGenerator.crearTextField(this.str_text, {color: 0xffffff, multiline: true, wordwrap: true, width: 500});
			
			var triangle_params:Object = {fillColor: 0x555555, lineAlpha: 0};
			this._left_button = new TriangleIcon(triangle_params);
			this._right_button = new TriangleIcon(triangle_params);
		}
		
		private function agregarListeners():void
		{
			this._left_button.addEventListener(MouseEvent.CLICK, onClickArrow);
			this._right_button.addEventListener(MouseEvent.CLICK, onClickArrow);
		}
		
		private function onClickArrow(e:MouseEvent):void
		{
			switch (e.target)
			{
				case this._left_button:
					
					this._actual_node_index = (this._actual_node_index == 0) ? this._data.length - 1 : this._actual_node_index - 1;
					
					this.img_url = this._data[this._actual_node_index].imagen_grande;
					this.str_text = this._data[this._actual_node_index].content_text;
					this.str_title = this._data[this._actual_node_index].content_title;
					
					break;
				
				case this._right_button:
					
					this._actual_node_index = (this._actual_node_index == this._data.length - 1) ? 0 : this._actual_node_index + 1;
					
					this.img_url = this._data[this._actual_node_index].imagen_grande;
					this.str_text = this._data[this._actual_node_index].content_text;
					this.str_title = this._data[this._actual_node_index].content_title;
					
					break;
			}
			
			this.update();
		}
		
		private function update():void
		{
			//image
			if (this.imgl && this.contains(this.imgl.content))
			{
				this.removeChild(this.imgl.content);
				
				this.imgl = new ImageLoader(this.img_url, {bgAlpha: 0, width: 500, height: 500 * 3 / 4, scaleMode: ScaleMode.PROPORTIONAL_INSIDE, centerRegistration: false});
				imgl.load();
				
				this.addChild(this.imgl.content);
			}
			
			//texts
			this.txt_title.text = this.str_title;
			this.txt_text.text = this.str_text;
		}
		
		private function dibujar():void
		{
			this.addChild(this.imgl.content);
			this.addChild(this.txt_title);
			this.txt_title.y = 500 * 3 / 4 + 5;
		
			//this.addChild(this.txt_text);
		
			//this.layout.addNode(this.imgl.content, false);
			//this.layout.addNode(this.txt_title, false);
			//this.layout.addNode(this.txt_text, false);
			//this.layout.updateAndRender();
			
			this.addChild(this._left_button);
			this._left_button.width = this.imgl.vars.height * 0.2;
			this._left_button.height = 20;
			this._left_button.y = this.imgl.vars.height / 2;
			this._left_button.x = -this._left_button.height / 2 - 5;
			this._left_button.rotation = -90;
			
			this.addChild(this._right_button);
			this._right_button.width = this.imgl.vars.height * 0.2;
			this._right_button.height = 20;
			this._right_button.y = this.imgl.vars.height / 2;
			this._right_button.x = this.imgl.vars.width + this._right_button.height / 2 + 5;
			this._right_button.rotation = 90;
		}
	}

}