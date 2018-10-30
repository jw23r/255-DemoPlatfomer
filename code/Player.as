package code {

	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.ui.Keyboard;


	public class Player extends MovieClip {

		private var gravity: Point = new Point(0, 1000);
		private var maxSpeed: Number = 200;
		private var velocity: Point = new Point(1, 5);
		private var ground: Number = 350;
		private const HORIZONTAL_ACCELERATION: Number = 800;
		private const HORIZONTAL_DECELERATION: Number = 800;
		private const VERTICAL_ACCELERATION: Number = -200;
		private var timer: Number = 0;
		private var jumpVelocity:Number = 400;
		/**
		 * keeps track of how many times youve jumped in a row
		 */
		private var isGrounded = false;
		private var isJumping = false;
		private var airJumpsLeft: Number = 1;
	private var airJumpsMax: Number = 1;
		public function Player() {
			// constructor code
		} // ends constructor

		public function update(): void {

			



		
			handleWalking();
			doPhysics();
			detectGround();
			handleJumping();

		}
		/**
		 * This function looks at the keyboard input in order to accelerate the player
		 * left or right. As a result, this function changes the player's velocity.
		 */
		
		private function handleWalking(): void {
			if (KeyboardInput.IsKeyDown(Keyboard.LEFT)) velocity.x -= HORIZONTAL_ACCELERATION * Time.dt;
			if (KeyboardInput.IsKeyDown(Keyboard.RIGHT)) velocity.x += HORIZONTAL_ACCELERATION * Time.dt;

			if (!KeyboardInput.IsKeyDown(Keyboard.LEFT) && !KeyboardInput.IsKeyDown(Keyboard.RIGHT)) { // left and right not being pressed...
				if (velocity.x < 0) { // moving left
					velocity.x += HORIZONTAL_DECELERATION * Time.dt; // accelerate right
					if (velocity.x > 0) velocity.x = 0; // clamp at 0
				}
				if (velocity.x > 0) { // moving right
					velocity.x -= HORIZONTAL_DECELERATION * Time.dt; // accelerate left
					if (velocity.x < 0) velocity.x = 0; // clamp at 0
				}
			}

		}
		private function handleJumping(): void {
			if (KeyboardInput.OnKeyDown(Keyboard.SPACE)) {
				
				timer = 0;

			}

			if (KeyboardInput.OnKeyDown(Keyboard.SPACE) ) {
				trace("jump");
				if (isGrounded) {
					velocity.y = -jumpVelocity; // apply an impulse
					isGrounded = false;
					isJumping = true;
				}else{// in air attrmpting a double-jump
				if(airJumpsLeft > 0){
					velocity.y = -jumpVelocity;
					airJumpsLeft--;
					isJumping = true;
				}
					}
			}
			if(!KeyboardInput.IsKeyDown(Keyboard.SPACE)) isJumping = false
				if(velocity.y  > 0) isJumping =false;
		}
		private function doPhysics(): void {
			// apply gravity to velocity:
var gravityMulitplier:Number = 1;	
			if(!isJumping) gravityMulitplier = 2;
			velocity.x += gravity.x * Time.dt * gravityMulitplier;
			velocity.y += gravity.y * Time.dt * gravityMulitplier;

			// constrain to maxSpeed:
			//if (velocity.x > maxSpeed) velocity.x = maxSpeed; // clamp going right
			if (velocity.x < -maxSpeed) velocity.x = -maxSpeed; // clamp going left

			// apply velocity to position:
			x += velocity.x * Time.dt;
			y += velocity.y * Time.dt;
		}
		private function detectGround(): void {
			// look at y position

			if (y > ground) {
				isGrounded = true;
				y = ground; // clamp
				velocity.y = 0;
				airJumpsLeft = airJumpsMax;
			}
		}


	} // ends Player class

} // ends package