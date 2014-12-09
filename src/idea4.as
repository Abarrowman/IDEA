//enemy on enterframe callbacks
function breakablecannon() {
	//basic turret
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			if (this.body._currentframe == this.body._totalframes) {
				this.unloadMovie();
			}
			if (isNaN(this.dead)) {
				this.health = 6;
				this.dir = 0;
				this.vdr = 0;
				this.scr = 0;
				this.score = 5;
				this.dy = 0;
				this.dead = 0;
				if (this.armor) {
					this.health *= 2;
					var colorTrans:ColorTransform = new ColorTransform();
					colorTrans.redOffset = -100;
					colorTrans.greenOffset = -100;
					colorTrans.blueOffset = -100;
					this.transform.colorTransform = colorTrans;
				}
				this.z = this.health;
				if (this.crystal._visible) {
					this.spd = 1;
					if (this.jets) {
						this.dir = 1;
						if (this.fst) {
							this.spd = 4;
						}
					}
					if (this.vjets) {
						this.vdir = 1;
						if (this.fst) {
							this.spd = 4;
						}
					}
				} else {
					this.jets = false;
					this.vjets = false;
				}
			}
			if (this.dead == 0) {
				var dx = this._x-movelayer.Guy._x;
				var dy = this._y-(movelayer.Guy._y-17);
				var dxy = Math.sqrt(dx*dx+dy*dy);
				if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
				//if (dxy<300) {
					hitgood(this);
					hitneutral(this);
					if (this.health<=0) {
						this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
						if (isNaN(this.health)) {
							this.health = this.z;
						} else {
							if(this.health<=-10){
								unlock(33);
							}
							if (this.scr == 0) {
								this.body.play();
								killtotal++;
								var oldscore = SCORE;
								multiscore += multi;
								SCORE += this.score;
								if (this.crystal._visible) {
									SCORE += 2;
									if (this.jets) {
										SCORE += 3;
										if (this.wis) {
											SCORE++;
										}
										if (this.fst) {
											SCORE++;
										}
									}
									if (this.vjets) {
										SCORE += 3;
										if (this.wis) {
											SCORE++;
										}
										if (this.fst) {
											SCORE++;
										}
									}
								}
								if(this.pre){
									SCORE+=2;
								}
								if (this.armor) {
									SCORE += 3;
								}
								multi += (SCORE-oldscore)*multiscores[equiped-1];
								this.scr += 1;
							}
						}
					}
					if (!this.crystal._visible) {
						if (movelayer.platforms.hitTest(this._x+4+movelayer._x, this._y+10+movelayer._y, true)) {
							this.dy = 0;
							while (movelayer.platforms.hitTest(this._x+movelayer._x+4, this._y+movelayer._y+10-1, true)) {
								this._y--;
							}
						} else {
							this.dy += GRAV;
							if (this.dy>=12) {
								this.dy = 12;
							}
						}
						this._y += this.dy;
					}
					//jetcode           
					if (this.jets) {
						if (this.dir == 1) {
							if (movelayer.Guy._x+30>this._x) {
								if (!movelayer.platforms.hitTest(this._x+10+movelayer._x, this._y+movelayer._y, true)) {
									this._x += this.spd;
								}
							} else {
								this.dir = -1;
							}
						} else {
							if (movelayer.Guy._x-30<this._x) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x-10, this._y+movelayer._y, true)) {
									this._x -= this.spd;
								}
							} else {
								this.dir = 1;
							}
						}
						if (this.wis) {
							if (dxy<100 && dx<90) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x+this.dir*-10, this._y+movelayer._y, true)) {
									this._x -= 2*this.dir*this.spd;
								}
							}
						}
					}
					if (this.vjets) {
						if (this.vdir == 1) {
							if ((movelayer.Guy._y-17)+30>this._y) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+10, true)) {
									this._y += this.spd;
								} else {
									this.vdir = -1;
								}
							} else {
								this.vdir = -1;
							}
						} else {
							if ((movelayer.Guy._y-17)-30<this._y) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-10, true)) {
									this._y -= this.spd;
								} else {
									this.vdir = 1;
								}
							} else {
								this.vdir = 1;
							}
						}
						if (this.wis) {
							if (dxy<100 && dy<90) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+this.vdir*-10, true)) {
									this._y -= 2*this.vdir*this.spd;
								}
							}
						}
					}
				}
			}
		}
	}
}

function heavyTurret() {
	//basic turret
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			if (this._currentframe == this._totalframes) {
				this.unloadMovie();
			}
			if (isNaN(this.dead)) {
				this.health = 12;
				this.dir = 0;
				this.vdr = 0;
				this.scr = 0;
				this.score = 12;
				this.reloadtime = 13;
				this.dy = 0;
				this.dead = 0;
				if (this.armor) {
					this.health *= 2;
					var colorTrans:ColorTransform = new ColorTransform();
					colorTrans.redOffset = -100;
					colorTrans.greenOffset = -100;
					colorTrans.blueOffset = -100;
					this.transform.colorTransform = colorTrans;
				}
				this.z = this.health;
				if (this.crystal._visible) {
					this.spd = 1;
					if (this.jets) {
						this.dir = 1;
						if (this.fst) {
							this.spd = 4;
						}
					}
					if (this.vjets) {
						this.vdir = 1;
						if (this.fst) {
							this.spd = 4;
						}
					}
				} else {
					this.jets = false;
					this.vjets = false;
				}
			}
			if (this.dead == 0) {
				var dx = this._x-movelayer.Guy._x;
				var dy = this._y-(movelayer.Guy._y-17);
				var dxy = Math.sqrt(dx*dx+dy*dy);
				this.reloadtime--;
				if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
				//if (dxy<300) {
					hitgood(this);
					hitneutral(this);
					if (this.health<=0) {
						this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
						if (isNaN(this.health)) {
							this.health = this.z;
						} else {
							if (this.scr == 0) {
								this.play();
								if (movelayer.Guy._x>this._x) {
									this._xscale=200;
								}else{
									this._xscale=-200;
								}
								killtotal++;
								var oldscore = SCORE;
								multiscore += multi;
								SCORE += this.score;
								if (this.crystal._visible) {
									SCORE += 2;
									if (this.jets) {
										SCORE += 3;
										if (this.wis) {
											SCORE++;
										}
										if (this.fst) {
											SCORE++;
										}
									}
									if (this.vjets) {
										SCORE += 3;
										if (this.wis) {
											SCORE++;
										}
										if (this.fst) {
											SCORE++;
										}
									}
								}
								if (this.armor) {
									SCORE += 3;
								}
								multi += (SCORE-oldscore)*multiscores[equiped-1];
								this.scr += 1;
							}
						}
					}
					//gun
					if (movelayer.Guy._x<this._x) {
						aimu(this._x,movelayer.Guy._x,(movelayer.Guy._y-17),0,this.gun,this._y);
						this.gun._xscale = -100;
					} else {
						aimu(this._x,movelayer.Guy._x,(movelayer.Guy._y-17),180,this.gun,this._y);
						this.gun._xscale = 100;
					}
					if (this.reloadtime<=0) {
						this.gun.play();
						var arb:Number = -1;
							if (movelayer.Guy._x>this._x) {
								arb = 1;
							}
						if(dxy<100){
							//flamer shots
							this.reloadtime = 4;
							var en:MovieClip;
							if (Math.random()>=0.5) {
								en = movelayer.trackmc3.attachMovie('exdy', "d"+cept, cept++);
							} else {
								en = movelayer.trackmc3.attachMovie('exdr', "d"+cept, cept++);
							}
							var ran:Number = Math.random()*10;
							if (Math.random>.5) {
								ran *= -1;
							}
							en._rotation = this.gun._rotation+180*arb+ran;
							qw = en._rotation/180*Math.PI;
							en.dx = -Math.cos(qw)*10*arb;
							en.dy = -Math.sin(qw)*10*arb;
							en._x = this._x-Math.cos(qw)*25*arb;
							en._y = this._y-Math.sin(qw)*25*arb;
							en.spd = 10;
							en.damage = 1;
							en.side = 2;
							en.z = 1;
							if (movelayer.platforms.hitTest(en._x+movelayer._x, en._y+movelayer._y, true)) {
								en.unloadMovie();
							}
							neutral = 45;
						}else if(dxy<175){
							//basic turret shots
							var T_mc = movelayer.trackmc2.attachMovie("BaseTurretShot", "d"+depth, depth++);
							T_mc._x = this._x+Math.cos(this.gun._rotation/180*Math.PI)*25*arb;
							T_mc._y = this._y+Math.sin(this.gun._rotation/180*Math.PI)*25*arb;
							T_mc._rotation = Math.atan2(dy, dx)/Math.PI*180;
							qw = T_mc._rotation/180*Math.PI;
							T_mc.dy = Math.sin(qw)*10;
							T_mc.dx = Math.cos(qw)*10;
							this.reloadtime = 11;
							bad = 55;
						}else{
							//rockets
							var T_mc = movelayer.trackmc2.attachMovie("TankShot", "d"+depth, depth++);
							T_mc._x = this._x+Math.cos(this.gun._rotation/180*Math.PI)*25*arb;
							T_mc._y = this._y+Math.sin(this.gun._rotation/180*Math.PI)*25*arb;
							T_mc._rotation = Math.atan2(dy, dx)/Math.PI*180;
							var qw:Number = T_mc._rotation/180*Math.PI;
							T_mc.dy = Math.sin(qw)*10;
							T_mc.dx = Math.cos(qw)*10;
							T_mc.explosive=true;
							this.reloadtime = 36;
							bad = 55;
						}
					}
					//other
					if (!this.crystal._visible) {
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+10+movelayer._y, true)) {
							this.dy = 0;
							while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+10-1, true)) {
								this._y--;
							}
						} else {
							this.dy += GRAV;
							if (this.dy>=12) {
								this.dy = 12;
							}
						}
						this._y += this.dy;
					}
					//jetcode           
					if (this.jets) {
						if (this.dir == 1) {
							if (movelayer.Guy._x+30>this._x) {
								if (!movelayer.platforms.hitTest(this._x+10+movelayer._x, this._y+movelayer._y, true)) {
									this._x += this.spd;
								}
							} else {
								this.dir = -1;
							}
						} else {
							if (movelayer.Guy._x-30<this._x) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x-10, this._y+movelayer._y, true)) {
									this._x -= this.spd;
								}
							} else {
								this.dir = 1;
							}
						}
						if (this.wis) {
							if (dxy<100 && dx<90) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x+this.dir*-10, this._y+movelayer._y, true)) {
									this._x -= 2*this.dir*this.spd;
								}
							}
						}
					}
					if (this.vjets) {
						if (this.vdir == 1) {
							if ((movelayer.Guy._y-17)+30>this._y) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+10, true)) {
									this._y += this.spd;
								} else {
									this.vdir = -1;
								}
							} else {
								this.vdir = -1;
							}
						} else {
							if ((movelayer.Guy._y-17)-30<this._y) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-10, true)) {
									this._y -= this.spd;
								} else {
									this.vdir = 1;
								}
							} else {
								this.vdir = 1;
							}
						}
						if (this.wis) {
							if (dxy<100 && dy<90) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+this.vdir*-10, true)) {
									this._y -= 2*this.vdir*this.spd;
								}
							}
						}
					}
				}
			}
		}
	}
}

function badship() {
	if (isNaN(this.reloadtime)) {
		this.health = 25;
		this.reloadtime = 11;
		this.bombtime = 50;
		this.missletime = 45;
		this.scr = 0;
		this.z = 25;
	}
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			if (this.health<=0) {
				this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
				if (isNaN(this.health)) {
					this.health = this.z;
				} else {
					if (this.scr == 0) {
						killtotal++;
						var oldscore = SCORE;
						multiscore += multi;
						SCORE += 10;
						if (this.ram) {
							SCORE += 3;
						}
						if(this.sbomb){
							SCORE += 3;
						}
						this.scr += 1;
						multi += (SCORE-oldscore)*multiscores[equiped-1];
					}
					if (this.body._currentframe == this.body._totalframes) {
						explosion(this._x,this._y,6,20,9,1,2);
						this.unloadMovie();
					}
				}
			} else {
				this.missletime--;
				this.reloadtime--;
				this.bombtime--;
				var dx = this._x-movelayer.Guy._x;
				var dy = this._y-((movelayer.Guy._y-17));
				var dxy = Math.sqrt(dx*dx+dy*dy);
				if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
				//if (dxy<300) {
					hitgood(this);
					hitneutral(this);
					//rotationg
					var rot:Number = Math.atan2(dy, dx);
					this.h._rotation = rot/Math.PI*180;
					var mi:Number = tsy(this._rotation);
					var wa:Number = tsy(this.h._rotation);
					var far:Boolean = true;
					if (Math.abs(wa-mi)>15) {
						if ((mi+180<wa) || (wa<mi)) {
							if (wa+180<mi) {
								var r = 15;
							} else {
								var r = -15;
							}
						} else {
							var r = 15;
						}
					} else {
						far = false;
						var r = wa-mi;
					}
					var ev = r/180*Math.PI;
					this._rotation += r;
					if (this._currentframe == 2) {
						if (this._x>movelayer.Guy._x) {
							this.gotoAndStop(1);
						}
					} else {
						if (this._x<movelayer.Guy._x) {
							this.gotoAndStop(2);
						}
					}
					var ev = this._rotation/180*Math.PI;
					var okgo = true;
					/*
					//top
					this.h._rotation = this._rotation+205;
					var topx = this._x+Math.cos(this.h._rotation/180*Math.PI)*75+movelayer._x;
					var topy = this._y+Math.sin(this.h._rotation/180*Math.PI)*75+movelayer._y;
					*/
					var po:Object={x:0, y:0};
					this.top.localToGlobal(po);
					var topx:Number=po.x;
					var topy:Number=po.y;
					
					
					/*
					//bottom
					this.h._rotation = this._rotation+155;
					var botx = this._x+Math.cos(this.h._rotation/180*Math.PI)*75+movelayer._x;
					var boty = this._y+Math.sin(this.h._rotation/180*Math.PI)*75+movelayer._y;
					*/
					po={x:0, y:0};
					this.bottom.localToGlobal(po);
					var botx:Number=po.x;
					var boyy:Number=po.y;
					
					/*
					//ctop
					this.h._rotation = this._rotation+210;
					var ctopx = this._x+Math.cos(this.h._rotation/180*Math.PI)*45+movelayer._x;
					var ctopy = this._y+Math.sin(this.h._rotation/180*Math.PI)*45+movelayer._y;
					*/
					
					po={x:0, y:0};
					this.ctop.localToGlobal(po);
					var ctopx:Number=po.x;
					var ctopy:Number=po.y;
					
					/*
					//cbottom
					this.h._rotation = this._rotation+150;
					var cbotx = this._x+Math.cos(this.h._rotation/180*Math.PI)*45+movelayer._x;
					var cboty = this._y+Math.sin(this.h._rotation/180*Math.PI)*45+movelayer._y;
					*/
					
					po={x:0, y:0};
					this.cbottom.localToGlobal(po);
					var cbotx:Number=po.x;
					var cboty:Number=po.y;
					
					//Turn off back?
					var back:Boolean = false;
					
					//If both the close points hit go back 
					if ((movelayer.platforms.hitTest(cbotx, cboty, true)) && (movelayer.platforms.hitTest(ctopx, ctopy, true))) {
						okgo = false;
						back = true;
					}
					
					/*
					//?
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						okgo = true;
						back = false;
					}
					*/
					
					//If you can move
					if ((okgo) || (back)) {
						if ((movelayer.platforms.hitTest(botx, boty, true)) || (movelayer.platforms.hitTest(cbotx, cboty, true))) {
							//If the bottom ones hit
							this._rotation += 20;wa
						} else if ((movelayer.platforms.hitTest(topx, topy, true)) || (movelayer.platforms.hitTest(ctopx, ctopy, true))) {
							//if the top ones hit
							this._rotation -= 20;
						}
					}
					
					//My rotation in radians
					var ev:Number = this._rotation/180*Math.PI;
					
					//recalculate
					/*
					//top
					this.h._rotation = this._rotation+205;
					var topx = this._x+Math.cos(this.h._rotation/180*Math.PI)*75+movelayer._x;
					var topy = this._y+Math.sin(this.h._rotation/180*Math.PI)*75+movelayer._y;
					*/
					po={x:0, y:0};
					this.top.localToGlobal(po);
					topx=po.x;
					topy=po.y;
					
					
					/*
					//bottom
					this.h._rotation = this._rotation+155;
					var botx = this._x+Math.cos(this.h._rotation/180*Math.PI)*75+movelayer._x;
					var boty = this._y+Math.sin(this.h._rotation/180*Math.PI)*75+movelayer._y;
					*/
					po={x:0, y:0};
					this.bottom.localToGlobal(po);
					botx=po.x;
					boyy=po.y;
					
					
					//Can I go forward?
					if ((movelayer.platforms.hitTest(botx*75+this._x+movelayer._x, boty*75+movelayer._y+this._y, true)) && (movelayer.platforms.hitTest(topx*75+this._x+movelayer._x, topy*75+movelayer._y+this._y, true))) {
						okgo = false;
						//back = false;
					}
					if ((movelayer.platforms.hitTest(botx*45+this._x+movelayer._x, boty*45+movelayer._y+this._y, true)) && (movelayer.platforms.hitTest(topx*45+this._x+movelayer._x, topy*45+movelayer._y+this._y, true))) {
						okgo = false;
						back = false;
					}
					
					//font
					po={x:0, y:0};
					this.front.localToGlobal(po);
					var frontx:Number=po.x;
					var fronty:Number=po.y;
					//back
					po={x:0, y:0};
					this.back.localToGlobal(po);
					var backx:Number=po.x;
					var backy:Number=po.y;
					//Can I move?
					if (movelayer.platforms.hitTest(backx, backy, true)) {
						back = false;
					}
					if (movelayer.platforms.hitTest(frontx, fronty, true)) {
						okgo = false;
					}
					
					//moving
					if (okgo) {
						//trace(!far+" "+d);
						if(!far&&d<75){
							this.x2 = 4*Math.cos(ev);
							this.y2 = 4*Math.sin(ev);
						}else{
							this.x2 = 7*Math.cos(ev);
							this.y2 = 7*Math.sin(ev);
						}
						this._x -= this.x2;
						this._y -= this.y2;
					} else if (back) {
						this.x2 = 7*Math.cos(ev);
						this.y2 = 7*Math.sin(ev);
						this._x += this.x2;
						this._y += this.y2;
					}
					//finishing touches
					this.oldx = this._x;
					this.oldy = this._y;
					if (Math.abs(this._rotation)<90) {
						this.gotoAndStop(1);
					} else {
						this.gotoAndStop(2);
					}
					//weapons
					//Am I aiming at Zuy?
					if ((!far) && (this.reloadtime<=0)) {
						bad = 55;
						this.bod.play();
						var T_mc = movelayer.trackmc2.attachMovie("badshipshot", "d"+depth, depth++);
						arb = -1;
						if (movelayer.Guy._x>this._x+this._parent._x) {
							arb = -1;
						}
						T_mc._x = this._x+Math.cos(this._rotation/180*Math.PI)*35*arb;
						T_mc._y = this._y+Math.sin(this._rotation/180*Math.PI)*35*arb;
						this.reloadtime = 11;
						T_mc._rotation = this._rotation;
						T_mc.dx = Math.cos(this._rotation/180*Math.PI)*10;
						T_mc.dy = Math.sin(this._rotation/180*Math.PI)*10;
					} else if ((Math.abs(dx)<30) && (movelayer.Guy._y-30>this._y) && (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+20, true)) && (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+50, true)) && (this.bombtime<=0)) {
						bad = 55;
						var T_mc = movelayer.trackmc2.attachMovie("badshipbomb", "d"+depth, depth++);
						T_mc._x = this._x;
						T_mc._y = this._y;
						T_mc.sbomb=this.sbomb;
						this.bombtime = 50;
					} else if (this.missletime<=0) {
						bad = 55;
						var T_mc = movelayer.trackmc2.attachMovie("badshipmissle", "d"+depth, depth++);
						T_mc._x = this._x;
						T_mc._y = this._y;
						this.missletime = 45;
					}
					//blade
					if (this.ram) {
						ramblade(this);
					}
					this.horn._visible = this.ram;
				}
			}
		}
	}
}

function hailfire() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.reloadtime)) {
				this.reloadtime = 105;
			}
			this.reloadtime -= 1;
			var dx = this._parent._x-movelayer.Guy._x;
			var dy = this._parent._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy>300) {
				this._visible=false;
			}else{
				this._visible=true;
			//if (dxy<=300) {
				fac = -1;
				adj = 0;
				if (movelayer.Guy._x<this._parent._x) {
					aimu(this._parent._x,movelayer.Guy._x,(movelayer.Guy._y-17),0,this,this._parent._y);
					this._xscale = 100;
				} else {
					aimu(this._parent._x,movelayer.Guy._x,(movelayer.Guy._y-17),180,this,this._parent._y);
					this._xscale = -100;
					fac = 1;
					adj = 180;
				}

				if (this.reloadtime<=0) {
					bad = 70;
					this.play();
					this.reloadtime = 105;
					firehail(this,adj,fac,dx,dy);
				}
			}
		}
	}
}

