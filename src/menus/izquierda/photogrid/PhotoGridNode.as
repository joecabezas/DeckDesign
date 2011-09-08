package menus.izquierda.photogrid
{
	import com.as3joelib.ui.Button;
	import com.greensock.loading.ImageLoader;
	import com.greensock.TweenLite;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class PhotoGridNode extends Button
	{
		//constantes de eventos
		public static const CLICK_PHOTO_GRID_NODE:String = 'clickPhotoGridNode';
		
		private var img_loader:ImageLoader;		
		private var _data:Object;
		
		//ui
		private var fondo:Sprite;
		
		public function PhotoGridNode(data:Object)
		{
			this._data = data;
			
			this.setup();
			this.load();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.img_loader = new ImageLoader(this._data.imagen_chica, { width:ApplicationConfiguration.PHOTO_GRID_NODE_SIZE, height:ApplicationConfiguration.PHOTO_GRID_NODE_SIZE } );
			
			this.fondo = new Sprite();
			this.fondo.graphics.beginFill(ApplicationConfiguration.COLOR_QUIENES_SOMOS);
			this.fondo.graphics.drawRect(-ApplicationConfiguration.PHOTO_GRID_NODE_SIZE/2, -ApplicationConfiguration.PHOTO_GRID_NODE_SIZE/2, ApplicationConfiguration.PHOTO_GRID_NODE_SIZE, ApplicationConfiguration.PHOTO_GRID_NODE_SIZE);
			this.fondo.graphics.endFill();
			
			//toggle ON
			this.toggle = true;
		}
		
		private function load():void 
		{
			this.img_loader.load();
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo);
			this.fondo.x = this.fondo.width / 2;
			this.fondo.y = this.fondo.height / 2;
			
			this.addChild(this.img_loader.content);
		}
		
		override protected function onClick(e:MouseEvent):void {
			this.dispatchEvent(new Event(PhotoGridNode.CLICK_PHOTO_GRID_NODE, true));
		}
		
		override protected function onRollOver(e:MouseEvent):void {
			TweenLite.to(this.fondo, 0.3, { scaleX:1.1, scaleY:1.1 } );
		}
		
		override protected function onRollOut(e:MouseEvent):void {
			if(!this.selected)
				TweenLite.to(this.fondo, 0.3, { scaleX:1.0, scaleY:1.0 } );
		}
		
		override protected function onSelectedChange():void {
			if (this.selected) {
				TweenLite.to(this.fondo, 0.3, { scaleX:1.1, scaleY:1.1 } );
			} else {
				TweenLite.to(this.fondo, 0.3, { scaleX:1.0, scaleY:1.0 } );
			}
		}
		
		public function get data():Object 
		{
			return _data;
		}
	}

}