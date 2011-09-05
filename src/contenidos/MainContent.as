package contenidos 
{
	import com.as3joelib.ui.UISwitcher;
	import flash.display.Sprite;
	import secciones.HomeImageCarrousel;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MainContent extends Sprite 
	{
		
		private var items:Vector.<Sprite>;
		private var switcher:UISwitcher; //TODO: creo que aca no es necesario un switcher
		
		public function MainContent()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.items = new Vector.<Sprite>;
			
			this.switcher = new UISwitcher();
			this.switcher.animation_in_object = { };
			this.switcher.animation_out_object = { };
			
			//agregar secciones
			this.items.push(new HomeImageCarrousel());
		}
		
		private function agregarListeners():void
		{
		
		}
		
		private function dibujar():void
		{
			for each(var s:Sprite in this.items) {
				this.addChild(s);
				this.switcher.addItem(s);
			}
		}
		
	}

}