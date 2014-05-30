//some changes
package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;	
	import flash.display.Sprite;
	import objectspanel.*;
	import propertiespanel.*;
	import workspace.*;

	public class BCConstructor extends MovieClip
	{
		internal var mWidth:int = 0;
		internal var mHeight:int = 0;
		
		public function BCConstructor()
		{
			trace("BCConstructor class");
			mWidth = stage.stageWidth;
			mHeight = stage.stageHeight;
			var workSpace = new WorkSpace(mWidth, mHeight);
			addChild(workSpace);
			workSpace.x = mWidth/2 - workSpace.width/2;
			workSpace.y = mHeight/2 - workSpace.height/2;
			var propertiesForm = new PropertiesPanel(workSpace, mWidth, mHeight);
			addChild(propertiesForm);
			var objectsForm = new ObjectsPanel(workSpace, mWidth, mHeight);
			addChild(objectsForm);

//			btTest.addEventListener(MouseEvent.CLICK, onTestButtonClick);//Отслеживаем нажатие кнопки.
		}
		
/*		public function onTestButtonClick(Event:MouseEvent):void
		{
			trace(Text.x);
		}
*/		
	}
}
