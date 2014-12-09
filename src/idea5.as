function tsy(a:Number):Number {
	var b:Number;
	if (a>0) {
		b = a;
	} else {
		b = 180+(180+a);
	}
	return b;
}
function itsy(a:Number):Number {
	var b:Number;
	if (a>180) {
		b = -180+(a-180);
	} else {
		b = a;
	}
	return b;
}

function replaceall(a:String, b:String, c:String) {
	var d:Number = a.indexOf(b);
	while (d>-1) {
		a = a.slice(0, d)+c+a.slice(d+b.length);
		d = a.indexOf(b);
	}
	return a;
}

function hider() {
	trace(this);
	if (pauseq == 0) {
		if (!paused) {
			if (this._visible) {
				if (this.hitTest(movelayer.Guy._x+movelayer._x, movelayer.Guy._y+movelayer._y, true)) {
					this._visible = false;
				}
			}
		}
	}
}
function aimu(a, b, c, d, e, f) {
	var dx = a-b;
	var dy = f-c;
	angle = Math.atan2(dy, dx);
	e._rotation = angle*180/Math.PI+d;
}

function expl() {
	if (pauseq == 0) {
		if (!paused) {
			if (this.dead) {
				removeMovieClip(this);
			} else {
				this._y += this.dy;
				this._x += this.dx;
				if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
					this.dead = true;
				}else if (movelayer.Guy.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)||movelayer.THead.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
					damage(this.damage);
					//this.dead = true;
					this._alpha=50;
				}else if (this._currentframe == this._totalframes) {
					this.dead = true;
				}
			}
		}
	}
}

