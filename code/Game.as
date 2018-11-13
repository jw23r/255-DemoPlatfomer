package code {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;


	public class Game extends MovieClip {
		private var level: MovieClip;
		private var player: Player;
		static public var platforms: Array = new Array;
		public function Game() {
			KeyboardInput.setup(stage);
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		private function gameLoop(e: Event): void {
			Time.update();
			player.update();
			doCollisionDetection();
			doCameraMove();
			loadLevel();
			KeyboardInput.update();
		} // ends gameLoop()
		private function doCameraMove(): void {
			level.x = -player.x + 100;
			level.y = -player.y +100;

		}
		private function loadLevel(): void {
			level = new Level01();
			addChild(level);
			if (level.player) {
				player = level.player;
			} else {
				player = new Player();
				addChild(player);
			}
		}
		private function doCollisionDetection(): void {

			for (var i: int = 0; i < platforms.length; i++) {
				if (player.collider.checkOverlap(platforms[i].collider)) {
					//if overlap find fix apply fix				
					var fix: Point = player.collider.findOverlapFix(platforms[i].collider);
					//apply fix
					player.applyFix(fix);
				}
			}



		} // ends Game class

	} // ends package
}