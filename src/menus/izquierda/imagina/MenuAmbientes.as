package menus.izquierda.imagina
{
	import com.as3joelib.utils.Singleton;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import com.somerandomdude.coordy.layouts.twodee.VerticalLine;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuAmbientes extends Sprite
	{
		private var items:Vector.<AmbienteNode>;
		private var layout:ILayout2d;
		
		public function MenuAmbientes()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.items = new Vector.<AmbienteNode>;
			
			for each(var a:Object in Singleton.getInstance().data.json.data.secciones.imagina_tus_espacios.ambientes) {
				var an:AmbienteNode = new AmbienteNode(a);
				this.items.push(an);
			}
			
			this.layout = new VerticalLine();
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			var d:Number = 25;
			var i:uint = 0;
			for each(var a:AmbienteNode in this.items) {
				this.addChild(a);
				a.x = -ApplicationConfiguration.MENU_IZQUIERDA_WIDTH + 30;
				a.y = i * d;
				i++;
				//this.layout.addNode(a, false);
			}
			
			//this.layout.updateAndRender();
		}
	}

}