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
		private var content_title:String;
		private var content_text:String;
		
		public function GaleriaImageNode(url_chica:String, url_grande:String, content_title:String, content_text:String)
		{
			this.url_chica = url_chica;
			this.url_grande = url_grande;
			this.content_title = content_title;
			this.content_text = content_text;
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.imgl = new ImageLoader(this.url_chica, { width:500/LinearCarrousel.CANTIDAD_ELEMENTOS_A_MOSTRAR, height:500/LinearCarrousel.CANTIDAD_ELEMENTOS_A_MOSTRAR, scaleMode:ScaleMode.STRETCH } );
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
		
		public function getTitle():String {
			return this.content_title;
		}
		
		public function getText():String {
			return this.content_text;
		}
		
		override protected function onClick(e:MouseEvent):void {
			this.dispatchEvent(new Event(CLICK_GALERIA_IMAGE_NODE, true));
		}
		
		override protected function onRollOver(e:MouseEvent):void {
			//TweenLite.to(this.imgl.content, 0.2, { scaleX:1.1, scaleY:1.1 } );
		}
		
		override protected function onRollOut(e:MouseEvent):void {
			//TweenLite.to(this.imgl.content, 0.2, { scaleX:1, scaleY:1 } );
		}
	}

}