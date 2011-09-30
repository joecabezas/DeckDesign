package menus.izquierda
{
	import com.as3joelib.ui.UISwitcher;
	import flash.display.Sprite;
	import menus.izquierda.contacto.MenuIzquierdaContacto;
	import menus.izquierda.galeria.MenuIzquierdaGaleria;
	import menus.izquierda.imagina.MenuIzquierdaImaginaTusEspacios;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuIzquierda extends Sprite
	{
		private var items:Vector.<Sprite>;
		private var switcher:UISwitcher;
		
		//items
		private var menu_home:MenuIzquierdaHome;
		private var menu_quienes_somos:MenuIzquierdaQuienesSomos;
		private var menu_imagina_tus_espacios:MenuIzquierdaImaginaTusEspacios;
		private var menu_nuestros_proyectos:MenuIzquierdaNuestrosProyectos;
		private var menu_galeria:MenuIzquierdaGaleria;
		private var menu_contacto:MenuIzquierdaContacto;
		
		public function MenuIzquierda()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.items = new Vector.<Sprite>;
			
			this.switcher = new UISwitcher();
			this.switcher.animation_in_object = {duration: 0.3, alpha: 1};
			this.switcher.animation_out_object = {duration: 0.3, alpha: 0};
			
			//menus
			this.menu_home = new MenuIzquierdaHome();
			this.menu_quienes_somos = new MenuIzquierdaQuienesSomos();
			this.menu_imagina_tus_espacios = new MenuIzquierdaImaginaTusEspacios();
			this.menu_nuestros_proyectos = new MenuIzquierdaNuestrosProyectos();
			this.menu_galeria = new MenuIzquierdaGaleria();
			this.menu_contacto = new MenuIzquierdaContacto();
			
			//agregar menus
			this.items.push(this.menu_home);
			this.items.push(this.menu_quienes_somos);
			this.items.push(this.menu_imagina_tus_espacios);
			this.items.push(this.menu_nuestros_proyectos);
			this.items.push(this.menu_galeria);
			this.items.push(this.menu_contacto);
		}
		
		private function agregarListeners():void
		{
		
		}
		
		private function dibujar():void
		{
			for each (var s:Sprite in this.items)
			{
				this.addChild(s);
				s.y = 110;
				
				this.switcher.addItem(s);
			}
			this.switcher.hideAllItems();
			this.switcher.switchTo(this.menu_home);
		}
		
		public function switchTo(seccion:String):void
		{
			trace('MenuIzquierda.switchTo');
			trace(seccion);
			switch (seccion)
			{
				case Main.SECCION_HOME: 
					this.switcher.switchTo(this.menu_home);
					break;
				case Main.SECCION_QUIENES_SOMOS: 
					this.switcher.switchTo(this.menu_quienes_somos);
					break;
				case Main.SECCION_IMAGINA_TUS_ESPACIOS: 
					this.switcher.switchTo(this.menu_imagina_tus_espacios);
					break;
				case Main.SECCION_NUESTROS_PROYECTOS: 
					this.switcher.switchTo(this.menu_nuestros_proyectos);
					break;
				case Main.SECCION_GALERIA: 
					this.switcher.switchTo(this.menu_galeria);
					break;
				case Main.SECCION_CONTACTO: 
					this.switcher.switchTo(this.menu_contacto);
					break;
			}
		}
	
	}

}