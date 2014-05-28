package objectspanel
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.*;

	public class ObjectsPanel extends MovieClip
	{
		var mWidth:int;
		var mHeight:int;
		var objPanel:ObjectsPanelObjects;
		var mText:TextField;
		
		public function ObjectsPanel(aText:TextField, aWidth:int, aHeight:int)
		{
			trace("PropertiesPanel class");	
			mText = aText;
			mWidth = aWidth;
			mHeight = aHeight;
			objPanel = new ObjectsPanelObjects();
			objPanel.x = 0;//Вирівнювання панелі по лівому краю.
			objPanel.y = aHeight/2 - objPanel.height/2;//Вирівнювання панелі по нижньому краю.			
			addChild(objPanel);
			objPanel.btAddText.addEventListener(MouseEvent.CLICK, addTextOnClick);//Отслеживаем нажатие кнопки.
		}
		
		public function addTextOnClick(event:MouseEvent):void
		{
			var format:TextFormat = new TextFormat(); 
			format.color = 0x000000; 
			format.size = 14; 
			format.font = "Times New Roman"; 
//			Text = new TextField();
			mText.type = TextFieldType.INPUT;
//			mText.background = true;
//			Text.embedFonts = true; 
			mText.autoSize = TextFieldAutoSize.LEFT; 
//			Text.antiAliasType = AntiAliasType.ADVANCED; 
			mText.defaultTextFormat = format; 
			mText.selectable = true; 
			mText.mouseEnabled = true; 
			mText.text = "Hello World";
			mText.x = mWidth/2 - mText.width/2;
			mText.y = mHeight/2 - mText.height/2;
			addChild(mText); 
//			trace(mText.height);
		}
	}
}