function firehail(that, adj, fac, dx, dy) {
	var vert = this._rotation-90;
	for (n=0; n<2; n++) {
		for (m=4; m>0; m--) {
			if (!movelayer.platforms.hitTest(that._parent._x+Math.cos(that._rotation/180*Math.PI)*(29+4*n)*fac-Math.cos(vert/180*Math.PI)*(29-4*m)*fac+movelayer._x, that._parent._y+Math.sin(that._rotation/180*Math.PI)*(29+4*n)*fac-Math.sin(vert/180*Math.PI)*(29-4*m)*fac+movelayer._y, true)) {
				var T_mc = movelayer.trackmc2.attachMovie("bhtshot", "d"+depth, depth++);
				T_mc._x = that._parent._x+Math.cos(that._rotation/180*Math.PI)*(9+4*n)*fac-Math.cos(vert/180*Math.PI)*(9-4*m)*fac;
				T_mc._y = that._parent._y+Math.sin(that._rotation/180*Math.PI)*(9+4*n)*fac-Math.sin(vert/180*Math.PI)*(9-4*m)*fac;
				T_mc._rotation = Math.atan2(dy, dx)/Math.PI*180;
				T_mc.yad = Math.round(Math.random()*20)-10;
				if (movelayer.platforms.hitTest(T_mc._x+movelayer._x, T_mc._y+movelayer._y, true)) {
					T_mc.unloadMovie();
				}
			}
		}
	}
}

function guarddog() {
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
				this.health = 10;
				this.dy = 0;
				this.z = 10;
				this.dead = 0;
			}
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
			//if (dxy<=300) {
				if (this.dead == 0) {
					hitgood(this);
					hitneutral(this);
					if (this.health<=0) {
						this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
						if (isNaN(this.health)) {
							this.health = this.z;
						} else {
							this.dead = 1;
						}
					} else {
						var dir = 1;
						if ((Math.abs(dx)<10) && (dxy<15)) {
							var dir = this.olddir;
							var ychange = -15;
						} else {
							if (movelayer.Guy._x>this._x) {
								this._xscale = -100;
							} else {
								dir = -1;
								this._xscale = 100;
							}
							if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
								this.dy = 0;
							} else {
								this.dy += GRAV;
							}
							if (!movelayer.platforms.hitTest(this._x+movelayer._x+dir*5, this._y+movelayer._y-10, true)) {
								if (movelayer.platforms.hitTest(this._x+movelayer._x+dir*5, this._y+movelayer._y+10, true)) {
									this._x += dir*5;
								} else {
									this._x -= dir*5;
								}
							}
							this._y += this.dy;
							var ychange:Number = 0+this.dy;
							var count:Number=0;
							while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-1, true)) {
								this._y--;
								ychange--;
								count++;
								if(count>10){
									this._y+=count;
									ychange+=count;
									break;
								}
							}

						}
						var adj:Number = 180;
						var ajg:Number = 0;
						var mult:Number = 1;
						var vult:Number = 1;
						if (dir == 1) {
							ajg = 180;
							adj = 0;
							if (ychange<0) {
								mult = -1;
							}
							if (ychange>0) {
								vult = -1;
							}
						}
						this._rotation = (Math.atan2(ychange, dir*7)/Math.PI*180+adj);
						this.old = this._rotation;
						this.olddir = dir;
						bad = 55;
						var rote = (this._rotation+ajg)*dir*-1*mult;
						var rotr = rote/180*Math.PI;
						var rotor = (rote+90*dir*-1*vult)/180*Math.PI;
						var blop_mc = movelayer.trackmc4.attachMovie("GuardBlade", "d"+depth, depth++);
						blop_mc.damage = 1;
						blop_mc._xscale = blop_mc._yscale=75;
						blop_mc._y = this._y+Math.sin(rotr)*-20+Math.sin(rotor)*-15;
						blop_mc._x = this._x+Math.cos(rotr)*-20+Math.cos(rotor)*-15;
						//if (checkCollision(movelayer.Guy, blop_mc) || checkCollision(movelayer.THead, blop_mc)) {
						if ((movelayer.Guy.hitTest(blop_mc)) || (movelayer.THead.hitTest(blop_mc))) {
							damage(1);
						}
					}
				} else {
					if (this._currentframe == 1) {
						this.play();
						killtotal++;
						var oldscore = SCORE;
						multiscore += multi;
						SCORE += 5;
						if (this.gren._visible) {
							SCORE += 3;
						}
						multi += (SCORE-oldscore)*multiscores[equiped-1];
					} else if (this._currentframe == this._totalframes) {
						this.unloadMovie();
					}
				}
			}
		}
	}
}

function tankarmor(a) {
	var parts = new Array();
	var one = a.attachMovie("Arp", "A"+a.getNextHighestDepth(), a.getNextHighestDepth());
	var two = a.attachMovie("Arp", "A"+a.getNextHighestDepth(), a.getNextHighestDepth());
	var three = a.attachMovie("Arp", "A"+a.getNextHighestDepth(), a.getNextHighestDepth());
	var four = a.attachMovie("Arp", "A"+a.getNextHighestDepth(), a.getNextHighestDepth());
	one._x = -15;
	one._y = -13;
	one._rotation = 35;
	two._x = -10;
	two._y = -15;
	two._rotation = 0;
	three._x = -21;
	three._y = -5;
	three._rotation = 35;
	four._x = -17;
	four._y = -9;
	four._rotation = 0;
	parts[0] = one;
	parts[1] = two;
	parts[2] = three;
	parts[3] = four;
	return parts;
}
function movingwall() {
	if (pauseq == 0) {
		if (!paused) {
			if (this._currentframe == this._totalframes) {
				this.unloadMovie();
			}
			if (isNaN(this.health)) {
				this.health = 50;
				this.falling = false;
				this.dy = 0;
				this.diff = 0;
				this.okgo = true;
				this.z = 50;
				this.dead = 0;
				this.old = 0;
				this.oldir = 1;
				this.spd=3;
				if(this.fast){
					this.spd=6;
				}
			}
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
			//if (dxy<=300) {
				if (this.dead == 0) {
					hitgood(this);
					hitneutral(this);
					if (this.health<=0) {
						this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
						if (isNaN(this.health)) {
							this.health = this.z;
						} else {
							this.dead = 1;
						}
					} else {
						var dir = this.oldir;
						if (dir == 1) {
							this._xscale = -200;
							if (movelayer.Guy._x+30<this._x) {
								dir = -1;
								this._xscale = 200;
							}
						} else {
							this._xscale = 200;
							if (movelayer.Guy._x-30>this._x) {
								dir = 1;
								this._xscale = -200;
							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+3, true)) {
							this.dy = 0;
						} else {
							this.dy += GRAV;
						}
						
						
						var backok:Boolean=false;
						if(!movelayer.platforms.hitTest(this._x+movelayer._x-dir*20, this._y+movelayer._y-47, true)){
							if (movelayer.platforms.hitTest(this._x+movelayer._x-dir*10, this._y+movelayer._y+28, true) || movelayer.platforms.hitTest(this._x+movelayer._x-dir*20, this._y+movelayer._y-20, true) || movelayer.platforms.hitTest(this._x+movelayer._x-dir*10, this._y+movelayer._y+3, true)) {
								backok=true;
							}
						}
						if (!movelayer.platforms.hitTest(this._x+movelayer._x+dir*40, this._y+movelayer._y-47, true)) {
							if (movelayer.platforms.hitTest(this._x+movelayer._x+dir*20, this._y+movelayer._y+28, true) || movelayer.platforms.hitTest(this._x+movelayer._x+dir*40, this._y+movelayer._y-20, true) || movelayer.platforms.hitTest(this._x+movelayer._x+dir*20, this._y+movelayer._y+3, true)) {
								if(Math.abs(dx)>60){
									this._x += dir*this.spd;
								}else if(Math.abs(dx)<40){
									if (backok) {
										this._x -= dir*this.spd;
									}
								}
							} else {
								if (backok) {
									this._x -= dir*this.spd;
								}
							}
						} else {
							if (backok) {
								this._x -= dir*this.spd;
							}
						}
						/*if (!movelayer.platforms.hitTest(this._x+movelayer._x+dir*7, this._y+movelayer._y-34, true)) {
							if (movelayer.platforms.hitTest(this._x+movelayer._x+dir*7, this._y+movelayer._y+17, true)) {
								this._x += dir*this.spd;
							} else {
								this._x -= dir*this.spd;
							}
						}*/
						
						
						
						this._y += this.dy;
						var ychange = 0+this.dy;
						while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-1+3, true)) {
							this._y--;
							ychange--;
						}
						var lcount = 0;
						var rcount = 0;
						if (movelayer.platforms.hitTest(this._x+movelayer._x+50, this._y+movelayer._y+3, true)) {
							while (movelayer.platforms.hitTest(this._x+movelayer._x+50, this._y+movelayer._y+3-1+lcount, true)) {
								lcount--;
								if (lcount<=-50) {
									break;
								}
							}
						} else {
							while (!movelayer.platforms.hitTest(this._x+movelayer._x+50, this._y+movelayer._y+3+1+lcount, true)) {
								lcount++;
								if (lcount>=50) {
									break;
								}
							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x-50, this._y+movelayer._y+3, true)) {
							while (movelayer.platforms.hitTest(this._x+movelayer._x-50, this._y+movelayer._y+3-1+rcount, true)) {
								rcount--;
								if (rcount<=-50) {
									break;
								}
							}
						} else {
							while (!movelayer.platforms.hitTest(this._x+movelayer._x-50, this._y+movelayer._y+3+1+rcount, true)) {
								rcount++;
								if (rcount>=50) {
									break;
								}
							}
						}
						var slo = 0;
						if (this._xscale<0) {
							slo = lcount-rcount;
						} else {
							slo = rcount-lcount;
						}
						this._rotation = Math.atan2(slo*-dx/Math.abs(dx), 100)/Math.PI*180;
						/*var adj = 180;
						if (dir == 1) {
						adj = 0;
						}
						if (dir == this.oldir) {
						this._rotation = (Math.atan2(ychange, dir*7)/Math.PI*180+adj);
						this._rotation = (this._rotation+this.old)/2;
						} else {
						this._rotation = (Math.atan2(ychange, dir*7)/Math.PI*180+adj);
						}
						this.old = this._rotation;
						this.oldir = dir;*/
					}
				} else {
					if (this._currentframe<=9) {
						this.gotoAndPlay(10);
						multiscore += multi;
						killtotal++;
						var oldscore = SCORE;
						SCORE += 10;
						if (this.gun._visible) {
							SCORE += 2;
						}
						if (this.gren._visible) {
							SCORE += 3;
						}
						if (this.goon._visible) {
							SCORE += 4;
						}
						if(this.fast){
							SCORE+=2;
						}
						multi += (SCORE-oldscore)*multiscores[equiped-1];
					}
				}
			}
		}
	}
}
function tank() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			if (this._currentframe == this._totalframes) {
				this.unloadMovie();
			}
			if (isNaN(this.health)) {
				this.health = 30;
				this.falling = false;
				this.dy = 0;
				this.diff = 0;
				this.okgo = true;
				this.z = 30;
				this.dead = 0;
				this.old = 0;
				this.oldir = 1;
				if (this.anti) {
					this.parts = tankarmor(this);
				}
				this.spikes._visible = this.spik;
			}
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
			//if (dxy<=300) {
				if (this.dead == 0) {
					hitgood(this);
					hitneutral(this);
					if (this.health<=0) {
						this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
						if (isNaN(this.health)) {
							this.health = this.z;
						} else {
							this.dead = 1;
						}
					} else {
						var dir = this.oldir;
						if (dir == 1) {
							this._xscale = -200;
							if (movelayer.Guy._x<this._x) {
								dir = -1;
								this._xscale = 200;
							}
						} else {
							this._xscale = 200;
							if (movelayer.Guy._x>this._x) {
								dir = 1;
								this._xscale = -200;
							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+3, true)) {
							this.dy = 0;
						} else {
							this.dy += GRAV;
						}
						var backok:Boolean=false;
						if(!movelayer.platforms.hitTest(this._x+movelayer._x-dir*20, this._y+movelayer._y-47, true)){
							if (movelayer.platforms.hitTest(this._x+movelayer._x-dir*10, this._y+movelayer._y+28, true) || movelayer.platforms.hitTest(this._x+movelayer._x-dir*20, this._y+movelayer._y-20, true) || movelayer.platforms.hitTest(this._x+movelayer._x-dir*10, this._y+movelayer._y+3, true)) {
								backok=true;
							}
						}
						if (!movelayer.platforms.hitTest(this._x+movelayer._x+dir*40, this._y+movelayer._y-47, true)) {
							if (movelayer.platforms.hitTest(this._x+movelayer._x+dir*20, this._y+movelayer._y+28, true) || movelayer.platforms.hitTest(this._x+movelayer._x+dir*40, this._y+movelayer._y-20, true) || movelayer.platforms.hitTest(this._x+movelayer._x+dir*20, this._y+movelayer._y+3, true)) {
								if(Math.abs(dx)>60){
									this._x += dir*7;
								}else if(Math.abs(dx)<40){
									if (backok) {
										this._x -= dir*7;
									}
								}
							} else {
								if (backok) {
									this._x -= dir*7;
								}
							}
						} else {
							if (backok) {
								this._x -= dir*7;
							}
						}
						this._y += this.dy;
						var ychange = 0+this.dy;
						while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-1+3, true)) {
							this._y--;
							ychange--;
						}
						var adj = 180;
						if (dir == 1) {
							adj = 0;
						}
						if (dir == this.oldir) {
							this._rotation = (Math.atan2(ychange, dir*7)/Math.PI*180+adj);
							this._rotation = (this._rotation+this.old)/2;
						} else {
							this._rotation = (Math.atan2(ychange, dir*7)/Math.PI*180+adj);
						}
						this.old = this._rotation;
						this.oldir = dir;
					}
					if (this.spik) {
						tankspikes(this);
					}
				} else {
					if (this._currentframe == 1) {
						this.play();
						killtotal++;
						multiscore += multi;
						var oldscore = SCORE;
						SCORE += 15;
						if (this.anti) {
							for (n=0; n<this.parts.length; n++) {
								this.parts[n].unloadMovie();
							}
							SCORE += 3;
						}
						if (this.spik) {
							SCORE += 5;
						}
						if (this.gun._visible) {
							SCORE += 3;
						}
						if (this.goon._visible) {
							SCORE += 4;
						}
						if (this.gren._visible) {
							SCORE += 5;
						}
						if (this.hom) {
							SCORE += 3;
						}
						multi += (SCORE-oldscore)*multiscores[equiped-1];
					}
				}
			}
		}
	}
}
function greenlaunch() {
	if (pauseq == 0) {
		if (!paused) {
			if (this._visible) {
				if (isNaN(this.reloadtime)) {
					this.old = 0;
					this.reloadtime = 0;
				}
				this.blan._rotation = this._parent._rotation-90;

				var pon = {x:0, y:0};
				this.localToGlobal(pon);
				var ex = (pon.x-movelayer._x);
				var ey = (pon.y-movelayer._y);
				var dx = ex-movelayer.Guy._x;
				//normally you're hitpoint is a the bottom;
				var dy = ey-((movelayer.Guy._y-17));
				var dxy = Math.sqrt(dx*dx+dy*dy);
				this.reloadtime--;
				if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
				//if (dxy<=300) {
					var adj = 0;
					var multpl = 1;
					if (movelayer.Guy._x>this._parent._x) {
						adj = 180;
						multpl = -1;
					}
					if (this.reloadtime<=0) {
						var erx = ex+movelayer._x;
						var ery = ey+movelayer._y;
						var pangle = (multpl*this._rotation+adj+this._parent._rotation)/180*Math.PI;
						if (!movelayer.platforms.hitTest(erx-Math.cos(pangle)*32, ery-Math.sin(pangle)*32, true)) {
							greenfire(pangle,erx,ery);
							this.play();
						}
						this.reloadtime = 25;
					}
				}
			}
		}
	}
}
function greenfire(a, b, c) {
	var T_mc = movelayer.trackmc2.attachMovie("Green", "d"+depth, depth++);
	T_mc.spray = false;
	T_mc.explosive = true;
	T_mc._x = b-movelayer._x-Math.cos(a)*32;
	T_mc._y = c-movelayer._y-Math.sin(a)*32;
	T_mc._rotation = a/Math.PI*180;
	T_mc.dx = Math.cos(a)*10;
	T_mc.dy = Math.sin(a)*10;
	bad = 45;
}
function horizontalgun() {
	if (pauseq == 0) {
		if (!paused) {
			if (this._visible) {
				if (isNaN(this.reloadtime)) {
					this.old = 0;
					this.reloadtime = 2;
				}
				this.blan._rotation = this._parent._rotation-90;
				var pon = {x:0, y:0};
				this.localToGlobal(pon);
				var ex = (pon.x-movelayer._x);
				var ey = (pon.y-movelayer._y);
				var dx = ex-movelayer.Guy._x;
				//normally you're hitpoint is a the bottom;
				var dy = ey-((movelayer.Guy._y-17));
				var dxy = Math.sqrt(dx*dx+dy*dy);
				this.reloadtime--;
				if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
				//if (dxy<=300) {
					var angle = Math.atan2(dy, dx)/Math.PI*180;
					if (movelayer.Guy._x>this._parent._x) {
						angle *= -1;
						angle += this._parent._rotation;
						angle += 180;
					} else {
						angle -= this._parent._rotation;
					}
					var adj = 0;
					if (movelayer.Guy._x>this._parent._x) {
						adj = 180;
					}
					var rot = ((this._parent._rotation+this._rotation)*-1+adj)*-1;
					var angle = Math.atan2(dy, dx)/Math.PI*180;
					var wa = tsy(angle);
					var me = tsy(rot);
					mod = false;
					if (adj == 180) {
						if (Math.abs(wa-me)<20) {
							mod = true;
						}

					} else {
						if (this._rotation>0) {
							if (angle>0) {
								if (Math.abs(angle-rot)<20) {
									mod = true;
								}
							} else {
								if (rot+Math.abs(angle)<20) {
									mod = true;
								}
							}
						} else {
							if (angle>0) {
								if (angle+Math.abs(rot)<20) {
									mod = true;
								}
							} else {
								if (Math.abs(Math.abs(angle)-Math.abs(rot))<20) {
									mod = true;
								}
							}
						}
					}
					if (mod) {
						if (this.reloadtime<=0) {
							var erx = ex+movelayer._x;
							var ery = ey+movelayer._y;
							var pangle = ((this._parent._rotation+this._rotation)*-1+adj)*-1/180*Math.PI;
							if (!movelayer.platforms.hitTest(erx-Math.cos(pangle)*32, ery-Math.sin(pangle)*32, true)) {
								horizontalgunfire(pangle,erx,ery);
								this.play();
							}
							this.reloadtime = 10;
						}
					}
				}
			}
		}
	}
}


function wormnanogunfire(a, b, c) {
	var T_mc = movelayer.trackmc2.attachMovie("WormShot", "d"+depth, depth++);
	T_mc._x = b-movelayer._x-Math.cos(a)*32;
	T_mc._y = c-movelayer._y-Math.sin(a)*32;
	T_mc._rotation = a/Math.PI*180;
	T_mc.dx = Math.cos(a)*10;
	T_mc.dy = Math.sin(a)*10;
	bad = 45;
}

