package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	public class Default extends MovieClip {
		public var keys:Array;
		public var mousedown:Boolean;
		public var mousex:Number;
		public var mousey:Number;
		function Default() {
			setupkeys();
			setupmouse();
		}
		private function setupmouse():void {
			mousex=0;
			mousey=0;
			mousedown=false;
			stage.addEventListener(MouseEvent.MOUSE_DOWN,mouselistener);
			stage.addEventListener(MouseEvent.MOUSE_UP,mouselistener);
			stage.addEventListener(MouseEvent.MOUSE_MOVE,mouselistener);
		}
		private function setupkeys():void {
			keys=new Array();
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyboardlistener);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyboardlistener);
		}
		public function mouselistener(event:MouseEvent):void {
			switch (event.type) {
				case MouseEvent.MOUSE_DOWN :
					mousedown=true;
					break;
				case MouseEvent.MOUSE_UP :
					mousedown=false;
					break;
				case MouseEvent.MOUSE_MOVE :
					mousex=event.stageX;
					mousey=event.stageY;
					break;
			}
		}
		public function keyboardlistener(event:KeyboardEvent):void {
			switch (event.type) {
				case KeyboardEvent.KEY_DOWN :
					keys[event.keyCode]=true;
					break;
				case KeyboardEvent.KEY_UP :
					keys[event.keyCode]=false;
					break;
			}
		}
		public static function pom():int {
			if (Math.random()>.5) {
				return -1;
			} else {
				return 1;
			}
		}
	}
}