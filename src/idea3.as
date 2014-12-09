function rallypoint(){
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if(isNaN(this.body.health)){
			this.body.z=this.body.health=20;
			this.scr=0;
			this.dy=0;
			this.affect=false;
		}
		if (!paused) {
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if(dxy<=300){
				hitgood(this.body);
				hitneutral(this.body);
				if (this.body.health<=0) {
					this.body.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
					if (this.scr == 0) {
						this.play();
						this.scr=1;
					}
					if (this._currentframe == this._totalframes) {
						this.unloadMovie();
					}
				}else{
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dy = 0;
					} else {
						this.dy += GRAV;
					}
					if(this.dy>=12){
						this.dy=12;
					}
					this._y+=this.dy;
					if (dxy<300) {
						if(!this.affect){
							PAIN+=0.5;
							this.affect=true;
						}
					}
				}
			}else{
				if(this.affect){
					PAIN-=0.5;
					this.affect=false;
				}
			}
		}
	}
}

function mine() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			var ok:Boolean=false;
			for(var n:Number=0;n<mineGroupsGone.length;n++){
				if(this.grp==mineGroupsGone[n]){
					ok=true;
				}
			}
			if(ok){
				explosion(this._x,this._y,1,10,10,2,2);
				this.unloadMovie();
			}else if (dxy<300) {
				if (isNaN(this.dy)) {
					if (this.hd) {
						this._alpha = 10;
					}
					this.health = 1;
					this.z = 1;
					this.dy = 0;
				}
				var m = new MovieClip();
				m._rotation = this._rotation-90;
				var roty = this._y-Math.sin(m._rotation/180*Math.PI)*4;
				var rotx = this._x-Math.cos(m._rotation/180*Math.PI)*4;
				if (movelayer.platforms.hitTest(rotx+movelayer._x, roty+movelayer._y, true)) {
					this.dy = 0;
				} else {
					this.dy += GRAV;
				}
				if (hitgood(this)) {
					if(this.grp!=-1){
						mineGroupsGone.push(this.grp);
					}
					explosion(this._x,this._y,1,10,10,2,2);
					this.unloadMovie();
					//mine sweeper
					unlock(21);
				} else if (hitbad(this) || hitneutral(this)) {
					if(this.grp!=-1){
						mineGroupsGone.push(this.grp);
					}
					explosion(this._x,this._y,1,10,10,2,2);
					this.unloadMovie();
				}
				//if ((this.hitTest(movelayer.Guy)) || (this.hitTest(movelayer.THead))) {        
				if (checkCollision(movelayer.Guy, this) || checkCollision(movelayer.THead, this)) {
					if(this.grp!=-1){
						mineGroupsGone.push(this.grp);
					}
					explosion(this._x,this._y,1,10,10,2,2);
					this.unloadMovie();
				}
				if (this.dy>12) {
					this.dy = 12;
				}
				this._y += this.dy;
			}
		}
	}
}

function explosive() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.dead)) {
				this.dead = 0;
				this.health = 1;
				this.z = 1;
			}
			if (this.dead == 0) {
				var dx = this._x-movelayer.Guy._x;
				var dy = this._y-(movelayer.Guy._y-20);
				var d = Math.sqrt(dx*dx+dy*dy);
				if (d<300) {
					if (hitgood(this)) {
						this.g = 1;
						if (isRewardEnabled(6)) {
							if (this.hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y+2, true)) {
								unlock(13);
							}
						}
					}
					if (hitbad(this)) {
						this.g = 1;
					}
					if (hitneutral(this)) {
						this.g = 1;
					}
					if (this.x == 0) {
						if (this.g == 1) {
							explosion(this._x,this._y-10,this.radius,this.plows,this.spd,2,3);
							this.unloadMovie();
						}
					}
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dy = 0;
					} else {
						this.dy += GRAV;
						if (this.dy>12) {
							this.dy = 12;
						}
					}
					this._y += this.dy;
				}
			}
		}
	}
}

