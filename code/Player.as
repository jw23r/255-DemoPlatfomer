package code {

	import flash.display.MovieClip;
	import flash.geom.Point;


	public class Player extends MovieClip {
		private var gravity: Point = new Point(0, 100);
		private var velocity: Point = new Point(1, 5);
		private const HORIZONTAL_ACCELRATTION: Number = 100;
		private const HORIZONTAL_DECELRATTION: Number = 100;
		public function Player() {
			// constructor code
		}
		public function update(): void {
			// apply gravity to velocity
			if (keyboardInput.keyleft) velocity.x -= HORIZONTAL_ACCELRATTION * time.dt;
			if (keyboardInput.keyleft) velocity.x += HORIZONTAL_ACCELRATTION * time.dt;
			if (!keyboard.keyleft && !keyboardInput.keyRight){
				if(velocity.x < 0){
					// moving left
					velocity.x += HORIZONTAL_DECELRATTION * Time.dt
					if (velocity.x > 0) velocity.x =0;
				}
				if(velocity.x > 0){
					//moving right
					velocity.x -= HORIZONTAL_DECELRATTION * Time.dt
						if (velocity.x < 0) velocity.x =0;
				}
			}
			doPhysics();

			detectGround();
		}
		private function doPhysics(): void {
			velocity.x += gravity.x * Time.dt;
			velocity.y += gravity.y * Time.dt;
			//apply velocity to point
			y + -velocity.x * Time.dt;
			y += velocity.y * Time.dt;
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