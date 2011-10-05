package assets
{
	import com.as3joelib.utils.ArrayUtil;
	import com.as3joelib.utils.ObjectUtil;
	import com.as3joelib.utils.Singleton;
	import com.greensock.layout.ScaleMode;
	import com.greensock.loading.SWFLoader;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class Logo extends Sprite
	{
		public static const WIDTH:Number = 250;
		public static const HEIGHT:Number = 105;
		
		private var loader:SWFLoader;
		
		public function Logo()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			//trace(Singleton.getInstance().data.json.data.logo);
			this.loader = new SWFLoader(Singleton.getInstance().data.json.data.logo, { width:WIDTH, height:HEIGHT, bgColor:0xff0000, bgAlpha:0, scaleMode:ScaleMode.WIDTH_ONLY } );
			this.loader.load();
		}
		
		private function agregarListeners():void
		{
		
		}
		
		private function dibujar():void
		{
			this.addChild(this.loader.content);
		}
	
	}

}