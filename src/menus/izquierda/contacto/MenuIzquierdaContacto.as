package menus.izquierda.contacto
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.as3joelib.utils.Singleton;
	import config.ApplicationConfiguration;
	import contenidos.MenuContent;
	import contenidos.MenuContentNode;
	import flash.text.TextField;
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
		
		//info
		private var txt_info:TextField;
		
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
			
			
			//info
			var opciones:Object = {size: 12, border: false, align: TextFieldGenerator.TEXTFORMAT_ALIGN_RIGHT, autosize: TextFieldGenerator.AUTOSIZE_NONE, color: 0xffffff, width: ApplicationConfiguration.MENU_IZQUIERDA_WIDTH, height:150, multiline:true, wordwrap:true};
			this.txt_info = TextFieldGenerator.crearTextField(Singleton.getInstance().data.json.data.secciones.contacto.info, opciones);
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			//set title
			this.setTitle(ApplicationConfiguration.STR_CONTACTO.toUpperCase(), ApplicationConfiguration.COLOR_QUIENES_SOMOS);
			
			//this.addChild(this.text_node_cotiza);
			this.text_node_cotiza.x = -12;
			this.text_node_cotiza.y = 100;
			
			//info
			this.addChild(this.txt_info);
			this.txt_info.x = -12;
			this.txt_info.y = 150;
			
			//form
			this.addChild(this.formulario);
			this.formulario.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH + ApplicationConfiguration.MENU_IZQUIERDA_SEPARACION;
			this.formulario.y = 120;
		}
	
	}

}