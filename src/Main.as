package
{
	import assets.Logo;
	import buttons.BotonMenuSuperior;
	import com.adobe.serialization.json.JSON;
	import com.as3joelib.utils.Singleton;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.DataLoader;
	import contenidos.MainContent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import interfaces.ICanChangeSection;
	import menus.izquierda.MenuIzquierda;
	import menus.izquierda.MenuIzquierdaHomeNode;
	import menus.superior.MenuSuperior;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	[SWF(backgroundColor="#1D1D1F",width=1280,height=800,frameRate=60)]
	[Frame(factoryClass="Preloader")]
	
	public class Main extends Sprite
	{
		//constantes de las secciones
		public static const SECCION_HOME:String = 'seccionHome';
		public static const SECCION_QUIENES_SOMOS:String = 'seccionQuienesSomos';
		public static const SECCION_IMAGINA_TUS_ESPACIOS:String = 'SeccionImaginaTusEspacios';
		public static const SECCION_NUESTROS_PROYECTOS:String = 'seccionNuestrosProyectos';
		public static const SECCION_NUESTRA_DIFERENCIA:String = 'seccionNuestraDiferencia';
		public static const SECCION_GALERIA:String = 'seccionGaleria';
		public static const SECCION_CONTACTO:String = 'seccionContacto';
		
		//temps
		private var logo:Logo;
		
		//loaders names
		private static const LOADER_JSON:String = 'loaderJson';
		
		//loaders
		private var data_loader:DataLoader;
		
		//menus
		private var menu_izquierda:MenuIzquierda;
		private var menu_superior:MenuSuperior;
		
		//contenido
		private var contenido:MainContent;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			this.setupLoaders();
		}
		
		private function setupLoaders():void
		{
			//loaders
			this.data_loader = new DataLoader('data/data.json', {name: LOADER_JSON, onComplete: onDataLoaderComplete, onProgress: onDataLoaderProgress, onError: onDataLoaderError});
			
			this.data_loader.load();
		}
		
		private function onDataLoaderComplete(e:LoaderEvent):void
		{			
			//parsear el JSON y darselo al singleton
			Singleton.getInstance().data = {json: JSON.decode(DataLoader(e.target).content, false)};
			
			this.setup();
			this.agregarLisneters();
			this.dibujar();
		}
		
		private function onDataLoaderProgress(e:LoaderEvent):void
		{
		}
		
		private function onDataLoaderError(e:LoaderEvent):void
		{
		}
		
		private function setup():void
		{
			//set application colors
			
			//menus
			this.menu_superior = new MenuSuperior();
			this.menu_izquierda = new MenuIzquierda();
			
			this.contenido = new MainContent();
			
			this.logo = new Logo();
		}
		
		private function agregarLisneters():void {
			this.addEventListener(MenuIzquierdaHomeNode.CLICK_HOME_NODE, onClickSection);
			this.addEventListener(BotonMenuSuperior.CLICK_BOTON_MENU_SUPERIOR, onClickSection);
		}
		
		private function onClickSection(e:Event):void 
		{
			trace(ICanChangeSection(e.target).seccion);
			
			var seccion:String = ICanChangeSection(e.target).seccion;
			switch(seccion) {
				case Main.SECCION_HOME:
					this.menu_izquierda.switchTo(seccion);
					break;
				case Main.SECCION_QUIENES_SOMOS:
					this.menu_izquierda.switchTo(seccion);
					break;
				case Main.SECCION_NUESTROS_PROYECTOS:
					this.menu_izquierda.switchTo(seccion);
					break;
				case Main.SECCION_NUESTROS_PROYECTOS:
					this.menu_izquierda.switchTo(seccion);
					break;
				case Main.SECCION_GALERIA:
					this.menu_izquierda.switchTo(seccion);
					break;
				case Main.SECCION_CONTACTO:
					this.menu_izquierda.switchTo(seccion);
					break;
			}
		}
		
		private function dibujar():void
		{
			this.addChild(this.menu_superior);
			this.menu_superior.x = 265;
			this.menu_superior.y = 72;
			
			this.addChild(this.contenido);
			this.contenido.x = 255;
			this.contenido.y = 110;
			
			this.addChild(this.logo);
			this.addChild(this.menu_izquierda);
		}
	
	}

}