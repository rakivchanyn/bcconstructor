package settingspanel
{
	import flash.display.MovieClip;
	import workspace.*;
	
	public class SettingsPanel extends MovieClip
	{
		var mWorkSpace:WorkSpace;
		
		public function SettingsPanel(aWorkSpace:WorkSpace, aWidth:int, aHeight:int)
		{
			trace("SettingsPanel class");	
			var setPanel = new SettingsPanelObjects();
			addChild(setPanel);
			mWorkSpace = aWorkSpace;
			setPanel.x = aWidth/2 - setPanel.width/2;//Вирівнювання панелі по центру.
			setPanel.y = 0;//Вирівнювання панелі по нижньому краю.			
		}
	}
}
