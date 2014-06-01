package  workspace
{
	import flash.display.Sprite;
	import flash.events.MouseEvent
	import flash.display.Shape;
	import flash.text.*;

	
	public class WorkSpace extends Sprite
	{
		public var mWidth:int = 300;
		public var mHeight:int = 200;
		var mWorkSpaceMask:Sprite;
		var mOffsetX:Vector.<int>; 
		var mOffsetY:Vector.<int>;
		public var mCurObj:Array;
		public var mObject:Array;
		public var mPreviousText: TextField;
		var mBackGround:Sprite;

		public function WorkSpace()
		{
			trace("WorkSpace class");
			mCurObj = new Array(1);
			mCurObj[0] = null;
			mObject = new Array();
			mOffsetX = new Vector.<int>(30); 
			mOffsetY = new Vector.<int>(30);
			//Створюєм фон робочої області
			mBackGround = new Sprite(); 
			mBackGround.graphics.lineStyle(1, 0x000000); 
			mBackGround.graphics.beginFill(0xffffff); 
			mBackGround.graphics.drawRect(0, 0, mWidth, mHeight); 
			mBackGround.graphics.endFill(); 
			this.addChild(mBackGround);
			//Створюємо маску робочої області.
			mWorkSpaceMask = new Sprite(); 
			mWorkSpaceMask.graphics.lineStyle(1, 0x000000); 
			mWorkSpaceMask.graphics.beginFill(0xffffff); 
			mWorkSpaceMask.graphics.drawRect(0, 0, mWidth, mHeight); 
			mWorkSpaceMask.graphics.endFill(); 
			mBackGround.addEventListener(MouseEvent.CLICK, makeSelected);//Скидаем виділення всіх об'єктів.
			this.addChild(mWorkSpaceMask); 
			this.mask = mWorkSpaceMask;//Маска для контейнера робочої області.
		}
		//Функція початку перетягування обєктів. Визиваеться коли відбувається натискання миші.
		function startDragging(event:MouseEvent):void 
		{
			if(event.target is TextField && !event.target.border)//Якщо працюєм з текстом и
				return;//даний об'єкт не виділений, то нічого не будемо переміщувати

			for(var i:int = 0; i < mCurObj.length; i++)
			{
				mOffsetX[i] = event.stageX - mCurObj[i].x;//Запис різниці координат миші на екрані і координат
				mOffsetY[i] = event.stageY - mCurObj[i].y;//об'єкту.
			}
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, dragObjects);//Відслідковування переміщення миші. 
		} 
		//Функція закінчення перетягування обєктів. Визиваеться коли відбувається відпускання миші.
		function stopDragging(event:MouseEvent):void 
		{//Зупиняем відслідковування переміщення миші. 
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, dragObjects); 
		} 
		//Функція перетягування об'єктів.
		function dragObjects(event:MouseEvent):void 
		{//Переміщення обєкту з попередньої точки розташування на величину зміщення миші. 
			for(var i:int = 0; i < mCurObj.length; i++)
			{
				mCurObj[i].x = event.stageX - mOffsetX[i]; 
				mCurObj[i].y = event.stageY - mOffsetY[i]; 
			}
		} 
			
		public function createText():void
		{
//			trace("Text created");
			mCurObj.length = 1;//Обрізаемо масив активних об'єктів, залишаемо тільки 1.
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
			mObject[i].border = true;
			mObject[i].multiline = true;
			mObject[i].autoSize = TextFieldAutoSize.CENTER; 
			mObject[i].selectable = true;
			mObject[i].mouseEnabled = true;
			mObject[i].text = "Type Text Here";						
			this.addChild(mObject[i]);
			mObject[i].x = mWidth/2 - mObject[i].width/2;
			mObject[i].y = mHeight/2 - mObject[i].height/2;
			mObject[i].addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
			mObject[i].addEventListener(MouseEvent.MOUSE_UP, stopDragging);//Відслідковуем відпускання миші.
			//Відслідковуємо клік по об'єкту, роблячи його виділеним.
			mObject[i].addEventListener(MouseEvent.CLICK, makeSelected);
			mPreviousText = mObject[i];
			
			for(i = 0; i < mObject.length - 1; i++)//провіряем список всіх об'єктів крім останнього.
			{
				if(mObject[i] is TextField)//Якщо працюєм з текстом,
					mObject[i].border = false;//то забираєм рамку в об'єкта.
			}
		}
		//Відслідковуємо появу фокуса об'єкта.
		public function makeSelected(event:MouseEvent):void
		{
			if(event.ctrlKey)//Клік з натиснутою клавішею Ctrl,
			{	
				if(event.target == mBackGround)//Якщо клікнули по робочій області,
					return;//то виходимо.
				else//Інакше,
					mCurObj.push(event.target);//додаем об'єкт в масив активних об'єктів.
			}
			else
			{
				for(var i:int = 0; i < mObject.length; i++)//провіряем список всіх об'єктів.
				{
					if(mObject[i] is TextField)//Якщо працюєм з текстом,
						mObject[i].border = false;//то забираєм рамку в об'єкта.
				}
				
				mCurObj.length = 1;//Обрізаемо масив активних об'єктів, залишаемо тільки 1.
				mCurObj[0] = event.target;
				
				if(event.target == mBackGround)//Якщо клікнули по робочій області,
				{
					mCurObj[0] = null;
					return;//то виходимо.
				}
			}
				
			if(event.target is TextField)
				event.target.border = true;
		}		
	}
}
//			mObject[i].background = true;
//			mObject[i].gridFitType=GridFitType.PIXEL;
//			mObject[i].antiAliasType = AntiAliasType.ADVANCED;
//			mObject[i].sharpness = -400;			
//			mObject[i].embedFonts = true; 
