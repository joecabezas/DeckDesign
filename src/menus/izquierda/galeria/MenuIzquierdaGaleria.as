package menus.izquierda.galeria
{
	import com.as3joelib.ui.navigation.treenavigator.TreeNavigator;
	import com.as3joelib.ui.navigation.treenavigator.TreeNavigatorNode;
	import com.as3joelib.ui.windows.ModalWindow;
	import com.as3joelib.utils.Singleton;
	import com.greensock.layout.ScaleMode;
	import com.greensock.loading.ImageLoader;
	import config.ApplicationConfiguration;
	import flash.display.Sprite;
	import flash.events.Event;
	import menus.izquierda.MenuIzquierdaBlackTemplate;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class MenuIzquierdaGaleria extends MenuIzquierdaBlackTemplate
	{
		//ui
		private var back_button:BackButton;
		private var tree_navigator:TreeNavigator;
		private var galeria:MenuIzquierdaGaleriaContent2;
		
		//modal window
		//private var modal_window:ModalWindow;
		
		public function MenuIzquierdaGaleria()
		{
			trace('MenuIzquierdaGaleria.MenuIzquierdaGaleria');
			this.setup();
			this.agregarListeners();
			this.dibujar();
		}
		
		private function setup():void
		{
			this.back_button = new BackButton();
			this.tree_navigator = new TreeNavigator(Singleton.getInstance().data.json.data.secciones.galeria, ApplicationConfiguration.MENU_IZQUIERDA_WIDTH * 0.8, 450);
			this.galeria = new MenuIzquierdaGaleriaContent2();
		}
		
		private function agregarListeners():void
		{
			this.addEventListener(TreeNavigatorNode.CLICK_TREE_NAVIGATOR_NODE, treeNavigatorEventHandler);
			this.addEventListener(TreeNavigator.TREE_NAVIGATOR_CHANGE_PAGE, treeNavigatorEventHandler);
			
			this.addEventListener(BackButton.CLICK_BACK_BUTTON, onClickBackButton);
			
			this.addEventListener(GaleriaImageNode.CLICK_GALERIA_IMAGE_NODE, modalWindowEventHandler);
			this.addEventListener(ModalWindow.MODAL_WINDOW_CLICK_BACKGROUND, modalWindowEventHandler);
		}
		
		private function modalWindowEventHandler(e:Event):void
		{
			switch (e.type)
			{
				case GaleriaImageNode.CLICK_GALERIA_IMAGE_NODE: 
					//this.addModalView(e);
					this.galeria.removeWindow();
					this.galeria.addWindow(GaleriaImageNode(e.target));
					break;
				
				case ModalWindow.MODAL_WINDOW_CLICK_BACKGROUND: 
					//this.removeModalView();
					this.galeria.removeWindow();
					break;
			}
		}
		
		/*private function addModalView(e:Event):void
		   {
		   var window:NodeWindow = new NodeWindow(GaleriaImageNode(e.target).getUrlBig(), GaleriaImageNode(e.target).getTitle(), GaleriaImageNode(e.target).getText());
		
		   this.modal_window = new ModalWindow(window, 0x000000);
		
		   this.modal_window.animation_window_duration = 0.4;
		   this.modal_window.animation_window_in = {y: this.stage.stageHeight / 2 - window.height / 2, alpha: 1, rotation: 0};
		   this.modal_window.animation_window_out = {y: this.stage.stageHeight / 2 - window.height / 2 + 100, alpha: 0, rotation: 0};
		
		   this.addChild(this.modal_window);
		   this.modal_window.y = -110;
		
		   this.modal_window.fadeIn();
		   }
		
		   private function removeModalView():void
		   {
		   if (this.modal_window && this.contains(this.modal_window))
		   {
		   this.removeChild(this.modal_window);
		   }
		 }*/
		
		private function onClickBackButton(e:Event):void
		{
			trace('MenuIzquierdaGaleria.onClickBackButton');
			this.tree_navigator.back();
		}
		
		private function treeNavigatorEventHandler(e:Event):void
		{
			switch (e.type)
			{
				
				case TreeNavigatorNode.CLICK_TREE_NAVIGATOR_NODE: 
					//remover el anterior (si habia)
					if (this.galeria && this.contains(this.galeria))
					{
						this.removeChild(this.galeria);
					}
					
					this.galeria = new MenuIzquierdaGaleriaContent2(TreeNavigatorNode(e.target).data);
					
					this.addChild(this.galeria);
					this.galeria.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH + ApplicationConfiguration.MENU_IZQUIERDA_SEPARACION;
					break;
				
				case TreeNavigator.TREE_NAVIGATOR_CHANGE_PAGE:
					
					if (tree_navigator.page_number <= 1)
					{
						//ocultar el back button
						this.back_button.visible = false;
					}
					else
					{
						this.back_button.visible = true;
					}
					
					break;
			}
		
		}
		
		private function dibujar():void
		{
			//set title
			this.setTitle(ApplicationConfiguration.STR_GALERIA.toUpperCase(), ApplicationConfiguration.COLOR_QUIENES_SOMOS);
			
			//menu
			this.addChild(this.back_button);
			this.back_button.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH * 0.1;
			this.back_button.y = 70;
			
			//no deberia aparecer al comienzo
			this.back_button.visible = false;
			
			this.addChild(this.tree_navigator);
			this.tree_navigator.x = 12;
			this.tree_navigator.y = 10 + 33 - 5;
			
			//content
			this.addChild(this.galeria);
			this.galeria.x = ApplicationConfiguration.MENU_IZQUIERDA_WIDTH + ApplicationConfiguration.MENU_IZQUIERDA_SEPARACION;
		}
	
	}

}