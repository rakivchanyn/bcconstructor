package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.*;
	import fl.controls.ComboBox;
	import fl.controls.NumericStepper;
    import flash.events.EventDispatcher;
	import CurrentObjectsEventer;
	import flash.display.Sprite;
	import fl.data.DataProvider;
	import ComboBoxColors;
	
	public class PropertiesPanel extends MovieClip
	{
		var propPanel:PropertiesPanelObjects;
		var mTF:TextField;
		var mWorkSpace:WorkSpace;
		var mX:Number;
		var mY:Number;
		var cbCol:ComboBoxColors;
		
		public function PropertiesPanel(aWorkSpace:WorkSpace, aWidth:int, aHeight:int)
		{
			trace("PropertiesPanel start");	
			mTF = new TextField();
			mWorkSpace = aWorkSpace;
			propPanel = new PropertiesPanelObjects();
			propPanel.x = int(aWidth/2 - propPanel.FormBackGround.width/2);//Вирівнювання панелі по центру.
			propPanel.y = int(aHeight - propPanel.FormBackGround.height);//Вирівнювання панелі по нижньому краю.
			
			var data:DataProvider = new DataProvider();
			data.addItem({label:"Чорний", color:0x000000});
			data.addItem({label:"Червоний", color:0xff0000});
			data.addItem({label:"Зелений", color:0x00ff00});
			data.addItem({label:"Синій", color:0x0000ff});
			data.addItem({label:"Золотистий", color:0xffcc33});
			data.addItem({label:"Сріблястий", color:0xcccccc});
			data.addItem({label:"", color:-1});
			
			cbCol = new ComboBoxColors();
			cbCol.x = 238;
			cbCol.y = 12;
			cbCol.dropdown.setStyle("cellRenderer", ColorCellRenderer);
			cbCol.dataProvider = data;
			cbCol.rowCount = 7;
			propPanel.addChild(cbCol);
			
			addChild(propPanel);
			propPanel.Shadow.x = propPanel.x;//Координати області, яка затінює об'єкти панелі властивостей.
			propPanel.Shadow.y = propPanel.y;
			//Додаємо обробку натискань на елементи панелі інструментів.
			propPanel.btTextBold.addEventListener(MouseEvent.CLICK, setTextBold);
			propPanel.btTextItalic.addEventListener(MouseEvent.CLICK, setTextItalic);
			propPanel.btTextUnderlined.addEventListener(MouseEvent.CLICK, setTextUnderlined);
			propPanel.btTextAlignLeft.addEventListener(MouseEvent.CLICK, setTextAlingLeft);
			propPanel.btTextAlignCenter.addEventListener(MouseEvent.CLICK, setTextAlingCenter);
			propPanel.btTextAlignRight.addEventListener(MouseEvent.CLICK, setTextAlingRight);
			propPanel.cbFontType.addEventListener(Event.CHANGE, setFontType);
			cbCol.addEventListener(Event.CHANGE, setTextColor);
			propPanel.nsFontSize.addEventListener(Event.CHANGE, setFontSize);
			propPanel.tiX.addEventListener(Event.CHANGE, setXPosition);
			propPanel.tiY.addEventListener(Event.CHANGE, setYPosition);


			//Прослуховувач події на скидання фокуса з об'єктів(тобто жоден об'єкт не виділений).
			mWorkSpace.addEventListener(CurrentObjectsEventer.CURRENT_OBJECTS_FALSE, noCurrentObjects);
			//Прослуховувач події на появу фокуса на об'єкті/об'єктах.
			mWorkSpace.addEventListener(CurrentObjectsEventer.CURRENT_OBJECTS_TRUE, isCurrentObjects);
			mWorkSpace.dispatchEvent(new CurrentObjectsEventer(CurrentObjectsEventer.CURRENT_OBJECTS_FALSE));//Подія "Не виділено жодного об'єкту".
			trace("PropertiesPanel end");	
		}
		//Функція зміни положення об'єктів по координаті Х.
		function setXPosition(event:Event)
		{
			var iXChange:Number;
			iXChange = mWorkSpace.mScreenDPI*(mX - Number(propPanel.tiX.text));//Визначаємо зміну в між попереднім значенням координати і зміненим.
			
			for(var i:int = 0; i < mWorkSpace.mCurObj.length; i++)//Працюємо з поточними виділенними об'єктами.
			{
				mWorkSpace.mCurObj[i].x = mWorkSpace.mCurObj[i].x - iXChange;//Змінюємо координату Х об'єкта на величину зміни.
			}
			
			mX = Number(propPanel.tiX.text);//Запам'ятовуємо теперішнє значення.
		}
		//Функція зміни положення об'єктів по координаті Y.
		function setYPosition(event:Event)
		{
			var iYChange:Number;
			iYChange = mWorkSpace.mScreenDPI*(mY - Number(propPanel.tiY.text));//Визначаємо зміну в між попереднім значенням координати і зміненим.

			for(var i:int = 0; i < mWorkSpace.mCurObj.length; i++)//Працюємо з поточними виділенними об'єктами.
			{
				mWorkSpace.mCurObj[i].y = mWorkSpace.mCurObj[i].y - iYChange;//Змінюємо координату Y об'єкта на величину зміни.
			}
			
			mY = Number(propPanel.tiY.text);//Запам'ятовуємо теперішнє значення.
		}
		//Функція керування зовнішнім виглядом панелі властивостей, коли не виділений жодний об'єкт.
		function noCurrentObjects(event:CurrentObjectsEventer):void
		{
			addChildAt(propPanel.Shadow, 1);//Затінюємо панель властивостей тексту.
		}
		//Функція керування зовнішнім виглядом панелі властивостей, коли об'єкти виділені.
		function isCurrentObjects(event:CurrentObjectsEventer):void
		{
			var i:int;
			mX = 10000, mY = 10000;//Вносимо початкові значення для координат.
			var fontType = new Array(0);//Масиви властивостей текстових об'єктів.
			var fontSize = new Array(0);
			var fontColor = new Array(0);
			
			for(i = 0; i < mWorkSpace.mCurObj.length; i++)//Провіряємо список виділених об'єктів.
			{
				if(mWorkSpace.mCurObj[i] is TextField)//Опрацьовуємо текст.
				{
					mTF = mWorkSpace.mCurObj[i];
					var format:TextFormat = mTF.getTextFormat();//Отримуємо властивості формату тексту.
					fontType.push(format.font);//Шрифт тексту додаємо в кінець масиву властивостей текстовий об'єктів.
					fontColor.push(format.color);
					fontSize.push(format.size);
				}
				
				if(mX > mWorkSpace.mCurObj[i].x/mWorkSpace.mScreenDPI)//Визначаємо координату х з найменшим значенням.
				{
					mX = mWorkSpace.mCurObj[i].x/mWorkSpace.mScreenDPI;
				}
				
				if(mY > mWorkSpace.mCurObj[i].y/mWorkSpace.mScreenDPI)//Визначаємо координату y з найменшим значенням.
				{
					mY = mWorkSpace.mCurObj[i].y/mWorkSpace.mScreenDPI;
				}
			}
			
			if(fontType.length > 0)//Виділено хоча б один текстовий об'єкт.
			{
				addChildAt(propPanel.Shadow, 0);//Забираємо затінення панелі властивостей тексту.
				propPanel.nsFontSize.textField.text = String(fontSize[0]);//Розмір шрифту відображаємо на панелі.

				if(fontType.length > 1)//Виділено кілька текстових об'єктів.
				{
					for(i = 1; i < fontType.length; i++)//Провіряємо масиви властивостей об'єктів.
					{
						if(fontType[0] != fontType[i])//Якщо типи шрифтів текстових об'єктів відрізняються,
						{
							fontType[0] = "";//то занулюємо тип шрифта.
						}
						
						if(fontSize[0] != fontSize[i])//Якщо розмір тексту текстових об'єктів відрізняються,
						{
							fontSize[0] = "";//то занулюємо розмір шрифта.
						}
						
						if(fontColor[0] != fontColor[i])//Якщо колір текстових об'єктів відрізняються,
						{
							fontColor[0] = -1;//то занулюємо колір шрифта.
						}
					}
				}
				//Визначаємо поле випадаючого списку шрифтів, яке відповідає типу шрифта текстового об'єкту.
				for(i = 0; i < propPanel.cbFontType.length; i++)
				{
					propPanel.cbFontType.selectedIndex = i;
					
					if(propPanel.cbFontType.selectedItem.data == fontType[0])//Якщо тип шрифту текстового об'єкту
					{//співпадає з типом шрифту з випадаючого списку,
						break;//то тоді виходимо із циклу.
					}
				}
				//Визначаємо поле випадаючого списку кольорів тексту, яке відповідає кольору текстового об'єкту.
				
				for(i = 0; i < cbCol.length; i++)
				{
					cbCol.selectedIndex = i;
					if(cbCol.selectedItem.color == fontColor[0])//Якщо колір текстового об'єкту
					{//співпадає з кольором з випадаючого списку,
						break;//то тоді виходимо із циклу.
					}
				}
			}
			
			propPanel.tiX.text = String(mX.toFixed(1));//Відображення координати Х об'єкта.
			propPanel.tiY.text = String(mY.toFixed(1));//Відображення координати Y об'єкта.
		}
		
		function setTextBold(event:MouseEvent):void
		{
			for(var i:int = 0; i < mWorkSpace.mCurObj.length; i++)
			{
				if(mWorkSpace.mCurObj[i] is TextField)
				{
					mTF = mWorkSpace.mCurObj[i];
					var format:TextFormat = mTF.getTextFormat(0,1);
					format.bold = !format.bold;
					mTF.setTextFormat(format);
				}
			}
		}
		
		function setTextItalic(event:MouseEvent):void
		{
			for(var i:int = 0; i < mWorkSpace.mCurObj.length; i++)
			{
				if(mWorkSpace.mCurObj[i] is TextField)
				{
					mTF = mWorkSpace.mCurObj[i];
					var format:TextFormat = mTF.getTextFormat(0,1);
					format.italic = !format.italic;
					mTF.setTextFormat(format);
				}
			}
		}
		
		function setTextUnderlined(event:MouseEvent):void
		{
			for(var i:int = 0; i < mWorkSpace.mCurObj.length; i++)
			{
				if(mWorkSpace.mCurObj[i] is TextField)
				{
					mTF = mWorkSpace.mCurObj[i];
					var format:TextFormat = mTF.getTextFormat(0,1);
					format.underline = !format.underline;
					mTF.setTextFormat(format);
				}
			}
		}
		
		function setFontType(evt:Event):void
		{
			if((evt.currentTarget as ComboBox).selectedItem.data == "")
				return;
				
			for(var i:int = 0; i < mWorkSpace.mCurObj.length; i++)
			{
				if(mWorkSpace.mCurObj[i] is TextField)
				{
					mTF = mWorkSpace.mCurObj[i];
					var format:TextFormat = mTF.getTextFormat(0,1);
					format.font = (evt.currentTarget as ComboBox).selectedItem.data;
					mTF.setTextFormat(format);
				}
			}
		}
		
		function setFontSize(evt:Event):void
		{
			for(var i:int = 0; i < mWorkSpace.mCurObj.length; i++)
			{
				if(mWorkSpace.mCurObj[i] is TextField)
				{
					mTF = mWorkSpace.mCurObj[i];
					var format:TextFormat = mTF.getTextFormat(0,1);
					format.size = (evt.currentTarget as NumericStepper).value;
					mTF.setTextFormat(format);
				}
			}
		}
		
		function setTextColor(evt:Event):void
		{
			if((evt.currentTarget as ComboBoxColors).selectedItem.color == -1)
				return;

			for(var i:int = 0; i < mWorkSpace.mCurObj.length; i++)
			{
				if(mWorkSpace.mCurObj[i] is TextField)
				{
					mTF = mWorkSpace.mCurObj[i];
					var format:TextFormat = mTF.getTextFormat(0,1);
					format.color = (evt.currentTarget as ComboBoxColors).selectedItem.color;
					mTF.setTextFormat(format);
				}
			}
		}
		
		function setTextAlingLeft(event:MouseEvent):void
		{
			for(var i:int = 0; i < mWorkSpace.mCurObj.length; i++)
			{
				if(mWorkSpace.mCurObj[i] is TextField)
				{
					mTF = mWorkSpace.mCurObj[i];
					mTF.autoSize = TextFieldAutoSize.LEFT;
				}
			}
		}
		
		function setTextAlingCenter(event:MouseEvent):void
		{
			for(var i:int = 0; i < mWorkSpace.mCurObj.length; i++)
			{
				if(mWorkSpace.mCurObj[i] is TextField)
				{
					mTF = mWorkSpace.mCurObj[i];
					mTF.autoSize = TextFieldAutoSize.CENTER;
				}
			}
		}
		
		function setTextAlingRight(event:MouseEvent):void
		{
			for(var i:int = 0; i < mWorkSpace.mCurObj.length; i++)
			{
				if(mWorkSpace.mCurObj[i] is TextField)
				{
					mTF = mWorkSpace.mCurObj[i];
					mTF.autoSize = TextFieldAutoSize.RIGHT;
				}
			}
		}
	}
}
