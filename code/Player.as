package code {

	import flash.display.MovieClip;
	import flash.geom.Point;


	public class Player extends MovieClip {
		private var gravity: Point = new Point(0, 100);
		private var velocity: Point = new Point(1, 5);
		public function Player() {
			// constructor code
		}
		public function update(): void {
			// apply gravity to velocity
			velocity.x += gravity.x * Time.dt;
			velocity.y += gravity.y * Time.dt;
			//apply velocity to point
			y + -velocity.x * Time.dtScaled;
			y += velocity.y * Time.dtScaled;
			//look at y position
			detectGround();
		}
		private function detectGround(): void {
			var ground: Number = 350;
			if (y > ground) {
				y = ground;
				velocity.y = 0;
			}

		}

	}
}