function horizontalgunfire(a, b, c) {
	var T_mc = movelayer.trackmc2.attachMovie("StaticShot", "d"+depth, depth++);
	T_mc._x = b-movelayer._x-Math.cos(a)*32;
	T_mc._y = c-movelayer._y-Math.sin(a)*32;
	T_mc._rotation = a/Math.PI*180;
	T_mc.dx = Math.cos(a)*10;
	T_mc.dy = Math.sin(a)*10;
	bad = 45;
}
function wormnanogun() {
	if (pauseq == 0) {
		if (!paused) {
			if (this._visible) {
				if (isNaN(this.reloadtime)) {
					this.old = 0;
					this.reloadtime = 2;
					this.auto = 0;
				}
				if (isNaN(this.bon)) {
					this.bon = 1;
				}
				this.blan._rotation = this._parent._rotation-90+this._rotation;
				var pon = {x:0, y:0};
				this.localToGlobal(pon);
				var ex = (pon.x-movelayer._x);
				var ey = (pon.y-movelayer._y);
				var dx = ex-movelayer.Guy._x;
				//normally you're hitpoint is a the bottom;
				var dy = ey-((movelayer.Guy._y-17));
				var dxy = Math.sqrt(dx*dx+dy*dy);
				this.reloadtime--;
				//if (dxy<=300) {
				var angle = Math.atan2(dy, dx)/Math.PI*180;
				if (movelayer.Guy._x>this._parent._x) {
					angle *= -1;
					angle += this._parent._rotation;
					angle += 180;
				} else {
					angle -= this._parent._rotation;
				}
				var adj = 0;
				if (movelayer.Guy._x>this._parent._x) {
					adj = 180;
				}
				var rot = ((this._parent._rotation+this._rotation)*-1+adj)*-1;
				var angle = Math.atan2(dy, dx)/Math.PI*180;
				if (adj == 180) {
					if (this.bon == 0) {
						this._rotation = 180-(angle-this._parent._rotation-adj)+180;
					} else {
						this._rotation = angle-this._parent._rotation-adj+180;
					}
				} else {
					this._rotation = angle-this._parent._rotation-adj;
				}
				if (this.reloadtime<=0) {
					this.reloadtime = 20;
					this.auto = 10;
					this.play();
				}
				if (this.auto>0) {
					if (this.auto%2 == 0) {
						var erx = ex+movelayer._x;
						var ery = ey+movelayer._y;
						multpl = -1;
						if (adj == 180) {
							if (this.bon == 0) {
								var pangle = 180-((this._parent._rotation+this._rotation)*-1+adj)*-1+180;
							} else {
								var pangle = ((this._parent._rotation+this._rotation)*-1+adj)*-1+180;
							}
						} else {
							var pangle = ((this._parent._rotation+this._rotation)*-1+adj)*-1;
						}
						pangle = pangle/180*Math.PI;
						if (!movelayer.platforms.hitTest(erx-Math.cos(pangle)*32, ery-Math.sin(pangle)*32, true)) {
							wormnanogunfire(pangle,erx,ery);
						}
						if ((autofire+1)%3 == 0 || autofire%3 == 0) {
							//#sound
							addSound(assetContainer.getSound("MachineFire"),"MachineFire",1);
						}
					}
					this.auto--;
				}
			}
		}
	}
}
function aimgun() {
	if (pauseq == 0) {
		if (!paused) {
			if (this._visible) {
				if (isNaN(this.reloadtime)) {
					this.old = 0;
					this.reloadtime = 2;
				}
				if (isNaN(this.bon)) {
					this.bon = 0;
				}
				this.blan._rotation = this._parent._rotation-90+this._rotation;
				var pon = {x:0, y:0};
				this.localToGlobal(pon);
				var ex = (pon.x-movelayer._x);
				var ey = (pon.y-movelayer._y);
				var dx = ex-movelayer.Guy._x;
				//normally you're hitpoint is a the bottom;
				var dy = ey-((movelayer.Guy._y-17));
				var dxy = Math.sqrt(dx*dx+dy*dy);
				this.reloadtime--;
				/*if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;*/
				if (dxy<=300) {
					var angle = Math.atan2(dy, dx)/Math.PI*180;
					if (movelayer.Guy._x>this._parent._x) {
						angle *= -1;
						angle += this._parent._rotation;
						angle += 180;
					} else {
						angle -= this._parent._rotation;
					}
					var adj = 0;
					if (movelayer.Guy._x>this._parent._x) {
						adj = 180;
					}
					var rot = ((this._parent._rotation+this._rotation)*-1+adj)*-1;
					var angle = Math.atan2(dy, dx)/Math.PI*180;
					if (adj == 180) {
						if (this.bon == 0) {
							this._rotation = 180-(angle-this._parent._rotation-adj)+180;
						} else {
							this._rotation = angle-this._parent._rotation-adj+180;
						}
					} else {
						this._rotation = angle-this._parent._rotation-adj;
					}
					if (this.reloadtime<=0) {
						var erx = ex+movelayer._x;
						var ery = ey+movelayer._y;
						multpl = -1;
						if (adj == 180) {
							if (this.bon == 0) {
								var pangle = 180-((this._parent._rotation+this._rotation)*-1+adj)*-1+180;
							} else {
								var pangle = ((this._parent._rotation+this._rotation)*-1+adj)*-1+180;
							}
						} else {
							var pangle = ((this._parent._rotation+this._rotation)*-1+adj)*-1;
						}
						pangle = pangle/180*Math.PI;
						if (!movelayer.platforms.hitTest(erx-Math.cos(pangle)*32, ery-Math.sin(pangle)*32, true)) {
							horizontalgunfire(pangle,erx,ery);
							this.play();
						}
						this.reloadtime = 10;
					}
				}
			}
		}
	}
}
function shipboss() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.z)) {
				this.health = this.z=800;
				this.scr = 0;
				this.dropping = 30;
				this.facing=-1;
				this.mn=30;
				this.mx=90;
			}
			if (this.health<=0) {
				this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
				if (isNaN(this.health)) {
					this.health = this.z;
				} else {
					if (this.scr == 0) {
						this.scr = 1;
						this.play();
						killtotal++;
						var oldscore = SCORE;
						multiscore += multi;
						SCORE += 150;
						multi += (SCORE-oldscore)*multiscores[equiped-1];
					}
				}
			} else {
				hitgood(this);
				hitneutral(this);
				//ai
				
				
				if (movelayer.Guy._x-20>this._x&&this.facing==-1) {
					this._xscale = -300;
					this.facing=1;
				} else if (movelayer.Guy._x+20<this._x&&this.facing==1) {
					this._xscale = 300;
					this.facing=-1;
				}
				this.engine.gotoAndStop(1);
				//horizontal movement
				var dr:Number;
				if (Math.abs(movelayer.Guy._x-this._x)>50) {
					dr = 65+this.engine._rotation;
					this.engine._rotation -= dr/10;
				} else {
					dr = 0+this.engine._rotation;
					this.engine._rotation -= dr/10;
				}
				if(Math.abs(movelayer.Guy._x-this._x)>10){
					if (!movelayer.platforms.hitTest(this._x-60*this._xscale/Math.abs(this._xscale)+movelayer._x, this._y+movelayer._y, true) && !movelayer.platforms.hitTest(this._x-30*this._xscale/Math.abs(this._xscale)+movelayer._x, this._y+movelayer._y, true)) {
						this._x += Math.sin(this.engine._rotation/180*Math.PI)*this._xscale/Math.abs(this._xscale)*10;
					}
				}
				this.dropping-=3;
				if (this.dropping>=0) {
					this._y-=3;
				} else {
					this._y+=3;
					if (this.dropping<=-this.mn) {
						this.dropping = this.mx;
					}
				}
				if(movelayer.platforms.hitTest(this._x+movelayer._x,this._y+movelayer._y+27,true)||movelayer.platforms.hitTest(this._x+movelayer._x,this._y+movelayer._y-27,true)){
					this.dropping*=-1;
					this.mn+=this.mx;
					this.mx=this.mn-this.mx;
					this.mn=this.mn-this.mx;
				}
			}
		}
	}
}
function shipbossnanogun() {
	if (pauseq == 0) {
		if (!paused) {
			if (this._parent._currentframe == 1) {
				if (isNaN(this.reloadtime)) {
					this.reloadtime = 30;
				}
				var pon = {x:0, y:0};
				this.localToGlobal(pon);
				var ex = (pon.x-movelayer._x);
				var ey = (pon.y-movelayer._y);
				var dx = ex-movelayer.Guy._x;
				//normally your hitpoint is a the bottom;
				var dy = ey-((movelayer.Guy._y-17));
				var dxy = Math.sqrt(dx*dx+dy*dy);
				this._rotation = Math.atan2(dy, dx)/Math.PI*180;
				if (this._parent._xscale<0) {
					this._rotation = 180-this._rotation;
				}
				this.reloadtime--;
				if (this.reloadtime<=0) {
					this.reloadtime = 30;
					this.play();
					shipbossnanogunfire(Math.atan2(dy, dx),pon.x,pon.y);
				}
			}
		}
	}
}
function shipbossnanogunfire(a, b, c) {
	var T_mc = movelayer.trackmc2.attachMovie("ShipBossShot", "d"+depth, depth++);
	T_mc._x = b-movelayer._x-Math.cos(a)*62;
	T_mc._y = c-movelayer._y-Math.sin(a)*62;
	T_mc._rotation = a/Math.PI*180;
	T_mc.dx = Math.cos(a)*10;
	T_mc.dy = Math.sin(a)*10;
	bad = 45;
}

function shipbossgun() {
	if (pauseq == 0) {
		if (!paused) {
			if (this._parent._currentframe == 1) {
				var pon = {x:0, y:0};
				this.localToGlobal(pon);
				var ex = (pon.x-movelayer._x);
				var ey = (pon.y-movelayer._y);
				var dx = ex-(movelayer.Guy._x+movelayer.Guy.dx*15);
				//normally your hitpoint is a the bottom;
				var dy = ey-((movelayer.Guy._y-17+movelayer.Guy.dy*15));
				var dxy = Math.sqrt(dx*dx+dy*dy);
				this._rotation = Math.atan2(dy, dx)/Math.PI*180;
				if (this._parent._xscale<0) {
					this._rotation = 180-this._rotation;
				}
			}
		}
	}
}
function shipbossgunfire() {
	if (this._parent._currentframe == 1) {
		var fron = {x:this.front._x, y:this.front._y};
		this.localToGlobal(fron);
		var bac = {x:this.back._x, y:this.back._y};
		this.localToGlobal(bac);
		var dx = bac.x-fron.x;
		var dy = bac.y-fron.y;
		var a = Math.atan2(dy, dx);
		var T_mc = movelayer.trackmc2.attachMovie("StaticShot", "d"+depth, depth++);
		T_mc._x = fron.x-movelayer._x-Math.cos(a)*22;
		T_mc._y = fron.y-movelayer._y-Math.sin(a)*22;
		T_mc._rotation = a/Math.PI*180;
		T_mc.dx = Math.cos(a)*10;
		T_mc.dy = Math.sin(a)*10;
		bad = 45;
	}
}

function duoboss(){
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.z)) {
				this.health = this.z=400;
				this.scr = 0;
				this.fx = 1;
				this.vy=0;
				this.jumping=false;
				this.maxCharge=Math.round(Math.random()*40+10);
				this.fireDelay=10;
				this.charge=1;
				this.gun.play();
				this.backPackReload=80;
				this.ts=null;
			}
			if (this.health<=0) {
				this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
				if (isNaN(this.health)) {
					this.health = this.z;
				} else {
					if (this.scr == 0) {
						this.scr = 1;
						this.play();
						killtotal++;
						this.legs.gotoAndStop(1);
						var oldscore = SCORE;
						multiscore += multi;
						SCORE += 150;
						multi += (SCORE-oldscore)*multiscores[equiped-1];
					}
				}
			} else {
				//ai
				var dx:Number=this._x-movelayer.Guy._x;
				var dy:Number=this._y-(movelayer.Guy._y-17);
				hitgood(this);
				hitneutral(this);
				if (movelayer.Guy._x>this._x) {
					this._xscale = -150;
					this.fx=-1;
				} else {
					this._xscale = 150;
					this.fx=1;
				}
				var moving:Boolean=true;
				var mux:Number=1;
				var disCoefficient:Number=1;
				if(equiped==2){
					disCoefficient=3;
				}
				if(Math.abs(dx)<disCoefficient*50){
					//back up
				}else if(Math.abs(dx)<disCoefficient*75){
					//still
					moving=false;
					mux=0;
				}else{
					//forward
					mux=-1;
				}
				if(mux!=0){
					if(movelayer.platforms.hitTest(movelayer._x+this._x+15*this._xscale/100*mux, movelayer._y+this._y, true)){
						//there is a wall in the way
					}else{
						this._x+=mux*this.fx*5;
					}
				}
				
				//falling
				if(movelayer.platforms.hitTest(movelayer._x+this._x, movelayer._y+this._y+20*this._yscale/100, true)){
					this.jumping=false;
					//landing
					this.vy=0;
					var count:Number=0;
					while(movelayer.platforms.hitTest(movelayer._x+this._x, movelayer._y+this._y+20*this._yscale/100-1, true)){
						count++;
						this._y--;
						if(count>20){
							this._y+=count;
							break;
						}
					}
					//jumping
					if(dy>50){
						this.vy=-12;
						this.jumping=true;
						this.legs.gotoAndStop(4);
					}
				}else{
					//falling
					this.vy++;
					//hit head
					if(this.vy<0) {
						if(movelayer.platforms.hitTest(movelayer._x+this._x, movelayer._y+this._y-11*this._yscale/100, true)){
							this.vy*=-1;
						}
					}
					//friction
					if(this.vy>12){
						this.vy=12;
					}
				}
				this._y+=this.vy;
				//animation
				if(this.jumping){
					if(this.vy<0){
						if(this.legs.ani._currentframe==5){
							this.legs.ani.stop();
						}
					}else{
						if(this.legs.ani._currentframe==5){
							this.legs.ani.play();
						}else if(this.legs.ani._currentframe==1){
							this.jumping=false;
						}
					}
				}else if(moving){
					this.legs.gotoAndStop(2);
				}else if(this.legs._currentframe==2){
					if(this.legs.ani._currentframe==1){
						this.legs.gotoAndStop(1);
					}else if(this.legs.ani._currentframe>this.legs.ani._totalframes/2){
						//finish animation
					}else{
						var fram:Number=this.legs.ani._currentframe;
						this.legs.gotoAndStop(3);
						this.legs.ani.gotoAndPlay(this.legs.ani._totalframes-fram);
					}
				}else if(this.legs._currentframe==3){
					if(this.legs.ani._currentframe==this.legs.ani._totalframes){
						this.legs.gotoAndStop(1);
					}
				}else if(this.legs._currentframe==4){
					this.legs.gotoAndStop(1);
				}
				//gun
				
				var pangle:Number=Math.atan2(dy,dx);
				this.gun._rotation=pangle/Math.PI*180;
				if(dx<0){
					this.gun._rotation=this.gun._rotation*-1+180;
				}
				if(this.fireDelay==10){
					this.charge++;
				}
				if(this.charge>=this.maxCharge){
					this.gun.gotoAndStop(100);
					this.fireDelay--;
					if(this.fireDelay==0){
						var pon = {x:0, y:0};
						this.gun.tip.localToGlobal(pon);
						var ex:Number = pon.x-movelayer._x;
						var ey:Number = pon.y-movelayer._y;
						
						var T_mc = movelayer.trackmc2.attachMovie("DuoBossShot", "d"+depth, depth++);
						T_mc._x = ex;
						T_mc._y = ey;
						T_mc._rotation = pangle/Math.PI*180;
						T_mc.dx = Math.cos(pangle)*10;
						T_mc.dy = Math.sin(pangle)*10;
						T_mc.damage=this.charge+0;
						T_mc.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 255*this.charge/100, 0, 0, 0);
						T_mc.filters = [new BlurFilter(10*this.charge/100, 10*this.charge/100, 1)];
						//
						this.gun.play();
						this.fireDelay=10;
						this.charge=0;
						this.maxCharge=Math.round(Math.random()*40+10);
					}
				}
				this.backPackReload--;
				if(this.backPackReload<72){
					this.ts.homming=1;
					if(this.backPackReload<=0){
						var pon = {x:0, y:0};
						this.torso.pack.po.localToGlobal(pon);
						var ex:Number = pon.x-movelayer._x;
						var ey:Number = pon.y-movelayer._y;
					
						var T_mc = movelayer.trackmc2.attachMovie("TankShot", "d"+depth, depth++);
						T_mc._x = ex;
						T_mc._y = ey;
						T_mc.explosive = true;
						T_mc.homming = 0;
						T_mc._rotation = 90;
						T_mc.dx = 0;
						T_mc.dy = 10;
						this.ts=T_mc;
						this.backPackReload=80;
					}
				}
			}
		}
	}
}

function tankcannon() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.reloadtime)) {
				this.old = 0;
				this.reloadtime = 0;
			}
			this.blan._rotation = this._parent._rotation-90;
			var pon = {x:0, y:0};
			this.localToGlobal(pon);
			var ex = pon.x-movelayer._x;//this._parent._x+Math.cos(this.blan._rotation/180*Math.PI)*50;
			var ey = pon.y-movelayer._y;//this._parent._y+Math.sin(this.blan._rotation/180*Math.PI)*50;
			var dx = ex-movelayer.Guy._x;
			//normally you're hitpoint is a the bottom;
			var dy = ey-((movelayer.Guy._y-17));
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
			//if (dxy<=300) {
				var angle = Math.atan2(dy, dx)/Math.PI*180;
				if (movelayer.Guy._x>this._parent._x) {
					angle *= -1;
					angle += this._parent._rotation;
					angle += 180;
				} else {
					angle -= this._parent._rotation;
				}
				this._rotation = angle;
				if (this._rotation<=-10) {
					this._rotation = -10;
				}
				var adj = 0;
				var multpl = 1;
				if (movelayer.Guy._x>this._parent._x) {
					adj = 180;
					multpl = -1;
				}
				var pangle = (this._parent._rotation*-1+this._rotation+adj)/180*Math.PI*multpl;
				this.reloadtime--;
				if (this.reloadtime<=0) {
					var erx = ex+movelayer._x;
					var ery = ey+movelayer._y;
					if ((!movelayer.platforms.hitTest(erx-Math.cos(pangle)*52, ery-Math.sin(pangle)*52, true)) && (!movelayer.platforms.hitTest(erx-Math.cos(pangle)*22, ery-Math.sin(pangle)*22, true))) {
						bad = 55;
						this.reloadtime = 12;
						var T_mc = movelayer.trackmc2.attachMovie("TankShot", "d"+depth, depth++);
						T_mc._x = erx-movelayer._x-Math.cos(pangle)*62;
						T_mc._y = ery-movelayer._y-Math.sin(pangle)*62;
						this.play();
						if ((dxy>85) && (!movelayer.platforms.hitTest(erx-Math.cos(pangle)*62, ery-Math.sin(pangle)*62, true)) && (!movelayer.platforms.hitTest(erx-Math.cos(pangle)*82, ery-Math.sin(pangle)*82, true)) && (!movelayer.platforms.hitTest(erx-Math.cos(pangle)*102, ery-Math.sin(pangle)*102, true))) {
							this.reloadtime = 36;
							T_mc.explosive = true;
						} else {
							T_mc.explosive = false;
						}
						if (this._parent.hom) {
							T_mc.homming = 1;
						}
						T_mc._rotation = pangle/Math.PI*180;
						T_mc.dx = Math.cos(pangle)*10;
						T_mc.dy = Math.sin(pangle)*10;
					}
				}
			}
		}
	}
}

function dragonarm() {
	if (pauseq == 0) {
		if (!paused) {
			evil = 45;
			var m = new MovieClip();
			var e = this._parent._rotation;
			rule = true;
			if (this._parent._xscale == -300) {
				if (this._parent._rotation<0) {
					e = (180+this._parent._rotation);
				} else {
					e = (180-this._parent._rotation)*-1;
				}
			} else {
				rule = false;
			}
			m._rotation = e;
			var ex = this._parent._x+Math.cos(m._rotation/180*Math.PI)*this._x*3;
			var ey = this._parent._y+Math.sin(m._rotation/180*Math.PI)*this._x*3;
			var dy = ey-(movelayer.Guy._y-17);
			var dx = ex-movelayer.Guy._x;
			var angle = Math.atan2(dy, dx);
			var pangle = angle/Math.PI*180;
			this._rotation = e-pangle;
			if (rule) {
				if (this._rotation>90) {
					this._rotation = 180;
				} else if (this._rotation>0) {
					this._rotation = 0;
				}
				var truerot = e-this._rotation;
			} else {
				if (this._rotation<=-90) {
					this._rotation = -180;
				} else if (this._rotation<0) {
					this._rotation = 0;
				}
				this._rotation = 180-this._rotation+180;
				var truerot = e+this._rotation;
			}
			dragonclawspot(truerot,ex,ey);
		}
	}
}
function dragonhead() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.reloadtime)) {
				this.reloadtime = 0;
			}
			neutral = 45;
			var m = new MovieClip();
			var e = this._parent._rotation;
			rule = true;
			if (this._parent._xscale == -300) {
				if (this._parent._rotation<0) {
					e = (180+this._parent._rotation);
				} else {
					e = (180-this._parent._rotation)*-1;
				}
			} else {
				rule = false;
			}
			m._rotation = e;
			var ex = this._parent._x+Math.cos(m._rotation/180*Math.PI)*this._x*3;
			var ey = this._parent._y+Math.sin(m._rotation/180*Math.PI)*this._x*3;
			var dy = ey-(movelayer.Guy._y-17);
			var dx = ex-movelayer.Guy._x;
			var angle = Math.atan2(dy, dx);
			var pangle = angle/Math.PI*180;
			this._rotation = e-pangle;
			if (rule) {
				if (this._rotation>90) {
					this._rotation = -135;
				} else if (this._rotation<=-135) {
					this._rotation = -135;
				} else if (this._rotation>0) {
					this._rotation = 0;
				}
				var truerot = e-this._rotation;
			} else {
				if (this._rotation<=-90) {
					this._rotation = 135;
				} else if (this._rotation>=135) {
					this._rotation = 135;
				} else if (this._rotation<0) {
					this._rotation = 0;
				}
				this._rotation = 180-this._rotation+180;
				var truerot = e+this._rotation;
			}
			this.reloadtime--;
			if ((this.head._currentframe>5) && (this.head._currentframe<24) && (this.reloadtime<0)) {
				dragonbreath(truerot,ex,ey);
				this.reloadtime = 3;
			}
		}
	}
}
function dragonbreath(a, b, c) {
	if (Math.random()>=0.5) {
		var en = movelayer.trackmc3.attachMovie('exdy', "d"+cept, cept++);
	} else {
		var en = movelayer.trackmc3.attachMovie('exdr', "d"+cept, cept++);
	}
	var ran = Math.random()*10;
	if (Math.random>.5) {
		ran *= -1;
	}
	a = a+ran;
	en.dx = 0-Math.cos(a/180*Math.PI)*10;
	en.dy = 0-Math.sin(a/180*Math.PI)*10;
	en._x = b-Math.cos(a/180*Math.PI)*75;
	en._y = c-Math.sin(a/180*Math.PI)*75;
	en.spd = 10;
	en.damage = 3;
	en.side = 2;
	en.z = 1;
}
function dragon() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.dead)) {
				this.dead = 0;
				this.health = 300;
				this.z = 300;
				this.scr = 0;
				this.score = 100;
				this.dir = 1;
				this._xscale = 300;
				this.fall = true;
			}
			if (this.dead == 0) {
				hitgood(this);
				hitbad(this);
				hitneutral(this);
				if (this.health<=0) {
					this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
					if (this.scr == 0) {
						killtotal++;
						var oldscore = SCORE;
						multiscore += multi;
						SCORE += this.score;
						this.scr += 1;
						multi += (SCORE-oldscore)*multiscores[equiped-1];
					}
					if (this._currentframe == this._totalframes) {
						this.unloadMovie();
						WIN = 1;
					}
				} else {
					var der = -1;
					if (this._xscale == 300) {
						der = 1;
					}
					var dx = this._x-movelayer.Guy._x;
					var dy = this._y-(movelayer.Guy._y-17);

					if (this.dir == 1) {
						this._xscale = 300;
						this._rotation = (Math.atan2(dy, dx)/Math.PI*180)+45;
						if (dx+60<=0) {
							this.dir = -1;
						}
					} else {
						this._xscale = -300;
						this._rotation = 180+(Math.atan2(dy, dx)/Math.PI*180)-45;
						if (dx-60>=0) {
							this.dir = 1;
						}
					}
					if (this._currentframe == 20) {
						this.gotoAndPlay(1);
					}
					if (!movelayer.platforms.hitTest(this._x+movelayer._x-100*this.dir, this._y+movelayer._y, true)) {
						this._x -= Math.cos(this._rotation/180*Math.PI)*7*this.dir;
					}
					if (this.fall) {
						this._y += 4;
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+125, true)) {
							this.fall = false;
						}
					} else {
						this._y -= 2;
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-100, true)) {
							this.fall = true;
						}
					}
					var n = new MovieClip();
					var m = new MovieClip();
					var e = this._rotation;
					rule = true;
					if (this._xscale == -300) {
						if (this._rotation<0) {
							e = (180+this._rotation);
						} else {
							e = (180-this._rotation)*-1;
						}
					} else {
						rule = false;
					}
					m._rotation = e;
					n._rotation = e-90;
					var ex = this._x+Math.cos(m._rotation/180*Math.PI)*this.tail._x*3-Math.cos(n._rotation/180*Math.PI)*this.tail._y*3;
					var ey = this._y+Math.sin(m._rotation/180*Math.PI)*this.tail._x*3-Math.sin(n._rotation/180*Math.PI)*this.tail._y*3;
					dragontailspot(this.tail._rotation,ex,ey);
				}
			}
		}
	}
}

