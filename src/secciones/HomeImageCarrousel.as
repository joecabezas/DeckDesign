package secciones
{
	import com.as3joelib.ui.UISwitcher;
	import com.as3joelib.utils.Singleton;
	import com.greensock.loading.ImageLoader;
	import config.ApplicationConfiguration;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class HomeImageCarrousel extends Sprite
	{		
		private var images:Vector.<ImageLoader>;
		private var switcher:UISwitcher;
		private var timer:Timer;
		
		public function HomeImageCarrousel()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.images = new Vector.<ImageLoader>;
			
			this.switcher = new UISwitcher();
			this.switcher.animation_in_object = { duration:2, alpha:1 };
			this.switcher.animation_out_object = { duration:2, alpha:0 };
			
			//agregar imagenes
			for each(var i:Object in Singleton.getInstance().data.json.data.secciones.home.contenido) {
				var il:ImageLoader = new ImageLoader(i.img, { width:ApplicationConfiguration.MAIN_CONTENT_WIDTH, height:ApplicationConfiguration.MAIN_CONTENT_HEIGHT } );
				this.images.push(il);
				il.load();
			}
			
			//set timer
			this.timer = new Timer(3*1000);
			this.timer.start();
		}
		
		private function agregarListeners():void
		{
			this.timer.addEventListener(TimerEvent.TIMER, onTimer);
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			this.switcher.next();
		}
		
		private function dibujar():void
		{
			for each(var il:ImageLoader in this.images) {
				this.addChild(il.content);
				this.switcher.addItem(il.content);
			}
		}
	
	}

}