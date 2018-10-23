package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Game extends MovieClip {
		
		
		public function Game() {
			// constructor code
		
			addEventListener(Event.ENTER_FRAME, gameloop);
		}
		private function gameloop(e:Event):void{
			Time.update();
			player.update();
		}
	}
	
}
