﻿package code {



	public class AABB {
		public var halfWidth: Number;
		private var halfHeight: Number;
		public var xmin: Number;
		public var xmax: Number;
		public var ymin: Number;
		public var ymax: Number;
		public function AABB(halfWidth: Number, halfHeight: Number) {

			setSize(halfWidth, halfHeight);

		} // ends Game class
		public function setSize(halfWidth: Number, halfHeight: Number): void {
			this.halfWidth = halfWidth;
			this.halfHeight = halfHeight;
			//recalc edges!!!
			calcEdges((xmin + xmax) / 2, (ymin + ymax) / 2);
		}
		public function calcEdges(x:Number, y:Number): void {
			xmin = x - halfWidth;
			xmax = x + halfWidth
			ymin = y - halfHeight
			ymax = y + halfHeight
		}
		public function checkOverlap(other:AABB): Boolean {
if(this.xmax < other.xmin) return false;
			if(this.xmin > other.xmax) return false;
			if(this.ymax < other.ymin) return false;
			if(this.ymin > other.ymax) return false;
			return true;
		}
	} // ends package
}