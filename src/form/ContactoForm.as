package form
{
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import com.somerandomdude.coordy.layouts.twodee.VerticalLine;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
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
			
			this.tf_nombre = new TextComponent('NOMBRE');
			this.tf_mail = new TextComponent('E-MAIL');
			this.tf_producto = new TextComponent('PRODUCTO');
			this.tf_mensaje = new TextAreaComponent('MENSAJE');
			
			this.btn_borrar = new ButtonComponent('BORRAR');
			this.btn_enviar = new ButtonComponent('ENVIAR');
			
			this.layout_campos = new VerticalLine();
		}
		
		private function agregarListeners():void
		{
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