/*
Lag managere is designed to limit the number of bullets that are checked to see if they are in collisions.
*/
function lagmanager() {
	good -= 1;
	bad -= 1;
	neutral -= 1;
	if (multi>0) {
		multi--;
	}
	if (time>0) {
		time--;
	}
}
function explosion(ex:Number, ey:Number, size:Number, fires:Number, speed:Number, damage:Number, side:Number) {
	//optimized
	//startTest("Explosion");
	//#sound
	addSound(assetContainer.getSound("Boom"), "Boom", 1);
	var mathRandom:Function=Math.random;
	var mathPI:Number=Math.PI;
	var mathSin:Function=Math.sin;
	var mathCos:Function=Math.cos;
	neutral = fires;
	var w:Number = 0;
	while (w<fires) {
		w++;
		var qw:Number = mathRandom()*mathPI*2;
		var dx:Number = size*mathRandom()*mathCos(qw);
		var dy:Number = size*mathRandom()*mathSin(qw);
		var z:MovieClip;
		if (mathRandom()>=0.5) {
			z = movelayer.trackmc3.attachMovie('exdy', "d"+cept, cept++);
		} else {
			z = movelayer.trackmc3.attachMovie('exdr', "d"+cept, cept++);
		}
		z._x = dx+ex;
		z._y = dy+ey;
		z.spd = speed;
		z.damage = damage;
		z.side = side;
		z.dead = false;
		//velocity
		qw = mathRandom()*mathPI*2;
		z.dx = speed*mathRandom()*mathCos(qw);
		z.dy = speed*mathRandom()*mathSin(qw);
	}	
	//endTest(fires, "fire");

}
function aimy(a, b, c, d) {
	//used by devil bot
	var e:Number = a._x-b;
	var f:Number = a._y-c;
	var g:Number = Math.sqrt(e*e+f*f)/d;
	return f/g;
}
function aimx(a, b, c, d) {
	var e = a._x-b;
	var f = a._y-c;
	var g = Math.sqrt(e*e+f*f)/d;
	return e/g;
}
function aimz(a, b, c, d) {
	var dx = a._x-b;
	var dy = a._y-c;
	angle = Math.atan2(dy, dx);
	a._rotation = angle*180/Math.PI+d;
}
function aimw(a, b, c, d, e) {
	var dx = a._x-b;
	var dy = a._y-c;
	angle = Math.atan2(dy, dx);
	e._rotation = angle*180/Math.PI+d;
}
/*
50% of the time returns true, otherwise it returns false.
*/
function randombool():Boolean {
	if (Math.random()>.5) {
		return true;
	} else {
		return false;
	}
}
function settarget() {
	targetparent = this._parent._name;
	TARGET = this._name;
	this.oldtrans = this.transform.colorTransform;
	var coltrans = new ColorTransform();
	coltrans.blueOffset = 120+this.oldtrans.greenOffset;
	coltrans.greenOffset = 120+this.oldtrans.blueOffset;
	coltrans.redOffset = this.oldtrans.redOffset;
	this.transform.colorTransform = coltrans;
}
function setbaddie() {
	BADDIE = this._name;
	baddieparent = this._parent._name;
}
function hitgood(a) {
	//setup
	if (isNaN(a.overtime)) {
		a.overtime = 0;
		//adjust health based on difficulty
		a.z = a.health = Math.max(Math.round(a.z*DIFF/1.5),1);
	}
	//if you are dead then un aim
	if(a.health<=0){
		a.transform.colorTransform=new ColorTransform(1,1,1,1,0,0,0,0);
	}
	//count enemies in range
	enemiesInRange++;
	//targeting system
	if (mouseaim == 1) {
		if ((TARGET == a._name) && (targetparent == a._parent._name)) {
			if (!a.hitTest(movelayer.Pointer._x+movelayer._x, movelayer.Pointer._y+movelayer._y, false)||a.health<=0) {
				//un target
				TARGET = null;
				a.transform.colorTransform = a.oldtrans;
			}
		} else {
			if (TARGET == null&&a.health>=0) {
				//target
				if (a.hitTest(movelayer.Pointer._x+movelayer._x, movelayer.Pointer._y+movelayer._y, false)) {
					settarget.apply(a);
				} else {
					a.transform.colorTransform = a.oldtrans;
				}
			}
		}
	}
	if (a._parent != movelayer.platforms) {
		if (a._parent._parent != movelayer.platforms) {
			//baddie health resets to 999 every frame
			var po = {x:0, y:0};
			a.localToGlobal(po);
			po.x = po.x-movelayer._x;
			po.y = po.y-movelayer._y;
			var dx:Number=po.x-movelayer.Guy._x;
			var dy:Number=po.y-movelayer.Guy._y;
			var dis:Number=Math.sqrt(dx*dx+dy*dy);
			if(dis<baddiehealth){
				baddiehealth = dis;
				setbaddie.apply(a);
			}
		}
	}
	//take damage over time
	if (a.overtime>0) {
		a.overtime--;
		a.health--;
		if(isRewardEnabled(24)){
			if(a.health%2==0){
				HEALTH++;
			}
		}
	}
	//misc
	var col:Boolean = false;
	//boot spikes
	if (isRewardEnabled(6)) {
		if (a.hitTest(movelayer.Guy._x+movelayer._x, movelayer.Guy._y+movelayer._y+2, true)) {
			a.health--;
			col = true;
		}
	}
	//mine detonating automatically
	if (isRewardEnabled(22)) {
		if(remotebomb!=null){
			if(a._parent!=null){
				if (a.hitTest(remotebomb.po.x+movelayer._x, remotebomb.po.y+movelayer._y, true)) {
					explosion(remotebomb.po.x,remotebomb.po.y,10,20,9,3,1);
					col = true;
					remotebomb.removeMovieClip();
					remotebomb=null;
					vtrace("Detonated Automatically",10);
				}
			}
		}
	}
	var parentsArePlatforms:Boolean=(a._parent==movelayer.platforms||a._parent._parent==movelayer.platforms);
	//the bullets
	if (good>=1) {
		for (var x = Math.max(molecount-good,0); x<=molecount; x++) {
			mcray = movelayer.trackmc["Ray_"+x];
			if(mcray==null){
				//for now we'll ignore you
			}else if (mcray != null) {
				if(parentsArePlatforms||mcray.dead==0){
					if (mcray.grenade) {
						if (mcray.typ == 0) {
							if (checkCollision(a, mcray)) {
								//if (a.hitTest(mcray._x+movelayer._x, mcray._y+movelayer._y, true)) {
								explosion(mcray._x, mcray._y,mcray.radius,mcray.plows,mcray.spd,2,1);
								mcray.removeMovieClip();
								col = true;
							}
						} else if (mcray.typ == 1) {
						} else if (mcray.typ == 2){
							if (checkCollision(a, mcray.swrd)) {
								//if (a.hitTest(mcray.swrd)) {
								a.health -= mcray.damage;
								col = true;
							}
						}
					} else {
						if (mcray.equiped == 1 || mcray.equiped == 5 || mcray.equiped == 8 || mcray.equiped == 9 || mcray.equiped == 10 || mcray.equiped == 11) {
							//if (checkCollision(a, mcray)) {
							if (a.hitTest(mcray._x+movelayer._x, mcray._y+movelayer._y, true)) {
								a.health -= mcray.damage;
								mcray.removeMovieClip();
								col = true;
							}
						} else if (mcray.equiped == 2) {
							if (checkCollision(a, mcray.swrd)) {
								//if (a.hitTest(mcray.swrd)) {
								a.health -= mcray.damage;
								col = true;
							}
						} else if (mcray.equiped == 3) {
							//if (checkCollision(a, mcray)) {
							if (a.hitTest(mcray._x+movelayer._x, mcray._y+movelayer._y, true)) {
								explosion(mcray._x,mcray._y,mcray.radius,mcray.plows,mcray.spd,3,1);
								mcray.removeMovieClip();
								col = true;
							}
						} else if (mcray.equiped == 6) {
							//if (checkCollision(a, mcray)) {
							if (a.hitTest(mcray._x+movelayer._x, mcray._y+movelayer._y, true)) {
								a.health -= mcray.damage;
								col = true;
							}
						} else if (mcray.equiped == 7) {
							//if (checkCollision(a, mcray)) {
							if (a.hitTest(mcray._x+movelayer._x, mcray._y+movelayer._y, true)) {
								a.health -= mcray.damage;
								a.overtime += 20;
								col = true;
								mcray.removeMovieClip();
							}
						}
					}
				}
			}
		}
	}
	if (isRewardEnabled(12)) {
		if (col) {
			a.health--;
		}
	}
	return col;
}
function hitbad(a) {
	var col:Boolean = false;
	if (bad>=1) {
		for (var x = Math.max(depth-bad,0); x<=depth; x++) {
			mcray2 = movelayer.trackmc2["d"+x];
			mcray4 = movelayer.trackmc4["d"+x];
			if (mcray2 != null) {
				//reduces lag
				//if (checkCollision(a, mcray2)) {
				if (a.hitTest(mcray2._x+movelayer._x, mcray2._y+movelayer._y, true)) {
					a.health -= mcray2.damage;
					mcray2.removeMovieClip();
					col = true;
				}
			}
			
			if (mcray4 != null) {
				if (checkCollision(a, mcray4)) {
					a.health -= mcray4.damage;
					col = true;
				}
			}
		}
	}
	return col;
}
function hitneutral(a) {
	var col = false;
	if (neutral>=1) {
		for (var x = Math.max(cept-neutral,0); x<=cept; x++) {
			mcray3 = movelayer.trackmc3["d"+x];
			if (mcray3 != null) {
				if(mcray3._alpha==100){
					//dosen't need persision
					//if (checkCollision(a, mcray3)) {
					if (a.hitTest(mcray3._x+movelayer._x, mcray3._y+movelayer._y, true)) {
						a.health -= mcray3.damage;
						//a reward for killing a flamer with the flame thrower
						if(a.health<=0){
							if(mcray3.side==1&&mcray3.damage==3&&a.isaFlamer!=null){
								unlock(32);
							}
							x=cept+1;
						}
						mcray3._alpha=50;
						col = true;
					}
				}
			}
		}
	}
	return col;
}
function aimmouse() {
	if (!paused) {
		this._rotation = 90;
		this._x = _xmouse-movelayer._x;
		this._y = _ymouse-movelayer._y;
		if (isRewardEnabled(2)) {
			if ((equiped == 1) || (equiped == 4) || (equiped == 8) || (equiped == 9) || (equiped == 10)) {
				if (movelayer.Shootat0.reloadtime>0) {
					this._rotation = -90*(movelayer.Shootat0.reloadtime/movelayer.Shootat0.maxtime);
				}
			} else if (equiped != 2) {
				if (movelayer.Shootat0.midtime>0) {
					this._rotation = -90*(movelayer.Shootat0.midtime/movelayer.Shootat0.maxtime);
				}
			}
		}
	}
}

