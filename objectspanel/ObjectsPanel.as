package objectspanel
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import workspace.*;
	
	public class ObjectsPanel extends MovieClip
	{
		var mWidth:int;
		var mHeight:int;
		var mWorkSpace:WorkSpace;
		
		public function ObjectsPanel(aWorkSpace:WorkSpace, aWidth:int, aHeight:int)
		{
			trace("ObjectPanel class");	
			mWorkSpace = aWorkSpace;
			mWidth = aWidth;
			mHeight = aHeight;
			var objPanel = new ObjectsPanelObjects();
			objPanel.x = 0;//Вирівнювання панелі по лівому краю.
			objPanel.y = aHeight/2 - objPanel.height/2;//Вирівнювання панелі по нижньому краю.			
			addChild(objPanel);
			objPanel.btAddText.addEventListener(MouseEvent.CLICK, addTextOnClick);//Отслеживаем нажатие кнопки.
		}
		
		public function addTextOnClick(event:MouseEvent):void
		{
			mWorkSpace.createText();
		}
	}
}
