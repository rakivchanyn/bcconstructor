package propertiespanel
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.*;
	import fl.controls.ComboBox;
	import fl.controls.NumericStepper;
	import workspace.*;	
	
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
			propPanel.btTextBold.addEventListener(MouseEvent.CLICK, setTextBold);
			propPanel.btTextItalic.addEventListener(MouseEvent.CLICK, setTextItalic);
			propPanel.btTextUnderlined.addEventListener(MouseEvent.CLICK, setTextUnderlined);
			propPanel.btTextAlignLeft.addEventListener(MouseEvent.CLICK, setTextAlingLeft);
			propPanel.btTextAlignCenter.addEventListener(MouseEvent.CLICK, setTextAlingCenter);
			propPanel.btTextAlignRight.addEventListener(MouseEvent.CLICK, setTextAlingRight);
			propPanel.cbFontType.addEventListener(Event.CHANGE, setFontType);
			propPanel.nsFontSize.addEventListener(Event.CHANGE, setFontSize);
			addChild(mTF);

		}
		function setTextBold(event:MouseEvent):void
		{
			if(mWorkSpace.mCurObj[0] is TextField)
			{
				mTF = mWorkSpace.mCurObj[0];
			}
			else
			{
				return;
			}
			var format:TextFormat = mTF.getTextFormat(0,1);
			format.bold = !format.bold;
			mTF.setTextFormat(format);
		}
		
		function setTextItalic(event:MouseEvent):void
		{
			if(mWorkSpace.mCurObj[0] is TextField)
			{
				mTF = mWorkSpace.mCurObj[0];
			}
			else
			{
				return;
			}
			var format:TextFormat = mTF.getTextFormat(0,1);
			format.italic = !format.italic;
			mTF.setTextFormat(format);
		}
		
		function setTextUnderlined(event:MouseEvent):void
		{
			if(mWorkSpace.mCurObj[0] is TextField)
			{
				mTF = mWorkSpace.mCurObj[0];
			}
			else
			{
				return;
			}
			var format:TextFormat = mTF.getTextFormat(0,1);
			format.underline = !format.underline;
			mTF.setTextFormat(format);
		}
		
		function setFontType(evt:Event):void
		{
			if(mWorkSpace.mCurObj[0] is TextField)
			{
				mTF = mWorkSpace.mCurObj[0];
			}
			else
			{
				return;
			}
			var format:TextFormat = mTF.getTextFormat(0,1);
			format.font = (evt.currentTarget as ComboBox).selectedItem.data;
			mTF.setTextFormat(format);
			
		}
		
		function setFontSize(evt:Event):void
		{
			if(mWorkSpace.mCurObj[0] is TextField)
			{
				mTF = mWorkSpace.mCurObj[0];
			}
			else
			{
				return;
			}
			var format:TextFormat = mTF.getTextFormat(0,1);
			format.size = (evt.currentTarget as NumericStepper).value;
			mTF.setTextFormat(format);
		}
		
		function setTextAlingLeft(event:MouseEvent):void
		{
			if(mWorkSpace.mCurObj[0] is TextField)
			{
				mTF = mWorkSpace.mCurObj[0];
			}
			else
			{
				return;
			}
			mTF.autoSize = TextFieldAutoSize.LEFT; 
		}
		
		function setTextAlingCenter(event:MouseEvent):void
		{
			if(mWorkSpace.mCurObj[0] is TextField)
			{
				mTF = mWorkSpace.mCurObj[0];
			}
			else
			{
				return;
			}
			mTF.autoSize = TextFieldAutoSize.CENTER; 
		}
		
		function setTextAlingRight(event:MouseEvent):void
		{
			if(mWorkSpace.mCurObj[0] is TextField)
			{
				mTF = mWorkSpace.mCurObj[0];
			}
			else
			{
				return;
			}
			mTF.autoSize = TextFieldAutoSize.RIGHT; 
		}
	}
}
