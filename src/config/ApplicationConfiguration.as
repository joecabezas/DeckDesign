package config
{
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public final class ApplicationConfiguration
	{
		//color de la aplicacion
		public static const COLOR_BACKGROUND_APPLICATION:uint = 0x1D1D1F;
		
		//colores de los botones superiores
		public static const COLOR_INICIO:uint = 0x01AC4E;
		public static const COLOR_BOTON_SUPERIOR:uint = 0x336600;
		public static const COLOR_QUIENES_SOMOS:uint = 0xFE7C00;
		public static const COLOR_IMAGINA_TUS_ESPACIOS:uint = 0x069FDB;
		public static const COLOR_NUESTROS_PROYECTOS:uint = 0xFECC00;
		public static const COLOR_GALERIA_DE_IMAGENES:uint = 0xFF1615;
		public static const COLOR_CONTACTO:uint = 0x55248D;
		
		//nombres de las seccione
		public static const STR_INICIO:String = 'Inicio';
		public static const STR_QUIENES_SOMOS:String = 'Quienes Somos';
		public static const STR_IMAGINA_TUS_ESPACIOS:String = 'Imagina tus Espacios';
		public static const STR_NUESTROS_PROYECTOS:String = 'Nuestros Proyectos';
		public static const STR_NUESTRA_DIFERENCIA:String = 'Nuestra Diferencia';
		public static const STR_GALERIA:String = 'Galería de Imágenes';
		public static const STR_CONTACTO:String = 'Contacto';
		public static const STR_COTIZA:String = 'Cotiza';
		
		//constantes de diseño
		public static const MENU_IZQUIERDA_WIDTH:Number = 250;
		public static const MENU_IZQUIERDA_HEIGHT:Number = 560;
		
		public static const MENU_IZQUIERDA_SEPARACION:Number = 0;
		
		public static const MAIN_CONTENT_WIDTH:Number = 950;
		public static const MAIN_CONTENT_HEIGHT:Number = 560;
		//public static const MAIN_CONTENT_HEIGHT:Number = 630;
		
		public static const HOME_CARROUSEL_WIDTH:Number = MAIN_CONTENT_WIDTH + 160;
		
		public static const PHOTO_GRID_NODE_SIZE:Number = 60;

		public static const ROOM_NODE_SIZE:Number = 25;
		
		public function ApplicationConfiguration()
		{
			throw new Error('La clase ApplicationConfiguration no debe ser instanciada');
		}
	}
}