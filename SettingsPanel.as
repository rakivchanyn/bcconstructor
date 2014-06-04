package
{
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class SettingsPanel extends MovieClip
	{
		public var mWorkSpace:WorkSpace;
		public var mSetPanel:SettingsPanelObjects;
		var mWidth:int;
		var mHeight:int;
		var mTextData:Array;
		
		public function SettingsPanel(aWorkSpace:WorkSpace, aWidth:int, aHeight:int)
		{
			trace("SettingsPanel class");
			mTextData = new Array(2);
			mTextData[0] = "Матеріал: Папір самоклеючийся\n";
			mTextData[1] = "Розмір: 20x30 мм\n";
			mWidth = aWidth;
			mHeight = aHeight;
			mSetPanel = new SettingsPanelObjects();
			addChild(mSetPanel);
			mWorkSpace = aWorkSpace;
			mSetPanel.x = aWidth/2 - mSetPanel.width/2;//Вирівнювання панелі по центру.
			mSetPanel.y = 0;//Вирівнювання панелі по верхньому краю.
			mSetPanel.cbWorkSpaceSizes.addEventListener(Event.CHANGE, setWorkSpace);
			mSetPanel.cbMaterialType.addEventListener(Event.CHANGE, setChangeMaterialType);
		}
		//Метод настройки размера и расположения рабочей области.
		public function setWorkSpace(event:Event):void
		{	//Значение из списка размеров рабочей области.
			var strSizes:String = mSetPanel.cbWorkSpaceSizes.selectedItem.data;
			mTextData[1] = "Розмір: " + mSetPanel.cbWorkSpaceSizes.selectedItem.label + "\n";
			var size:Array = strSizes.split(" ", 2);//Строку заносим в масив размеров.
			mWorkSpace.resizeWorkSpace(int(size[0]), int(size[1]));
			mWorkSpace.x = mWidth/2 - mWorkSpace.width/2;
			mWorkSpace.y = mHeight/2 - mWorkSpace.height/2;
			//trace (mTextData[0] + mTextData[1]);
		}
		
		public function setChangeMaterialType(event:Event):void
		{
			mTextData[0] = "Матеріал: " + mSetPanel.cbMaterialType.selectedItem.data + "\n";
			//trace (mTextData[0] + mTextData[1]);
		}
		
		public function obtainParameters() : String
		{
			return mTextData[0] + mTextData[1];
		}
	}
}
