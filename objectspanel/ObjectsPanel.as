package objectspanel
{
	import flash.display.MovieClip;

	public class ObjectsPanel extends MovieClip
	{
		var objPanel:ObjectsPanelObjects;
		
		public function ObjectsPanel(aWidth:int, aHeight:int)
		{
			trace("PropertiesPanel class");	
			objPanel = new ObjectsPanelObjects();
			objPanel.x = 0;//Вирівнювання панелі по лівому краю.
			objPanel.y = aHeight/2 - objPanel.height/2;//Вирівнювання панелі по нижньому краю.			
			addChild(objPanel);
		}
	}
}
