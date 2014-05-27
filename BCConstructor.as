package
{
	import flash.display.MovieClip;
	import objectspanel.ObjectsPanel;
	import propertiespanel.PropertiesPanel;
	
	public class BCConstructor extends MovieClip
	{
		internal var mWidth:int = 0;
		internal var mHeight:int = 0;
		
		public function BCConstructor()
		{
			mWidth = stage.stageWidth;
			mHeight = stage.stageHeight;
			var propertiesForm = new PropertiesPanel(mWidth, mHeight);
			addChild(propertiesForm);
			var objectsForm = new ObjectsPanel(mWidth, mHeight);
			addChild(objectsForm);
			trace("BCConstructor class");
		}
	}
}
