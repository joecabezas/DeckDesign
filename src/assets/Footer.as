package assets
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.as3joelib.utils.Singleton;
	import com.greensock.layout.ScaleMode;
	import com.greensock.loading.ImageLoader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class Footer extends Sprite
	{
		public static const WIDTH:Number = 219;
		public static const HEIGHT:Number = 15;
		
		private var img:ImageLoader;
		private var txt:TextField;
		
		public function Footer()
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.img = new ImageLoader(Singleton.getInstance().data.json.data.footer, { width: WIDTH, height: HEIGHT, bgColor: 0xff0000, bgAlpha: 1, scaleMode: ScaleMode.WIDTH_ONLY } );
			this.img.load();
			
			this.txt = TextFieldGenerator.crearTextField('Copyright 2011 DeckDesign | +56 9 7774 9430 | cgarcia@deckdesign.cl', { color:0xffffff, size:9 } );
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.img.content);
			
			this.addChild(this.txt);
			this.txt.x = this.stage.stageWidth - this.txt.textWidth - 20;
		}
	
	}

}