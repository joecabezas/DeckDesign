package menus.izquierda
{
	import com.as3joelib.utils.ObjectUtil;
	import com.as3joelib.utils.Singleton;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import com.somerandomdude.coordy.layouts.twodee.VerticalLine;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuIzquierdaHome extends Sprite
	{
		private var items:Vector.<Sprite>;
		
		private var _data:Object;
		
		private var layout:ILayout2d;
		
		public function MenuIzquierdaHome()
		{
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.items = new Vector.<Sprite>;
			this._data = Singleton.getInstance().data.json.data.secciones.home.seccion;
			
			this.layout = new VerticalLine();
			
			//ObjectUtil.pr(this._data);
		}
		
		private function agregarListeners():void
		{
		
		}
		
		private function dibujar():void
		{
			//crear un vector temporal con los strings ordenados
			//de las secciones que deberian ir cada uno de los botones
			var secciones:Vector.<String> = new Vector.<String>;
			
			secciones.push(Main.SECCION_IMAGINA_TUS_ESPACIOS);
			secciones.push(Main.SECCION_NUESTRA_DIFERENCIA);
			secciones.push(Main.SECCION_CONTACTO);
			
			secciones.reverse();

			for each(var i:Object in this._data) {
				var min:MenuIzquierdaHomeNode = new MenuIzquierdaHomeNode(i.img, i.texto, secciones.pop());
				this.items.push(min);
				this.layout.addNode(min,false);
				this.addChild(min);
			}
			this.layout.updateAndRender();
		}
		
		public function set data(value:Object):void
		{
			_data = value;
		}
	}

}