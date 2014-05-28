package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.*;	
	import objectspanel.*;
	import propertiespanel.*;

	public class BCConstructor extends MovieClip
	{
		internal var mWidth:int = 0;
		internal var mHeight:int = 0;
		var mText:TextField;
		public var propertiesForm:PropertiesPanel;
		public var objectsForm:ObjectsPanel;
		
		public function BCConstructor()
		{
			mWidth = stage.stageWidth;
			mHeight = stage.stageHeight;
			mText = new TextField();
			propertiesForm = new PropertiesPanel(mText, mWidth, mHeight);
			addChild(propertiesForm);
			objectsForm = new ObjectsPanel(mText, mWidth, mHeight);
			addChild(objectsForm);
			trace("BCConstructor class");
//			btTest.addEventListener(MouseEvent.CLICK, onTestButtonClick);//Отслеживаем нажатие кнопки.
		}
		
/*		public function onTestButtonClick(Event:MouseEvent):void
		{
			trace(Text.x);
		}
*/		
	}
}
