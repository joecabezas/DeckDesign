package form
{
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import com.somerandomdude.coordy.layouts.twodee.VerticalLine;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
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
			this.fondo.graphics.beginFill(ApplicationConfiguration.COLOR_CONTACTO);
			this.fondo.graphics.drawRect(0, 0, ApplicationConfiguration.MAIN_CONTENT_WIDTH / 2, ApplicationConfiguration.MAIN_CONTENT_HEIGHT / 2);
			this.fondo.graphics.endFill();
			
			this.tf_nombre = new TextComponent('NOMBRE');
			this.tf_mail = new TextComponent('E-MAIL');
			this.tf_producto = new TextComponent('PRODUCTO');
			
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
			
			this.layout_campos.addNode(this.tf_nombre, false);
			this.layout_campos.addNode(this.tf_mail, false);
			this.layout_campos.addNode(this.tf_producto, false);
			this.layout_campos.updateAndRender();
		}
	
	}

}