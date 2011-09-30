package menus.izquierda.imagina
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.as3joelib.utils.Singleton;
	import com.greensock.events.LoaderEvent;
	import com.greensock.layout.ScaleMode;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import config.ApplicationConfiguration;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import menus.izquierda.photogrid.PhotoGridNode;
	import org.flashsandy.display.DistortImage;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class Room extends Sprite
	{
		//eventos
		public static const ROOM_LOADED:String = 'roomLoaded';
		
		private var _data:Object;
		
		private var loader_max:LoaderMax;
		private var imgl_room:ImageLoader;
		private var imgl_mask:ImageLoader;
		
		//private var textures:Vector.<Sprite>;
		private var imgl_texture:ImageLoader;
		private var sprite_texture:Sprite;
		private var bmpd_texture:BitmapData;
		
		private var btn_tl:DragPoint;
		private var btn_tr:DragPoint;
		private var btn_bl:DragPoint;
		private var btn_br:DragPoint;
		
		//data del hotspot que se esta editando
		private var hotspot:Object;
		
		//debug
		private var debug:TextField;
		
		private var distorsion:DistortImage;
		
		public function Room(data:Object)
		{
			this._data = data;
			
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.btn_tl = new DragPoint();
			this.btn_tr = new DragPoint();
			this.btn_bl = new DragPoint();
			this.btn_br = new DragPoint();
			
			this.sprite_texture = new Sprite();
			
			this.imgl_room = new ImageLoader(this._data.image, {width: ApplicationConfiguration.MAIN_CONTENT_WIDTH, height: ApplicationConfiguration.MAIN_CONTENT_HEIGHT});
			this.imgl_mask = new ImageLoader(this._data.mask, {width: ApplicationConfiguration.MAIN_CONTENT_WIDTH, height: ApplicationConfiguration.MAIN_CONTENT_HEIGHT});
			
			this.loader_max = new LoaderMax({onComplete: onLoaderMaxComplete});
			this.loader_max.append(this.imgl_room);
			this.loader_max.append(this.imgl_mask);
			this.loader_max.load();
		}
		
		private function onLoaderMaxComplete(e:LoaderEvent):void
		{
			this.compose();
			
			//event dispatch
			this.dispatchEvent(new Event(ROOM_LOADED, true));
		}
		
		private function compose():void
		{
			var composite:BitmapData = new BitmapData(ApplicationConfiguration.MAIN_CONTENT_WIDTH, ApplicationConfiguration.MAIN_CONTENT_HEIGHT, true);
			
			var bmpd_room:BitmapData = Bitmap(imgl_room.rawContent).bitmapData.clone();
			var bmpd_mask:BitmapData = Bitmap(imgl_mask.rawContent).bitmapData;
			
			if (this.bmpd_texture)
			{
				trace('Room.compose');
				bmpd_room.draw(this.sprite_texture);
					//composite.copyPixels(bmpd_room, bmpd_room.rect, new Point(), bmpd_mask, new Point());
			}
			
			composite.copyPixels(bmpd_room, bmpd_room.rect, new Point(), bmpd_mask, new Point());
			
			var r:Bitmap = new Bitmap(composite);
			this.addChild(this.imgl_room.content);
			this.addChild(r);
		}
		
		private function agregarListeners():void
		{
			this.addEventListener(DragPoint.DRAG_POINT_MOVE, onDragPointMove);
			
			//debug
			this.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void
		{
			trace(e);
			
			if (Singleton.getInstance().data.json.data.secciones.imagina_tus_espacios.debug)
			{
				if (this.debug && this.contains(this.debug))
					this.removeChild(this.debug);
				
				this.debug = TextFieldGenerator.crearTextField('{"x":' + MouseEvent(e).localX + ',"y":' + MouseEvent(e).localX + '}', {color: 0xffffff, selectable: true});
				this.addChild(this.debug);
			}
		}
		
		private function onDragPointMove(e:Event):void
		{
			this.sprite_texture.graphics.clear();
			
			//puntos
			var tl:Point = new Point(btn_tl.x, btn_tl.y);
			var tr:Point = new Point(btn_tr.x, btn_tr.y);
			var bl:Point = new Point(btn_bl.x, btn_bl.y);
			var br:Point = new Point(btn_br.x, btn_br.y);
			
			//hay que redibujar el distorsion
			this.distorsion.setTransform(this.sprite_texture.graphics, Bitmap(this.imgl_texture.rawContent).bitmapData, tl, tr, br, bl);
		}
		
		private function dibujar():void
		{
		}
		
		public function addTex(data:Object):void
		{
			//actualizar datos del hotspot
			this.hotspot = data;
			
			this.imgl_texture = new ImageLoader(this.hotspot.imagen_grande, {x: ApplicationConfiguration.MAIN_CONTENT_WIDTH / 2 - 100, y: ApplicationConfiguration.MAIN_CONTENT_HEIGHT / 2 - 100, onComplete: onTexLoaded});
			//width: 200, height: 200, scaleMode: ScaleMode.STRETCH, 
			this.imgl_texture.load();
			
			//agregar el texture sprite
			this.sprite_texture.graphics.clear();
			this.addChild(this.sprite_texture);
		}
		
		public function merge():void
		{
			this.compose();
			
			if (this.btn_tl && this.contains(this.btn_tl))
				this.removeChild(this.btn_tl);
			
			if (this.btn_tr && this.contains(this.btn_tr))
				this.removeChild(this.btn_tr);
			
			if (this.btn_bl && this.contains(this.btn_bl))
				this.removeChild(this.btn_bl);
			
			if (this.btn_br && this.contains(this.btn_br))
				this.removeChild(this.btn_br);
			
			if (this.sprite_texture && this.contains(this.sprite_texture))
				this.removeChild(this.sprite_texture);
		}
		
		private function onTexLoaded(e:LoaderEvent):void
		{
			//sacar bitmapdata
			var s:Sprite = new Sprite();
			s.addChild(imgl_texture.content);
			
			this.bmpd_texture = new BitmapData(this.imgl_texture.content.width, this.imgl_texture.content.height);
			this.bmpd_texture.draw(imgl_texture.content);
			
			//puntos
			//var tl:Point = new Point(ApplicationConfiguration.MAIN_CONTENT_WIDTH / 2 - 100, ApplicationConfiguration.MAIN_CONTENT_HEIGHT / 2 - 100);
			//var tr:Point = new Point(ApplicationConfiguration.MAIN_CONTENT_WIDTH / 2 + 100, ApplicationConfiguration.MAIN_CONTENT_HEIGHT / 2 - 100);
			//var bl:Point = new Point(ApplicationConfiguration.MAIN_CONTENT_WIDTH / 2 - 100, ApplicationConfiguration.MAIN_CONTENT_HEIGHT / 2 + 100);
			//var br:Point = new Point(ApplicationConfiguration.MAIN_CONTENT_WIDTH / 2 + 100, ApplicationConfiguration.MAIN_CONTENT_HEIGHT / 2 + 100);
			
			var tl:Point = new Point(this.hotspot.tl.x, this.hotspot.tl.y);
			var tr:Point = new Point(this.hotspot.tr.x, this.hotspot.tr.y);
			var bl:Point = new Point(this.hotspot.bl.x, this.hotspot.bl.y);
			var br:Point = new Point(this.hotspot.br.x, this.hotspot.br.y);
			
			//textura
			var t:Sprite = new Sprite();
			this.addChild(t);
			
			//agregar dragpoints
			this.addChild(btn_tl);
			this.addChild(btn_tr);
			this.addChild(btn_bl);
			this.addChild(btn_br);
			
			this.btn_tl.x = tl.x;
			this.btn_tl.y = tl.y;
			
			this.btn_tr.x = tr.x;
			this.btn_tr.y = tr.y;
			
			this.btn_bl.x = bl.x;
			this.btn_bl.y = bl.y;
			
			this.btn_br.x = br.x;
			this.btn_br.y = br.y;
			
			this.distorsion = new DistortImage(this.imgl_texture.content.width, this.imgl_texture.content.height, 25, 25);
			this.distorsion.setTransform(this.sprite_texture.graphics, this.bmpd_texture, tl, tr, br, bl);
			
			this.merge();
		}
	}

}