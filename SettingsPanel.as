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
		
		public function SettingsPanel(aWorkSpace:WorkSpace, aWidth:int, aHeight:int)
		{
			trace("SettingsPanel class");	
			mWidth = aWidth;
			mHeight = aHeight;
			mSetPanel = new SettingsPanelObjects();
			addChild(mSetPanel);
			mWorkSpace = aWorkSpace;
			mSetPanel.x = aWidth/2 - mSetPanel.width/2;//Вирівнювання панелі по центру.
			mSetPanel.y = 0;//Вирівнювання панелі по верхньому краю.
			mSetPanel.cbWorkSpaceSizes.addEventListener(Event.CHANGE, setWorkSpace);
		}
		//Метод настройки размера и расположения рабочей области.
		public function setWorkSpace(event:Event):void
		{	//Значение из списка размеров рабочей области.
			var strSizes:String = mSetPanel.cbWorkSpaceSizes.selectedItem.data;
			var size:Array = strSizes.split(" ", 2);//Строку заносим в масив размеров.
			mWorkSpace.resizeWorkSpace(int(size[0]), int(size[1]));
			mWorkSpace.x = mWidth/2 - mWorkSpace.width/2;
			mWorkSpace.y = mHeight/2 - mWorkSpace.height/2;
		}
	}
}
