package buttons
{
	import assets.BtnContactoTxt;
	import assets.BtnGaleriaDeImagenesTxt;
	import assets.BtnImaginaTusEspaciosTxt;
	import assets.BtnInicioTxt;
	import assets.BtnNuestrosProyectosTxt;
	import assets.BtnQuienesSomosTxt;
	import com.as3joelib.generators.TextFieldGenerator;
	import com.as3joelib.ui.Button;
	import com.greensock.data.TweenLiteVars;
	import com.greensock.easing.Elastic;
	import com.greensock.TweenLite;
	import config.ApplicationConfiguration;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormatAlign;
	import interfaces.ICanChangeSection;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class BotonMenuSuperior extends Button implements ICanChangeSection
	{
		//constantes de eventos
		public static const CLICK_BOTON_MENU_SUPERIOR:String = 'clickBotonMenuSuperior';
		
		//varable de clase que dice cual esta en este momento seleecionada
		//para asi dejar de seleccionar la anterior
		private static var SECCION_ACTUAL:String;
		
		//seccion a la que debe ir cuando se haga click
		private var _seccion:String;
		
		//constantes de diseño
		private const padding:Number = 7.5;
		
		private var fondo:Sprite;
		private var color:uint;
		
		private var text_string:String
		private var text_field:TextField;
		
		private var text_asset:Sprite; //TODO: no se usa, pero lo dejo para compatibilidad futura, remover en produccion
		
		private var bmp_normal:Bitmap;
		private var bmp_over:Bitmap;
		
		//assets
		[Embed(source = "../../bin/img/botones/bt-contacto-1.gif")]
		private var BtnContactoImg:Class;
		
		[Embed(source = "../../bin/img/botones/bt-contacto-2.gif")]
		private var BtnContactoImgOver:Class;
		
		[Embed(source = "../../bin/img/botones/bt-galeria-1.gif")]
		private var BtnGaleriaImg:Class;
		
		[Embed(source = "../../bin/img/botones/bt-galeria-2.gif")]
		private var BtnGaleriaImgOver:Class;
		
		[Embed(source = "../../bin/img/botones/bt-imagina-1.gif")]
		private var BtnImaginaImg:Class;
		
		[Embed(source = "../../bin/img/botones/bt-imagina-2.gif")]
		private var BtnImaginaImgOver:Class;
		
		[Embed(source = "../../bin/img/botones/bt-inicio-1.gif")]
		private var BtnInicioImg:Class;
		
		[Embed(source = "../../bin/img/botones/bt-inicio-2.gif")]
		private var BtnInicioImgOver:Class;
		
		[Embed(source = "../../bin/img/botones/bt-proyectos-1.gif")]
		private var BtnProyectosImg:Class;
		
		[Embed(source = "../../bin/img/botones/bt-proyectos-2.gif")]
		private var BtnProyectosImgOver:Class;
		
		[Embed(source = "../../bin/img/botones/bt-somos-1.gif")]
		private var BtnSomosImg:Class;
		
		[Embed(source = "../../bin/img/botones/bt-somos-2.gif")]
		private var BtnSomosImgOver:Class;
		
		public function BotonMenuSuperior(text:String, color:uint, seccion:String = '')
		{
			super();
			
			this.text_string = text;
			this.color = color;
			this._seccion = seccion;
			
			this.toggle = true;
			
			this.setup();
			this.dibujar();
		}
		
		private function setup():void
		{
			/*
			//crear textfield
			this.text_field = TextFieldGenerator.crearTextField(this.text_string, {
				//border:true,
					size: 15, embedfonts: false, color: 0xffffff});
			this.text_field.x = this.padding * 0.75;
			this.text_field.y = this.padding * 0.75;
			*/
			
			//traer asset dependiendo de la seccion
			switch(this.seccion) {
				case Main.SECCION_HOME:
					//this.text_asset = new BtnInicioTxt();
					this.bmp_normal = new BtnInicioImg();
					this.bmp_over = new BtnInicioImgOver();
					break;
				case Main.SECCION_QUIENES_SOMOS:
					//this.text_asset = new BtnQuienesSomosTxt();
					this.bmp_normal = new BtnSomosImg();
					this.bmp_over = new BtnSomosImgOver();
					break;
				case Main.SECCION_IMAGINA_TUS_ESPACIOS:
					//this.text_asset = new BtnImaginaTusEspaciosTxt();
					this.bmp_normal = new BtnImaginaImg();
					this.bmp_over = new BtnImaginaImgOver();
					break;
				case Main.SECCION_NUESTROS_PROYECTOS:
					//this.text_asset = new BtnNuestrosProyectosTxt();
					this.bmp_normal = new BtnProyectosImg();
					this.bmp_over = new BtnProyectosImgOver();
					break;
				case Main.SECCION_GALERIA:
					//this.text_asset = new BtnGaleriaDeImagenesTxt();
					this.bmp_normal = new BtnGaleriaImg();
					this.bmp_over = new BtnGaleriaImgOver();
					break;
				case Main.SECCION_CONTACTO:
					//this.text_asset = new BtnContactoTxt();
					this.bmp_normal = new BtnContactoImg();
					this.bmp_over = new BtnContactoImgOver();
					break;
			}
			
			//crear fondo
			//this.fondo = new Sprite();
			//
			//this.fondo.graphics.beginFill(this.color);
			//this.fondo.graphics.beginFill(ApplicationConfiguration.COLOR_BOTON_SUPERIOR);
			//this.fondo.graphics.drawRect(0, 0, this.text_asset.width + 2 * this.padding, -40);
			//this.fondo.graphics.endFill();
		}
		
		override protected function onClick(e:MouseEvent):void 
		{
			BotonMenuSuperior.SECCION_ACTUAL = this.seccion;
			this.dispatchEvent(new Event(BotonMenuSuperior.CLICK_BOTON_MENU_SUPERIOR, true));			
		}
		
		override protected function onRollOver(e:MouseEvent):void
		{
			//trace(e);
			//TweenLite.to(this.fondo, 0.2, {scaleY: 1.2});
			
			TweenLite.to(this.bmp_over, 0.2, {alpha: 1});
		}
		
		override protected function onRollOut(e:MouseEvent):void
		{
			trace(e);
			trace(this.selected);
			if (!this.selected) {
				//TweenLite.to(this.fondo, 0.2, {scaleY: 1});
				
				TweenLite.to(this.bmp_over, 0.2, {alpha: 0});
			}
			
		}
		
		private function dibujar():void
		{
			//this.addChild(this.fondo);
			//this.addChild(this.text_field);
			
			//this.addChild(this.text_asset);
			//this.text_asset.x = this.fondo.width / 2;
			//this.text_asset.y = this.fondo.height / 2;
			
			this.addChild(this.bmp_normal);
			
			this.addChild(this.bmp_over);
			this.bmp_over.alpha = 0;
			
			//this.fondo.y = this.fondo.height;
		}
		
		public function get seccion():String 
		{
			return _seccion;
		}
		
		public function reset():void {
			if (this.seccion != BotonMenuSuperior.SECCION_ACTUAL) {
				this.selected = false;
				TweenLite.to(this.bmp_over, 0.2, {alpha: 0});
			}
		}
	}
}