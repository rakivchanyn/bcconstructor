package propertiespanel
{
	import flash.display.MovieClip;
	
	public class PropertiesPanel extends MovieClip
	{
		var propPanel:PropertiesPanelObjects;
		
		public function PropertiesPanel(aWidth:int, aHeight:int)
		{
			trace("PropertiesPanel class");	
			propPanel = new PropertiesPanelObjects();
			propPanel.x = aWidth/2 - propPanel.width/2;//Вирівнювання панелі по центру.
			propPanel.y = aHeight - propPanel.height;//Вирівнювання панелі по нижньому краю.			
			addChild(propPanel);
		}
	}
}
