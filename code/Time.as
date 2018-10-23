package code
{
	import flash.utils.getTimer;
/**
	* thee class for hnadling all game time.
	*/
	public class Time
	{
		/**
		*keeps track of detsal time
		*/
		public static var dt:Number = 0;
		/**
		*this is what were using to scale the objects with
		*/
		public static var dtScaled:Number = 0;
		/**
		* keeps track of current time on screen
		*/
		public static var time:Number = 0;
		/**
		* this is the scaler
		*/
		public static var scale:Number = 1;
		/**
		* keeps track of the previous time on screen
		*/
		private static var timePrev:Number = 0;


		/** 
		*this gets the time based on what time it used to be and what is now
		*/
		public static function update():void
		{
			time = getTimer();
			dt = (time - timePrev) / 1000;
			dtScaled = dt * scale;
			timePrev = time;// cache for next frame
		}
	}
}