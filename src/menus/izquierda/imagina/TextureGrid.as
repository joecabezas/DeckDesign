package menus.izquierda.imagina
{
	import com.as3joelib.ui.UISwitcher;
	import com.as3joelib.utils.ObjectUtil;
	import com.as3joelib.utils.Singleton;
	import com.greensock.loading.ImageLoader;
	import com.somerandomdude.coordy.layouts.twodee.HorizontalLine;
	import com.somerandomdude.coordy.layouts.twodee.VerticalLine;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	import menus.izquierda.photogrid.PhotoGridNode;
	import menus.izquierda.photogrid.PhotoGridPage;
	import menus.izquierda.photogrid.PhotoGridPaginator;
	import menus.izquierda.photogrid.PhotoGridPaginatorNode;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class TextureGrid extends Sprite
	{
		//constantes de diseño
		public static const SELECT_NODE:String = 'selectNode';
		
		//constantes de diseño
		private const SEPARACION:uint = 19;
		
		private var _data:Object;
		private var items:Vector.<Object>;
		//private var selected_item_index:uint;
		
		//private var pages:Vector.<PhotoGridPage>;
		//private var pages_switcher:UISwitcher;
		
		//private var paginator:PhotoGridPaginator;
		
		private var nodes:Vector.<PhotoGridNode>;
		private var colums:Vector.<Sprite>;
		
		public function TextureGrid(data:Object)
		{
			this._data = data;
			
			this.setup();
			this.setupItems();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.items = new Vector.<Object>;
			
			//this.pages = new Vector.<PhotoGridPage>;
			
			//this.pages_switcher = new UISwitcher();
			//this.pages_switcher.animation_in_object = {duration: 0.3, alpha: 1};
			//this.pages_switcher.animation_out_object = {duration: 0.3, alpha: 0};
			
			this.nodes = new Vector.<PhotoGridNode>;
			this.colums = new Vector.<Sprite>;
		}
		
		private function setupItems():void
		{
			trace('PhotoGrid.setupItems');
			/*var index:uint = 0;
			for each (var h:Object in this._data)
			{
				for each (var t:Object in h.textures)
				{
					t.index = index;
					t.tl = h.tl;
					t.tr = h.tr;
					t.bl = h.bl;
					t.br = h.br;
					this.items.push(t);
					index++;
				}
			}*/
			
			/*//cortar los primeros 9, pues solo se dibujaran 9
			this.items = this.items.slice(0, 9);
			
			//reordenar para que se dibujen por columnas en el grid
			var v:Vector.<Object> = new Vector.<Object>;
			
			v.push(this.items[0]);
			v.push(this.items[3]);
			v.push(this.items[6]);
			v.push(this.items[1]);
			v.push(this.items[4]);
			v.push(this.items[7]);
			v.push(this.items[2]);
			v.push(this.items[5]);
			v.push(this.items[8]);
			
			//reasignacion de los items reordenados a la lista de items final
			this.items = v;*/
			
			/*
			//determinar cuantas paginas tengo
			var n_pages:uint = Math.ceil(this.items.length / ELEMENTOS_POR_PAGINA);
			
			//crear cada pagina, dando los items correspondientes
			for (var j:uint = 0; j < n_pages; j++)
			{
				var p:PhotoGridPage = new PhotoGridPage(this.items.slice(j * ELEMENTOS_POR_PAGINA, (j + 1) * ELEMENTOS_POR_PAGINA), j);
				
				this.pages.push(p);
			}
			this.paginator = new PhotoGridPaginator(n_pages);
			*/
			
			//crear las columnas
			for each (var h:Object in this._data)
			{
				//por cada hotspot crear una columna:
				var vl:VerticalLine = new VerticalLine(SEPARACION);
				var col:Sprite = new Sprite();
				
				for each (var t:Object in h.textures)
				{
					//agregar puntos al objeto de textura
					t.tl = h.tl;
					t.tr = h.tr;
					t.bl = h.bl;
					t.br = h.br;
					
					var pgn:PhotoGridNode = new PhotoGridNode(t);
					this.nodes.push(pgn);
					col.addChild(pgn);
					vl.addNode(pgn);
				}
				this.colums.push(col);
			}
		}
		
		private function agregarListeners():void
		{
			this.addEventListener(PhotoGridNode.CLICK_PHOTO_GRID_NODE, onClickPhotoGridNode);
		}
		
		private function onClickPhotoGridNode(e:Event):void
		{
			this.deseleccionarTodosExcepto(PhotoGridNode(e.target));
		}
		
		private function deseleccionarTodosExcepto(n:PhotoGridNode):void {
			for each(var i:PhotoGridNode in this.nodes) {
				if(n != i)
					i.selected = false;
			}
		}
		
		private function dibujar():void
		{
			/*for each (var p:PhotoGridPage in this.pages)
			{
				this.addChild(p);
				this.pages_switcher.addItem(p);
				
				p.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH * 0.07;
				p.y = ApplicationConfiguration.MENU_IZQUIERDA_HEIGHT * 0.55;
			}
			this.pages_switcher.hideAllItems();
			this.pages_switcher.switchToIndex(0);
			
			this.addChild(this.paginator);
			this.paginator.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH - 20 - this.paginator.width;
			this.paginator.y = ApplicationConfiguration.MENU_IZQUIERDA_HEIGHT - 20;*/
			
			var hl:HorizontalLine = new HorizontalLine(SEPARACION);
			for each(var c:Sprite in this.colums) {
				this.addChild(c);
				hl.addNode(c);
			}			
		}
		
		public function selectNodeByIndex(index:uint):void
		{
		
		}
	}

}