package menus.superior 
{
	import assets.BtnFacebook;
	import buttons.BotonMenuSuperior;
	import com.somerandomdude.coordy.layouts.twodee.HorizontalLine;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import com.somerandomdude.coordy.layouts.twodee.Layout2d;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuSuperior extends Sprite 
	{
		public var botones:Vector.<BotonMenuSuperior>;
		
		//ui
		private var layout:ILayout2d;
		
		public function MenuSuperior() 
		{
			this.setup();
			this.fillButtons();
			this.agregarListeners();
			
			this.dibujar();
		}
		
		private function agregarListeners():void 
		{
			//cuando hagan click resetear botones para dejarlos no seleccionados
			this.addEventListener(BotonMenuSuperior.CLICK_BOTON_MENU_SUPERIOR, onClickButton);
		}
		
		private function onClickButton(e:Event):void 
		{
			for each(var btn:BotonMenuSuperior in this.botones) {
				btn.reset();
			}
		}
		
		private function setup():void 
		{
			this.botones = new Vector.<BotonMenuSuperior>;
			
			this.layout = new HorizontalLine(5);
		}
		
		private function fillButtons():void 
		{
			this.botones.push(new BotonMenuSuperior(ApplicationConfiguration.STR_INICIO, ApplicationConfiguration.COLOR_INICIO, Main.SECCION_HOME));
			this.botones.push(new BotonMenuSuperior(ApplicationConfiguration.STR_QUIENES_SOMOS, ApplicationConfiguration.COLOR_QUIENES_SOMOS, Main.SECCION_QUIENES_SOMOS));
			this.botones.push(new BotonMenuSuperior(ApplicationConfiguration.STR_IMAGINA_TUS_ESPACIOS, ApplicationConfiguration.COLOR_IMAGINA_TUS_ESPACIOS, Main.SECCION_IMAGINA_TUS_ESPACIOS));
			this.botones.push(new BotonMenuSuperior(ApplicationConfiguration.STR_NUESTROS_PROYECTOS, ApplicationConfiguration.COLOR_NUESTROS_PROYECTOS, Main.SECCION_NUESTROS_PROYECTOS));
			this.botones.push(new BotonMenuSuperior(ApplicationConfiguration.STR_GALERIA, ApplicationConfiguration.COLOR_GALERIA_DE_IMAGENES, Main.SECCION_GALERIA));
			this.botones.push(new BotonMenuSuperior(ApplicationConfiguration.STR_CONTACTO, ApplicationConfiguration.COLOR_CONTACTO, Main.SECCION_CONTACTO));
			
			//facebook
			//this.botones.push(new BotonMenuSuperior('',0xff0000,Main.SECCION_FACEBOOK));
			//this.botones.push(new BotonMenuSuperior('',0xff0000,Main.SECCION_TWITTER));
		}
		
		private function dibujar():void 
		{			
			for each(var btn:BotonMenuSuperior in this.botones) {
				this.addChild(btn);
				this.layout.addNode(btn, false);
			}
			this.layout.updateAndRender();
		}
	}

}