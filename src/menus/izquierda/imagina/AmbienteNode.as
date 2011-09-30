package menus.izquierda.imagina
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.somerandomdude.coordy.layouts.twodee.HorizontalLine;
	import com.somerandomdude.coordy.layouts.twodee.ILayout2d;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class AmbienteNode extends Sprite
	{
		private var _data:Object;
		
		private var txt_name:TextField;
		private var items:Vector.<RoomNode>;
		private var layout:ILayout2d;
		
		public function AmbienteNode(data:Object)
		{
			this._data = data;
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.txt_name = TextFieldGenerator.crearTextField(this._data.name, { size: 16, color: 0xffffff});
			this.items = new Vector.<RoomNode>;
			
			var i:uint = 1;
			for each (var n:Object in this._data.items)
			{
				var rn:RoomNode = new RoomNode(n, i);
				this.items.push(rn);
				i++;
			}
			
			this.layout = new HorizontalLine();
		}
		
		private function agregarListeners():void
		{
		}
		
		private function dibujar():void
		{
			//txt
			this.addChild(txt_name);
			this.layout.addNode(this.txt_name, false);
			
			//items
			for each (var i:RoomNode in this.items)
			{
				this.addChild(i);
				this.layout.addNode(i, false);
			}
			
			this.layout.updateAndRender();
		}
	
	}

}