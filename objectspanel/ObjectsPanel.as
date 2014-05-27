package objectspanel
{
	import flash.display.MovieClip;

	public class ObjectsPanel extends MovieClip
	{
		private var mMainWidth:int = 0;
		private var mMainHeight:int = 0;
		
		public function ObjectsPanel(aWidth, aHeight)
		{
			mMainWidth = aWidth;
			mMainHeight = aHeight;
			trace("ObjectsPanel class");
//			trace(stage.stageWidth);
			// constructor code
		}
	}
}
