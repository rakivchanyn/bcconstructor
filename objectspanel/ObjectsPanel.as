package objectspanel
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.FileReference;
	import flash.display.Bitmap;
    import flash.display.BitmapData;
	import flash.utils.ByteArray;
	import flash.geom.Matrix;
	import workspace.*;
	
	public class ObjectsPanel extends MovieClip
	{
		var mWorkSpace:WorkSpace;
		
		public function ObjectsPanel(aWorkSpace:WorkSpace, aWidth:int, aHeight:int)
		{
			trace("ObjectsPanel class");	
			mWorkSpace = aWorkSpace;
			var objPanel = new ObjectsPanelObjects();
			objPanel.x = 0;//Вирівнювання панелі по лівому краю.
			objPanel.y = aHeight/2 - objPanel.height/2;//Вирівнювання панелі по нижньому краю.			
			addChild(objPanel);
			//Добавляем текст на робоче поле.
			objPanel.btAddText.addEventListener(MouseEvent.CLICK, addTextOnWorkSpace);
			//Зберігаємо вміст робочої області як зображення.
			objPanel.btSave.addEventListener(MouseEvent.CLICK, saveWorkSpaceAsImage);
		}
		
		public function addTextOnWorkSpace(event:MouseEvent):void
		{
			mWorkSpace.createText();
		}
		
		public function saveWorkSpaceAsImage(event:MouseEvent):void
		{	//Налаштовуево розмір картинки робочої області.
			var scale:int = 5;
			trace(mWorkSpace.width-1);
			var bBitmapData:BitmapData = new BitmapData(scale*(mWorkSpace.mWidth),
														scale*(mWorkSpace.mHeight), true, 0x0);
			var scaleMatrix:Matrix = new Matrix(scale,0,0,scale);
			bBitmapData.draw(mWorkSpace, scaleMatrix);//Заповнюємо дані для побудови зображення з вмісту робочої області.
			var mWorkSpaceBitmap:Bitmap = new Bitmap(bBitmapData);//Створюємо зображення вмісту робочої області.
			var byteArrayWorkSpace:ByteArray = PNGEncoder.encode(bBitmapData, 300);
			var mWorkSpaceImage:FileReference = new FileReference();
			mWorkSpaceImage.save(byteArrayWorkSpace, "image.png");
		}
	}
}
