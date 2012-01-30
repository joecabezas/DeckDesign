package menus.izquierda.imagina
{
	import com.as3joelib.utils.ObjectUtil;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	import menus.izquierda.MenuIzquierdaBlackTemplate;
	import menus.izquierda.photogrid.PhotoGridNode;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuIzquierdaImaginaTusEspacios extends MenuIzquierdaBlackTemplate
	{
		private var fondo:Sprite;
		private var menu_ambientes:MenuAmbientes;
		private var content_ambientes:Room;
		private var textures_grid:TextureSelector;
		
		public function MenuIzquierdaImaginaTusEspacios()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.fondo = new Sprite();
			this.fondo.graphics.beginFill(ApplicationConfiguration.COLOR_BACKGROUND_APPLICATION);
			this.fondo.graphics.drawRect(0, 0, ApplicationConfiguration.MAIN_CONTENT_WIDTH, ApplicationConfiguration.MAIN_CONTENT_HEIGHT);
			this.fondo.graphics.endFill();
			
			this.menu_ambientes = new MenuAmbientes();
		}
		
		private function agregarListeners():void
		{
			this.addEventListener(RoomNode.CLICK_ROOM_NODE, onClickRoomNode);
			this.addEventListener(PhotoGridNode.CLICK_PHOTO_GRID_NODE, onClickPhotoGridNode);
			this.addEventListener(BtnOk.CLICK_OK_BUTTON, clickOkButton);
		}
		
		private function clickOkButton(e:Event):void
		{
			this.content_ambientes.merge();
		}
		
		private function onClickPhotoGridNode(e:Event):void
		{
			//determinar a que hotspot
			var h:uint = PhotoGridNode(e.target).data.index / 3;
			this.content_ambientes.addTex(PhotoGridNode(e.target).data)
		}
		
		private function onClickRoomNode(e:Event):void
		{
			//trace(e);
			
			if (this.content_ambientes && this.contains(this.content_ambientes))
			{
				this.removeChild(this.content_ambientes);
			}
			this.content_ambientes = new Room(RoomNode(e.target).getData());
			this.addChild(this.content_ambientes);
			this.content_ambientes.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH + ApplicationConfiguration.MENU_IZQUIERDA_SEPARACION;
			
			if (this.textures_grid && this.contains(this.textures_grid))
			{
				this.removeChild(this.textures_grid);
			}
			this.textures_grid = new TextureSelector(RoomNode(e.target).getData().hotspots);
			this.addChild(this.textures_grid);
		}
		
		private function dibujar():void
		{
			//set title
			this.setTitle(ApplicationConfiguration.STR_IMAGINA_TUS_ESPACIOS.toUpperCase(), ApplicationConfiguration.COLOR_QUIENES_SOMOS);
			
			//fondo
			this.addChild(this.fondo);
			this.fondo.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH + ApplicationConfiguration.MENU_IZQUIERDA_SEPARACION;
			
			//menu ambientes
			this.addChild(this.menu_ambientes);
			this.menu_ambientes.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH + ApplicationConfiguration.MENU_IZQUIERDA_SEPARACION - 15;
			this.menu_ambientes.y = 10;
		}
	
	}

}