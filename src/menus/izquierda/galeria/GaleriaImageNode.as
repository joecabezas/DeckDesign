package menus.izquierda.galeria
{
	import com.as3joelib.ui.Button;
	import com.greensock.layout.ScaleMode;
	import com.greensock.loading.ImageLoader;
	import com.greensock.TweenLite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class GaleriaImageNode extends Button
	{
		//eventos
		public static const CLICK_GALERIA_IMAGE_NODE:String = 'galeriaImageNode';
		
		private var imgl:ImageLoader;
		private var url_chica:String;
		private var url_grande:String;
		
		public function GaleriaImageNode(url_chica:String, url_grande:String)
		{
			this.url_chica = url_chica;
			this.url_grande = url_grande;
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.imgl = new ImageLoader(this.url_chica, { width:70, height:110, scaleMode:ScaleMode.PROPORTIONAL_INSIDE } );
			this.imgl.load();
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.imgl.content);
		}
		
		public function getUrlBig():String {
			return this.url_grande;
		}
		
		override protected function onClick(e:MouseEvent):void {
			this.dispatchEvent(new Event(CLICK_GALERIA_IMAGE_NODE, true));
		}
		
		override protected function onRollOver(e:MouseEvent):void {
			TweenLite.to(this.imgl.content, 0.2, { scaleX:1.1, scaleY:1.1 } );
		}
		
		override protected function onRollOut(e:MouseEvent):void {
			TweenLite.to(this.imgl.content, 0.2, { scaleX:1, scaleY:1 } );
		}
	}

}