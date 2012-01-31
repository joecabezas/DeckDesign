package
{
	import assets.BtnFacebook;
	import assets.BtnTwitter;
	import assets.Footer;
	import assets.Logo;
	import buttons.BotonMenuSuperior;
	import com.adobe.serialization.json.JSON;
	import com.as3joelib.utils.AppBlocker;
	import com.as3joelib.utils.Singleton;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.DataLoader;
	import contenidos.MainContent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import interfaces.ICanChangeSection;
	import menus.izquierda.MenuIzquierda;
	import menus.izquierda.MenuIzquierdaHomeNode;
	import menus.superior.MenuSuperior;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	[SWF(backgroundColor="#1D1D1F",width=1120,height=690,frameRate=60)]
	[Frame(factoryClass="Preloader")]
	
	public class Main extends Sprite
	{
		[Embed(source = "../lib/logo-facebook.png")]
		public static var LogoFacebook:Class;
		
		[Embed(source="../lib/logo-twitter.png")]
		public static var LogoTwitter:Class;
		
		//constantes de las secciones
		public static const SECCION_HOME:String = 'seccionHome';
		public static const SECCION_QUIENES_SOMOS:String = 'seccionQuienesSomos';
		public static const SECCION_IMAGINA_TUS_ESPACIOS:String = 'SeccionImaginaTusEspacios';
		public static const SECCION_NUESTROS_PROYECTOS:String = 'seccionNuestrosProyectos';
		public static const SECCION_NUESTRA_DIFERENCIA:String = 'seccionNuestraDiferencia';
		public static const SECCION_GALERIA:String = 'seccionGaleria';
		public static const SECCION_CONTACTO:String = 'seccionContacto';
		
		//botones facebook y twitter
		public static const SECCION_FACEBOOK:String = 'seccionFacebook';
		public static const SECCION_TWITTER:String = 'seccionTwitter';
		
		//static public const JSON_URL:String = 'data/data.json';
		static public const JSON_URL:String = 'http://www.deckdesign.cl/backend/json';
		
		//assets
		private var logo:Logo;
		private var footer:Footer;
		
		//loaders names
		private static const LOADER_JSON:String = 'loaderJson';
		
		//loaders
		private var data_loader:DataLoader;
		
		//menus
		private var menu_izquierda:MenuIzquierda;
		private var menu_superior:MenuSuperior;
		
		//botones de facebook y twitter
		private var btn_facebook:Bitmap;
		private var btn_twitter:Bitmap;
		
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
			this.data_loader = new DataLoader(JSON_URL, {name: LOADER_JSON, onComplete: onDataLoaderComplete, onProgress: onDataLoaderProgress, onError: onDataLoaderError});
			
			this.data_loader.load();
		}
		
		private function onDataLoaderComplete(e:LoaderEvent):void
		{
			trace(DataLoader(e.target).content);
			
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
			
			//botones de facebook y twitter
			this.btn_facebook = new LogoFacebook();
			this.btn_twitter = new LogoTwitter();
			
			this.logo = new Logo();
			this.footer = new Footer();
		}
		
		private function agregarLisneters():void
		{
			this.addEventListener(MenuIzquierdaHomeNode.CLICK_HOME_NODE, onClickSection);
			this.addEventListener(BotonMenuSuperior.CLICK_BOTON_MENU_SUPERIOR, onClickSection);
			
			this.btn_facebook.addEventListener(MouseEvent.CLICK, onClickFacebook);
			this.btn_twitter.addEventListener(MouseEvent.CLICK, onClickTwitter);
			
			AppBlocker.FILE_NAME = 'DECKDESIGN';
			AppBlocker.getInstance().addEventListener(AppBlocker.APP_BLOCKER_ON, block);
			AppBlocker.check();
		}
		
		private function block(e:Event):void
		{
			trace('Main.block');
			
			if( this.menu_superior && this.contains(this.menu_superior) ) this.removeChild(this.menu_superior);
			if( this.btn_facebook && this.contains(this.btn_facebook) ) this.removeChild(this.btn_facebook);
			if( this.btn_twitter && this.contains(this.btn_twitter) ) this.removeChild(this.btn_twitter);
			if( this.contenido && this.contains(this.contenido) ) this.removeChild(this.contenido);
			if( this.logo && this.contains(this.logo) ) this.removeChild(this.logo);
			if( this.footer && this.contains(this.footer) ) this.removeChild(this.footer);
			if( this.menu_izquierda && this.contains(this.menu_izquierda) ) this.removeChild(this.menu_izquierda);
		}
		
		private function onClickFacebook(e:MouseEvent):void
		{
			this.goToUrl(Singleton.getInstance().data.json.data.facebook_url);
		}
		
		private function onClickTwitter(e:MouseEvent):void
		{
			this.goToUrl(Singleton.getInstance().data.json.data.twitter_url);
		}
		
		private function goToUrl(url:String):void
		{
			try
			{
				navigateToURL(new URLRequest(url), '_blank');
			}
			catch (e:Error)
			{
				trace('ERROR: no se puede abrir el sitio: ' + url);
			}
		}
		
		private function onClickSection(e:Event):void
		{
			trace(ICanChangeSection(e.target).seccion);
			
			var seccion:String = ICanChangeSection(e.target).seccion;
			switch (seccion)
			{
				case Main.SECCION_HOME: 
					this.menu_izquierda.switchTo(seccion);
					break;
				case Main.SECCION_QUIENES_SOMOS: 
					this.menu_izquierda.switchTo(seccion);
					break;
				case Main.SECCION_IMAGINA_TUS_ESPACIOS: 
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
			this.menu_superior.x = 250;
			this.menu_superior.y = 52;
			
			//nuevos botones del 10 nov de 2011
			this.addChild(this.btn_facebook);
			this.btn_facebook.x = this.stage.stageWidth - 2 * this.btn_facebook.width - 25 - 10;
			this.btn_facebook.y = 10;
			
			this.addChild(this.btn_twitter);
			this.btn_twitter.x = this.stage.stageWidth - this.btn_twitter.width - 25;
			this.btn_twitter.y = 10;
			
			this.addChild(this.contenido);
			this.contenido.x = 255;
			this.contenido.y = 84;
			
			this.addChild(this.logo);
			this.logo.x = 15;
			
			this.addChild(this.footer);
			this.footer.x = this.logo.x;
			this.footer.y = this.stage.stageHeight - this.footer.height;
			
			this.addChild(this.menu_izquierda);
			this.menu_izquierda.y = -16;
		}
	
	}

}