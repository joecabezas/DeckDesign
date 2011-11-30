package menus.izquierda.galeria
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.greensock.layout.ScaleMode;
	import com.greensock.loading.ImageLoader;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import com.somerandomdude.coordy.layouts.twodee.VerticalLine;
	import flash.display.Sprite;
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
		
		//private var layout:ILayout2d;
		
		public function NodeWindow(image_url:String, title:String, text:String)
		{
			this.img_url = image_url;
			this.str_title = title;
			this.str_text = text;
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.imgl = new ImageLoader(this.img_url, {bgAlpha: 0,width: 500, height: 500*3/4, scaleMode: ScaleMode.PROPORTIONAL_INSIDE, centerRegistration: false});
			imgl.load();
			
			this.txt_title = TextFieldGenerator.crearTextField(this.str_title, {color:0xffffff } );
			this.txt_text = TextFieldGenerator.crearTextField(this.str_text, {color:0xffffff, multiline:true, wordwrap:true, width:500 } );
			
			//this.layout = new VerticalLine(0);
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.imgl.content);
			this.addChild(this.txt_title);
			this.txt_title.y = 500*3/4 + 5;
			
			//this.addChild(this.txt_text);
			
			//this.layout.addNode(this.imgl.content, false);
			//this.layout.addNode(this.txt_title, false);
			//this.layout.addNode(this.txt_text, false);
			//this.layout.updateAndRender();
		}
	}

}