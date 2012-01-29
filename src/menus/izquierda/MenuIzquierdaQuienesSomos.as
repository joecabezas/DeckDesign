package menus.izquierda
{
	import com.as3joelib.utils.ObjectUtil;
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
		private var _contenido:Vector.<NewPanelIzquierda>;
		
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
			this._contenido = new Vector.<NewPanelIzquierda>;
			
			this.layout = new VerticalLine(5);
			this.layout.x = 12;
			this.layout.y = 0;
		}
		
		private function setupItems():void 
		{
			for each(var i:Object in Singleton.getInstance().data.json.data.secciones.quienes_somos.items) {
				ObjectUtil.pr(i);
				
				//items del menu
				this._contenido.push(
					new NewPanelIzquierda(
						String(i.menu_title),
						String(i.content_title),
						String(i.content_text)
					)
				);
			}
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			for each (var t:NewPanelIzquierda in this._contenido)
			{
				this.addChild(t);
				this.layout.addNode(t);
			}
		}
	
	}

}