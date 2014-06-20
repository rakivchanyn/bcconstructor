package  {
	import fl.controls.listClasses.CellRenderer;
	import flash.display.Shape;
	import flash.text.TextFormat;
	
	public class ColorCellRenderer extends CellRenderer
	{
		
		private var colorIcon:Shape;

		public function ColorCellRenderer() 
		{
			super();
			
			colorIcon = new Shape();
			colorIcon.x = 2;
			colorIcon.y = 2;
			this.addChild(colorIcon);
		}
		
		public override function set data(value:Object) : void
		{
			super.data = value;
			var color:Number = value['color'];
//			var format:TextFormat = new TextFormat(null, null, color);
//			this.setStyle('textFomat', format);
//			this.textField.setTextFormat(format);
			colorIcon.graphics.clear();
			colorIcon.graphics.beginFill(color, 1);
			colorIcon.graphics.drawRect(0, 0, 15, 15);
			colorIcon.graphics.endFill();
		}
		
		protected override function drawLayout() : void
		{
			super.drawLayout();
			this.textField.x = 20;
			this.textField.width -= 20;
		}

	}
	
}
