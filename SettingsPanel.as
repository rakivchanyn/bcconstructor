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
			mSetPanel.cbScale.selectedIndex = 1;
			mSetPanel.cbScale.addEventListener(Event.CHANGE, setWorkSpaceScale);
		}
		//Метод настройки размера и расположения рабочей области.
		public function setWorkSpace(event:Event):void
		{	//Значение из списка размеров рабочей области.
			var strSizes:String = mSetPanel.cbWorkSpaceSizes.selectedItem.data;
			mTextData[1] = "Розмір: " + mSetPanel.cbWorkSpaceSizes.selectedItem.label + "\n";
			var size:Array = strSizes.split(" ", 2);//Строку заносим в масив размеров.
			mWorkSpace.resizeWorkSpace(int(size[0]), int(size[1]));
			mWorkSpace.x = int(mWidth/2 - mWorkSpace.mWidth/2);
			mWorkSpace.y = int(mHeight/2 - mWorkSpace.mHeight/2);
			//trace (mTextData[0] + mTextData[1]);
		}
		//Метод масштабирующий рабочую область
		public function setWorkSpaceScale(event:Event)
		{
			var nScale:Number = mSetPanel.cbScale.selectedItem.data;
			mWorkSpace.mScale = nScale;
			mWorkSpace.scaleX = nScale;
			mWorkSpace.scaleY = nScale;
			mWorkSpace.x = int(mWidth/2 - nScale*mWorkSpace.mWidth/2);
			mWorkSpace.y = int(mHeight/2 - nScale*mWorkSpace.mHeight/2);
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
