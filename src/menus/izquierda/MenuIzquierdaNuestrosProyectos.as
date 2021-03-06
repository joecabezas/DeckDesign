package menus.izquierda
{
	import com.as3joelib.utils.ObjectUtil;
	import com.as3joelib.utils.Singleton;
	import config.ApplicationConfiguration;
	import contenidos.NuestrosProyectosInfo;
	import contenidos.ProyectosContent;
	import contenidos.NuestrosProyectosInfo;
	import flash.events.Event;
	import menus.izquierda.photogrid.PhotoGrid;
	import menus.izquierda.photogrid.PhotoGridNode;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuIzquierdaNuestrosProyectos extends MenuIzquierdaBlackTemplate
	{
		//ui
		private var grid:PhotoGrid;
		private var proyectos_content:ProyectosContent;
		private var slide_panel:NuestrosProyectosInfo;
		
		public function MenuIzquierdaNuestrosProyectos()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.grid = new PhotoGrid(Singleton.getInstance().data.json.data.secciones.nuestros_proyectos.items);
			
			this.proyectos_content = new ProyectosContent();
			
			
			this.slide_panel = new NuestrosProyectosInfo();
			
			if (!Singleton.getInstance().data.json.data.secciones.nuestros_proyectos.items[0])
				return;
				
			this.slide_panel.setData(Singleton.getInstance().data.json.data.secciones.nuestros_proyectos.items[0]);
		}
		
		private function agregarListeners():void
		{
			this.addEventListener(PhotoGridNode.CLICK_PHOTO_GRID_NODE, onClickPhotoGridNode);
		}
		
		private function onClickPhotoGridNode(e:Event):void
		{
			this.proyectos_content.loadImageUrl(PhotoGridNode(e.target).data.imagen_grande);
			this.slide_panel.setData(PhotoGridNode(e.target).data);
		}
		
		private function onSelectNode(e:Event):void
		{
		}
		
		private function dibujar():void
		{
			//set title
			this.setTitle(ApplicationConfiguration.STR_NUESTROS_PROYECTOS.toUpperCase(), ApplicationConfiguration.COLOR_QUIENES_SOMOS);
			
			this.addChild(this.grid);
			this.grid.x = 12;
			
			this.addChild(this.proyectos_content);
			this.proyectos_content.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH + ApplicationConfiguration.MENU_IZQUIERDA_SEPARACION;
			
			this.addChild(this.slide_panel);
			this.slide_panel.x = 12;
			this.slide_panel.y = 280;
		}
	
	}

}