function broken() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.dead)) {
				this.dead = false;
				this.health = this.tot;
				this.z = this.tot;
				this.scr = 0;			}
			if (!this.dead) {
				var dx = 1.5*this._x+movelayer.platforms._x-movelayer.Guy._x;
				var dy = 1.5*this._y+movelayer.platforms._y-(movelayer.Guy._y-20);
				var d = Math.sqrt(dx*dx+dy*dy);
				if (d<300) {
					hitgood(this);
					hitbad(this);
					hitneutral(this);
					if (this.health<=0) {
						this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
						if (this.scr == 0) {
							this.play();
							this.scr=1;
						}
						if (this._currentframe == this._totalframes) {
							if (!this.res) {
								this.unloadMovie();
								miss--;
							} else {
								this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
								this.count = 100;
								this.dead = true;
							}
						}
					}
				}
			} else {
				this.count--;
				if (this.count == 0) {
					this.scr = 0;
					this.dead = false;
					this.health = this.tot;
					this.gotoAndStop(2);

				}
			}
		}
	}
}
function teleport() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.dy)) {
				this.dy = 0;
				teleports.push(this);
			}
			//if (movelayer.Guy.hitTest(this.bod)) {  
			var dx:Number = this._x-movelayer.Guy._x;
			var dy:Number = this._y-(movelayer.Guy._y-20);
			var d:Number = Math.sqrt(dx*dx+dy*dy);
			if(d<300){
				if (checkCollision(movelayer.Guy, this.bod) || checkCollision(movelayer.THead, this.bod)) {
					var tar = gettar(true);
					tar.transform.colorTransform = tar.oldtrans;
					TARGET = null;
					moveZuy((movelayer.Guy._x-this.tox), (movelayer.Guy._y-this.toy));
				}
				if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
					this.dy = 0;
					while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-1, true)) {
						this._y--;
					}
				} else {
					this.dy += GRAV;
					if (this.dy>12) {
						this.dy = 12;
					}
				}
				this._y += this.dy;
			}
		}
	}
}
function convey() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			if (this.hitTest(movelayer.Guy._x+movelayer._x, movelayer.Guy._y+movelayer._y+5, true)) {
				//you are on the platform
				movelayer.Guy.dx -= this.spd*Math.cos(this._rotation/180*Math.PI)*this._xscale/Math.abs(this._xscale);
				movelayer.Guy.dy -= this.spd*Math.sin(this._rotation/180*Math.PI)*this._xscale/Math.abs(this._xscale);

			}
		}
	}
}
//platforms is at 150% scale!
function bf() {
	//moving platform
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			this.hitArea = this.ft;
			if (this.hitTest(movelayer.Guy._x+movelayer._x, movelayer.Guy._y+movelayer._y+3, true)) {
				//good
				if (this._currentframe == 1) {
					this.play();
				}
				if (isNaN(this.dir)) {
					this.dir = 1;
				}
				if (this.dir == 1) {
					this._x += 3;
					moveZuy(-4.5, 0);
					if (equiped == 2) {
						for (var x = molecount-4; x<=molecount; x++) {
							mcray = movelayer.trackmc["Ray_"+x];
							mcray._x = movelayer.Shootat0._x;
						}
					}
					//should I turn auround
					this.cx = this._x*1.5+movelayer._x+movelayer.platforms._x+40;
					this.cy = this._y*1.5+movelayer._y+movelayer.platforms._y;
					if (movelayer.platforms.hitTest(this.cx, this.cy, true)) {
						this.dir = 0;
					}
					if (this.scrl) {
						if (this._x>this.maxe) {
							this.dir = 0;
						}
					}
				} else if (this.dir == 0) {
					this._x -= 3;
					moveZuy(4.5, 0);
					if (equiped == 2) {
						for (var x = molecount-4; x<=molecount; x++) {
							mcray = movelayer.trackmc["Ray_"+x];
							mcray._x = movelayer.Shootat0._x;
						}
					}
					//should I turn auround
					this.cx = this._x*1.5+movelayer._x+movelayer.platforms._x-40;
					this.cy = this._y*1.5+movelayer._y+movelayer.platforms._y;
					if (movelayer.platforms.hitTest(this.cx, this.cy, true)) {
						this.dir = 1;
					}
					if (this.scrl) {
						if (this._x<this.mine) {
							this.dir = 1;
						}
					}
				}
			} else {
				if (movelayer._visible) {
					if (this.auto) {
						if (this._currentframe == 1) {
							this.play();
						}
						if (isNaN(this.dir)) {
							this.dir = 1;
						}
						if (this.dir == 1) {
							this._x += 3;
							this.cx = this._x*1.5+movelayer._x+movelayer.platforms._x+40;
							this.cy = this._y*1.5+movelayer._y+movelayer.platforms._y;
							if (movelayer.platforms.hitTest(this.cx, this.cy, true)) {
								this.dir = 0;
							}
							if (this.scrl) {
								if (this._x>this.maxe) {
									this.dir = 0;
								}
							}
						} else if (this.dir == 0) {
							this._x -= 3;
							this.cx = this._x*1.5+movelayer._x+movelayer.platforms._x-40;
							this.cy = this._y*1.5+movelayer._y+movelayer.platforms._y;
							if (movelayer.platforms.hitTest(this.cx, this.cy, true)) {
								this.dir = 1;
							}
							if (this.scrl) {
								if (this._x<this.mine) {
									this.dir = 1;
								}
							}
						}
					} else {
						this.gotoAndStop(1);
					}
				}
			}
			boin._x = this.cx;
			boin._y = this.cy;
		}
	}
}

