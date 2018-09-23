package {

	import flash.display.MovieClip;


	public class Bullet extends MovieClip {

		private const SPEED: Number = 10;

		private var velocityX: Number = 0;
		private var velocityY: Number = -10;

		public var isDead: Boolean = false;
		public var radius: Number = 10;

		//var velocity:Point = new Point();

		public function Bullet(p: Player, n: int) {
			x = p.x;
			y = p.y;
			var angle: Number = 0;
			gotoAndStop(1);
			if (n == 0) {
				angle = (p.rotation - 90) * Math.PI / 180;
			}//end if

			else if (n == 1) {
				angle = ((p.rotation - 90) + 30) * Math.PI / 180;
			}//end else if
			
			else if (n == 2) {
				angle = ((p.rotation - 90) - 30) * Math.PI / 180;
			}//end else if
			else if (n == 3){
				angle = (p.rotation - 90) * Math.PI / 180;
				gotoAndStop(2);
			}

			if (n != 3){
							velocityX = SPEED * Math.cos(angle);
			velocityY = SPEED * Math.sin(angle);
			}//end if
			else {
				velocityY = SPEED*10;
				
			}



		}

		public function update(): void {

			x += velocityX;
			y += velocityY;

			if (!stage || y < 0 || x < 0 || x > stage.stageWidth || y > stage.stageHeight) isDead = true;
		}

	} // ends class
} // ends package