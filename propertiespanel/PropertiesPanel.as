package  propertiespanel
{
	import flash.display.MovieClip;
	
	public class PropertiesPanel extends MovieClip
	{
		private var mMainWidth:int = 0;
		private var mMainHeight:int = 0;
		
		public function PropertiesPanel(aWidth, aHeight)
		{
			mMainWidth = aWidth;
			mMainHeight = aHeight;
			trace("PropertiesPanel class");
		}
	}
}
