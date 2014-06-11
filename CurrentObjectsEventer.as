package
{
	import flash.events.Event;
	
	public class CurrentObjectsEventer extends Event
	{
		public static const CURRENT_OBJECTS_TRUE:String = 'CURRENT_OBJECTS_TRUE';
		public static const CURRENT_OBJECTS_FALSE:String = 'CURRENT_OBJECTS_FALSE';
		
		public function CurrentObjectsEventer(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			// constructor code
		}
	}
}
