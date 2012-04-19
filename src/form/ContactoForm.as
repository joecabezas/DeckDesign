package form
{
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import com.somerandomdude.coordy.layouts.twodee.VerticalLine;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import form.components.ButtonComponent;
	import form.components.TextAreaComponent;
	import form.components.TextComponent;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class ContactoForm extends Sprite
	{
		private var fondo:Sprite;
		
		//campos
		private var tf_nombre:TextComponent;
		private var tf_mail:TextComponent;
		private var tf_producto:TextComponent;
		private var tf_mensaje:TextAreaComponent;
		
		//botones
		private var btn_borrar:ButtonComponent;
		private var btn_enviar:ButtonComponent;
		
		//layout campos
		private var layout_campos:ILayout2d;
		
		//net
		private var url_request:URLRequest;
		private var url_vars:URLVariables;
		private var url_loader:URLLoader;
		
		public function ContactoForm()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.fondo = new Sprite();
			this.fondo.graphics.beginFill(ApplicationConfiguration.COLOR_BACKGROUND_APPLICATION);
			this.fondo.graphics.drawRect(0, 0, ApplicationConfiguration.MAIN_CONTENT_WIDTH / 2, ApplicationConfiguration.MAIN_CONTENT_HEIGHT / 2);
			this.fondo.graphics.endFill();
			
			this.tf_nombre = new TextComponent('Nombre');
			this.tf_mail = new TextComponent('E-Mail');
			this.tf_producto = new TextComponent('Producto');
			this.tf_mensaje = new TextAreaComponent('Mensaje');
			
			this.btn_borrar = new ButtonComponent('Borrar');
			this.btn_enviar = new ButtonComponent('Enviar');
			
			this.layout_campos = new VerticalLine();
			
			this.url_vars = new URLVariables(
				'Message.name=' + this.tf_nombre.text +
				'&Message.mail=' + this.tf_nombre.text +
				'&Message.product=' + this.tf_producto.text +
				'&Message.message=' + this.tf_mensaje.text
			);
			this.url_request = new URLRequest('contact');
			this.url_request.data = this.url_vars;
			this.url_request.method = URLRequestMethod.POST;
			
			this.url_loader = new URLLoader();
			this.url_loader.dataFormat = URLLoaderDataFormat.VARIABLES;
			
			this.url_loader.addEventListener(Event.COMPLETE, this.onLoaderComplete);
		}
		
		private function onLoaderComplete(e:Event):void 
		{
			this.empty();
			this.tf_mensaje.text = 'Mensaje Enviado';
		}
		
		private function agregarListeners():void
		{
			this.btn_enviar.addEventListener(MouseEvent.CLICK, this.onBtnEnviar);
			this.btn_borrar.addEventListener(MouseEvent.CLICK, this.onBtnBorrar);
		}
		
		private function onBtnBorrar(e:MouseEvent):void 
		{
			trace('borrar');
			
			this.empty();
		}
		
		private function empty():void 
		{
			this.tf_nombre.empty();
			this.tf_mail.empty();
			this.tf_producto.empty();
			this.tf_mensaje.empty();
		}
		
		private function onBtnEnviar(e:MouseEvent):void 
		{
			trace('enviar');
			this.url_loader.load(this.url_request);
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo);
			
			this.addChild(this.tf_nombre);
			this.addChild(this.tf_mail);
			this.addChild(this.tf_producto);
			this.addChild(this.tf_mensaje);
			
			this.layout_campos.addNode(this.tf_nombre, false);
			this.layout_campos.addNode(this.tf_mail, false);
			this.layout_campos.addNode(this.tf_producto, false);
			this.layout_campos.addNode(this.tf_mensaje, false);
			this.layout_campos.updateAndRender();
			
			this.layout_campos.x = this.fondo.width - 300 - 5;
			this.layout_campos.y = 50;
			
			//botones
			this.addChild(this.btn_borrar);
			this.btn_borrar.y = this.fondo.height + 3;
			this.btn_borrar.x = this.fondo.width - this.btn_borrar.width * 2 - 1 * 3;
			
			this.addChild(this.btn_enviar);
			this.btn_enviar.y = this.fondo.height + 3;
			this.btn_enviar.x = this.fondo.width - this.btn_enviar.width * 1 - 0 * 3;
		}
	
	}

}