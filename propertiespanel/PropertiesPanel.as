package propertiespanel
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.*;
	import fl.controls.ComboBox;
	
	
	public class PropertiesPanel extends MovieClip
	{
		var propPanel:PropertiesPanelObjects;
		var mTF:TextField;
		
		public function PropertiesPanel(aText:TextField, aWidth:int, aHeight:int)
		{
			trace("PropertiesPanel class");	
			mTF = aText;
			propPanel = new PropertiesPanelObjects();
			propPanel.x = aWidth/2 - propPanel.width/2;//Вирівнювання панелі по центру.
			propPanel.y = aHeight - propPanel.height;//Вирівнювання панелі по нижньому краю.			
			addChild(propPanel);
			propPanel.btTextBold.addEventListener(MouseEvent.CLICK, setTextBold);
			propPanel.btTextItalic.addEventListener(MouseEvent.CLICK, setTextItalic);
			propPanel.cbFontType.addEventListener(Event.CHANGE, setFontType);
			addChild(mTF);

		}
		function setTextBold(event:MouseEvent):void
		{
			var format:TextFormat = mTF.getTextFormat(0,1);
			format.bold = !format.bold;
			mTF.setTextFormat(format);
		}
		function setTextItalic(event:MouseEvent):void
		{
			var format:TextFormat = mTF.getTextFormat(0,1);
			format.italic = !format.italic;
			mTF.setTextFormat(format);
		}
		function setFontType(evt:Event):void
		{
			var format:TextFormat = mTF.getTextFormat(0,1);
			format.font = (evt.currentTarget as ComboBox).selectedItem.data;
			mTF.setTextFormat(format);
			
		}
	}
}