function atla() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.health)) {
				this.health = 230;
				this.reloadtime = 0;
				this.reloadtimet = 4;
				this.reloadtimett = 24;
				this.z = 150;
				this.dy = 0;
				this.dead = false;
				this.jumptime = 0;
				this.spd = 7;
			}
			this.reloadtime--;
			this.reloadtimet--;
			this.reloadtimett--;
			var dx = this._x-movelayer.Guy._x;
			var dy = (this._y+this.cannon._y*6)-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (this.dead) {
				this.body.play();
				if (this.body._currentframe == this.body._totalframes) {
					killtotal++;
					SCORE += 60;
					this.body.stop();
					//this.unloadMovie();
					WIN = 1;
				}
			} else {
				hitgood(this);
				hitneutral(this);
				if (this.health<0) {
					this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
					this.dead = true;
				}
				if (this.jumptime<0) {
					this.spd = 7;
					this.dir = -1;
					this.gotoAndStop(1);
					if (movelayer.Guy._x>this._x) {
						this.dir = 1;
						this.gotoAndStop(2);
					}
				}
				this.jumptime--;
				var dire = 1;
				if (equiped == 2) {
					if (this.jumptime<0) {
						if (Math.abs(movelayer.Guy._x-this._x)<30) {
							this.spd = 11;
							if (this.land) {
								this.dy = -14;
								this.spd=10;
								this.land = false;
							}
							this.jumptime = 35;
						} else {
							dire = -1;
						}

					}
				}
				var ti:Number=1;
				this.cannon._rotation = Math.atan2(dy, dx)/Math.PI*180;
				if(Math.abs(dx)>90||equiped == 2){
					this._x += this.spd*this.dir*dire;
				}else if(Math.abs(dx)<70&&equiped != 2){
					ti=-1;
					this._x -= this.spd*this.dir*dire;
				}else{
					ti=0;
				}
				if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
					this.dy = 0;
					var count = 0;
					this.land = true;
					while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-1, true)) {
						this._y--;
						count++;
					}
					if (count>15) {
						this._y += count;
						this._x -= this.spd*this.dir*dire*ti;
					}
				} else {
					this.dy += GRAV;
				}
				if (this.dy>12) {
					this.dy = 12;
				}
				this._y += this.dy;
				if (this.reloadtime<0) {
					this.reloadtime = atlafire(this, 1);
				}
				if (this.reloadtimet<0) {
					this.reloadtimet = atlafire(this, -1);
				}
				if (this.reloadtimett<0) {
					var exp:Boolean=true;
					if (movelayer.platforms.hitTest(this._x+Math.cos(this.cannon._rotation/180*Math.PI)*75*-1, (this._y+this.cannon._y*6)+Math.sin(this.cannon._rotation/180*Math.PI)*75*-1, true)) {
						exp=false;
					}
					bad = 55;
					var T_mc = movelayer.trackmc2.attachMovie("TankShot", "d"+depth, depth++);
					T_mc._x = this._x+Math.cos(this.cannon._rotation/180*Math.PI)*75*-1;
					T_mc._y = (this._y+this.cannon._y*6)+Math.sin(this.cannon._rotation/180*Math.PI)*75*-1;
					T_mc._rotation = this.cannon._rotation;
					qw = T_mc._rotation/180*Math.PI;
					T_mc.dy = Math.sin(qw)*10;
					T_mc.dx = Math.cos(qw)*10;
					T_mc.explosive = exp;
					T_mc.homming = 1;
					this.reloadtimett = 19;
				}
			}
		}
	}
}
function atlafire(a, b) {
	m = new MovieClip();
	m._rotation = a.cannon._rotation+90;
	bad = 55;
	var T_mc = movelayer.trackmc2.attachMovie("StaticShot", "d"+depth, depth++);
	T_mc._x = a._x+Math.cos(a.cannon._rotation/180*Math.PI)*60*-1+Math.cos(m._rotation/180*Math.PI)*16*a.dir*b;
	T_mc._y = (a._y+a.cannon._y*6)+Math.sin(a.cannon._rotation/180*Math.PI)*60*-1+Math.sin(m._rotation/180*Math.PI)*16*a.dir*b;
	T_mc._rotation = a.cannon._rotation;
	qw = T_mc._rotation/180*Math.PI;
	T_mc.dy = Math.sin(qw)*10;
	T_mc.dx = Math.cos(qw)*10;
	return 8;
}
function howshot() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.reloadtime)) {
				this.reloadtime = 0;
			}
			tankshot.apply(this);
			if (this != null) {
				this.dy -= GRAV/4;
				if (this.dy>12) {
					this.dy = 12;
				}
				if (this.spray) {
					this.reloadtime--;
					if (this._currentframe>=11) {
						if (this.reloadtime<=0) {
							if (Math.random()>=0.5) {
								var z = movelayer.trackmc3.attachMovie('exdy', "d"+cept, cept++);
							} else {
								var z = movelayer.trackmc3.attachMovie('exdr', "d"+cept, cept++);
							}
							var qw = (this._rotation+this.a._rotation)/180*Math.PI;
							z._rotation = this._rotation+this.a._rotation;
							var xi = Math.cos(qw)*-20;
							var yi = Math.sin(qw)*-20;
							neutral = 55;
							z._x = this._x+xi;
							z.z = 1;
							z._y = this._y+yi;
							z.damage = 2;
							z.dy = Math.sin(qw)*-10;
							z.dx = Math.cos(qw)*-10;
							this.reloadtime = 4;
						}
					}
				}
			}
		}
	}
}
function randomtur() {
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
				this.health = 10;
				this.z = 10;
				this.scr = 0;
				this.score = 10;
				this.dy = 0;
				this.dead = 0;
				this.reloadtime = 0;
				this.cont = 10;
				if (this.armor) {
					this.health *= 2;
					var colorTrans:ColorTransform = new ColorTransform();
					colorTrans.redOffset = -100;
					colorTrans.greenOffset = -100;
					colorTrans.blueOffset = -100;
					this.transform.colorTransform = colorTrans;
				}
			}
			if (this.cont == 0) {
				killtotal++;
				var oldscore = SCORE;
				multiscore += multi;
				SCORE += this.score;
				if (this.armor) {
					SCORE += 4;
				}
				if (this.crystal._visible) {
					SCORE += 2;
				}
				multi += (SCORE-oldscore)*multiscores[equiped-1];
				this.unloadMovie();
			}
			if (this.dead == 0) {
				var dx = this._x-movelayer.Guy._x;
				var dy = this._y-((movelayer.Guy._y-17));
				var dxy = Math.sqrt(dx*dx+dy*dy);
				if (dxy<300) {
					hitgood(this);
					hitneutral(this);
					if (this.health<=0) {
						this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
						if (isNaN(this.health)) {
							this.health = this.z;
						} else {
							//dying code
							this.body.stop();
							this.gun.stop();
							this.cont--;
						}
					} else {
						//fine code

						if (!this.crystal._visible) {
							if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+7.7+movelayer._y, true)) {
								this.dy = 0;
								while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+7.7-1, true)) {
									this._y--;
								}
							} else {
								this.dy += GRAV;
							}
						}
						if (this.dy>12) {
							this.dy = 12;
						}
						this._y += this.dy;
						this.gun._rotation = Math.atan2(dy, dx)/Math.PI*180;
						if (dx<0) {
							this.body._xscale = -50;
						} else {
							this.body._xscale = 50;
						}
						this.reloadtime--;
						if (this.reloadtime<0) {
							this.reloadtime = Math.round(Math.random()*16);
							bad = 55;
							var T_mc = movelayer.trackmc2.attachMovie("BaseTurretShot", "d"+depth, depth++);
							T_mc._x = this._x+Math.cos(this.gun._rotation/180*Math.PI)*-29;
							T_mc._y = this._y+Math.sin(this.gun._rotation/180*Math.PI)*-29;
							T_mc._rotation = this.gun._rotation;
							qw = T_mc._rotation/180*Math.PI;
							T_mc.dy = Math.sin(qw)*10;
							T_mc.dx = Math.cos(qw)*10;
							T_mc.damage = 1;
						}
					}
				}
			}
		}
	}
}
function howitzer() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			if (this.body._currentframe == this.body._totalframes) {
				this.unloadMovie();
			}
			if (isNaN(this.dead)) {
				this.health = 10;
				this.z = 10;
				this.scr = 0;
				this.score = 10;
				this.dy = 0;
				this.dead = 0;
				if (this.armor) {
					this.health *= 2;
					var colorTrans:ColorTransform = new ColorTransform();
					colorTrans.redOffset = -100;
					colorTrans.greenOffset = -100;
					colorTrans.blueOffset = -100;
					this.transform.colorTransform = colorTrans;
				}
				if (this.crystal._visible) {
					this.spd = 1;
					if (this.jets) {
						this.dir = 1;
						if (this.fst) {
							this.spd = 4;
						}
					}
					if (this.vjets) {
						this.vdir = 1;
						if (this.fst) {
							this.spd = 4;
						}
					}
				} else {
					this.jets = false;
					this.vjets = false;
				}
			}
			if (this.dead == 0) {
				var dx:Number = this._x-movelayer.Guy._x;
				var dy:Number = this._y-(movelayer.Guy._y-17);
				var dxy:Number = Math.sqrt(dx*dx+dy*dy);
				if (dxy<300) {
					hitgood(this);
					hitneutral(this);
					if (this.health<=0) {
						this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
						if (isNaN(this.health)) {
							this.health = this.z;
						} else {
							if (this.scr == 0) {
								killtotal++;
								this.body.play();
								var oldscore = SCORE;
								multiscore += multi;
								SCORE += this.score;

								if (this.crystal._visible) {
									SCORE += 2;
									if (this.jets) {
										SCORE += 2;
										if (this.wis) {
											SCORE++;
										}
										if (this.fst) {
											SCORE++;
										}
									}
									if (this.vjets) {
										SCORE += 2;
										if (this.wis) {
											SCORE++;
										}
										if (this.fst) {
											SCORE++;
										}
									}
									
								}
								if (this.armor) {
									SCORE += 4;
								}
								if (this.spray) {
									SCORE += 3;
								}
								multi += (SCORE-oldscore)*multiscores[equiped-1];
								this.scr += 1;
							}
						}
					}
					
					generalTurretFlight.apply(this);
					
				}
			}
		}
	}
}

function generalTurretFlight():Void{
	//crystal
	if (!this.crystal._visible) {
		if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+20+movelayer._y, true)) {
			this.dy = 0;
			while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+20-1, true)) {
				this._y--;
			}
		} else {
			this.dy += GRAV;
			if (this.dy>=12) {
				this.dy = 12;
			}
		}
		this._y += this.dy;
	}
	//jetcode           
	if (this.jets) {
		if (this.dir == 1) {
			if (movelayer.Guy._x+30>this._x && Math.abs(dx)>80) {
				if (!movelayer.platforms.hitTest(this._x+10+movelayer._x, this._y+movelayer._y, true)) {
					this._x += this.spd;
				}
			} else {
				this.dir = -1;
			}
		} else {
			if (movelayer.Guy._x-30<this._x && Math.abs(dx)>80) {
				if (!movelayer.platforms.hitTest(this._x+movelayer._x-10, this._y+movelayer._y, true)) {
					this._x -= this.spd;
				}
			} else {
				this.dir = 1;
			}
		}
		if (this.wis) {
			if (dxy<900 && Math.abs(dx)<70) {
				if (!movelayer.platforms.hitTest(this._x+movelayer._x+this.dir*-10, this._y+movelayer._y, true)) {
					this._x -= this.dir*this.spd;
				}
			}
		}
	}
	if (this.vjets) {
		if (this.vdir == 1) {
			if ((movelayer.Guy._y-17)+30>this._y && Math.abs(dy)>5) {
				if (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+20, true)) {
					this._y += this.spd;
				} else {
					this.vdir = -1;
				}
			} else {
				this.vdir = -1;
			}
		} else {
			if ((movelayer.Guy._y-17)-30<this._y && Math.abs(dy)>5) {
				if (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-10, true)) {
					this._y -= this.spd;
				} else {
					this.vdir = 1;
				}
			} else {
				this.vdir = 1;
			}
		}
		if (this.wis) {
			if (dxy<90 && Math.abs(dy)<10) {
				var vdis:Number=-10;
				if(vidir==1){
					vdis=20;
				}
				if (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+this.vdis, true)) {
					this._y -= this.vdir*this.spd;
				}
			}
		}
	}
}

function flamergun() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.reloadtime)) {
				this.reloadtime = 0;
				this._parent.isaFlamer=true;
			}
			this.reloadtime -= 1;
			var dx = this._parent._x-movelayer.Guy._x;
			var dy = this._parent._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
			//if (dxy<=300) {
				fac = -1;
				adj = 0;
				if (movelayer.Guy._x<this._parent._x) {
					aimu(this._parent._x,movelayer.Guy._x,(movelayer.Guy._y-17),0,this,this._parent._y);
					this._xscale = 100;
				} else {
					aimu(this._parent._x,movelayer.Guy._x,(movelayer.Guy._y-17),180,this,this._parent._y);
					this._xscale = -100;
					fac = 1;
					adj = 180;
				}
				if (this.reloadtime<=0) {
					this.reloadtime = 4;
					if (this._parent.spray) {
						if (Math.random()<0.5) {
							this.reloadtime = 2;
						}
					}
					if (Math.random()>=0.5) {
						var en = movelayer.trackmc3.attachMovie('exdy', "d"+cept, cept++);
					} else {
						var en = movelayer.trackmc3.attachMovie('exdr', "d"+cept, cept++);
					}
					var ran = Math.random()*10;
					if (Math.random>.5) {
						ran *= -1;
					}
					en._rotation = this._rotation+adj+ran;
					qw = en._rotation/180*Math.PI;
					en.dx = 0-Math.cos(qw)*10;
					en.dy = 0-Math.sin(qw)*10;
					en._x = this._parent._x-Math.cos(qw)*30;
					en._y = this._parent._y-Math.sin(qw)*30;
					en.spd = 10;
					en.damage = 1;
					en.side = 2;
					en.z = 1;
					if (movelayer.platforms.hitTest(en._x+movelayer._x, en._y+movelayer._y, true)) {
						en.unloadMovie();
					}
					neutral = 45;
				}
			}
		}
	}
}
function howtg() {
	if (pauseq == 0) {
		if (!paused) {
			this.reloadtime -= 1;
			var dx = this._parent._x-movelayer.Guy._x;
			var dy = this._parent._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy>400) {
					this._visible=false;
				}else{
					this._visible=true;
			//if (dxy<=400) {
				fac = -1;
				adj = 0;
				if (movelayer.Guy._x<this._parent._x) {
					aimu(this._parent._x,movelayer.Guy._x,(movelayer.Guy._y-17),0,this,this._parent._y);
					this._xscale = 100;
					if (this._rotation<15) {
						this._rotation = 15;
					}
				} else {
					aimu(this._parent._x,movelayer.Guy._x,(movelayer.Guy._y-17),180,this,this._parent._y);
					this._xscale = -100;
					fac = 1;
					adj = 180;
					if (this._rotation>=-15) {
						this._rotation = -15;
					}
				}

				if (this.reloadtime<=0) {
					bad = 55;
					this.play();
					var T_mc = movelayer.trackmc2.attachMovie("Howshot", "d"+depth, depth++);
					T_mc._x = this._parent._x+Math.cos(this._rotation/180*Math.PI)*29*fac;
					T_mc._y = this._parent._y+Math.sin(this._rotation/180*Math.PI)*29*fac;
					this.reloadtime = 30;
					T_mc._rotation = this._rotation+adj;
					qw = T_mc._rotation/180*Math.PI;
					T_mc.dy = Math.sin(qw)*10;
					T_mc.dx = Math.cos(qw)*10;
					T_mc.damage = 4;
					T_mc.spray = this._parent.spray;
					T_mc.explosive = true;
				}
			}
		}
	}
}
function btg() {
	if (pauseq == 0) {
		if (!paused) {
			this.reloadtime -= 1;
			var dx = this._parent._x-movelayer.Guy._x;
			var dy = this._parent._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy>300) {
				this._visible=false;
			}else{
				this._visible=true;
			//if (dxy<=300) {
				fac = -1;
				adj = 0;
				if(this._parent.pre){
					var factor:Number=4;
					var ex:Number=movelayer.Guy._x+movelayer.Guy.dx*factor;
					var ey:Number=(movelayer.Guy._y-17)+movelayer.Guy.dy*factor;
					if (ex<this._parent._x) {
						aimu(this._parent._x,ex,ey,0,this,this._parent._y);
						this._xscale = -100;
					} else {
						aimu(this._parent._x,ex,ey,180,this,this._parent._y);
						this._xscale = 100;
						fac = 1;
						adj = 180;
					}
				}else{
					if (movelayer.Guy._x<this._parent._x) {
						aimu(this._parent._x,movelayer.Guy._x,(movelayer.Guy._y-17),0,this,this._parent._y);
						this._xscale = -100;
					} else {
						aimu(this._parent._x,movelayer.Guy._x,(movelayer.Guy._y-17),180,this,this._parent._y);
						this._xscale = 100;
						fac = 1;
						adj = 180;
					}
				}
				if (this.reloadtime<=0) {
					this.play();
					bad = 55;
					var T_mc = movelayer.trackmc2.attachMovie("BaseTurretShot", "d"+depth, depth++);
					T_mc._x = this._parent._x+Math.cos(this._rotation/180*Math.PI)*29*fac;
					T_mc._y = this._parent._y+Math.sin(this._rotation/180*Math.PI)*29*fac;
					this.reloadtime = 11;
					T_mc._rotation = this._rotation+adj;
					qw = T_mc._rotation/180*Math.PI;
					T_mc.dy = Math.sin(qw)*10;
					T_mc.dx = Math.cos(qw)*10;
				}
			}
		}
	}
}

function arp() {
	if (pauseq == 0) {
		if (!paused) {
			var pon = {x:0, y:0};
			this.localToGlobal(pon);
			var ex = pon.x-movelayer._x;
			var ey = pon.y-movelayer._y;
			//0's opposite is 180? see rot
			var rot = (this._rotation+this._parent._rotation)*(this._parent._yscale/Math.abs(this._parent._yscale));
			if (this._parent._xscale<0) {
				rot = (rot-180)*-1;
			}
			var dx = ex-movelayer.Guy._x;
			var dy = ey-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy>600) {
				this._visible=false;
			}else{
				this._visible=true;
			//if (dxy<600) {
				mod = false;
				for (var x = molecount-good; x<=molecount; x++) {
					mcray = movelayer.trackmc["Ray_"+x];
					if (mcray != null) {
						if (mcray.equiped == 3) {
							if (!mcray.grenade) {
								var cx = ex-mcray._x;
								var cy = ey-mcray._y;
								var cxy = Math.sqrt(cx*cx+cy*cy);
								if (cxy<400) {
									var angle = Math.atan2(cy, cx)/Math.PI*180;
									var wa = tsy(angle);
									var me = tsy(rot);
									if (cx>ex) {
										if (Math.abs(wa-me)<10) {
											mod = true;
										}
									} else {
										if (this._rotation>0) {
											if (angle>0) {
												if (Math.abs(angle-rot)<10) {
													mod = true;
												}
											} else {
												if (rot+Math.abs(angle)<10) {
													mod = true;
												}
											}
										} else {
											if (angle>0) {
												if (angle+Math.abs(rot)<10) {
													mod = true;
												}
											} else {
												if (Math.abs(Math.abs(angle)-Math.abs(rot))<10) {
													mod = true;
												}
											}
										}
									}
								}
							}
						}
					}
				}
				if (mod) {
					bad = 55;
					var T_mc = movelayer.trackmc2.attachMovie("Arps", "d"+depth, depth++);
					T_mc._x = ex-Math.cos(rot/180*Math.PI)*40;
					T_mc._y = ey-Math.sin(rot/180*Math.PI)*40;
					T_mc._yscale = Math.abs(this._parent._yscale);
					T_mc._xscale = Math.abs(this._parent._yscale);
					T_mc._rotation = rot;
					qw = T_mc._rotation/180*Math.PI;
					T_mc.dy = Math.sin(rot/180*Math.PI)*10;
					T_mc.dx = Math.cos(rot/180*Math.PI)*10;
					this.unloadMovie();
				}
			}
		}
	}
}



