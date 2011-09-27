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
		
		//seccion a la que debe ir cuando se haga click
		private var _seccion:String;
		
		//constantes de diseño
		private const padding:Number = 7.5;
		
		private var fondo:Sprite;
		private var color:uint;
		
		private var text_string:String
		private var text_field:TextField;
		private var text_asset:Sprite;
		
		public function BotonMenuSuperior(text:String, color:uint, seccion:String = '')
		{
			super();
			
			this.text_string = text;
			this.color = color;
			this._seccion = seccion;
			
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
					this.text_asset = new BtnInicioTxt();
					break;
				case Main.SECCION_QUIENES_SOMOS:
					this.text_asset = new BtnQuienesSomosTxt();
					break;
				case Main.SECCION_IMAGINA_TUS_ESPACIOS:
					this.text_asset = new BtnImaginaTusEspaciosTxt();
					break;
				case Main.SECCION_NUESTROS_PROYECTOS:
					this.text_asset = new BtnNuestrosProyectosTxt();
					break;
				case Main.SECCION_GALERIA:
					this.text_asset = new BtnGaleriaDeImagenesTxt();
					break;
				case Main.SECCION_CONTACTO:
					this.text_asset = new BtnContactoTxt();
					break;
			}
			
			//crear fondo
			this.fondo = new Sprite();
			
			this.fondo.graphics.beginFill(this.color);
			this.fondo.graphics.beginFill(ApplicationConfiguration.COLOR_BOTON_SUPERIOR);
			//this.fondo.graphics.drawRect(0, 0, this.text_field.textWidth + 2 * this.padding, -(this.text_field.textHeight + 2 * this.padding));
			this.fondo.graphics.drawRect(0, 0, this.text_asset.width + 2 * this.padding, -40);
			this.fondo.graphics.endFill();
		}
		
		override protected function onClick(e:MouseEvent):void 
		{
			this.dispatchEvent(new Event(BotonMenuSuperior.CLICK_BOTON_MENU_SUPERIOR, true));
		}
		
		override protected function onRollOver(e:MouseEvent):void
		{
			//trace(e);
			TweenLite.to(this.fondo, 0.2, {scaleY: 1.2});
		}
		
		override protected function onRollOut(e:MouseEvent):void
		{
			//trace(e);
			if (!this.selected) {
				TweenLite.to(this.fondo, 0.2, {scaleY: 1});
			}
			
		}
		
		private function dibujar():void
		{
			this.addChild(this.fondo);
			//this.addChild(this.text_field);
			
			this.addChild(this.text_asset);
			this.text_asset.x = this.fondo.width / 2;
			this.text_asset.y = this.fondo.height / 2;
			
			this.fondo.y = this.fondo.height;
		}
		
		public function get seccion():String 
		{
			return _seccion;
		}
	}
}