function checkCollision(p_clip1:MovieClip, p_clip2:MovieClip):Boolean {
	//perfect collisions but 6 times slower than usual
	//
	if (p_clip1 == null || p_clip2 == null) {
		return false;
	}
	// get bounds:        
	var bounds1:Object = p_clip1.getBounds(_root);
	var bounds2:Object = p_clip2.getBounds(_root);
	// rule out anything that we know can't collide:
	if (((bounds1.xMax<bounds2.xMin) || (bounds2.xMax<bounds1.xMin)) || ((bounds1.yMax<bounds2.yMin) || (bounds2.yMax<bounds1.yMin))) {
		return false;
	} else {
		// determine test area boundaries:      
		var bounds:Object = {};
		bounds.xMin = Math.max(bounds1.xMin, bounds2.xMin);
		bounds.xMax = Math.min(bounds1.xMax, bounds2.xMax);
		bounds.yMin = Math.max(bounds1.yMin, bounds2.yMin);
		bounds.yMax = Math.min(bounds1.yMax, bounds2.yMax);
		// set up the image to use:
		var img:BitmapData = new BitmapData(bounds.xMax-bounds.xMin, bounds.yMax-bounds.yMin, false);
		// draw in the first image:
		var mat:Matrix = p_clip1.transform.concatenatedMatrix;
		mat.tx -= bounds.xMin;
		mat.ty -= bounds.yMin;
		img.draw(p_clip1,mat,new ColorTransform(1, 1, 1, 1, 255, -255, -255, 255));
		// overlay the second image:
		mat = p_clip2.transform.concatenatedMatrix;
		mat.tx -= bounds.xMin;
		mat.ty -= bounds.yMin;
		img.draw(p_clip2,mat,new ColorTransform(1, 1, 1, 1, 255, 255, 255, 255),"difference");
		// find the intersection:
		var intersection:Rectangle = img.getColorBoundsRect(0xFFFFFFFF, 0xFF00FFFF);
		//_root.attachBitmap(img,_root.getNextHighestDepth());
		// if there is no intersection, return null:
		if (intersection.width == 0) {
			return false;
		} else {
			//we're good  
			return true;
		}
	}
}

