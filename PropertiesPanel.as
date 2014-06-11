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
	
	public class PropertiesPanel extends MovieClip
	{
		var propPanel:PropertiesPanelObjects;
		var mTF:TextField;
		var mWorkSpace:WorkSpace;
		
		public function PropertiesPanel(aWorkSpace:WorkSpace, aWidth:int, aHeight:int)
		{
			trace("PropertiesPanel class");	
			mTF = new TextField();
			mWorkSpace = aWorkSpace;
			propPanel = new PropertiesPanelObjects();
			propPanel.x = aWidth/2 - propPanel.width/2;//Вирівнювання панелі по центру.
			propPanel.y = aHeight - propPanel.height;//Вирівнювання панелі по нижньому краю.			
			addChild(propPanel);
			//Додаємо обробку натискань на елементи панелі інструментів.
			propPanel.btTextBold.addEventListener(MouseEvent.CLICK, setTextBold);
			propPanel.btTextItalic.addEventListener(MouseEvent.CLICK, setTextItalic);
			propPanel.btTextUnderlined.addEventListener(MouseEvent.CLICK, setTextUnderlined);
			propPanel.btTextAlignLeft.addEventListener(MouseEvent.CLICK, setTextAlingLeft);
			propPanel.btTextAlignCenter.addEventListener(MouseEvent.CLICK, setTextAlingCenter);
			propPanel.btTextAlignRight.addEventListener(MouseEvent.CLICK, setTextAlingRight);
			propPanel.cbFontType.addEventListener(Event.CHANGE, setFontType);
			propPanel.cbColorPick.addEventListener(Event.CHANGE, setTextColor);
			propPanel.nsFontSize.addEventListener(Event.CHANGE, setFontSize);
			//Прослуховувач події на скидання фокуса з об'єктів(тобто жоден об'єкт не виділений).
			mWorkSpace.addEventListener(CurrentObjectsEventer.CURRENT_OBJECTS_FALSE, noCurrentObjects);
			//Прослуховувач події на появу фокуса на об'єкті/об'єктах.
			mWorkSpace.addEventListener(CurrentObjectsEventer.CURRENT_OBJECTS_TRUE, isCurrentObjects);
			mWorkSpace.dispatchEvent(new CurrentObjectsEventer(CurrentObjectsEventer.CURRENT_OBJECTS_FALSE));//Подія "Не виділено жодного об'єкту".

		}
		//Функція керування зовнішнім виглядом панелі властивостей, коли не виділений жодний об'єкт.
		function noCurrentObjects(event:CurrentObjectsEventer):void
		{
			propPanel.tiX.enabled = false;//Деактивуем текстове поле координати Х об'єкту.
			propPanel.tiY.enabled = false;//Деактивуем текстове поле координати У об'єкту.
			propPanel.btTextBold.enabled = false;
			propPanel.btTextItalic.enabled = false;
			propPanel.btTextUnderlined.enabled = false;
			propPanel.btTextAlignLeft.enabled = false;
			propPanel.btTextAlignCenter.enabled = false;
			propPanel.btTextAlignRight.enabled = false;
			propPanel.cbFontType.enabled = false;
			propPanel.cbColorPick.enabled = false;
			propPanel.nsFontSize.enabled = false;
		}
		//Функція керування зовнішнім виглядом панелі властивостей, коли не об'єкти виділені.
		function isCurrentObjects(event:CurrentObjectsEventer):void
		{
			var i:int;
			propPanel.tiX.enabled = true;//Активація текстового поля координати Х об'єкта.
			propPanel.tiY.enabled = true;//Активація текстового поля координати Y об'єкта.
			propPanel.btTextBold.enabled = true;
			propPanel.btTextItalic.enabled = true;
			propPanel.btTextUnderlined.enabled = true;
			propPanel.btTextAlignLeft.enabled = true;
			propPanel.btTextAlignCenter.enabled = true;
			propPanel.btTextAlignRight.enabled = true;
			propPanel.cbFontType.enabled = true;
			propPanel.cbColorPick.enabled = true;
			propPanel.nsFontSize.enabled = true;

			if(mWorkSpace.mCurObj.length == 1)
			{
				if(mWorkSpace.mCurObj[0] is TextField)
				{
					mTF = mWorkSpace.mCurObj[0];
					var format:TextFormat = mTF.getTextFormat(0,1);
					propPanel.nsFontSize.textField.text = String(format.size);
					
					for(i = 0; i < propPanel.cbFontType.length; i++)
					{
						propPanel.cbFontType.selectedIndex = i;
						
						if(propPanel.cbFontType.selectedItem.data == String(format.font))
						{
							break;
						}
					}
				}
			}

			propPanel.tiX.text = String(int(mWorkSpace.mCurObj[0].x));//Відображення координати Х об'єкта.
			propPanel.tiY.text = String(int(mWorkSpace.mCurObj[0].y));//Відображення координати Y об'єкта.
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
			for(var i:int = 0; i < mWorkSpace.mCurObj.length; i++)
			{
				if(mWorkSpace.mCurObj[i] is TextField)
				{
					mTF = mWorkSpace.mCurObj[i];
					var format:TextFormat = mTF.getTextFormat(0,1);
					format.color = (evt.currentTarget as ComboBox).selectedItem.data;
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
