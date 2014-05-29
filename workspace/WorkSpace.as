package  workspace
{
	import flash.display.Sprite;
	import flash.events.MouseEvent
	import flash.display.Shape;
	import flash.text.*;
	
	public class WorkSpace extends Sprite
	{
		var mWidth:int = 300;
		var mHeight:int = 200;
		var mWorkSpaceMask:Sprite;
		public var mCurObj:Array;
		public var mObject:Array;
		public var mPreviousText: TextField;
		
		public function WorkSpace(aWidth:int, aHeight:int)
		{
			trace("WorkSpace class");
			mCurObj = new Array(1);
			mCurObj[0] = null;
			mObject = new Array();
			//Створюєм фон робочої області
			var backGround:Shape = new Shape(); 
			backGround.graphics.lineStyle(1, 0x000000); 
			backGround.graphics.beginFill(0xffffff); 
			backGround.graphics.drawRect(0, 0, mWidth, mHeight); 
			backGround.graphics.endFill(); 
			this.addChild(backGround); 
			//Створюємо маску робочої області.
			mWorkSpaceMask = new Sprite(); 
			mWorkSpaceMask.graphics.lineStyle(1, 0x000000); 
			mWorkSpaceMask.graphics.beginFill(0xffffff); 
			mWorkSpaceMask.graphics.drawRect(0, 0, mWidth, mHeight); 
			mWorkSpaceMask.graphics.endFill(); 
			this.addChild(mWorkSpaceMask); 
			this.mask = mWorkSpaceMask;
		}
			
		public function createText():void
		{
			trace("Text created");
			mCurObj[0] = new TextField();
			var i:int = mObject.push(mCurObj[0]) - 1;
			var format:TextFormat = new TextFormat();
			
			if(mPreviousText == null)
			{
				mPreviousText = new TextField();
				format.color = 0x000000; 
				format.size = 14; 
				format.font = "Times New Roman"; 
				format.bold = false;
				format.italic = false;
				format.underline = false;
			}
			else
				format = mPreviousText.getTextFormat(0,1);
			
			mObject[i].defaultTextFormat = format;			
			mObject[i].type = TextFieldType.INPUT;
			mObject[i].background = true;
			mObject[i].border = true;
			mObject[i].multiline = true;
//			mObject[i].gridFitType=GridFitType.PIXEL;
//			mObject[i].antiAliasType = AntiAliasType.ADVANCED;
//			mObject[i].sharpness = -400;			
//			mObject[i].embedFonts = true; 
			mObject[i].autoSize = TextFieldAutoSize.CENTER; 
			mObject[i].selectable = true;
			mObject[i].mouseEnabled = true;
			mObject[i].text = "Type Text Here";						
			this.addChild(mObject[i]);
			mObject[i].x = mWidth/2 - mObject[i].width/2;
			mObject[i].y = mHeight/2 - mObject[i].height/2;;
			mPreviousText = mObject[i];
		}
	}
}