function morph() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.oldb)) {
				this.activer = false;
				this.oldb = 1;
				this.health = 15;
			}
			if (!this.activer) {
				dx = this._x-movelayer.Guy._x;
				dy = this._y-(movelayer.Guy._y-17);
				dxy = Math.sqrt(dx*dx+dy*dy);
				if (dxy<100) {
					this.body.play();
					this._y -= 2;
				}
			} else {
				this.score = 10;
				bst.apply(this);
			}
			this.oldb = this.body._currentframe;
		}
	}
}
function bst() {
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
				this.health = 6;
				this.scr = 0;
				this.score = 5;
				this.dy = 0;
				this.reloadtime = 0;
				this.dead = 0;
				if (this.armor) {
					this.health *= 2;
					var colorTrans:ColorTransform = new ColorTransform();
					colorTrans.redOffset = -100;
					colorTrans.greenOffset = -100;
					colorTrans.blueOffset = -100;
					this.transform.colorTransform = colorTrans;
				}
				this.z = this.health;
			}
			if (this.dead == 0) {
				if (this.health<=0) {
					this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
					if (isNaN(this.health)) {
						this.health = this.z;
					} else {
						this.dead = 1;
						if (movelayer.Guy._y-27<this._y) {
							unlock(12);
						}
					}
				}
				dx = this._x-movelayer.Guy._x;
				dy = this._y-(movelayer.Guy._y-17);
				dxy = Math.sqrt(dx*dx+dy*dy);
				if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
				//if (dxy<300) {
					hitgood(this);
					hitneutral(this);
					this.reloadtime--;
					if (this.reloadtime<1) {
						this.bod.play();
						this.reloadtime = 12;
						bstfire(this._x-20.6*this.gu,this._y-15.6,this.gu,true);
					}
					if (!this.crystal._visible) {
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
							this.dy = 0;
							while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-1, true)) {
								this._y--;
							}
						} else {
							this.dy += GRAV;
							if (this.dy>=12) {
								this.dy = 12;
							}
						}
						this._y += this.dy;
					}
					if (movelayer.Guy._x>this._x) {
						this.gotoAndStop(2);
						this.gu = -1;
					} else {
						this.gotoAndStop(1);
						this.gu = 1;
						this.body.gotoAndStop(this.oldb);
					}
				}
			} else {
				this._alpha--;
				if (this._alpha<0) {
					killtotal++;
					var oldscore = SCORE;
					multiscore += multi;
					SCORE += this.score;
					if (this.crystal._visible) {
						SCORE += 2;
					}
					if (this.armor) {
						SCORE += 3;
					}
					multi += (SCORE-oldscore)*multiscores[equiped-1];
					this.unloadMovie();
				}
			}
		}
	}
}
function bstfire(ex, ey, dir, hor) {
	bad = 55;
	var T_mc = movelayer.trackmc2.attachMovie("bsts", "d"+depth, depth++);
	T_mc._x = ex;
	T_mc._y = ey;
	T_mc.mode = dir;
	T_mc.x = hor;
}
function droper() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.dead)) {
				this.health = 6;
				this.scr = 0;
				this.score = 5;
				this.dy = 0;
				this.reloadtime = 0;
				this.dead = 0;
				if (this.armor) {
					this.health *= 2;
					var colorTrans:ColorTransform = new ColorTransform();
					colorTrans.redOffset = -100;
					colorTrans.greenOffset = -100;
					colorTrans.blueOffset = -100;
					this.transform.colorTransform = colorTrans;
				}
				if (this.crystal._visible) {
					if (this.jets) {
						this.dir = 1;
					}
				} else {
					this.jets = false;
				}
				this.z = this.health;
			}
			if (this.dead == 0) {

				if (this.health<=0) {
					this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
					if (isNaN(this.health)) {
						this.health = this.z;
					} else {
						this.dead = 1;
					}
				}
				dx = this._x-movelayer.Guy._x;
				dy = this._y-(movelayer.Guy._y-17);
				dxy = Math.sqrt(dx*dx+dy*dy);
				if (dxy>350) {
					this._visible=false;
				}else{
					this._visible=true;
				//if (dxy<350) {
					hitgood(this);
					hitneutral(this);
					if ((Math.abs(dx)<40) && (dy+25<0)) {
						this.reloadtime--;
						if (this.reloadtime<1) {
							bad = 55;
							this.reloadtime = 12;
							var T_mc = movelayer.trackmc2.attachMovie("bsts", "d"+depth, depth++);
							T_mc._x = this._x;
							T_mc._y = this._y+24;
							T_mc._rotation = -90;
							T_mc.mode = -1;
							T_mc.x = false;
							T_mc.tot = 0;
							if (this.deep == -1) {
								T_mc.det = false;
								T_mc.depth = -1;
							} else {
								T_mc.det = true;
								T_mc.depth = this.deep;
							}
						}
					}
					if (!this.crystal._visible) {
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
							this.dy = 0;
							while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+1, true)) {
								this._y++;
							}
						} else {
							this.dy += GRAV;
							if (this.dy>=12) {
								this.dy = 12;
							}
						}
						this._y += this.dy;
					}
					if (this.jets) {
						if (this.dir == 1) {
							if (movelayer.Guy._x+30>this._x) {
								if (!movelayer.platforms.hitTest(this._x+10+movelayer._x, this._y+movelayer._y, true)) {
									this._x++;
								}
							} else {
								this.dir = -1;
							}
						} else {
							if (movelayer.Guy._x-30<this._x) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x-10, this._y+movelayer._y, true)) {
									this._x--;
								}
							} else {
								this.dir = 1;
							}
						}
					}
				}
			} else {
				this.body.play();
				if (this.body._currentframe == this.body._totalframes) {
					killtotal++;
					var oldscore = SCORE;
					multiscore += multi;
					SCORE += this.score;
					if (this.crystal._visible) {
						SCORE += 2;
					}
					if (this.armor) {
						SCORE += 3;
					}
					if (this.jets) {
						SCORE += 2;
					}
					multi += (SCORE-oldscore)*multiscores[equiped-1];
					this.unloadMovie();
				}
			}
		}
	}
}