function tubeflame(a, b:Boolean) {
	if (b) {
		var dx = a.hole1._x-a.hole2._x;
		var dy = a.hole1._y-a.hole2._y;
		var angle = Math.atan2(dy, dx);
		var ex = a.hole2._x;
		var ey = a.hole2._y;
	} else {
		var dx = a.hole2._x-a.hole1._x;
		var dy = a.hole2._y-a.hole1._y;
		var angle = Math.atan2(dy, dx);
		var ex = a.hole1._x;
		var ey = a.hole1._y;
	}
	if (Math.random()<.5) {
		var z = movelayer.trackmc3.attachMovie('exdr', "d"+cept, cept++);
	} else {
		var z = movelayer.trackmc3.attachMovie('exdy', "d"+cept, cept++);
	}
	z._rotation = 180+angle/180*Math.PI;
	var xi = Math.cos(angle)*20;
	var yi = Math.sin(angle)*20;
	neutral = 55;
	z._x = ex-xi+a._x;
	z.z = 2;
	z._y = ey-yi+a._y;
	z.damage = 2;
	z.dy = Math.sin(angle)*-10;
	z.dx = Math.cos(angle)*-10;
}
function tube() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	}else if (pauseq == 0) {
		if (!paused) {
			if (neutral>=1) {
				for (var x = cept-neutral; x<=cept; x++) {
					mcray3 = movelayer.trackmc3["d"+x];
					if (mcray3 != null) {
						if (this.hole1.hitTest(mcray3._x+movelayer._x, mcray3._y+movelayer._y, true)) {
							removeMovieClip("mcray3");
							tubeflame(this,true);
						}
						if (this.hole2.hitTest(mcray3._x+movelayer._x, mcray3._y+movelayer._y, true)) {
							removeMovieClip("mcray3");
							tubeflame(this,false);
						}
					}
				}
			}
		}
	}
}
function switche() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.timee)) {
				this.timee = 0;
				this.went = false;
				this._xscale = 50*(1/(this._parent._xscale/100));
				this._yscale = 50*(1/(this._parent._yscale/100));
				this._rotation -= this._parent._rotation;
			}
			this.z = this.health=999;
			po={x:0, y:0};
			this.localToGlobal(po);
			var dx:Number = (po.x-movelayer._x)-movelayer.Guy._x;
			var dy:Number = (po.y-movelayer._y)-(movelayer.Guy._y-20);
			var d:Number = Math.sqrt(dx*dx+dy*dy);
			if(d<300){
				this.timee--;
				if (this.timee<0) {
					var goe = false;
					if (!this.went) {
						if (hitgood(this)) {
							goe = true;
							if (!this._parent.tw) {
								this.went = true;
							}
						}
						if (hitneutral(this) || hitbad(this)) {
							goe = true;
							if (!this._parent.tw) {
								this.went = true;
							}
							if (good<=0) {
								//Unlocks Wasn't Me
								unlock(11);
							}
						}
					} else {
						hitgood(this);
					}
					this.health = 1;
					this.z = 1;
					if (goe) {
						this.timee = 20;
						this._parent.tr = !this._parent.tr;
					}
				}
			}
			if (this._parent.tr) {
				this.gotoAndStop(1);
			} else {
				this.gotoAndStop(2);
			}
		}
	}
}

function fan() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.indie)) {
				this.indie = fans.length;
				fans[fans.length] = this;
			}
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (Math.abs(dx)<15) {
				if (dy>-10) {
					if (dy<this.high) {
						moveZuy(0, 1);
						movelayer.Guy.dy = -15;
					}
				}
			}
		}
	}
}

