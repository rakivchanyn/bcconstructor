package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Sprite;

	public class BCConstructor extends MovieClip
	{
		internal var mWidth:int = 0;
		internal var mHeight:int = 0;
		
		public function BCConstructor()
		{
			trace("BCConstructor class");
			mWidth = stage.stageWidth;
			mHeight = stage.stageHeight;
			var workSpace = new WorkSpace();
			addChild(workSpace);
			var settingsForm = new SettingsPanel(workSpace, mWidth, mHeight);
			addChild(settingsForm);
			workSpace.x = int(mWidth/2 - workSpace.mWidth/2);
			workSpace.y = int(mHeight/2 - workSpace.mHeight/2);
			var propertiesForm = new PropertiesPanel(workSpace, mWidth, mHeight);
			addChild(propertiesForm);
			var objectsForm = new ObjectsPanel(workSpace, mWidth, mHeight);
			addChild(objectsForm);
		}
	}
}