function maker() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.health)) {
				this.health = 200;
				this.dead = false;
				this.z = 200;
			}
			if (this._currentframe == this._totalframes) {
				earned++;
				if (!isRewardEnabled(4) && (equiped == 1)) {
					unlock(14);
				}
				this.unloadMovie();
			}
			if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+36, true)) {
				this.dy = 0;
				while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+36-1, true)) {
					this._y--;
				}
			} else {
				this.dy += GRAV;
				if (this.dy>=12) {
					this.dy = 12;
				}
			}
			this._y += this.dy;

			var etx = this._x-movelayer.Guy._x;
			var ety = (this._y)-(movelayer.Guy._y-20);
			var etyu = Math.sqrt(etx*etx+ety*ety);
			if (etyu>300) {
					this._visible=false;
				}else{
					this._visible=true;
			//if (etyu<300) {
				hitgood(this);
				hitneutral(this);
				if (this._currentframe == 53) {
					createenemy(this);
				}
			}
			if (this.health<0) {
				this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);

				if (isNaN(this.health)) {
					this.health = 200;
				} else {
					if (!this.dead) {
						this.dead = true;
						this.gotoAndPlay(109);
					}
				}
			}
		}
	}
}
function createenemy(that) {
	var ran = Math.random();
	if (ran<.1) {
		if (Math.random()>.5) {
			var newb = movelayer.attachMovie("Guard", ""+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
			newb._x = that._x;
			newb._y = that._y+newb._height/2;
			newb._xscale = newb._yscale=200;
			newb.temp = 1;
		} else {
			var newb = movelayer.attachMovie("Warden", ""+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
			newb._x = that._x;
			newb._y = that._y+newb._height/2;
			newb._xscale = newb._yscale=200;
			newb.jmp = false;
			newb.temp = 1;
		}
	} else if (ran<.2) {
		var newb = movelayer.attachMovie("Defender", ""+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
		newb._x = that._x;
		newb._y = that._y+newb._height/2;
		newb._xscale = newb._yscale=200;
		newb.ward = randombool();
		newb.jmp = false;
		newb.temp = 1;
	} else if (ran<.3) {
		var newb = movelayer.attachMovie("badship", ""+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
		newb._x = that._x;
		newb._y = that._y+newb._height/2;
		newb._xscale = newb._yscale=100;
		newb.temp = 1;
		newb.ram = randombool();
	} else if (ran<.4) {
		var newb = movelayer.attachMovie("Tank", ""+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
		newb._x = that._x;
		newb._y = that._y+newb._height/2;
		newb._xscale = newb._yscale=200;
		newb.temp = 1;
		newb.anti = randombool();
		newb.spik = randombool();
		newb.gun._visible = randombool();
		if (that.advanced) {
			newb.gren._visible = randombool();
			newb.goon._visible = randombool();
		} else {
			newb.goon._visible = false;
			newb.gren._visible = false;
		}
	} else if (ran<.5) {
		var newb = movelayer.attachMovie("GuardDog", ""+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
		newb._x = that._x;
		newb._y = that._y+newb._height/2;
		newb._xscale = newb._yscale=100;
		newb.temp = 1;
	} else if (ran<.6) {
		var newb = movelayer.attachMovie("baseturret", ""+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
		newb._x = that._x;
		newb._y = that._y+newb._height/2;
		newb._xscale = newb._yscale=200;
		newb.temp = 1;
		newb.crystal._visible = true;
		newb.jets = true;
		newb.vjets = randombool();
		newb.armor = randombool();
		newb.wis = false;
		newb.fst = false;
	} else if (ran<.7) {
		var newb = movelayer.attachMovie("BHT", ""+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
		newb._x = that._x;
		newb._y = that._y+newb._height/2;
		newb._xscale = newb._yscale=200;
		newb.temp = 1;
		newb.crystal._visible = true;
		newb.jets = true;
		newb.vjets = randombool();
		newb.armor = randombool();
		newb.wis = false;
		newb.fst = false;
	} else if (ran<.8) {
		var newb = movelayer.attachMovie("Hail", ""+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
		newb._x = that._x;
		newb._y = that._y+newb._height/2;
		newb._xscale = newb._yscale=200;
		newb.temp = 1;
		newb.crystal._visible = true;
		newb.jets = true;
		newb.vjets = randombool();
		newb.armor = randombool();
		newb.wis = false;
		newb.fst = false;
	} else if (ran<.9) {
		var newb = movelayer.attachMovie("Flamer", ""+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
		newb._x = that._x;
		newb._y = that._y+newb._height/2;
		newb._xscale = newb._yscale=200;
		newb.temp = 1;
		newb.crystal._visible = true;
		newb.jets = true;
		newb.spray = false;
		newb.vjets = randombool();
		newb.armor = randombool();

	} else {
		var newb = movelayer.attachMovie("Suicide", ""+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
		newb._x = that._x;
		newb._y = that._y+newb._height/2;
		newb._xscale = newb._yscale=200;
		newb.temp = 1;
		newb._rotation = Math.random()*360;
		newb.aiming = true;
		newb.home = false;
	}
	/*
	if (isNaN(this.temp)) {
	this.temp = 0;
	}
	if (pauseq == 1) {
	if (this.temp == 1) {
	this.unloadMovie();
	}
	} else if (pauseq == 0) {
	*/
}

//old version
function guard() {
	//official seal of large functions
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			var etx = this._x-movelayer.Guy._x;
			var ety = (this._y-36)-(movelayer.Guy._y-20);
			var etyu = Math.sqrt(etx*etx+ety*ety);
			if (etyu>350) {
				this._visible=false;
			}else{
				this._visible=true;
			//if (etyu<=350) {
				if (isNaN(this.dead)) {
					this.scr = true;
					this.dead = 0;
					this.dy = 0;
					this.health = 15;
					this.z = 15;
					this.dir = 1;
					this.jumping = false;
					this.atkdis = 40;
					this.rt = 0;
					if (this.rang) {
						this.atkdis = 125;
						if (this.grnd) {
							this.rgt = 0;
						}
					}
					this.spd = 5;
					if (this.fast) {
						this.spd = 8;
					}
					if (this.extra) {
						this.z=this.health *= 1.5;
						var colorTrans:ColorTransform = new ColorTransform();
						colorTrans.redOffset = -50;
						colorTrans.greenOffset = -50;
						colorTrans.blueOffset = -50;
						this.transform.colorTransform = colorTrans;
					}
				}
				if (!this.rang) {
					bad = 55;
					var blop_mc = movelayer.trackmc4.attachMovie("GuardBlade", "d"+depth, depth++);
					blop_mc._y = this._y+this.gy._y*2;
					blop_mc._x = this._x+this.gy._x*4;
					blop_mc.damage = 1;
				}
				if (this.dead == 0) {
					var tweet = 0;
					var erty = this.health;
					hitgood(this);
					hitneutral(this);
					if (this.dir == 1) {
						this.prev = 1;
						if (!this.jumping) {
							if (this._currentframe == 1) {
								this.play();
							} else if (this._currentframe == 15) {
								this.gotoAndPlay(1);
							} else if (this._currentframe>=16) {
								this.gotoAndPlay(1);
							}
						} else {
							if (this._currentframe<60) {
								this.gotoAndPlay(61);
							}
							if (this._currentframe == 60 || this._currentframe == 70) {
							} else {
								this.play();
							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-60, true)) {
							if (this.dy<0) {
								this.dy = 0;
							}
						}
						if (!movelayer.platforms.hitTest(this._x+movelayer._x-15, this._y+movelayer._y-60, true)) {
							this._x -= this.spd;

						} else {
							if (!this.ward) {
								this.dir = 2;
							} else {
								this._x += this.spd;
							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
							if (this.dy>0) {
								this.dy = 0;
							}
							this.jumping = false;
							if (this.jmp) {
								if (movelayer.Guy._y<this._y-30) {
									if (this.dy == 0) {
										this.jumping = true;
										this.dy = -10;
										this.gotoAndPlay(61);
									}
								}
							}
						} else {
							this.dy += GRAV;
							cue = 1;
							while (!movelayer.platforms.hitTest(this._x+movelayer._x-5, this._y+movelayer._y-1+cue+this.dy, true)) {
								cue += 1;
							}
							if (cue<10) {
								this.dy += cue;
							}
						}
						if (this.dy>12) {
							this.dy = 12;
						}
						this._y += this.dy;
						var cue = 0;
						while (movelayer.platforms.hitTest(this._x+movelayer._x-5, this._y+movelayer._y-1+cue, true)) {
							cue -= 1;
						}
						if (cue<=-15) {
							if (!this.ward) {
								this.dir = 2;
							} else {
								this._x += this.spd;
							}
						} else {
							this._y += cue;
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x-10, this._y+movelayer._y+10, true)) {
						} else {
							if (!this.ward) {
								this.dir = 2;
							} else {
								if (!this.jumping) {
									this._x += this.spd;
								}
							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x-10, this._y+movelayer._y-10, true)) {
							if (!this.ward) {
								this.dir = 2;
							} else {
								this._x += this.spd;
							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x-10, this._y+movelayer._y-20, true)) {
							if (!this.ward) {
								this.dir = 2;
							} else {
								this._x += this.spd;
							}
						}
						var tx = this._x-movelayer.Guy._x;
						var ty = (this._y-36)-(movelayer.Guy._y-20);
						var tyu = Math.sqrt(tx*tx+ty*ty);
						if (tyu<=this.atkdis) {
							if (movelayer.Guy._x>=this._x-20) {
								this.dir = 3;
							} else {
								this.dir = 4;
							}
						}
						if (isNaN(this.health)) {
							this.health = erty;
						}
						if (this.health<=0) {
							this.gotoAndPlay(21);
							this.dir = 5;
						}
						if (this.dir == 1) {
							if (etx<0) {
								if (this.ward) {
									this.dir = 2;
								}
							}
						}
					} else if (this.dir == 2) {
						this.prev = 2;
						if (!this.jumping) {
							if (this._currentframe == 26) {
								this.play();
							} else if (this._currentframe == 40) {
								this.gotoAndPlay(26);
							} else if ((this._currentframe>=41) || (this._currentframe<=25)) {
								this.gotoAndPlay(26);
							}
						} else {
							if (this._currentframe<50) {
								this.gotoAndPlay(51);
							} else if (this._currentframe>60 && this._currentframe<70) {
								this.gotoAndPlay(this._currentframe-10);
							}
							if (this._currentframe == 60 || this._currentframe == 70) {
							} else {
								this.play();
							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-60, true)) {
							if (this.dy<0) {
								this.dy = 0;
							}
						}
						if (!movelayer.platforms.hitTest(this._x+movelayer._x+15, this._y+movelayer._y-60, true)) {
							this._x += this.spd;
						} else {
							if (!this.ward) {
								this.dir = 1;
							} else {
								this._x -= this.spd;
							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
							if (this.dy>0) {
								this.dy = 0;
							}
							this.jumping = false;
							if (this.jmp) {
								if (movelayer.Guy._y<this._y-30) {
									if (this.dy == 0) {
										this.jumping = true;
										this.dy = -10;
										this.gotoAndPlay(51);
									}
								}
							}
						} else {
							this.dy += GRAV;
							cue = 1;
							while (!movelayer.platforms.hitTest(this._x+movelayer._x+5, this._y+movelayer._y-1+cue+this.dy, true)) {
								cue += 1;
							}
							if (cue<10) {
								this.dy += cue;
							}
						}
						if (this.dy>12) {
							this.dy = 12;
						}
						this._y += this.dy;
						var cue = 0;
						while (movelayer.platforms.hitTest(this._x+movelayer._x+5, this._y+movelayer._y-1+cue, true)) {
							cue -= 1;
						}
						if (cue<=-15) {
							if (!this.ward) {
								this.dir = 1;
							} else {
								this._x -= this.spd;
							}
						} else {
							this._y += cue;
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x+10, this._y+movelayer._y+10, true)) {
						} else {
							if (!this.ward) {
								this.dir = 1;
							} else {
								if (!this.jumping) {
									this._x -= this.spd;
								}
							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x+10, this._y+movelayer._y-10, true)) {
							if (!this.ward) {
								this.dir = 1;
							} else {
								this._x -= this.spd;
							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x+10, this._y+movelayer._y-20, true)) {
							if (!this.ward) {
								this.dir = 1;
							} else {
								this._x -= this.spd;
							}
						}
						var tx = this._x-movelayer.Guy._x;
						var ty = (this._y-36)-(movelayer.Guy._y-20);
						var tyu = Math.sqrt(tx*tx+ty*ty);
						if (tyu<=this.atkdis) {
							if (movelayer.Guy._x<=this._x+20) {
								this.dir = 3;
							} else {
								this.dir = 4;
							}
						}
						if (isNaN(this.health)) {
							this.health = erty;
						}
						if (this.health<=0) {
							this.gotoAndPlay(46);
							this.dir = 5;
						}
						if (this.dir == 2) {
							if (etx>0) {
								if (this.ward) {
									this.dir = 1;
								}
							}
						}
					} else if (this.dir == 3) {
						aimu(this._x,movelayer.Guy._x,(movelayer.Guy._y-17),0,this.aim,this._y-38);
						if (tweet == 0) {
							if ((this.gy.hitTest(movelayer.THead)) || (this.gy.hitTest(movelayer.Guy))) {
								//if (checkCollision(movelayer.Guy, this.gy) || checkCollision(movelayer.THead, this.gy)) {
								damage(1);
							}
							if (this.rang) {
								this.rt--;
								if (this.rt<=0) {
									bad = 55;
									var T_mc = movelayer.trackmc2.attachMovie("Defenders", "d"+depth, depth++);
									arb = -1;
									T_mc._x = this._x+Math.cos(this.aim._rotation/180*Math.PI)*17*arb+Math.sin(this.aim._rotation/180*Math.PI)*9*arb;
									T_mc._y = this._y-38+Math.sin(this.aim._rotation/180*Math.PI)*17*arb+Math.cos(this.aim._rotation/180*Math.PI)*9*arb;
									T_mc.dx = Math.cos(this.aim._rotation/180*Math.PI)*10*arb*-1;
									T_mc.dy = Math.sin(this.aim._rotation/180*Math.PI)*10*arb*-1;
									T_mc._rotation = this.aim._rotation;
									this.rt = 11;
								}
								if (this.grnd) {
									this.rgt--;
									if (this.rgt<=0) {
										defenderGrenade.apply(this);
									}
								}
							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
							if (this.dy>0) {
								this.dy = 0;
							}
						} else {
							this.dy += GRAV;
							cue = 1;
							while (!movelayer.platforms.hitTest(this._x+movelayer._x+5, this._y+movelayer._y-1+cue+this.dy, true)) {
								cue += 1;
							}
							if (cue<5) {
								this.dy += cue;
							}
						}
						if (this.dy>12) {
							this.dy = 12;
						}
						this._y += this.dy;
						if (this._currentframe == 16) {
							this.play();
						} else if (this._currentframe == 20) {
							this.gotoAndPlay(16);
						} else if ((this._currentframe>=21) || (this._currentframe<=15)) {
							this.gotoAndPlay(16);
						}
						var tx = this._x-movelayer.Guy._x;
						var ty = (this._y-36)-(movelayer.Guy._y-20);
						var tyu = Math.sqrt(tx*tx+ty*ty);
						if (tyu<=this.atkdis) {
							if (movelayer.Guy._x>=this._x) {
								this.dir = 4;
							}
						} else {
							this.dir = this.prev;
						}
						if (isNaN(this.health)) {
							this.health = erty;
						}
						if (this.health<=0) {
							this.gotoAndStop(21);
							this.play();
							this.dir = 5;
						}
					} else if (this.dir == 4) {
						aimu(this._x,movelayer.Guy._x,(movelayer.Guy._y-17),0,this.aim,this._y-38);
						if (tweet == 0) {
							if ((this.gy.hitTest(movelayer.THead)) || (this.gy.hitTest(movelayer.Guy))) {
								//if (checkCollision(movelayer.Guy, this.gy) || checkCollision(movelayer.THead, this.gy)) {
								damage(1);
							}
							if (this.rang) {
								this.rt--;
								if (this.rt<=0) {
									bad = 55;
									var T_mc = movelayer.trackmc2.attachMovie("Defenders", "d"+depth, depth++);
									arb = -1;
									T_mc._x = this._x+Math.cos(this.aim._rotation/180*Math.PI)*17*arb+Math.sin(this.aim._rotation/180*Math.PI)*-9*arb;
									T_mc._y = this._y-38+Math.sin(this.aim._rotation/180*Math.PI)*17*arb+Math.cos(this.aim._rotation/180*Math.PI)*-9*arb;
									T_mc.dx = Math.cos(this.aim._rotation/180*Math.PI)*10*arb*-1;
									T_mc.dy = Math.sin(this.aim._rotation/180*Math.PI)*10*arb*-1;
									T_mc._rotation = this.aim._rotation;
									this.rt = 11;
								}
								if (this.grnd) {
									this.rgt--;
									if (this.rgt<=0) {
										defenderGrenade.apply(this);
									}
								}
							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
							if (this.dy>0) {
								this.dy = 0;
							}
						} else {
							this.dy += GRAV;
							cue = 1;
							while (!movelayer.platforms.hitTest(this._x+movelayer._x+5, this._y+movelayer._y-1+cue+this.dy, true)) {
								cue += 1;
							}
							if (cue<5) {
								this.dy += cue;
							}
						}
						if (this.dy>12) {
							this.dy = 12;
						}
						this._y += this.dy;
						if (this._currentframe == 41) {
							this.play();
						} else if (this._currentframe == 45) {
							this.gotoAndPlay(41);
						} else if ((this._currentframe>=46) || (this._currentframe<=40)) {
							this.gotoAndPlay(41);
						}
						if (isNaN(this.health)) {
							this.health = erty;
						}
						if (this.health<=0) {
							this.gotoAndStop(46);
							this.play();
							this.dir = 5;
						}
						var tx = this._x-movelayer.Guy._x;
						var ty = (this._y-36)-(movelayer.Guy._y-20);
						var tyu = Math.sqrt(tx*tx+ty*ty);
						if (tyu<=this.atkdis) {
							if (movelayer.Guy._x<=this._x) {
								this.dir = 3;
							}
						} else {
							this.dir = this.prev;
						}
					} else {
						this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
						this.play();
						if (this.scr) {
							killtotal++;
							this.scr = false;
							var oldscore = SCORE;
							multiscore += multi;
							SCORE += 5;
							if (this.jmp) {
								SCORE += 2;
							}
							if (this.ward) {
								SCORE += 2;
							}
							if (this.grnd) {
								SCORE += 2;
							}
							if(this.rock){
								SCORE += 2;
							}
							if (this.sc) {
								SCORE += 3;
							}
							if (this.fast) {
								SCORE += 2;
							}
							if (this.extra) {
								SCORE += 3;
							}
							multi += (SCORE-oldscore)*multiscores[equiped-1];
						}
						if (this._currentframe == 25) {
							this.unloadMovie();
							if (this.sc) {
								var po = {x:0, y:0};
								this.head.localToGlobal(po);
								po.x -= movelayer._x;
								po.y -= movelayer._y;

								var newb = movelayer.attachMovie("Suicide", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
								newb._xscale = newb._yscale=200;
								newb.temp = 1;
								newb._x = parseInt(po.x);
								newb._y = parseInt(po.y);
								newb._rotation = this.head._rotation+90;
								newb.aiming = true;
								newb.arm = true;
								newb.home = true;
							}
						} else if (this._currentframe == 50) {
							this.unloadMovie();
							if (this.sc) {
								var po = {x:0, y:0};
								this.head.localToGlobal(po);
								po.x -= movelayer._x;
								po.y -= movelayer._y;

								var newb = movelayer.attachMovie("Suicide", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
								newb._xscale = newb._yscale=200;
								newb.temp = 1;
								newb._x = parseInt(po.x);
								newb._y = parseInt(po.y);
								newb._rotation = this.head._rotation+270;
								newb.aiming = true;
								newb.arm = true;
								newb.home = true;
							}
						}
					}
				}
			}
		}
	}
}
//new version
function guardcopy() {
	//official seal of large functions
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			var etx:Number = this._x-movelayer.Guy._x;
			var ety:Number = (this._y-36)-(movelayer.Guy._y-20);
			var etyu:Number = Math.sqrt(etx*etx+ety*ety);
			if (etyu>350) {
					this._visible=false;
				}else{
					this._visible=true;
			//if (etyu<=350) {
				if (isNaN(this.dead)) {
					this.scr = true;
					this.dead = 0;
					this.dy = 0;
					this.health = 15;
					this.z = 15;
					this.dir = 1;
					this.jumping = false;
					this.atkdis = 40;
					this.rt = 0;
					if (this.rang) {
						this.atkdis = 125;
						if (this.grnd) {
							this.rgt = 0;
						}
					}
					this.spd = 5;
					if (this.fast) {
						this.spd = 8;
					}
					if (this.extra) {
						this.z=this.health *= 1.5;
						var colorTrans:ColorTransform = new ColorTransform();
						colorTrans.redOffset = -50;
						colorTrans.greenOffset = -50;
						colorTrans.blueOffset = -50;
						this.transform.colorTransform = colorTrans;
					}
				}
				if (!this.rang) {
					bad = 55;
					var blop_mc:MovieClip = movelayer.trackmc4.attachMovie("GuardBlade", "d"+depth, depth++);
					blop_mc._y = this._y+this.image.gy._y*this._yscale;
					blop_mc._x = this._x+this.image.gy._x*2*this._xscale;
					blop_mc.damage = 1;
				}
				if (this.dead == 0) {
					var tweet:Number = 0;
					hitgood(this);
					hitneutral(this);
					var dire:Number=-1;
					if(this.dir==2||this.dir==4){
						dire=1;
					}
					if (this.dir == 1 || this.dir == 2) {
						var hasTurnedAuround:Boolean=false;
						this.prev = this.dir;
						if (!this.jumping) {
							//walking
							this.gotoAndStop(1);
							if(this.dir==1){
								this._xscale=200;
							}else if(this.dir==2){
								this._xscale=-200;
							}
						} else {
							//jumping
							this.gotoAndStop(4);
							if(this.dir==1){
								this._xscale=200;
							}else if(this.dir==2){
								this._xscale=-200;
							}
						}
						//hit your head
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-60, true)) {
							if (this.dy<0) {
								this.dy = 0;
							}
						}
						//Is it ok to move forward?
						if (!movelayer.platforms.hitTest(this._x+movelayer._x+dire*15, this._y+movelayer._y-60, true)) {
							//yes
							this._x += this.spd*dire;
						} else {
							if (!this.ward) {
								if(!hasTurnedAuround){
									if(this.dir==1){
										this.dir = 2;
									}else if(this.dir==2){
										this.dir = 1;
									}
									hasTurnedAuround=true;
								}
							} else {
								//It's still a wall.
								this._x -= dire*this.spd;
							}
						}
						//I land
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
							//don't sink into the ground
							if (this.dy>0) {
								this.dy = 0;
							}
							//you are no longer jumping
							this.jumping = false;
							//Do you want to jump?
							if (this.jmp) {
								if (movelayer.Guy._y<this._y-30) {
									if (this.dy == 0) {
										this.jumping = true;
										this.dy = -10;
										this.gotoAndStop(4);
									}
								}
							}
						} else {
							//Falling
							this.dy += GRAV;
							//Used to walk down.
							var cue:Number = 1;
							while (!movelayer.platforms.hitTest(this._x+movelayer._x+dire*5, this._y+movelayer._y-1+cue+this.dy, true)) {
								cue += 1;
							}
							if (cue<5) {
								this.dy += cue;
							}
						}
						//Terminal velocity
						if (this.dy>12) {
							this.dy = 12;
						}
						//fall
						this._y += this.dy;
						//get out of the ground
						var cue:Number = 0;
						while (movelayer.platforms.hitTest(this._x+movelayer._x+dire*5, this._y+movelayer._y-1+cue, true)) {
							cue -= 1;
						}
						//That's too far, it's a wall!
						if (cue<=-7) {
							if (!this.ward) {
								if(!hasTurnedAuround){
									if(this.dir==1){
										this.dir = 2;
									}else if(this.dir==2){
										this.dir = 1;
									}
									hasTurnedAuround=true;
								}
							} else {
								//It's still to steep.
								this._x -= dire*this.spd;
							}
						} else {
							this._y += cue;
						}
						//Is there a hole in front of me?
						if (movelayer.platforms.hitTest(this._x+movelayer._x+dire*10, this._y+movelayer._y+10, true)) {
						} else {
							if (!this.ward) {
								if(!hasTurnedAuround){
									if(this.dir==1){
										this.dir = 2;
									}else if(this.dir==2){
										this.dir = 1;
									}
									hasTurnedAuround=true;
								}
							} else {
								if (!this.jumping) {
									//There's still a hole in front of me.
									this._x -= dire*this.spd;
								}
							}
						}
						
						//Another wall!
						if (movelayer.platforms.hitTest(this._x+movelayer._x+dire*10, this._y+movelayer._y-10, true)) {
							if (!this.ward) {
								if(!hasTurnedAuround){
									if(this.dir==1){
										this.dir = 2;
									}else if(this.dir==2){
										this.dir = 1;
									}
									hasTurnedAuround=true;
								}
							} else {
								//It's still a wall.
								this._x -= dire*this.spd;
							}
						}
						//Another wall!
						if (movelayer.platforms.hitTest(this._x+movelayer._x+dire*10, this._y+movelayer._y-20, true)) {
							if (!this.ward) {
								if(!hasTurnedAuround){
									if(this.dir==1){
										this.dir = 2;
									}else if(this.dir==2){
										this.dir = 1;
									}
									hasTurnedAuround=true;
								}
							} else {
								//It's still a wall.
								this._x -= dire*this.spd;
							}
						}
						//Is Zuy close enough for me to attack.
						var tx:Number = this._x-movelayer.Guy._x;
						var ty:Number = (this._y-36)-(movelayer.Guy._y-20);
						var tyu:Number = Math.sqrt(tx*tx+ty*ty);
						if (tyu<=this.atkdis) {
							if (movelayer.Guy._x>=this._x) {
								this.dir = 3;
							} else {
								this.dir = 4;
							}
						}
						//Is Zuy behind me?
						if (this.ward) {
							if(!hasTurnedAuround){
								if (etx<0&&this.dir == 1) {
									this.dir = 2;
									hasTurnedAuround=true;
								}else if(ext>0&&this.dir==2){
									this.dir=1;
									hasTurnedAuround=true;
								}
							}
						}
						//Am I dead?
						if (this.health<=0) {
							this.gotoAndPlay(21);
							this.dir = 5;
						}
					} else if (this.dir == 3 || this.dir == 4) {
						aimu(this._x,movelayer.Guy._x,(movelayer.Guy._y-17),0,this.image.aim,this._y-38);
						if (tweet == 0) {
							if ((this.gy.hitTest(movelayer.THead)) || (this.gy.hitTest(movelayer.Guy))) {
								//if (checkCollision(movelayer.Guy, this.gy) || checkCollision(movelayer.THead, this.gy)) {
								damage(1);
							}
							if (this.rang) {
								this.rt--;
								if (this.rt<=0) {
									bad = 55;
									var T_mc = movelayer.trackmc2.attachMovie("Defenders", "d"+depth, depth++);
									arb = -1;
									T_mc._x = this._x+Math.cos(this.image.aim._rotation/180*Math.PI)*17*arb+Math.sin(this.image.aim._rotation/180*Math.PI)*9*arb;
									T_mc._y = this._y-38+Math.sin(this.image.aim._rotation/180*Math.PI)*17*arb+Math.cos(this.image.aim._rotation/180*Math.PI)*9*arb;
									T_mc.dx = Math.cos(this.image.aim._rotation/180*Math.PI)*10*arb*-1;
									T_mc.dy = Math.sin(this.image.aim._rotation/180*Math.PI)*10*arb*-1;
									T_mc._rotation = this.image.aim._rotation;
									this.rt = 11;
								}
								if (this.grnd) {
									this.rgt--;
									if (this.rgt<=0) {
										defenderGrenade.apply(this);
									}
								}
							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
							if (this.dy>0) {
								this.dy = 0;
							}
						} else {
							this.dy += GRAV;
							//Used to walk down.
							var cue:Number = 1;
							while (!movelayer.platforms.hitTest(this._x+movelayer._x+dire*5, this._y+movelayer._y-1+cue+this.dy, true)) {
								cue += 1;
							}
							if (cue<5) {
								this.dy += cue;
							}
						}
						if (this.dy>12) {
							this.dy = 12;
						}
						this._y += this.dy;
						this.gotoAndStop(2);
						if(this.dir==3){
							this._xscale=200;
						}else if(this.dir==4){
							this._xscale=-200;
						}
						var tx = this._x-movelayer.Guy._x;
						var ty = (this._y-36)-(movelayer.Guy._y-20);
						var tyu = Math.sqrt(tx*tx+ty*ty);
						if (tyu<=this.atkdis) {
							if (movelayer.Guy._x>=this._x) {
								this.dir = 4;
							}else if(movelayer.Guy._x<=this._x){
								this.dir=3;
							}
						} else {
							this.dir = this.prev;
						}
						if (this.health<=0) {
							this.gotoAndStop(3);
							this.dir = 5;
						}
					} else {
						this.gotoAndStop(3);
						this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
						this.image.play();
						if (this.scr) {
							killtotal++;
							//earn points
							this.scr = false;
							var oldscore = SCORE;
							multiscore += multi;
							SCORE += 5;
							if (this.jmp) {
								SCORE += 2;
							}
							if (this.ward) {
								SCORE += 2;
							}
							if (this.grnd) {
								SCORE += 2;
							}
							if(this.rock){
								SCORE += 2;
							}
							if (this.sc) {
								SCORE += 3;
							}
							if (this.fast) {
								SCORE += 2;
							}
							if (this.extra) {
								SCORE += 3;
							}
							multi += (SCORE-oldscore)*multiscores[equiped-1];
						}
						if(this.image._currentframe==this.image._totalframes){
							this.unloadMovie();
							if(this.sc){
								//make the suicide head appear
								var po = {x:0, y:0};
								this.image.head.localToGlobal(po);
								po.x -= movelayer._x;
								po.y -= movelayer._y;
								var newb = movelayer.attachMovie("Suicide", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
								newb._xscale = newb._yscale=200;
								newb.temp = 1;
								newb._x = parseInt(po.x);
								newb._y = parseInt(po.y)
								newb._rotation = this.head._rotation+90;
								if(this._xscale<0){
									newb._rotation+=180;
								}
								newb.aiming = true;
								newb.arm = true;
								newb.home = true;
							}
						}
					}
				}
			}
		}
	}
}


function defenderGrenade() {
	bad = 55;
	if(this.rock){
		var T_mc = movelayer.trackmc2.attachMovie("TankShot", "d"+depth, depth++);
		var dx:Number = this._x-movelayer.Guy._x;
		var dy:Number = (this._y-36)-(movelayer.Guy._y-20);
		var dxy:Number = Math.sqrt(etx*etx+ety*ety);
		T_mc.explosive=true;
	}else{
		var T_mc = movelayer.trackmc2.attachMovie("Green", "d"+depth, depth++);
		T_mc.spray = false;
		T_mc.explosive = true;
	}
	var arb:Number = -1;
	var left:Number = 1;
	if (movelayer.Guy._x>this._x) {
		left = -1;
	}
	var po:Object={x:0, y:0};
	this.aim.gren.localToGlobal(po);
	T_mc._x=po.x-movelayer._x;
	T_mc._y=po.y-movelayer._y;
	T_mc.dx = Math.cos(this.aim._rotation/180*Math.PI)*10*arb*-1;
	T_mc.dy = Math.sin(this.aim._rotation/180*Math.PI)*10*arb*-1;
	T_mc._rotation = this.aim._rotation;
	
	this.rgt = 11;
}

function pyramid() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.relaod)) {
				this.health = 600;
				this.relaod = 0;
				this.timer = 0;
				this.dex = 0;
				this.dey = 0;
				this.z = 600;
				this.dead = false;
				this.px = 0;
				this.py = 0;
			}
			hitgood(this);
			hitneutral(this);
			if (this._currentframe == this._totalframes) {
				this.dead = true;
			}
			if (this.dead) {
				killtotal++;
				SCORE += 140;
				this.stop();
				WIN = 1;
			} else {
				if (this.health<0) {
					this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
					if (isNaN(this.health)) {
						this.health = this.z;
					} else {
						this.play();
					}
				}
				this.relaod--;
				this.timer--;
				if (this.timer<0) {
					this.head.gotoAndStop(2);
					if (this.timer>=-100) {
						this.head._y -= .5;
						if (movelayer.platforms.hitTest(this._x+4*this.head._x+movelayer._x, this._y+4*this.head._y+movelayer._y-7.5*4, true)) {
							this.timer = -100;
						}
						this.px = 4*this.head._x;
						this.py = 4*this.head._y;
					} else if (this.timer<=-200) {
						var dex = this.px-this.head._x*4;
						var dey = this.py-this.head._y*4;
						var angle = Math.atan2(dey, dex);
						pyramidbeam(this._x+4*this.head._x,this._y+4*this.head._y-10,angle,1,0,0);
						this.timer = 200;
						this.dex = this.head._x;
						this.dey = this.head._y+14.8;
					} else {
						var dex = (this._x+this.px)-movelayer.Guy._x;
						var dey = (this._y+this.py)-(movelayer.Guy._y-20);
						this.px -= dex/35;
						this.py -= dey/35;
						var z = movelayer.trackmc4.attachMovie("Pyramidaim", "d"+depth, depth++);
						z.damage = 0;
						z._x = this.px+this._x;
						z._y = this.py+this._y;
						z._alpha = -1*this.timer-100;
					}
				} else {
					if (this.timer>=100) {
						this.head._x -= this.dex/100;
						this.head._y -= this.dey/100;
					} else {
						this.head.gotoAndStop(1);
					}
				}
				var dx = this._x-movelayer.Guy._x;
				var dy = this._y-(movelayer.Guy._y-20);
				var dxy = Math.sqrt(dx*dx+dy*dy);
				if (dxy<200) {
					var z = movelayer.trackmc4.attachMovie("pyramidspikes", "d"+depth, depth++);
					z._x = this._x;
					z._y = this._y;
					z._xscale = z._yscale=400;
					z.gotoAndStop(Math.round(dxy/13));
					if (checkCollision(movelayer.Guy, z) || checkCollision(movelayer.THead, z)) {
						//if (movelayer.Guy.hitTest(z) || movelayer.THead.hitTest(z)) {
						damage(1);
					}
				}
			}
		}
	}
}
function spider() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.dead)) {
				this.dead = false;
				this.health = 500;
				this.dir = 1;
				this.dy = 0;
				this.z = 500;
				this.reloadtime = 10;
			}
			if (this._currentframe == this._totalframes) {
				this.dead = true;
			}
			hitgood(this);
			hitneutral(this);
			if (this.dead) {
				killtotal++;
				SCORE += 125;
				//this.unloadMovie();
				this.stop();
				this.legs.stop();
				WIN = 1;
			} else {
				if (this.health<0) {
					this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
					if (isNaN(this.health)) {
						this.health = this.z;
					} else {
						this.play();
					}
				}
				var backForth:Number=50;
				if(Math.abs(this._y-movelayer.Guy._y)>80){
					backForth=500;
				}
				
				
				if (this.dir == 1) {
					if (movelayer.Guy._x+backForth<this._x) {
						this.dir = -1;
						this._xscale = 300;
					}
				} else {
					if (movelayer.Guy._x-backForth>this._x) {
						this.dir = 1;
						this._xscale = -300;
					}
				}
				this.spd = 7;
				if (this.dy<0) {
					this.spd = 9;
				} else if (this.dy>0) {
					this.spd = 11;
				}
				this._x += this.dir*this.spd;

				if (movelayer.platforms.hitTest(this._x+movelayer._x+60*this.dir, this._y+movelayer._y-30, true)) {
					this._x -= this.dir*this.spd;
				}
				if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-40, true)) {
					this._x -= this.dir*this.spd;
				}
				if (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
					if (movelayer.platforms.hitTest(this._x+movelayer._x-this.dir*this.spd, this._y+movelayer._y-40, true)) {
						this._x -= this.dir*this.spd;
					}
					this.dy += GRAV;
				} else {
					this.dy = 0;
					if (movelayer.Guy._y+40<this._y) {
						this.dy = -13;
					}
					while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-1, true)) {
						this._y--;
					}
				}
				while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-70+this.dy, true)) {
					this.dy++;
				}
				if (this.dy>12) {
					this.dy = 12;
				}
				this._y += this.dy;
				//end of movement code
				var blah = movelayer.trackmc4.attachMovie("GuardBlade", "d"+depth, depth++);
				blah.damage = 1;
				blah._y = this._y-25;
				blah._x = this._x+35*this.dir;
				//if (checkCollision(movelayer.Guy, blah) || checkCollision(movelayer.THead, blah)) {
				if (blah.hitTest(movelayer.Guy) || blah.hitTest(movelayer.THead)) {
					damage(1);
				}
				spiderturret(this);
			}
		}
	}
}