function nanobox() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy<300) {
				if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
					this.dy = 0;
					while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-1, true)) {
						this._y--;
					}
				} else {
					this.dy += GRAV;
					if (this.dy>=15) {
						this.dy = 14;
					}
				}
				this._y += this.dy;
				//if ((movelayer.Guy.hitTest(this)) || (movelayer.THead.hitTest(this))) {        
				if (checkCollision(movelayer.Guy, this) || checkCollision(movelayer.THead, this)) {
					this.play();
				}
			}
			if (this._currentframe == 25) {
				nano = true;
				if (DIFF<1) {
					HEALTH += 1/DIFF*this.heal;
				} else {
					HEALTH += this.heal;
				}
				if (HEALTH>100/DIFF*healthmod) {
					if (HEALTH-this.heal>=100/DIFF*healthmod) {
						unlock(15);
					}
					HEALTH = Math.round(100/DIFF*healthmod);
				}
				this.unloadMovie();
			}
		}
	}
}

function spike() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy<300) {
				if (checkCollision(movelayer.Guy, this) || checkCollision(movelayer.THead, this)) {
					//if ((movelayer.Guy.hitTest(this)) || (movelayer.THead.hitTest(this))) {
					damage(1);
				}
				if (isNaN(this.indie)) {
					this.indie = spikes.length;
					spikes[this.indie] = this;
				}
			}
		}
	}
}
function showhint() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy<300) {
				if(dxy<50){
					//if (checkCollision(movelayer.Guy, this.stand)) {
					//if (this.stand.hitTest(movelayer.Guy)) {
					this.tex._visible = true;
					this.stand.filters=[new GlowFilter(0x00ff00, 1, 5, 5)];
				} else {
					this.stand.filters=[];
					this.tex._visible = false;
				}
			}
		}
	}
}
function bridge() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.setup)) {
				this.setup = true;
				if (this.tr) {
					this.l.gotoAndStop(20);
					this.r.gotoAndStop(20);
				}
			}
			if (this.tr) {
				if (this.l._currentframe<20) {
					this.l.play();
					this.r.play();
				} else if (this.l._currentframe>20) {
					ve = 20-(this.l._currentframe-20);
					this.l.gotoAndPlay(ve-20);
					this.r.gotoAndPlay(ve-20);
				}
			} else {
				if ((this.l._currentframe<20) && (this.l._currentframe != 1)) {
					ve = 20-(this.l._currentframe+20);
					this.l.gotoAndPlay(20+ve);
					this.r.gotoAndPlay(20+ve);
				} else if (this.l._currentframe>=20) {
					this.l.play();
					this.r.play();
				}
			}
		}
	}
}

function secret() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.health)) {
				this.health = this.z=1;
				this.dy = 0;
			}
			if (this._currentframe == this._totalframes) {
				this.unloadMovie();
				unlock(this.sec);
			}
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy<300) {
				if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-3, true)) {
					this.dy = 0;
					while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-4, true)) {
						this._y--;
					}
				} else {
					this.dy += GRAV;
					if (this.dy>=15) {
						this.dy = 14;
					}
				}
				this._y += this.dy;
				hitgood(this);
				hitneutral(this);
				if (this.health<=0) {
					this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
					this.play();
				}
			}
		}
	}
}
function ng() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.health)) {
				this.health = this.z=1;
				this.dy = 0;
			}
			if (this._currentframe == 5) {
				this.gotoAndPlay(1);
			}
			if (this._currentframe == this._totalframes) {
				if (this.win) {
					WIN = 1;
				} else {
					earned++;
				}
				this.unloadMovie();
			}
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy<300) {
				if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+43, true)) {
					this.dy = 0;
					while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+43-1, true)) {
						this._y--;
					}
				} else {
					this.dy += GRAV;
					if (this.dy>=15) {
						this.dy = 14;
					}
				}
				this._y += this.dy;
				var rel = false;
				if (hitgood(this) || hitneutral(this)) {
					rel = true;
				}
				if (rel) {
					if (this._currentframe<6) {
						this.gotoAndPlay(6);
					}
				}
			}
		}
	}
}
function devilscanner() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.health)) {
				this.health = 1;
				this.z = 1;
				if (isNaN(this.won)) {
					this.won = 0;
				}
			}
			if (this._currentframe == this.lop+1) {
				this.gotoAndPlay(1);
			}
			if (this._currentframe == this._totalframes) {
				if (this.won == 0) {
					WIN = 1;
				} else {
					earned++;
				}
			}
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy<300) {
				var rel:Boolean = false;
				if (hitgood(this) || hitneutral(this)) {
					rel = true;
				}
				if (rel) {
					if (this._currentframe<this.lop+1) {
						this.gotoAndPlay(this.lop+1);
					}
				}
			}
		}
	}
}