package menus.izquierda
{
	import com.as3joelib.generators.TextFieldGenerator;
	import com.as3joelib.ui.Button;
	import com.greensock.loading.ImageLoader;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import interfaces.ICanChangeSection;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuIzquierdaHomeNode extends Button implements ICanChangeSection
	{
		//constantes de eventos
		public static const CLICK_HOME_NODE:String = 'clickHomeNode';
		
		//loader names
		private static const LOADER_IMG:String = 'loaderImg';
		
		//seccion a la que debe ir cuando se haga click
		private var _seccion:String;
		
		//constantes de diseño
		private static const WIDTH:Number = 250;
		private static const HEIGHT:Number = 160;
		
		private var img:ImageLoader;
		private var img_url:String;
		
		private var textfield:TextField;
		private var texto:String;
		private var color:uint;
		
		private var caja:Sprite;
		
		public function MenuIzquierdaHomeNode(img_url:String, texto:String, seccion:String = '')
		{
			this.img_url = img_url;
			this.texto = texto;
			this._seccion = seccion;
			
			this.setup();
			this.load();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.img = new ImageLoader(this.img_url, {name: LOADER_IMG, width: WIDTH, height: HEIGHT, bgColor: 0xcccccc});
			
			//set color, no me gusta este codigo, pero el tiempo apremia
			switch (this.texto)
			{
				case 'Imagina tus Espacios': 
					this.color = ApplicationConfiguration.COLOR_IMAGINA_TUS_ESPACIOS;
					break;
				case 'Nuestra Diferencia': 
					this.color = ApplicationConfiguration.COLOR_QUIENES_SOMOS;
					break;
				case 'Nuestros Proyectos': 
					this.color = ApplicationConfiguration.COLOR_NUESTROS_PROYECTOS;
					break;
				default: 
					this.color = ApplicationConfiguration.COLOR_NUESTROS_PROYECTOS;
					break;
			}
			
			this.textfield = TextFieldGenerator.crearTextField(this.texto, {size: 18, color: this.color, width: WIDTH, height: 25, 
				//border: true,
					align: TextFieldGenerator.TEXTFORMAT_ALIGN_RIGHT, autosize: TextFieldGenerator.AUTOSIZE_NONE});
			
			this.caja = new Sprite();
			
			this.caja.graphics.beginFill(this.color);
			this.caja.graphics.drawRect(0, 0, WIDTH, 5);
			this.caja.graphics.endFill();
		}
		
		private function load():void
		{
			this.img.load();
		}
		
		private function agregarListeners():void
		{
			//this.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		/*private function onClick(e:MouseEvent):void
		   {
		   //this
		 }*/
		
		private function dibujar():void
		{
			this.addChild(this.img.content);
			this.addChild(this.textfield);
			this.addChild(this.caja);
			
			this.textfield.y = HEIGHT + 10;
			this.caja.y = this.textfield.y + this.textfield.height;
		}
		
		public function get seccion():String
		{
			return this._seccion;
		}
		
		//metodos sobrecargados
		override protected function onClick(e:MouseEvent):void
		{
			this.dispatchEvent(new Event(MenuIzquierdaHomeNode.CLICK_HOME_NODE, true));
		}
	}

}