function devilbot():Void {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.health)) {
				this.health = 200;
				this.rt = 100;
				this.dy = 0;
				this.reloadtime = 15;
				this.z = 200;
				this.down = 200;
				this.facing=-1;
			}
			var dx:Number = this._x-movelayer.Guy._x;
			var dy:Number = this._y-(movelayer.Guy._y-20);
			var d:Number = Math.sqrt(dx*dx+dy*dy);
			if (d<1600) {
				hitgood(this);
				hitneutral(this);
				var okgo:Boolean = true;
				if (this.health>0) {
					this.rt--;
					this.reloadtime--;
					this.down--;
					if (this._currentframe>30) {
						this.gotoAndPlay(1);
					}
					if(dx<=-20&&this.facing==1){
						this.facing=-1;
					}else if(this.facing==-1&&dx>20){
						this.facing=1;
					}
					if (this.facing==-1) {
						this.arm._rotation = (Math.atan2(dy, dx)/Math.PI*180+180)*-1;
						bad = 55;
						if (this.rt<=0) {
							var T_mc:MovieClip = movelayer.trackmc2.attachMovie("devilbotmissle", "d"+depth, depth++);
							T_mc._x = this._x+this.head._x+30;
							T_mc._y = this._y+this.head._y;
							this.head.play();
							this.rt = 120;
						}
						if (this.down<0) {
							this.stop();
							if (this.reloadtime<=0) {
								this.reloadtime = 5;
								this.arm.play();
								var T_mc:MovieClip = movelayer.trackmc2.attachMovie("BaseTurretShot", "d"+depth, depth++);
								T_mc._x = this._x+Math.cos(this.arm._rotation/180*Math.PI)*70;
								T_mc._y = this._y+Math.sin(this.arm._rotation/180*Math.PI)*-70;
								T_mc._rotation = this.arm._rotation*-1+180;
								qw = T_mc._rotation/180*Math.PI;
								T_mc.dy = Math.sin(qw)*10;
								T_mc.dx = Math.cos(qw)*10;
							}
							if (this.down == -100) {
								this.down = 200;
								this.play();
							}
						}
						blop = devilbothits(this, true);
						this._xscale = -100;
						if (this.down>0) {
							if (movelayer.platforms.hitTest(this._x+movelayer._x+80, this._y+movelayer._y+125, true)) {
								this.dy = 0;
								if (movelayer.platforms.hitTest(this._x+movelayer._x+80, this._y+movelayer._y, true)) {
									okgo = false;
								} else {
									while (movelayer.platforms.hitTest(this._x+movelayer._x+80, this._y+movelayer._y+125-1, true)) {
										this._y--;
									}
								}
							} else {
								this.dy += GRAV;
								if (this.dy>12) {
									this.dy = 12;
								}
							}
							if (okgo) {
								this._x += 2.5;
							}

							this._y += this.dy;
						}
					} else {
						this.arm._rotation = Math.atan2(dy, dx)/Math.PI*180;
						bad = 55;
						if (this.rt<=0) {
							this.rt = 100;
							var T_mc = movelayer.trackmc2.attachMovie("devilbotmissle", "d"+depth, depth++);
							T_mc._x = this._x+this.head._x;
							T_mc._y = this._y+this.head._y;
							this.head.play();
							T_mc.dir = -1;
						}
						if (this.down<0) {
							this.stop();
							if (this.reloadtime<=0) {
								this.reloadtime = 5;
								this.arm.play();
								var T_mc = movelayer.trackmc2.attachMovie("BaseTurretShot", "d"+depth, depth++);
								T_mc._x = this._x+Math.cos(this.arm._rotation/180*Math.PI)*-70;
								T_mc._y = this._y+Math.sin(this.arm._rotation/180*Math.PI)*-70;
								T_mc._rotation = this.arm._rotation;
								qw = T_mc._rotation/180*Math.PI;
								T_mc.dy = Math.sin(qw)*10;
								T_mc.dx = Math.cos(qw)*10;
							}
							if (this.down == -100) {
								this.down = 200;
								this.play();
							}
						}
						blop = devilbothits(this, false);
						this._xscale = 100;
						if (this.down>0) {
							if (movelayer.platforms.hitTest(this._x+movelayer._x-80, this._y+movelayer._y+125, true)) {
								this.dy = 0;
								if (movelayer.platforms.hitTest(this._x+movelayer._x-80, this._y+movelayer._y, true)) {
									okgo = false;
								} else {
									while (movelayer.platforms.hitTest(this._x+movelayer._x-80, this._y+movelayer._y+125-1, true)) {
										this._y--;
									}
								}
							} else {
								this.dy += GRAV;
								if (this.dy>12) {
									this.dy = 12;
								}
							}
							if (okgo) {
								this._x -= 2.5;
							}
							this._y += this.dy;
						}
					}

					if ((blop[0].hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y, true)) || (blop[0].hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y-30, true)) || (blop[0].hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y-60, true))) {
						damage(1);
					}
					if ((blop[1].hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y, true)) || (blop[1].hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y-30, true)) || (blop[1].hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y-60, true))) {
						damage(1);
					}
					if ((blop[2].hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y, true)) || (blop[2].hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y-30, true)) || (blop[2].hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y-60, true))) {

					}
					/*
					if (checkCollision(movelayer.Guy, blop[0]) || checkCollision(movelayer.THead, blop[0])) {
					damage(1);
					}
					if (checkCollision(movelayer.Guy, blop[1]) || checkCollision(movelayer.THead, blop[1])) {
					damage(1);
					}
					if (checkCollision(movelayer.Guy, blop[2]) || checkCollision(movelayer.THead, blop[2])) {
					damage(1);
					}
					*/ 
				} else if (isNaN(this.health)) {
					this.health = z;
				} else {
					this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
					if (this._currentframe<=30) {
						this.gotoAndPlay(31);
					}
					if (this._currentframe == this._totalframes) {
						if (equiped == 2) {
							unlock(30);
						}
						//this.unloadMovie();
						this.stop();
						killtotal++;
						var oldscore = SCORE;
						multiscore += multi;
						SCORE += 50;
						multi += (SCORE-oldscore)*multiscores[equiped-1];
						WIN = 1;
					}
				}
			}
		}
	}
}

function gravboss() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.health)) {
				this.health = 800;
				this.z = 800;
				this.dy = 0;
				this.rt = 10;
				this.reloadtime = 15;
				this.dir = 0;
				this.ydir = 0;
				this.oldx=null;
				this.oldy=null;
				this.teleportCount=80;
			}
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-20);
			var d = Math.sqrt(dx*dx+dy*dy);
			if (d<1600) {
				hitgood(this);
				hitneutral(this);
				if(this.oldx!=null){
					if(this.oldx==this._x&&this.oldy==this._y&&d>50){
						this.teleportCount--;
						if(this.teleportCount<=0){
							this._x=movelayer.Guy._x;
							this._y=(movelayer.Guy._y-30);
							this.teleportCount=80;
							this.teleporters.gotoAndStop(1);
						}else{
							this.teleporters.play();
						}
					}else{
						this.teleporters.gotoAndStop(1);
						this.teleportCount=80;
					}
				}
				this.oldx=this._x;
				this.oldy=this._y;
				var okgo = true;
				if (this.health>0) {
					this.rt--;
					this.reloadtime--;

					arb = 0;
					if (movelayer.Guy._x>this._x) {
						arb = 1;
						this._xscale = -400;
						aimz(this,movelayer.Guy._x,(movelayer.Guy._y-17),180);
					} else {
						this._xscale = 400;
						aimz(this,movelayer.Guy._x,(movelayer.Guy._y-17),0);
					}
					if (this.dir == 0 && movelayer.Guy._x-50>this._x) {
						this.dir = 1;
					} else if (this.dir == 1 && movelayer.Guy._x+50<this._x) {
						this.dir = 0;
					}
					if (this.ydir == 0 && movelayer.Guy._y-70>this._y) {
						this.ydir = 1;
					} else if (this.ydir == 1 && movelayer.Guy._y+30<this._y) {
						this.ydir = 0;
					}

					var po = {x:this.spot._x, y:this.spot._y};
					this.localToGlobal(po);
					po.x -= movelayer._x;
					po.y -= movelayer._y;

					//shoot
					if (this.reloadtime<=0) {
						bad = 55;
						var T_mc:MovieClip = movelayer.trackmc2.attachMovie("gravshot", "d"+depth, depth++);


						T_mc._x = po.x;
						T_mc.dx = Math.cos((this._rotation+180*arb)/180*Math.PI)*10;
						T_mc._y = po.y;
						T_mc.dy = Math.sin((this._rotation+180*arb)/180*Math.PI)*10;
						T_mc._rotation = Math.atan2(dy, dx)/Math.PI*180+180*arb;
						
						this.reloadtime = 13;
					}

					gravbossblade(po,this._rotation+180*arb);

					if (this.dir == 0) {
						if (!movelayer.platforms.hitTest(this._x+movelayer._x-40, this._y+movelayer._y-32, true) && !movelayer.platforms.hitTest(this._x+movelayer._x-50, this._y+movelayer._y-25, true) && !movelayer.platforms.hitTest(this._x+movelayer._x-60, this._y+movelayer._y, true) && !movelayer.platforms.hitTest(this._x+movelayer._x-50, this._y+movelayer._y+25, true) && !movelayer.platforms.hitTest(this._x+movelayer._x-40, this._y+movelayer._y+32, true)) {
							this._x -= 7;
						}
					} else if (this.dir == 1) {
						if (!movelayer.platforms.hitTest(this._x+movelayer._x+40, this._y+movelayer._y-32, true) && !movelayer.platforms.hitTest(this._x+movelayer._x+50, this._y+movelayer._y-25, true) && !movelayer.platforms.hitTest(this._x+movelayer._x+60, this._y+movelayer._y, true) && !movelayer.platforms.hitTest(this._x+movelayer._x+50, this._y+movelayer._y+25, true) && !movelayer.platforms.hitTest(this._x+movelayer._x+40, this._y+movelayer._y+32, true)) {
							this._x += 7;
						}
					}
					if (this.ydir == 0) {
						if (!movelayer.platforms.hitTest(this._x+movelayer._x-25, this._y+movelayer._y-30, true) && !movelayer.platforms.hitTest(this._x+movelayer._x-10, this._y+movelayer._y-40, true) && !movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-40, true) && !movelayer.platforms.hitTest(this._x+movelayer._x+10, this._y+movelayer._y-40, true) && !movelayer.platforms.hitTest(this._x+movelayer._x+25, this._y+movelayer._y-30, true)) {
							this._y -= 7;
						}
					} else if (this.ydir == 1) {
						if (!movelayer.platforms.hitTest(this._x+movelayer._x-25, this._y+movelayer._y+30, true) && !movelayer.platforms.hitTest(this._x+movelayer._x-10, this._y+movelayer._y+40, true) && !movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+40, true) && !movelayer.platforms.hitTest(this._x+movelayer._x+10, this._y+movelayer._y+40, true) && !movelayer.platforms.hitTest(this._x+movelayer._x+25, this._y+movelayer._y+30, true)) {
							this._y += 7;
						}
					}
				} else if (isNaN(this.health)) {
					this.health = z;
				} else {
					this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
					this.play();
					if (this._currentframe == this._totalframes) {
						this.stop();
						killtotal++;
						var oldscore = SCORE;
						multiscore += multi;
						SCORE += 175;
						multi += (SCORE-oldscore)*multiscores[equiped-1];
						WIN = 1;
					}
				}
			}
		}
	}
}

function wormboss() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.health)) {
				this.health = 1000;
				this.z = 1000;
				this.dir = 1;
			}
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-20);
			var d = Math.sqrt(dx*dx+dy*dy);
			if (d<1600) {
				hitgood(this);
				hitneutral(this);
				var okgo = true;
				if (this.health>0) {
					//move
					if (movelayer.Guy._x<this._x) {
						if (movelayer.Guy._x<this._x-160) {
							this.dir = -1;
						} else {
							this.dir = 1;
						}
					} else if (movelayer.Guy._x>this._x) {
						if (movelayer.Guy._x>this._x+160) {
							this.dir = 1;
						} else {
							this.dir = -1;
						}
					}
					if (!movelayer.platforms.hitTest(movelayer._x+this._x+180*this.dir, movelayer._y+this._y-20, true)) {
						this._x += this.dir*5;
					} else {
						this.dir *= -1;
					}
					//attack
					wormbossMouths(this);
				} else if (isNaN(this.health)) {
					this.health = z;
				} else {
					this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
					this.play();
					if (this._currentframe == this._totalframes) {
						this.stop();
						killtotal++;
						var oldscore = SCORE;
						multiscore += multi;
						SCORE += 200;
						multi += (SCORE-oldscore)*multiscores[equiped-1];
						WIN = 1;
					}
				}
			}
		}
	}
}

function staticturret() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.health)) {
				this.health = 6;
				this.reloadtime = 0;
				this.fac = -1;
				this.adj = 0;
				this.score = 3;
				if (Math.abs(this._rotation)>90) {
					this.gotoAndStop(2);
				} else {
					this.gotoAndStop(1);
				}
				if (this.armor) {
					this.health *= 2;
					var colorTrans:ColorTransform = new ColorTransform();
					colorTrans.redOffset = -100;
					colorTrans.greenOffset = -100;
					colorTrans.blueOffset = -100;
					this.transform.colorTransform = colorTrans;
				}
				this.z = this.health;
			}
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
			//if (dxy<300) {
				hitgood(this);
				hitneutral(this);
				if (this.health<=0) {
					killtotal++;
					this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
					var oldscore = SCORE;
					multiscore += multi;
					SCORE += this.score;
					if (this.armor) {
						SCORE += 3;
					}
					multi += (SCORE-oldscore)*multiscores[equiped-1];
					explosion(this._x,this._y,1,5,3,2,2);
					this.unloadMovie();
				} else {
					this.reloadtime--;
					this.mod = false;
					var angle = Math.atan2(dy, dx)/Math.PI*180;
					var wa = tsy(angle);
					var me = tsy(this._rotation);
					if (movelayer.Guy._x>this._x) {
						if (Math.abs(wa-me)<15) {
							this.mod = true;
						}
					} else {
						if (this._rotation>0) {
							if (angle>0) {
								if (Math.abs(angle-this._rotation)<15) {
									this.mod = true;
								}
							} else {
								if (this._rotation+Math.abs(angle)<15) {
									this.mod = true;
								}
							}
						} else {
							if (angle>0) {
								if (angle+Math.abs(this._rotation)<15) {
									this.mod = true;
								}
							} else {
								if (Math.abs(Math.abs(angle)-Math.abs(this._rotation))<15) {
									this.mod = true;
								}
							}
						}
					}
					if (this.mod) {
						if (this.reloadtime<0) {
							bad = 55;
							this.bod.play();
							var T_mc = movelayer.trackmc2.attachMovie("StaticShot", "d"+depth, depth++);
							T_mc._x = this._x+Math.cos(this._rotation/180*Math.PI)*29*this.fac;
							T_mc._y = this._y+Math.sin(this._rotation/180*Math.PI)*29*this.fac;
							this.reloadtime = 11;
							T_mc._rotation = this._rotation+this.adj;
							qw = T_mc._rotation/180*Math.PI;
							T_mc.dy = Math.sin(qw)*10;
							T_mc.dx = Math.cos(qw)*10;
						}
					}
				}
			}
		}
	}
}
function suicide() {
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.mod)) {
				this.mod = false;
				this.health = 6;
				this.z = 6;
			}
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
			//if (dxy<300) {
				hitgood(this);
				hitneutral(this);
				if (this.health<=0) {
					killtotal++;
					this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
					unlock(5);
					SCORE++;
					explosion(this._x,this._y,1,10,10,2,2);
					this.unloadMovie();
				} else {
					if (!this.mod) {
						var angle = Math.atan2(dy, dx)/Math.PI*180;
						var wa = tsy(angle);
						var me = tsy(this._rotation);
						if (movelayer.Guy._x>this._x) {
							if (Math.abs(wa-me)<10) {
								this.mod = true;
							}
						} else {
							if (this._rotation>0) {
								if (angle>0) {
									if (Math.abs(angle-this._rotation)<10) {
										this.mod = true;
									}
								} else {
									if (this._rotation+Math.abs(angle)<10) {
										this.mod = true;
									}
								}
							} else {
								if (angle>0) {
									if (angle+Math.abs(this._rotation)<10) {
										this.mod = true;
									}
								} else {
									if (Math.abs(Math.abs(angle)-Math.abs(this._rotation))<10) {
										this.mod = true;
									}
								}
							}
						}
						if (this.aiming) {
							var r = 0;
							if (Math.abs(wa-me)>2) {
								if ((me+180<wa) || (wa<me)) {
									if (wa+180<me) {
										var r = 2;
									} else {
										var r = -2;
									}
								} else {
									var r = 2;
								}
							} else {
								var r = wa-me;
							}
							this._rotation += r;
						}
					} else {
						var angle = Math.atan2(dy, dx)/Math.PI*180;
						var wa = tsy(angle);
						var me = tsy(this._rotation);
						if (this.aiming && this.home) {
							var r = 0;
							if (Math.abs(wa-me)>2) {
								if ((me+180<wa) || (wa<me)) {
									if (wa+180<me) {
										var r = 2;
									} else {
										var r = -2;
									}
								} else {
									var r = 2;
								}
							} else {
								var r = wa-me;
							}
							this._rotation += r;
						}
						this._x -= Math.cos(this._rotation/180*Math.PI)*10;
						this._y -= Math.sin(this._rotation/180*Math.PI)*10;
						if (this.arm) {
							var blop_mc = movelayer.trackmc4.attachMovie("GuardBlade", "d"+depth, depth++);
							blop_mc._xscale = blop_mc._yscale=25;
							var rotr = this._rotation/180*Math.PI;
							blop_mc._y = this._y+Math.sin(rotr)*-20;
							blop_mc._x = this._x+Math.cos(rotr)*-20;
							blop_mc.damage = 1;
							bad = 55;
						}
						if ((movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) || (checkCollision(movelayer.Guy, this) || checkCollision(movelayer.THead, this))) {
							explosion(this._x,this._y,1,10,10,2,2);
							this.unloadMovie();
						}
					}
				}
			}
		}
	}
}
function roller() {
	if (pauseq == 0) {
		if (!paused) {
			if (this.body._currentframe == this.body._totalframes) {
				this.unloadMovie();
			}
			if (isNaN(this.dead)) {
				this.dead = 0;
				this.health = 10;
				this.scr = 0;
				this.score = 10;
				this.dy = 0;
				this.reloadtime = 0;
				if (this.armor) {
					this.health *= 2;
					var colorTrans:ColorTransform = new ColorTransform();
					colorTrans.redOffset = -100;
					colorTrans.greenOffset = -100;
					colorTrans.blueOffset = -100;
					this.transform.colorTransform = colorTrans;
				}
				this.z = this.health;
			}
			if (this.dead == 0) {
				var dx = this._x-movelayer.Guy._x;
				var dy = this._y-(movelayer.Guy._y-17);
				var dxy = Math.sqrt(dx*dx+dy*dy);
				if (dxy>300) {
					this._visible=false;
					this.z = this.health;
				}else{
					this._visible=true;
				//if (dxy<300) {
					hitgood(this);
					hitneutral(this);
					if (this.health<=0) {
						this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
						if (isNaN(this.health)) {
							this.health = this.z;
						} else {
							if (this.scr == 0) {
								killtotal++;
								this.body.play();
								var oldscore = SCORE;
								multiscore += multi;
								SCORE += this.score;
								if (this.crystal._visible) {
									SCORE += 2;
								}
								if (this.armor) {
									SCORE += 3;
								}
								if (this.ball) {
									SCORE += 1;
								}
								if (this.flo) {
									SCORE += 2;
								}
								multi += (SCORE-oldscore)*multiscores[equiped-1];
								this.scr += 1;
							}
						}
					} else {
						if (movelayer.Guy._x>this._x) {
							this.gotoAndStop(2);
							this.gu = 1;
						} else {
							this.gotoAndStop(1);
							this.gu = -1;
						}
						if (dxy<300) {
							this.reloadtime--;
							if (this.reloadtime<1) {
								this.reloadtime = 25;
								if (!movelayer.platforms.hitTest(this._x+20*this.gu+movelayer._x, movelayer._y+this._y-5, true) && !movelayer.platforms.hitTest(this._x+25*this.gu+movelayer._x, movelayer._y+this._y-5, true)) {
									bad = 90;
									var T_mc = movelayer.trackmc2.attachMovie("rollershot", "d"+depth, depth++);
									T_mc.ball = this.ball;
									T_mc._x = this._x+15*this.gu;
									T_mc._y = this._y-3;
									T_mc.flo = this.flo;
									T_mc.dir = this.gu;
								}
							}
						}
					}
				}
				if (!this.crystal._visible) {
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
}
function breakablecannone() {
	//bht
	if (isNaN(this.temp)) {
		this.temp = 0;
	}
	if (pauseq == 1) {
		if (this.temp == 1) {
			this.unloadMovie();
		}
	} else if (pauseq == 0) {
		if (!paused) {
			if (this.body._currentframe == this.body._totalframes) {
				this.unloadMovie();
			}
			if (isNaN(this.dead)) {
				this.dead = 0;
				this.health = 6;
				this.scr = 0;
				this.score = 5;
				this.dy = 0;
				if (this.armor) {
					this.health *= 2;
					var colorTrans:ColorTransform = new ColorTransform();
					colorTrans.redOffset = -100;
					colorTrans.greenOffset = -100;
					colorTrans.blueOffset = -100;
					this.transform.colorTransform = colorTrans;
				}
				if (this.crystal._visible) {
					this.spd = 1;
					if (this.jets) {
						this.dir = 1;
						if (this.fst) {
							this.spd = 4;
						}
					}
					if (this.vjets) {
						this.vdir = 1;
						if (this.fst) {
							this.spd = 4;
						}
					}
				} else {
					this.vjets = false;
					this.jets = false;
				}
				this.z = this.health;
			}
			if (this.dead == 0) {
				var dx = this._x-movelayer.Guy._x;
				var dy = this._y-(movelayer.Guy._y-17);
				var dxy = Math.sqrt(dx*dx+dy*dy);
				if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
				//if (dxy<300) {
					hitgood(this);
					hitneutral(this);
					if (this.health<=0) {
						this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
						if (isNaN(this.health)) {
							this.health = this.z;
						} else {
							if (this.scr == 0) {
								killtotal++;
								this.body.play();
								var oldscore = SCORE;
								multiscore += multi;
								SCORE += this.score;
								if (this.crystal._visible) {
									SCORE += 2;
									if (this.jets) {
										SCORE += 3;
										if (this.wis) {
											SCORE++;
										}
										if (this.fst) {
											SCORE++;
										}
									}
									if (this.vjets) {
										SCORE += 3;
										if (this.wis) {
											SCORE++;
										}
										if (this.fst) {
											SCORE++;
										}
									}
								}
								if (this.hm) {
									SCORE += 3;
								}
								if (this.armor) {
									SCORE += 3;
								}
								multi += (SCORE-oldscore)*multiscores[equiped-1];
								this.scr += 1;
							}
						}
					}
					if (!this.crystal._visible) {
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+8, true)) {
							this.dy = 0;
							while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+8-1, true)) {
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
					//jetcode           
					if (this.jets) {
						if (this.dir == 1) {
							if (movelayer.Guy._x+30>this._x) {
								if (!movelayer.platforms.hitTest(this._x+10+movelayer._x, this._y+movelayer._y, true)) {
									this._x += this.spd;
								}
							} else {
								this.dir = -1;
							}
						} else {
							if (movelayer.Guy._x-30<this._x) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x-10, this._y+movelayer._y, true)) {
									this._x -= this.spd;
								}
							} else {
								this.dir = 1;
							}
						}
						if (this.wis) {
							if (dxy<100 && dx<90) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x+this.dir*-10, this._y+movelayer._y, true)) {
									this._x -= 2*this.dir*this.spd;
								}
							}
						}
					}
					if (this.vjets) {
						if (this.vdir == 1) {
							if ((movelayer.Guy._y-17)+30>this._y) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+10, true)) {
									this._y += this.spd;
								} else {
									this.vdir = -1;
								}
							} else {
								this.vdir = -1;
							}
						} else {
							if ((movelayer.Guy._y-17)-30<this._y) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-10, true)) {
									this._y -= this.spd;
								} else {
									this.vdir = 1;
								}
							} else {
								this.vdir = 1;
							}
						}
						if (this.wis) {
							if (dxy<100 && dy<90) {
								if (!movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+this.vdir*-10, true)) {
									this._y -= 2*this.vdir*this.spd;
								}
							}
						}
					}
				}
			}
		}
	}
}

