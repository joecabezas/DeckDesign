package menus.izquierda
{
	import com.as3joelib.utils.Singleton;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import com.somerandomdude.coordy.layouts.twodee.VerticalLine;
	import config.ApplicationConfiguration;
	import contenidos.MainContent;
	import contenidos.MenuContent;
	import contenidos.MenuContentNode;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuIzquierdaQuienesSomos extends MenuIzquierdaBlackTemplate
	{
		private var items_menu:Vector.<MenuIzquierdaTextNode>;
		private var menu_content:MenuContent;
		
		//ui
		private var layout:ILayout2d;
		
		public function MenuIzquierdaQuienesSomos()
		{
			this.setup();
			this.setupItems();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.items_menu = new Vector.<MenuIzquierdaTextNode>;
			
			this.menu_content = new MenuContent();
			this.menu_content.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH + 5;
			
			this.layout = new VerticalLine(5);
			this.layout.y = 100;
		}
		
		private function setupItems():void 
		{
			for each(var i:Object in Singleton.getInstance().data.json.data.secciones.quienes_somos.items) {
				//ObjectUtil.pr(i);
				
				//items del menu
				this.items_menu.push(new MenuIzquierdaTextNode(String(i.menu_title).toUpperCase()));
				
				//items del contenido
				this.menu_content.addNode(new MenuContentNode(String(i.content_title), String(i.content_text)));
			}
		}
		
		private function agregarListeners():void
		{
			this.addEventListener(MenuIzquierdaTextNode.MENU_IZQUIERDA_TEXT_NODE_ROLLOVER, onTextNodeEvent);
			this.addEventListener(MenuIzquierdaTextNode.MENU_IZQUIERDA_TEXT_NODE_ROLLOUT, onTextNodeEvent);
		}
		
		private function onTextNodeEvent(e:Event):void 
		{
			switch(e.type) {
				case MenuIzquierdaTextNode.MENU_IZQUIERDA_TEXT_NODE_ROLLOVER:
					this.menu_content.switchTo(this.items_menu.indexOf(MenuIzquierdaTextNode(e.target)),MenuIzquierdaTextNode(e.target).y);
					break;
				case MenuIzquierdaTextNode.MENU_IZQUIERDA_TEXT_NODE_ROLLOUT:
					this.menu_content.hideAllItems();
					break;
			}
		}
		
		private function dibujar():void
		{
			//set title
			this.setTitle(ApplicationConfiguration.STR_QUIENES_SOMOS.toUpperCase(), ApplicationConfiguration.COLOR_QUIENES_SOMOS);
			
			//contents
			this.addChild(this.menu_content);
			
			//menu items
			for each (var t:MenuIzquierdaTextNode in this.items_menu)
			{
				this.addChild(t);
				this.layout.addNode(t);
				
				MenuContentNode(this.menu_content.items[this.items_menu.indexOf(t)]).y = t.y;
			}
		}
	
	}

}