package  {
	import fl.data.DataProvider;
	import fl.controls.ComboBox;
	import flash.display.Shape;
	import flash.text.TextFormat;
	
	import ColorCellRenderer;
	
	public class ComboBoxColors extends ComboBox{

		private var colorIcon:Shape;
		
		public function ComboBoxColors() 
		{
			
			super();
			
			colorIcon = new Shape();
			colorIcon.x = 3;
			colorIcon.y = 3;
			this.addChild(colorIcon);
		}
		
		protected override function drawTextField() : void
		{
			super.drawTextField();
			
			var item:Object = this.selectedItem;
			
			var color:Number = item['color'];
			
			var format:TextFormat = new TextFormat(null, null, color);
			this.textField.setStyle('textFormat', format);
			this.textField.textField.setTextFormat(format);
			
			this.textField.x = 20;
			this.textField.width -= 20;
			
			colorIcon.graphics.clear();
			colorIcon.graphics.beginFill(color, 1);
			colorIcon.graphics.drawRect(0, 0, 15, 15);
			colorIcon.graphics.endFill();
		}
	}
	
}