function btge() {
	if (pauseq == 0) {
		if (!paused) {
			this.reloadtime -= 1;
			var dx = this._parent._x-movelayer.Guy._x;
			var dy = this._parent._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (dxy>300) {
					this._visible=false;
				}else{
					this._visible=true;
			//if (dxy<=300) {
				if (movelayer.Guy._x<this._parent._x) {
					aimu(this._parent._x,movelayer.Guy._x,(movelayer.Guy._y-17),180,this,this._parent._y);
					this._xscale = -100;
				} else {
					aimu(this._parent._x,movelayer.Guy._x,(movelayer.Guy._y-17),0,this,this._parent._y);
					this._xscale = 100;
				}
				if (this.reloadtime<=0) {
					this.play();
					bad = 55;
					var T_mc = movelayer.trackmc2.attachMovie("bhtshot", "d"+depth, depth++);
					arb = 1;
					if (movelayer.Guy._x>this._x+this._parent._x) {
						arb = -1;
					}
					T_mc.hm = this._parent.hm;
					T_mc._x = this._parent._x+Math.cos(this._rotation/180*Math.PI)*25*arb;
					T_mc._y = this._parent._y+Math.sin(this._rotation/180*Math.PI)*25*arb;
					T_mc._rotation = Math.atan2(dy, dx)/Math.PI*180;
					this.reloadtime = 13;
				}
			}
		}
	}
}






//bullet onenterframe callbacks
function evilBulletHit(flamable:Boolean, destoryable:Boolean):Boolean {
	if (flamable == null) {
		flamable = false;
	}
	if (destroyable == null) {
		destroyable = true;
	}
	var dead:Boolean = false;
	if (destroyable && movelayer.trackmc.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
		dead = true;
	} else if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
		dead = true;
		/*}else if (checkCollision(movelayer.Guy, this) || checkCollision(movelayer.THead, this)) {
		damage(this.damage);
		removeMovieClip(this);*/
	} else if (movelayer.Guy.hitTest(this._x+movelayer._x, this._y+movelayer._y, true) || movelayer.THead.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
		if(isNaN(this.damage)){
			trace(this+" delt null damage to Zuy.");
		}else{
			damage(this.damage);
		}
		dead = true;
	} else if (this._currentframe == this._totalframes) {
		dead = true;
	}
	if (flamable) {
		if (movelayer.trackmc3.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
			dead = true;
		}
	}
	return dead;
}

function wormshot() {
	if (pauseq == 0) {
		if (!paused) {
			//not flamable
			var dead:Boolean = evilBulletHit.apply(this, new Array(false, false));
			if (dead) {
				removeMovieClip(this);
			} else {
				//run code
				this._x -= this.dx;
				this._y -= this.dy;
			}
		}
	}
}

function aim2() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.cold)) {
				this.cold = 0;
			}
			//not flamable 
			var dead:Boolean = evilBulletHit.apply(this, new Array(false));
			if (dead) {
				removeMovieClip(this);
			} else {
				//run code
				this._x -= this.dx;
				this._y -= this.dy;
				if (this.cold == 1) {
					if (neutral>=1) {
						for (var x = cept-neutral; x<=cept; x++) {
							mcray3 = movelayer.trackmc3["d"+x];
							if (mcray3 != null) {
								if (mcray3.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
									this.damage--;
									removeMovieClip("mcray3");
								}
							}
						}
					}
				}
				//done code 
			}
		}
	}
}
function gravshot() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.cold)) {
				this.cold = 0;
			}
			//not flamable 
			var dead:Boolean = evilBulletHit.apply(this, new Array(false));
			if (dead) {
				removeMovieClip(this);
			} else {
				//run code
				if (movelayer.Guy._y>this._y) {
					this.vdir = -1;
				} else {
					this.vdir = 1;
				}
				this.dy += this.vdir*GRAV;
				if (this.dy>12) {
					this.dy = 12;
				}
				if (this.dy<=-12) {
					this.dy = -12;
				}
				this._x -= this.dx;
				this._y -= this.dy;
				//done code
			}
		}
	}
}


function tankshot() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.homming)) {
				this.homming = 0;
			}
			//flamable 
			var dead:Boolean = evilBulletHit.apply(this, new Array(true));
			if (dead) {
				if (this.explosive) {
					explosion(this._x+this.dx,this._y+this.dy,1,10,10,2,2);
				}
				removeMovieClip(this);
			} else {
				//run code
				if (this.homming>=1) {
					var dx = this._x-movelayer.Guy._x;
					var dy = this._y-(movelayer.Guy._y-17);
					var angle = Math.atan2(dy, dx)/Math.PI*180;
					if (this.homming == 2) {
						this._rotation = angle;
						this.dx = Math.cos(this._rotation/180*Math.PI)*10;
						this.dy = Math.sin(this._rotation/180*Math.PI)*10;
					} else {
						var mi = tsy(this._rotation);
						var wa = tsy(angle);
						if (Math.abs(wa-mi)>15) {
							if ((mi+180<wa) || (wa<mi)) {
								if (wa+180<mi) {
									var r = 15;
								} else {
									var r = -15;
								}
							} else {
								var r = 15;
							}
						} else {
							var r = wa-mi;
						}
						this._rotation += r;
						this.dx = Math.cos(this._rotation/180*Math.PI)*10;
						this.dy = Math.sin(this._rotation/180*Math.PI)*10;
					}
				}
				this._x -= this.dx;
				this._y -= this.dy;
				//done code
			}
		}
	}
}

function badshipbomb() {
	if (pauseq == 0) {
		if (!paused) {
			//flamable
			var dead:Boolean = evilBulletHit.apply(this, new Array(true));
			if (dead) {
				explosion(this._x,this._y-15,this.radius,this.plows,this.spd,2,2);
				removeMovieClip(this);
			} else {
				//run code
				this._y += 10;
				if(this.sbomb){
					var dx:Number=this._x-movelayer.Guy._x;
					if(Math.abs(dx)<5){
					}else if(dx<0){
						this._x+=4;
					}else{
						this._x-=4;
					}
				}
				//done code
			}
		}
	}
}

function badshipmissle() {
	if (pauseq == 0) {
		if (!paused) {
			//not flamable
			var dead:Boolean = evilBulletHit.apply(this, new Array(false));
			if (dead) {
				removeMovieClip(this);
			} else {
				//run code
				if (this._currentframe<10) {
					this._y += 10;
				} else {
					aimz(this,movelayer.Guy._x,(movelayer.Guy._y-17),0);
					this.dy = aimy(this, movelayer.Guy._x, (movelayer.Guy._y-17), 10);
					this.dx = aimx(this, movelayer.Guy._x, (movelayer.Guy._y-17), 10);
					this._x -= this.dx;
					this._y -= this.dy;
				}
				//end code
			}
		}
	}
}

function bsts() {
	if (pauseq == 0) {
		if (!paused) {
			//not flamable
			var dead:Boolean = evilBulletHit.apply(this, new Array(false));
			if (dead) {
				removeMovieClip(this);
			} else {
				//run code
				if (this.x) {
					if (this.mode == -1) {
						this._xscale = -100;
						this._x += 10;
					} else {
						this._x -= 10;
					}
				} else {
					if (this.mode == -1) {
						this._yscale = -100;
						this._y += 10;
						this.tot += 10;
						if (this.det) {
							if (this.tot>this.depth) {
								explosion(this._x,this._y,1,10,10,2,2);
								removeMovieClip(this);
							}
						}
					} else {
						this._y -= 10;
					}
				}
				//end code
			}
		}
	}
}

function gb() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.dead)) {
				this.dead = true;
			} else {
				removeMovieClip(this);
			}
		}
	}
}

function devilbotmissle() {
	if (pauseq == 0) {
		if (!paused) {
			//not flamable
			var dead:Boolean = evilBulletHit.apply(this, new Array(false));
			if (dead) {
				removeMovieClip(this);
			} else {
				aimz(this,movelayer.Guy._x,(movelayer.Guy._y-17),0);
				this.dy = aimy(this, movelayer.Guy._x, (movelayer.Guy._y-17), 10);
				this.dx = aimx(this, movelayer.Guy._x, (movelayer.Guy._y-17), 10);
				this._x -= this.dx;
				this._y -= this.dy;
			}
		}
	}
}


function shipbossshot() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.gone)) {
				this.gone = false;
				this.auto = 20;
				this.damage = 10;
			}
			//not flamable 
			var dead:Boolean = evilBulletHit.apply(this, new Array(false));
			if (dead) {
				//peculuar
				if (!this.gone) {
					if (movelayer.Guy.hitTest(this._x+movelayer._x, this._y+movelayer._y, true) || movelayer.THead.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.gone = true;
						this.visible = false;
						this._x = 2000;
					} else {
						removeMovieClip(this);
					}
				}
			} else {
				//run code
				if (!this.gone) {
					this._x -= this.dx;
					this._y -= this.dy;
				} else {
					this.auto--;
					damage(1);
					if (this.auto<=0) {
						removeMovieClip(this);
					}
				}
				//end code
			}
		}
	}
}

function rollerball() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.dy)) {
				this.damage=0;
				this.dy = 0;
				this.dead=false;
			}
			//flamable 
			var deade:Boolean = evilBulletHit.apply(this, new Array(true));
			if (deade) {
				explosion(this._x,this._y-10,1,10,10,2,2);
				removeMovieClip(this);
			} else {
				//run code
				this._x += this.dir*10;
				var count = 0;
				if (!this.ball) {
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+3, true)) {
						this.dy = 0;
						while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-1+3, true)) {
							this._y--;
							count++;
						}
						if (count>15) {
							this._y += count;
							this.dead = true;
						}
					} else {
						this.dy += GRAV;
					}
				} else {
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-3, true)) {
						this.dy = 0;
						while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+1-3, true)) {
							this._y++;
							count++;
						}
						if (count>15) {
							this._y -= count;
							this.dead = true;
						}
					} else {
						this.dy -= GRAV;
					}
				}
				if (this.dy>12) {
					this.dy = 12;
				}
				if (this.dy<=-12) {
					this.dy = -12;
				}
				this._y += this.dy;
				if (this.flo) {
					if ((this._x>movelayer.Guy._x+30 && this.dir == 1) || (this._x<movelayer.Guy._x-30 && this.dir == -1)) {
						this.dir *= -1;
					}
				}
				//die
				if(this.dead){
					explosion(this._x,this._y-10,1,10,10,2,2);
					removeMovieClip(this);
				}
				//end code 
			}
		}
	}
}

function aim3() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.yad)) {
				this.yad = 0;
			}
			//nont flamable 
			var dead:Boolean = evilBulletHit.apply(this, new Array(false));
			if (dead) {
				removeMovieClip(this);
			} else {
				//run code

				var dx = this._x-movelayer.Guy._x;
				var dy = this._y-(movelayer.Guy._y-17+this.yad);
				var angle = Math.atan2(dy, dx)/Math.PI*180;
				if (this.hm) {
					this._rotation = angle;
					this.dx = Math.cos(this._rotation/180*Math.PI)*8;
					this.dy = Math.sin(this._rotation/180*Math.PI)*8;
				} else {
					var mi = tsy(this._rotation);
					var wa = tsy(angle);
					if (Math.abs(wa-mi)>15) {
						if ((mi+180<wa) || (wa<mi)) {
							if (wa+180<mi) {
								var r = 15;
							} else {
								var r = -15;
							}
						} else {
							var r = 15;
						}
					} else {
						var r = wa-mi;
					}
					this._rotation += r;
					this.dx = Math.cos(this._rotation/180*Math.PI)*8;
					this.dy = Math.sin(this._rotation/180*Math.PI)*8;
				}

				this._x -= this.dx;
				this._y -= this.dy;
				//end code
			}
		}
	}
}

//energy weapon creation function

function gravbossblade(po, rot) {
	bad = 55;
	var blop_mc = movelayer.trackmc4.attachMovie("gravblade", "d"+depth, depth++);
	blop_mc.damage = 1;
	blop_mc._y = po.y;
	blop_mc._x = po.x;
	blop_mc._rotation = rot;
	if ((movelayer.Guy.hitTest(blop_mc)) || (movelayer.THead.hitTest(blop_mc))) {
		damage(1);
	}
}


function ramblade(a) {
	bad = 55;
	var blop_mc = movelayer.trackmc4.attachMovie("ramshipblade", "d"+depth, depth++);
	blop_mc.damage = 1;
	blop_mc._y = a._y;
	blop_mc._x = a._x;
	blop_mc._rotation = a._rotation;

	//if (checkCollision(movelayer.Guy, blop_mc) || checkCollision(movelayer.THead, blop_mc)) {
	if ((movelayer.Guy.hitTest(blop_mc)) || (movelayer.THead.hitTest(blop_mc))) {
		damage(1);
	}
}

function tankspikes(a) {
	bad = 55;
	var blop_mc = movelayer.trackmc4.attachMovie("tankblader", "d"+depth, depth++);
	blop_mc.damage = 1;
	blop_mc._y = a._y;
	blop_mc._x = a._x;
	blop_mc._xscale = a._xscale/Math.abs(a._xscale)*100;
	blop_mc._rotation = a._rotation;
	//if (checkCollision(movelayer.Guy, blop_mc) || checkCollision(movelayer.THead, blop_mc)) {
	if ((movelayer.Guy.hitTest(blop_mc)) || (movelayer.THead.hitTest(blop_mc))) {
		damage(1);
	}
}

function dragonclawspot(a, b, c) {
	var en = movelayer.trackmc4.attachMovie("dhbc", "d"+depth, depth++);
	en.damage = 1;
	en._rotation = a;
	en._x = b;
	en._y = c;
	if ((movelayer.Guy.hitTest(en)) || (movelayer.THead.hitTest(en))) {
		//if (checkCollision(movelayer.Guy, en) || checkCollision(movelayer.THead, en)) {
		damage(1);
	}
}
function dragontailspot(a, b, c) {
	var en = movelayer.trackmc4.attachMovie("dth", "d"+depth, depth++);

	en.damage = 1;
	en._rotation = a;
	en._x = b;
	en._y = c;
	if ((movelayer.Guy.hitTest(en)) || (movelayer.THead.hitTest(en))) {
		//if (checkCollision(movelayer.Guy, en) || checkCollision(movelayer.THead, en)) {
		damage(1);
	}
}

function wormbossMouths(a) {
	var blop_mc = movelayer.trackmc4.attachMovie("GuardBlade", "d"+depth, depth++);
	blop_mc._y = a._y-20;
	blop_mc._x = a._x-150;
	blop_mc.damage = 1;
	bad = 55;
	if ((blop_mc.hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y, true)) || (blop_mc.hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y-30, true)) || (blop_mc.hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y-60, true))) {
		damage(1);
	}
	var blop_mce = movelayer.trackmc4.attachMovie("GuardBlade", "d"+depth, depth++);
	blop_mce._y = a._y-20;
	blop_mce._x = a._x+150;
	blop_mce.damage = 1;
	bad = 55;
	if ((blop_mce.hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y, true)) || (blop_mce.hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y-30, true)) || (blop_mce.hitTest(movelayer._x+movelayer.Guy._x, movelayer._y+movelayer.Guy._y-60, true))) {
		damage(1);
	}
}

function pyramidbeam(a, b, c, d, e, f) {
	var n = 1;
	while (true) {
		var xi = Math.cos(c)*(f+n*8)*d;
		var yi = Math.sin(c)*(f+n*8)*d;
		var z = movelayer.trackmc4.attachMovie("Pyramidray", "d"+depth, depth++);
		z._x = a+xi;
		z._y = b+yi;
		z.damage = 5;
		if (movelayer.Guy.hitTest(z) || movelayer.THead.hitTest(z)) {
			//if (checkCollision(movelayer.Guy, z) || checkCollision(movelayer.THead, z)) {
			damage(5);
		}
		z.health = Number.POSITIVE_INFINITY+1;
		z.gotoAndStop(85);
		z.play();
		z._rotation = c/Math.PI*180+e;
		if (movelayer.platforms.hitTest(z._x+movelayer._x, z._y+movelayer._y, true)) {
			break;
		}
		if (n>100) {
			break;
		}
		n++;
	}
	bad = n+40;
	//#sound
	addSound(assetContainer.getSound("Pow"),"Pow",1);
}

function spiderturret(a) {
	var ex = a._x+a.gun._x*3*a.dir;
	var ey = a._y+a.gun._y*3;
	var dx = ex-movelayer.Guy._x;
	var dy = ey-(movelayer.Guy._y-35);
	var angle = Math.atan2(dy, dx)/Math.PI*180;
	if (a.dir == 1) {
		a.gun._rotation = 360+(180-angle);
	} else {
		a.gun._rotation = angle;
	}
	a.reloadtime--;
	if (a.reloadtime<0) {
		a.reloadtime = 20;
		bad = 55;
		//#sound
		addSound(assetContainer.getSound("Bang"),"Bang",1);
		for (b=-5; b<10; b += 5) {
			var T_mc = movelayer.trackmc2.attachMovie("spidershot", "d"+depth, depth++);
			T_mc._x = ex-Math.cos((angle)/180*Math.PI)*32;
			T_mc._y = ey-Math.sin((angle)/180*Math.PI)*32;
			T_mc._rotation = angle+b;
			qw = T_mc._rotation/180*Math.PI;
			T_mc.dy = Math.sin(qw)*10;
			T_mc.dx = Math.cos(qw)*10;
		}
	}
}


function devilbothits(a, b) {
	var holder = new Array(3);
	var val = 1;
	var bo = 0;
	if (b) {
		bo = 180;
		val = -1;
	}

	var blop_mc = movelayer.trackmc4.attachMovie("devilbothandhit", "d"+depth, depth++);
	blop_mc._y = a._y;
	blop_mc._x = a._x;
	blop_mc.damage = 1;
	blop_mc._rotation = val*(a.arm._rotation+bo);
	var blop_mce = movelayer.trackmc4.attachMovie("devilbotfoo", "d"+depth, depth++);
	blop_mce._x = a._x+a.f1._x*val;
	blop_mce._y = a._y+a.f1._y;

	blop_mce.damage = 1;
	var blop_me = movelayer.trackmc4.attachMovie("devilbotfoo", "d"+depth, depth++);
	blop_me._x = a._x+a.f2._x*val;
	blop_me._y = a._y+a.f2._y;

	blop_me.damage = 1;
	if (b) {
		blop_mce.gotoAndStop(2);
		blop_me.gotoAndStop(2);
	}
	holder[2] = blop_me;
	holder[1] = blop_mce;
	holder[0] = blop_mc;
	return holder;
}