function decodeBool(string:String):Boolean {
	if (string == "true") {
		return true;
	} else {
		return false;
	}
}

function startTest(id:String):Void{
	if(!testing){
		if(id==null){
			id="Untitled Test";
		}
		startTime=getTimer();
		testing=true;
		testId=id;
	}
}

function endTest(asAFunctionOf:Number,functionLabel:String):Void{
	if(testing){
		var timePassed:Number=getTimer()-startTime;
		if(asAFunctionOf!=null&&!isNaN(asAFunctionOf)){
			trace(testId+" was performed in "+(timePassed/asAFunctionOf)+" ms per "+functionLabel);
		}else{
			trace(testId+" was performed in "+timePassed+" ms");
		}
		testing=false;
	}
}

function rgbbright(r, g, b) {
	return (r+g+b)/3;
}
function hexToRGB(hex:Number) {
	var returnObj:Object = new Object();
	returnObj.r = hex >> 16;
	var temp = Math.pow(hex, r) << 16;
	returnObj.g = temp >> 8;
	returnObj.b = Math.pow(temp, g) << 8;
	return returnObj;
}
function inferred(col:Number) {
	var colo = hexToRGB(col);
	var bright = rgbbright(colo.r, colo.g, colo.b);
	var r = 2*bright;
	var g = 2*(bright-128);
	var b = 255-2*bright;
	if (b<0) {
		b = 0;
	}
	if (g<0) {
		g = 0;
	}
	if (r<0) {
		r = 0;
	}
	if (r>255) {
		r = 255;
	}
	if (g>255) {
		g = 255;
	}
	if (b>255) {
		b = 255;
	}
	var rs = r.toString(16);
	var gs = g.toString(16);
	var bs = b.toString(16);
	if (rs.length == 1) {
		rs = "0"+rs;
	}
	if (gs.length == 1) {
		gs = "0"+gs;
	}
	if (bs.length == 1) {
		bs = "0"+bs;
	}
	return ("0x"+rs+gs+bs).toString(16);
}
function motionblur(target, ex, ey) {
	var filtering = new Array();
	filtering.push(new BlurFilter(Math.abs(ex)/3, Math.abs(ey)/3, 1));
	target.filters = filtering;
}
var mouseListener:Object = new Object();
mouseListener.onMouseDown = function() {
	if(mouseaim==1){
		if (md == 0&&!paused) {
			Mouse.hide();
			md = 1;
		}
	}
};
mouseListener.onMouseUp = function() {
	if(mouseaim==1){
		semi = true;
		if (md == 1) {
			md = 0;
		}
	}
};
mouseListener.onMouseWheel = function(delta:Number) {
	if(mouseaim==1){
		if(delta>0){
			equiped++;
		}else if(delta<0){
			equiped--;
		}
		if(equiped<0){
			equiped=maxequiped;
		}
		if(equiped>maxequiped){
			equiped=1;
		}
	}
};
Mouse.addListener(mouseListener);
