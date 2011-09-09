package menus.izquierda.contacto
{
	import config.ApplicationConfiguration;
	import contenidos.MenuContent;
	import contenidos.MenuContentNode;
	import form.ContactoForm;
	import menus.izquierda.MenuIzquierdaBlackTemplate;
	import menus.izquierda.MenuIzquierdaTextNode;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuIzquierdaContacto extends MenuIzquierdaBlackTemplate
	{
		//text nodes
		private var text_node_cotiza:MenuIzquierdaTextNode;
		
		//form
		private var formulario:ContactoForm;
		
		public function MenuIzquierdaContacto()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.formulario = new ContactoForm();
			
			this.text_node_cotiza = new MenuIzquierdaTextNode(ApplicationConfiguration.STR_COTIZA.toUpperCase());
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			//set title
			this.setTitle(ApplicationConfiguration.STR_CONTACTO.toUpperCase(), ApplicationConfiguration.COLOR_QUIENES_SOMOS);
			
			this.addChild(this.text_node_cotiza);
			this.text_node_cotiza.y = 100;
			
			this.addChild(this.formulario);
			this.formulario.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH + 5;
			this.formulario.y = 120;
		}
	
	}

}