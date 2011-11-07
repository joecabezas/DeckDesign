package secciones
{
	import com.as3joelib.ui.UISwitcher;
	import com.as3joelib.utils.Singleton;
	import com.greensock.layout.ScaleMode;
	import com.greensock.loading.ImageLoader;
	import config.ApplicationConfiguration;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.geom.Point;
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
		
		//mask
		private var s_mask:Sprite;
		
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
				var il:ImageLoader = new ImageLoader(i.img, { width:ApplicationConfiguration.HOME_CARROUSEL_WIDTH, height:ApplicationConfiguration.MAIN_CONTENT_HEIGHT, scaleMode:ScaleMode.PROPORTIONAL_OUTSIDE } );
				this.images.push(il);
				il.load();
			}
			
			//mask
			this.s_mask = new Sprite();
			this.s_mask.graphics.beginFill(0xff0000, 1);
			this.s_mask.graphics.drawRect(0, 0, ApplicationConfiguration.HOME_CARROUSEL_WIDTH, ApplicationConfiguration.MAIN_CONTENT_HEIGHT);
			this.s_mask.graphics.endFill();
			
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
				
				//modificacion 7 nov 2011
				//ahora las imagenes deben ocupar el espacio completo
				il.content.x = -255;
				
				this.switcher.addItem(il.content);
			}
			
			this.addChild(this.s_mask);
			this.s_mask.x = -255;
			
			this.mask = this.s_mask;
		}
	
	}

}