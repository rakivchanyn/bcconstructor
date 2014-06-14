package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.display.Shape;
    import flash.display.InteractiveObject;
	import flash.text.*;
	import EmbFonts;
    import flash.events.EventDispatcher;
    import flash.events.Event;
	import CurrentObjectsEventer;
	
	public class WorkSpace extends Sprite
	{
		public var mScreenDPI:Number = 96/25.4;
		public var mWidth:int = 30*mScreenDPI;
		public var mHeight:int = 20*mScreenDPI;
		var mWorkSpaceMask:Sprite;
		var mBackGround:Sprite;
		var mNoFocusText:TextField;
		var mOffsetX:Vector.<int>; 
		var mOffsetY:Vector.<int>;
		public var mCurObj:Array;
		public var mObject:Array;
		public var mPreviousText:TextField;

		public function WorkSpace()
		{
			trace("WorkSpace class");
			var embF:EmbFonts = new EmbFonts();
			embF.loadFonts()
			mCurObj = new Array(1);
			mCurObj[0] = null;
			mObject = new Array();
			mOffsetX = new Vector.<int>(30); 
			mOffsetY = new Vector.<int>(30);
			//Створюєм фон робочої області
			mBackGround = new Sprite(); 
			mBackGround.graphics.beginFill(0xffffff); 
			mBackGround.graphics.drawRect(0, 0, mWidth, mHeight); 
			mBackGround.graphics.endFill(); 
			mBackGround.doubleClickEnabled = true;
			mNoFocusText = new TextField();
			mNoFocusText.y = -100;
			addChild(mNoFocusText);
			this.addChild(mBackGround);
			//Створюємо маску робочої області.
			mWorkSpaceMask = new Sprite(); 
			mWorkSpaceMask.graphics.beginFill(0xffffff); 
			mWorkSpaceMask.graphics.drawRect(0, 0, mWidth, mHeight); 
			mWorkSpaceMask.graphics.endFill(); 
			mBackGround.addEventListener(MouseEvent.CLICK, makeSelected);//Скидаем виділення всіх об'єктів.
			mBackGround.addEventListener(MouseEvent.DOUBLE_CLICK, makeEditable);
			this.addChild(mWorkSpaceMask);
			this.mask = mWorkSpaceMask;//Маска для контейнера робочої області.
 			this.addEventListener(KeyboardEvent.KEY_DOWN, deleteObjects);
		}
		//Метод видалення об'єктів клавішею Delete.
		function deleteObjects(event:KeyboardEvent):void 
		{
			if(event.charCode == 127)//Якщо натиснута клавіша Delete.
			{	//Якщо поточний об'єкт не існує або в режимі редактування тексту,
				if(mCurObj[0] == null || mCurObj[0].selectable)
					return;//то виходимо.
				else
				{
					for(var i:int = mCurObj.length - 1; i >= 0; i--)//Провіряємо всі поточні об'єкти. 
					{	
						for(var j:int = mObject.length - 1; j >= 0; j--)//Провіряємо всі створені об'єкти.
						{
							if(mObject[j] == mCurObj[i])//Якщо елементи масивів співпали,
							{
								mObject.splice(j, 1);//то видаляємо подібний.
								break;
							}
						}

						removeChild(mCurObj[i]);//Видаляємо з відображення на екрані і з прослуховувачів
						mCurObj[i].removeEventListener(MouseEvent.CLICK, makeSelected);//подій
						mCurObj[i].removeEventListener(MouseEvent.DOUBLE_CLICK, makeEditable);
						mCurObj[i] = null;//Видаляемо об'єкт
					}
					
					mCurObj.length = 0;
				}
			}
		}
		//Метод скидування фокусу з усіх об'єктів робочої області.
		public function setNoFocus():void
		{
			for(var i:int = 0; i < mObject.length; i++)//провіряем список всіх об'єктів крім останнього.
			{
				if(mObject[i] is TextField)//Якщо працюєм з текстом,
				{
					mObject[i].border = false;//то забираєм рамку в об'єкта,
					mObject[i].selectable = false;//забороняем редактування,
					mObject[i].setSelection(0, 0);//знімаємо виділення тексту.				
				}
			}
			
			mCurObj.length = 1;//Залишаємо в масиві поточних об'єктів тільки один елемент
			mCurObj[0] = null;//і занулюємо його.
			mNoFocusText.text = "";
			stage.focus = mNoFocusText;//Установка фокуса на текст, якого не видно.
		}
		//Відслідковуємо подвійний клік по об'єкту.
		public function makeEditable(event:MouseEvent):void
		{
			this.setNoFocus();//Знімаємо фокус з об'єктів.
			
			if(event.target is TextField)//Якщо двічі клікнули по тексту,
			{
				mCurObj[0] = event.target;//Відмічаємо об'єкт як активний.
				mCurObj[0].border = true;//Показуємо рамку для об'єкта.
				mCurObj[0].selectable = true;//Дозволяємо редактування.
				stage.focus = mCurObj[0];//Установка фокуса на текст.
				dispatchEvent(new CurrentObjectsEventer(CurrentObjectsEventer.CURRENT_OBJECTS_TRUE));//Подія "Виділено об'єкти".
				return;
			}
			
			if(event.target == mBackGround)//Якщо двічі клікнули по робочій області,
			{
				mCurObj[0] = null;//то активних об'єктів нема і
				dispatchEvent(new CurrentObjectsEventer(CurrentObjectsEventer.CURRENT_OBJECTS_FALSE));//Подія "Не виділено жодного об'єкту".
				return;//виходимо.
			}
		}
		//Відслідковуємо виділення об'єкта/об'єктів по одинарному кліку мишею.
		public function makeSelected(event:MouseEvent):void
		{
			if(event.ctrlKey)//Клік з натиснутою клавішею Ctrl,
			{	
				if(event.target == mBackGround)//Якщо клікнули по робочій області,
					return;//то виходимо.
				
				mCurObj.push(event.target);//Додаем об'єкт в масив активних об'єктів.
					
				if(event.target is TextField)
				{
					for(var i:int = 0; i < mObject.length; i++)//Провіряем список всіх об'єктів.
					{
						if(mObject[i] is TextField)//Якщо працюєм з текстом,
							mObject[i].selectable = false;//і робимо об'єкт нередактованим.
					}
				
					event.target.border = true;//Виділяємо об'єкт.
				}

				dispatchEvent(new CurrentObjectsEventer(CurrentObjectsEventer.CURRENT_OBJECTS_TRUE));//Подія "Виділено об'єкти".
				stage.focus = mNoFocusText;//Установка фокуса на текст, якого не видно.
			}
			else//Клік без клавіші Ctrl.
			{
				if(event.target is TextField)
				{	
					if(event.target.selectable)//Якщо поточний можна редактувати,
						return;//то виходимо;
					else//Якщо редактувати не можна,
					{
						this.setNoFocus();//то знімаємо фокус з усіх об'єктів,
						mCurObj[0] = event.target;//позначаєм даний об'єкт поточним,
						mCurObj[0].border = true;//виділяємо його рамкою
						dispatchEvent(new CurrentObjectsEventer(CurrentObjectsEventer.CURRENT_OBJECTS_TRUE));//Подія "Виділено об'єкти".
						return;//і виходимо;
					}
				}
				
				if(event.target == mBackGround)//Якщо клікнули по робочій області,
				{
					this.setNoFocus();//скидуєм фокус з об'єктів,
					mCurObj[0] = null;//спорожнюєм масив поточних об'єктів
					dispatchEvent(new CurrentObjectsEventer(CurrentObjectsEventer.CURRENT_OBJECTS_FALSE));//Подія "Не виділено жодного об'єкту".
					return;//і виходимо.
				}
			}
		}
		//Метод створює текст при нажиманні на кнопку добавити текст.
		public function createText():void
		{
			this.setNoFocus();//Скидання фокусу з об'єктів.
			mCurObj[0] = new TextField();
			var i:int = mObject.push(mCurObj[0]) - 1;
			var format:TextFormat = new TextFormat();
			
			if(mPreviousText == null || mPreviousText.text == "")
			{
				mPreviousText = new TextField();
				format.color = 0x000000; 
				format.size = 14; 
				//format.font = "Times New Roman"; 
				//trace(EmbFonts.EmbSansMS().fontFamilyName);
				format.font = "EmbTimesNewRoman";//EmbFonts.EmbSansMS().fontFamily;
				format.bold = false;
				format.italic = false;
				format.underline = false;
			}
			else
			{
				format = mPreviousText.getTextFormat(0,1);
			}
			
			mObject[i].embedFonts = true;
			mObject[i].defaultTextFormat = format;			
			mObject[i].type = TextFieldType.INPUT;
			mObject[i].multiline = true;
			mObject[i].border = true;
			mObject[i].autoSize = TextFieldAutoSize.CENTER; 
			mObject[i].selectable = true;
			mObject[i].doubleClickEnabled = true;
			mObject[i].text = "Type Text Here";						
			this.addChild(mObject[i]);
			mObject[i].x = mWidth/2 - mObject[i].width/2;
			mObject[i].y = mHeight/2 - mObject[i].height/2;
			mObject[i].addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
			mObject[i].addEventListener(MouseEvent.MOUSE_UP, stopDragging);//Відслідковуем відпускання миші.
			//Відслідковуємо клік по об'єкту, роблячи його виділеним.
			mObject[i].addEventListener(MouseEvent.CLICK, makeSelected);
			mObject[i].addEventListener(MouseEvent.DOUBLE_CLICK, makeEditable);
			mPreviousText = mObject[i];
			stage.focus = mObject[i];//Установка фокуса на текстове поле.
			mObject[i].setSelection(0, mObject[i].text.length);//Виділяем текст для редактування.
 			dispatchEvent(new CurrentObjectsEventer(CurrentObjectsEventer.CURRENT_OBJECTS_TRUE));//Подія "Виділено об'єкти".
		}
		//Метод, що змінює розмір робочої області.
		public function resizeWorkSpace(aWidth:int, aHeight:int)
		{
			mWidth = aWidth*mScreenDPI;
			mHeight = aHeight*mScreenDPI;
			mBackGround.width = mWidth;
			mBackGround.height = mHeight;
			mWorkSpaceMask.width = mWidth;
			mWorkSpaceMask.height = mHeight;
		}
		//Функція початку перетягування обєктів. Визиваеться коли відбувається натискання миші.
		function startDragging(event:MouseEvent):void 
		{
			if(event.target is TextField)
			{
				if(!event.target.border)//Якщо працюєм з текстом і він не виділений,
					return;//то нічого не будемо переміщувати.
			
				if(event.target.selectable)//Якщо працюєм з текстом і його не можна редактувати
					return;//то нічого не будемо переміщувати.
			}
			
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
	}
}