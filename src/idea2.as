
////Game Code////

function gamevar(a:Number) {
	DIFF = parseFloat(Diff.gro.val);
	if (mouseaim == 0) {
		DIFF *= 0.9;
	}
	vid.contentPath = "";
	nano = false;
	miss = 0;
	movelayer.Hud._visible = true;
	movelayer.Pointer._visible = true;
	detonate = false;
	molenull = 0;
	throwing = false;
	movelayer._visible = true;
	movelayer.gotoAndStop(1);
	movelayer.gotoAndStop(a+2);
	Mouse.hide();
	levs._visible = false;
	movelayer._x = 197.95;
	movelayer._y = 199.15;
	Mouse.addListener(mouseListener);
	semi = true;
	WIN = 0;
	GRAV = 1;
	SCORE = 0;
	PAIN = 1;
	molecount = 0;
	cnt = 0;
	dv = 0;
	md = 0;
	esl = 50;
	depth = 0;
	equiped = 1;
	pauseq = 0;
	cept = 0;
	neutral = 0;
	good = 0;
	bad = 0;
	multi = 0;
	rethrow = false;
	allowRewards=true;
	mainGunBulletsFired=0;
	mineGroupsGone=[];
	remotebomb=null;
	dieontimeout=false;
	multiscore = 0;
	healthmod = 1;
	changed = false;
	goal = -1;
	earned = 0;
	TARGET = null;
	targetparent = null;
	BADDIE = null;
	baddieparent = null;
	baddiehealth = 0;
	TBADDIE = null;
	tbaddieparent = null;
	secondary = 1;
	secer = 0;
	secondaries = new Array(true, false, false, false, false);
	fans = [];
	spikes = [];
	teleports = [];
	goodies = [];
	autofire = 0;
	ammomax = new Array(300, 1500, 20, 1000, 50, 10, 15, 100, 50, 15, 20);
	ammo = new Array(300, 1500, 20, 1000, 50, 10, 15, 100, 50, 15, 20);
	sammo = new Array(40, 80, 120, 20, 1);
	sammomax = new Array(40, 80, 120, 20, 1);
	primsAllowed=new Array(true, true, true, true, true, true, true, true, true, true, true);
	secsAllowed=new Array(true, true, true, true, true);
	paused = false;
	pdown = false;
	tobp = false;
	
	oldDate=new Date();
	fpsFrame=0;
	movelayer.pausemessage._visible = false;
	if (a == 0) {
		HEALTH = 10/DIFF;
		maxequiped = 1;
		starttime = 4200;
		time = 4200;
	} else if (a == 1) {
		HEALTH = 100/DIFF;
		maxequiped = 1;
		starttime = 6300;
		time = 6300;
	} else if (a == 2) {
		HEALTH = 100/DIFF;
		maxequiped = 1;
		starttime = 1575;
		time = 1575;
	} else if (a == 3) {
		HEALTH = 100/DIFF;
		maxequiped = 2;
		starttime = 4200;
		time = 4200;
	} else if (a == 4) {
		HEALTH = 100/DIFF;
		maxequiped = 2;
		starttime = 1575;
		time = 1575;
	} else if (a == 5) {
		HEALTH = 100/DIFF;
		maxequiped = 3;
		starttime = 8400;
		time = 8400;
	} else if (a == 6) {
		HEALTH = 100/DIFF;
		maxequiped = 3;
		starttime = 1575;
		time = 1575;
	} else if (a == 7) {
		goal = 4;
		HEALTH = 100/DIFF;
		maxequiped = 4;
		starttime = 8400;
		time = 8400;
	} else if (a == 8) {
		HEALTH = 100/DIFF;
		maxequiped = 4;
		starttime = 4200;
		time = 4200;
	} else if (a == 9) {
		HEALTH = 80/DIFF;
		maxequiped = 5;
		starttime = 8400;
		time = 8400;
	} else if (a == 10) {
		HEALTH = 100/DIFF;
		maxequiped = 5;
		starttime = 4200;
		time = 4200;
	} else if (a == 10) {
		HEALTH = 100/DIFF;
		maxequiped = 6;
		starttime = 4200;
		time = 4200;
	} else if (a == 11) {
		HEALTH = 100/DIFF;
		maxequiped = 6;
		starttime = 8400;
		time = 8400;
	} else if (a == 12) {
		HEALTH = 100/DIFF;
		maxequiped = 6;
		starttime = 4200;
		time = 4200;
	} else if (a == 13) {
		HEALTH = 100/DIFF;
		maxequiped = 7;
		goal = 5;
		starttime = 8400;
		time = 8400;
	} else if (a == 14) {
		HEALTH = 100/DIFF;
		maxequiped = 7;
		starttime = 4200;
		time = 4200;
	} else if (a == 15) {
		HEALTH = 100/DIFF;
		maxequiped = 8;
		starttime = 4200;
		time = 4200;
	} else if (a == 16) {
		HEALTH = 100/DIFF;
		maxequiped = 8;
		starttime = 4200;
		time = 4200;
	} else if (a == 17) {
		HEALTH = 100/DIFF;
		maxequiped = 9;
		starttime = 8400;
		time = 8400;
	} else if (a == 18) {
		HEALTH = 100/DIFF;
		maxequiped = 9;
		starttime = 4200;
		time = 4200;
	} else if (a == 22) {
		//custom level code
		HEALTH = 100/DIFF;
		maxequiped = 10;
		starttime = 4200;
		time = 4200;
		//make the level
		movelayer.platforms.lineStyle(20,0x333333);
		var lchi = levelxml.childNodes;
		for (var n = 0; n<lchi.length; n++) {
			//these are the levels
			if (lchi[n].nodeName == "Level") {
				trace(lchi[n]);
				var leve = lchi[n].childNodes;
				for (var en = 0; en<leve.length; en++) {
					//now the cool code
					var stu = leve[en];
					switch (stu.nodeName) {
						case "Settings" :
							HEALTH = parseInt(stu.attributes.health)/DIFF;
							GRAV = parseFloat(stu.attributes.gravity);
							time = starttime = 35*parseInt(stu.attributes.time);
							maxequiped = parseInt(stu.attributes.weapons);
							if(deocdeBool(stu.attributes.goalsyn)){
								goals=parseInt(stu.attributes.goals);
							}
							dieontimeout=decodeBool(stu.attributes.timelimit);
							break;
						case "Platform" :
							movelayer.platforms.moveTo(parseInt(stu.attributes.x),parseInt(stu.attributes.y));
							movelayer.platforms.lineTo(parseInt(stu.attributes.endx),parseInt(stu.attributes.endy));
							break;
						case "Bridge" :
							//
							//
							//pinstance for complex reasons
							//for all children of movelayer
							//
							//
							var newb = movelayer.platforms.attachMovie("Bridge", "pinstance"+movelayer.platforms.getNextHighestDepth(), movelayer.platforms.getNextHighestDepth());
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.che._x = parseInt(stu.attributes.sx);
							newb.che._y = parseInt(stu.attributes.sy);

							newb._rotation = parseInt(stu.attributes.rot);
							newb._xscale = newb._yscale=parseFloat(stu.attributes.scale)*100;
							newb.tw = decodeBool(stu.attributes.two);
							newb.tr = decodeBool(stu.attributes.closed);
							if (newb.tr) {
								newb.che.gotoAndStop(1);
								newb.l.gotoAndStop(20);
								newb.r.gotoAndStop(20);
							} else {
								newb.che.gotoAndStop(2);
								newb.l.gotoAndStop(1);
								newb.r.gotoAndStop(1);
							}
							break;
						case "BaseTurret" :
							var newb = movelayer.attachMovie("baseturret", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb._xscale = newb._yscale=200;
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.crystal._visible = decodeBool(stu.attributes.float);
							newb.armor = decodeBool(stu.attributes.extra);
							newb.jets = decodeBool(stu.attributes.hjets);
							newb.vjets = decodeBool(stu.attributes.vjets);
							newb.wis = decodeBool(stu.attributes.wise);
							newb.fst = decodeBool(stu.attributes.fast);
							newb.pre = decodeBool(stu.attributes.predict);
							break;
						case "ExplosiveBarrel" :
							var newb = movelayer.attachMovie("ExplosiveBarrel", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb._xscale = newb._yscale=200;
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							break;
						case "Spike" :
							var newb = movelayer.attachMovie("Spike", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb._xscale = newb._yscale=200;
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb._rotation = parseInt(stu.attributes.rotation);
							break;
						case "BadShip" :
							var newb = movelayer.attachMovie("badship", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.ram = decodeBool(stu.attributes.horn);
							break;
						case "Fan" :
							var newb = movelayer.attachMovie("Fan", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.high = parseInt(stu.attributes.high);
							break;
						case "GuardDog" :
							var newb = movelayer.attachMovie("GuardDog", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.gren._visible=decodeBool(stu.attributes.grenade);
							break;
						case "Mine" :
							var newb = movelayer.attachMovie("Mine", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb._xscale = newb._yscale=200;
							newb._rotation = parseInt(stu.attributes.rotation);
							newb.hd = !decodeBool(stu.attributes.horn);
							newb.grp=parseInt(stu.attributes.group);
							break;
						case "GoodUnit" :
							var newb = movelayer.attachMovie("GoodUnit", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb.temp = 1;
							newb._xscale = newb._yscale=140;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							break;
						case "HelpStand" :
							var newb = movelayer.attachMovie("HelpStand", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb.temp = 1;
							var mes:String=stu.attributes.message;
							while(mes.indexOf("|", 0)!=-1){
								mes=mes.substr(0, mes.indexOf("|", 0))+"'"+mes.substr(mes.indexOf("|", 0)+1);
							}
							newb.saying=mes;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							break;
						case "NanoBox" :
							var newb = movelayer.attachMovie("Nanobox", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.heal = parseInt(stu.attributes.heal);
							newb._xscale=newb._yscale=200;
							break;
						case "Generator" :
							var newb = movelayer.attachMovie("nuclear generator", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.win = decodeBool(stu.attributes.win);
							newb._xscale=400
							newb._yscale=-400;
							break;
						case "Teleporter" :
							var newb = movelayer.attachMovie("Teleporter", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.tox = parseInt(stu.attributes.tx);
							newb.toy = parseInt(stu.attributes.ty);
							newb._xscale=200
							newb._yscale=200;
							break;
						case "BasicStillTurret" :
							var newb = movelayer.attachMovie("bst", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.crystal._visible = decodeBool(stu.attributes.float);
							newb.armor = decodeBool(stu.attributes.extra);
							break;
						case "MovingPlatform" :
							//
							//
							//pinstance for complex reasons
							//for all children of movelayer
							//
							//
							var newb = movelayer.platforms.attachMovie("backforward", "pinstance"+movelayer.platforms.getNextHighestDepth(), movelayer.platforms.getNextHighestDepth());
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.mine = parseInt(stu.attributes.sx);
							newb.maxe = parseInt(stu.attributes.endx);
							newb.scrl = decodeBool(stu.attributes.between);
							newb.auto = decodeBool(stu.attributes.auto);
							newb._xscale=200
							newb._yscale=200;
							newb.temp=1;
							break;
						case "Breakable" :
							//
							//
							//pinstance for complex reasons
							//for all children of movelayer
							//
							//
							var newb = movelayer.platforms.attachMovie("breakable", "pinstance"+movelayer.platforms.getNextHighestDepth(), movelayer.platforms.getNextHighestDepth());
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.tot = parseInt(stu.attributes.health);
							newb.res = decodeBool(stu.attributes.respawn);
							newb._rotation = parseInt(stu.attributes.rot);
							newb._xscale=parseFloat(stu.attributes.scalex)*100;
							newb._yscale=76.9;
							newb.temp=1;
							break;
						case "Howitzer" :
							var newb = movelayer.attachMovie("Howitzer", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb._xscale = newb._yscale=200;
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.crystal._visible = decodeBool(stu.attributes.float);
							newb.armor = decodeBool(stu.attributes.extra);
							newb.jets = decodeBool(stu.attributes.hjets);
							newb.wis = decodeBool(stu.attributes.wise);
							newb.fst = decodeBool(stu.attributes.fast);
							newb.spray = decodeBool(stu.attributes.spray);
							break;
						case "AmmoBox" :
							var newb = movelayer.attachMovie("AmmoBox", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.powe = parseFloat(stu.attributes.power);
							newb.count = parseInt(stu.attributes.uses);
							break;
						case "Tank" :
							var newb = movelayer.attachMovie("Tank", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb._xscale = newb._yscale=200;
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.gren._visible = decodeBool(stu.attributes.grenade);
							newb.gun._visible = decodeBool(stu.attributes.hgun);
							newb.goon._visible = decodeBool(stu.attributes.agun);
							newb.hom = decodeBool(stu.attributes.homming);
							newb.spik = decodeBool(stu.attributes.spikes);
							newb.anti = decodeBool(stu.attributes.arps);
							break;
						case "Conveyor" :
							//
							//
							//pinstance for complex reasons
							//for all children of movelayer
							//
							//
							var newb = movelayer.platforms.attachMovie("Conveyor", "pinstance"+movelayer.platforms.getNextHighestDepth(), movelayer.platforms.getNextHighestDepth());
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.spd = parseFloat(stu.attributes.spd);
							newb._yscale=100*parseInt(stu.attributes.scale);
							newb._xscale=newb._yscale*parseInt(stu.attributes.flip);
							newb._rotation=parseInt(stu.attributes.rot);
							newb.temp=1;
							break;
						case "RallyPoint" :
							var newb = movelayer.attachMovie("RallyPoint", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb._xscale = newb._yscale=200;
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							break;
						case "Tube" :
							var newb = movelayer.attachMovie("Tube", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.hole2._x = parseInt(stu.attributes.endx);
							newb.hole2._y = parseInt(stu.attributes.endy);
							break;
						case "Defender" :
							var newb = movelayer.attachMovie("Defender", "instance"+movelayer.getNextHighestDepth(), movelayer.getNextHighestDepth());
							newb._xscale = newb._yscale=200;
							newb.temp = 1;
							newb._x = parseInt(stu.attributes.x);
							newb._y = parseInt(stu.attributes.y);
							newb.ward = decodeBool(stu.attributes.smart);
							newb.jmp = decodeBool(stu.attributes.jumping);
							newb.grnd = decodeBool(stu.attributes.grenade);
							newb.sc = decodeBool(stu.attributes.suicidal);
							newb.fast = decodeBool(stu.attributes.fast);
							newb.rock = decodeBool(stu.attributes.rocket);
							newb.extra = decodeBool(stu.attributes.extra);
							break;

					}
				}
			}
		}
		//works
	}
	
	//Continuous Beam
	if (isRewardEnabled(23)) {
		ammo[5]=300;
		ammomax[5]=300;
	}
	
	if (DIFF<1) {
		//On recreational difficulty you always start with full health.
		HEALTH = 100/DIFF;
	} else if (DIFF>1) {
		for (var n = 0; n<ammo.length && n<sammo.length; n++) {
			if (n<ammo.length) {
				ammo[n] = Math.round(ammo[n]/DIFF);
				ammomax[n] = Math.round(ammomax[n]/DIFF);
			}
			if (n<sammo.length) {
				sammo[n] = Math.round(sammo[n]/DIFF);
				sammomax[n] = Math.round(sammomax[n]/DIFF);
			}
		}
	}
	
	
	
	//Helmet
	if (isRewardEnabled(3)) {
		healthmod += .1;
		HEALTH += 10/DIFF;
	}
	
	//Boots
	if (isRewardEnabled(6)) {
		healthmod += .05;
		HEALTH += 5/DIFF;
	}
	
	//Gauntelet
	if (isRewardEnabled(7)) {
		healthmod += .05;
		HEALTH += 5/DIFF;
	}
	
	//Vambraces
	if (isRewardEnabled(19)) {
		healthmod += .05;
		HEALTH += 5/DIFF;
	}
	
	//Beserk
	if (isRewardEnabled(12)) {
		healthmod -= .5;
		HEALTH -= 50/DIFF;
	}
	
	//Knife
	if (isRewardEnabled(9)) {
		secondaries[1] = true;
		secondary = 2;
	}
	
	//Pistol
	if (isRewardEnabled(10)) {
		secondaries[2] = true;
		secondary = 3;
	}
	
	//Detonator
	if (isRewardEnabled(15)) {
		secondaries[3] = true;
		secondary = 4;
	}
	
	//Boomarang
	if (isRewardEnabled(16)) {
		secondaries[4] = true;
		secondary = 5;
	}
	
	//Next Weapon
	if (isRewardEnabled(17)) {
		maxequiped++;
	}
	
	//Anti Gravity
	if (isRewardEnabled(18)) {
		GRAV /= 2;
	}
	
	
	//done rewards make sure things are ok
	if (HEALTH<1) {
		HEALTH = 1;
	}else{
		maxhealth=Math.round(100/DIFF*healthmod);
	}
	
	if(!dieontimeout){
		movelayer.Hud.timey._visible=false;
	}
	
	bitdata = new BitmapData(400, 400, true, 0x00000000);
	movelayer.platforms._xscale = movelayer.platforms._yscale=150;
	
	pauseAtStart=true;
	
	if(pauseAtStart){
		pauseNow=true;
		allowUnpause=false;
		weaponChoice._visible=true;
		weaponChoice.init();
	}else{
		pauseNow=false;
		allowUnpause=true;
	}
	
	//
	enterFramify(movelayer);
}

function setupMovelayer(){
	movelayer.stop();
	movelayer.createEmptyMovieClip("trackmc", movelayer.getNextHighestDepth());
	movelayer.createEmptyMovieClip("trackmc2", movelayer.getNextHighestDepth());
	movelayer.createEmptyMovieClip("trackmc3", movelayer.getNextHighestDepth());
	movelayer.createEmptyMovieClip("trackmc4", movelayer.getNextHighestDepth());
	if (isRewardEnabled(5)) {
		var col:ColorTransform = new ColorTransform();
		col.redOffset = -255;
		col.blueOffset = 255;
		movelayer.trackmc3.transform.colorTransform = col;
	}
				
	if (isRewardEnabled(12)) {
		movelayer.trackmc.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 255, -255, 0, 0);
	}
}

/*
Call the onEnterFrames of the target and all of it's children recursively.
*/
function enterFramify(target:Object){
	target.onEnterFrame.apply(target);
	for (var string in target) {
		if (target[string] instanceof MovieClip) {
			enterFramify(target[string]);
		}
	}
}

/*
Records recurisvely the current frame of the target and all it's children recursively.
*/
function recordst(target:Object) {
	target.st = target._currentframe;
	for (var string in target) {
		if (target[string] instanceof MovieClip) {
			recordst(target[string]);
		}
	}
}

/*
Records recurisvely the current frame of the target and all it's children recursively.
*/
function recorden(target:Object) {
	target.en = target._currentframe;
	for (var string in target) {
		if (target[string] instanceof MovieClip) {
			recorden(target[string]);
		}
	}
}

/*
Based on the previously recursively recorded current frames of the target and it's children, pauses if necisary and record if they were paused.
*/
function recordpausedornot(target:Object) {
	if (target.en == target.st) {
		target.pausedornot = false;
	} else {
		target.pausedornot = true;
		target.stop();
	}
	for (var string in target) {
		if (target[string] instanceof MovieClip) {
			recordpausedornot(target[string]);
		}
	}
}

/*
Based on the previously recursively recorded current frames of the target and it's children, unpauses if necisary.
*/
function unpauseornot(target:Object) {
	if (target.pausedornot) {
		target.play();
	}
	for (var string in target) {
		if (target[string] instanceof MovieClip) {
			unpauseornot(target[string]);
		}
	}
}

/*
A hard animation stop.
*/
function stopAll(target:Object) {
	target.stop();
	for (var string in target) {
		if (target[string] instanceof MovieClip) {
			stopAll(target[string]);
		}
	}
}

/*
Performs some basic procedures at the end of a level either from victory or loss.
*/
function basicEnd(){
	//#sound
	endSounds();
	stopAll(movelayer);
	pauseq = 1;
	previousLevel=leveltoplay;
	Mouse.show();
	Mouse.removeListener(mouseListener);
}

function unpause(){
	pdown = true;
	paused = false;
	unpauseornot(movelayer);
	movelayer.pausemessage._visible = false;
	fpsFrame=0;
	oldDate=new Date();
	allowUnpause=true;
	//ensure primary weapon is ok
	if(!primsAllowed[equiped-1]||equiped>maxequiped){
		while(!primsAllowed[equiped-1]||equiped>maxequiped){
			equiped++;
			if (equiped>maxequiped) {
				equiped = 1;
			}
		}
	}
	//ensure secondary weapon is ok
	if (!secondaries[secondary-1]||!secsAllowed[secondary-1]) {
		var count:Number=0;
		while (!secondaries[secondary-1]||!secsAllowed[secondary-1]) {
			count++;
			if(count>100){
				paused=true;
				trace("Secondary Weapon Selection Problem");
				break;
			}
			secondary++;
			if (secondary>secondaries.length) {
				secondary = 1;
			}
		}
	}
	
}

/*
movelayer.Guy 's onEnterFrame callback, deals with platforming and a bunch of other stuff.
*/
function toDo() {
	//endTest();
	//startTest("Frame");
	
	//don't know what this does
	hot.removeMovieClip();
	
	if (pauseq == 1) {
		//you won
		ehealth._visible = false;
		if (movelayer._visible) {
			if (Key.isDown(32)) {
				//#sound
				endSounds();
				
				changesceen(30);
				bink._visible = false;
				movelayer._visible = false;
				menustuffvisible(true);
				Idea.gotoAndPlay(1);
				var count:Number=0;
				for (var string in movelayer) {
					if(movelayer[string] instanceof MovieClip){
						movelayer[string].unloadMovie();
						delete movelayer[string].onEnterFrame;
						count++;
					}
				}
				removeMovieClip("movelayer.trackmc4");
				removeMovieClip("movelayer.trackmc3");
				removeMovieClip("movelayer.trackmc2");
				removeMovieClip("movelayer.trackmc");
				movelayer.gotoAndStop(1);
				for (var string in movelayer) {
					if(movelayer[string] instanceof MovieClip){
						removeMovieClip("movelayer."+string);
						//trace(string);
					}
				}
				
			}
		}
	} else if (pauseq == 0) {
		//still haven't won
		if (paused) {
			//game is paused
			if (!pdown) {
				if (Key.isDown(80)&&allowUnpause) {
					unpause();
				}
			} else {
				if (!Key.isDown(80)) {
					pdown = false;
				}
			}
		} else {
			
			//pause handling
			if (tbp) {
				//finish pausing
				recorden(movelayer);
				recordpausedornot(movelayer);
				tbp = false;
				paused = true;
				movelayer.pausemessage._visible = true;
			} else {
				if (!pdown) {
					if (Key.isDown(80)||pauseNow) {
						//start pausing
						pauseNow=false;
						pdown = true;
						tbp = true;
						recordst(movelayer);
					}
				} else {
					if (!Key.isDown(80)) {
						pdown = false;
					}
				}
			}
			
			//set glidetime to default
			if (isNaN(this.glidetime)) {
				this.glidetime = 5;
			}
			
			//ensure health is ok
			HEALTH = Math.round(HEALTH);
			OLDHEALTH = HEALTH;
			if (HEALTH>maxhealth) {
				HEALTH = maxhealth;
			}
			
			
			if (WIN == 1) {
				//we won
				basicEnd();
				addSound("Victory","Victory",-1);
				
				movelayer.Hud._visible = false;
				movelayer.Pointer._visible = false;
				bink._visible = true;
				
				if (zed<=leveltoplay+1) {
					//custom level code
					if (leveltoplay != 22) {
						idea.data.level = leveltoplay+1;
						idea.flush();
					}
				}
				var healthscore = Math.round(HEALTH/4);
				var timescore = Math.round(time/100);
				if (time<0) {
					timetotal += time*-1+starttime;
				} else {
					timetotal += starttime-time;
				}
				totals[0]=timetotal;
				totals[1]=killtotal;
				idea.data.totals=totals;
				idea.flush();
				var hitscore = Math.round((1-miss/(molecount+molenull))*35);
				if (isNaN(SCORE)) {
					SCORE = 0;
				}
				if (isNaN(multiscore)) {
					multiscore = 0;
				}
				if (isNaN(healthscore)) {
					healthscore = 0;
				}
				if (isNaN(timescore)) {
					timescore = 0;
				}
				if (isNaN(hitscore)) {
					hitscore = 0;
				} else if (hitscore == Infinity) {
					hitscore = 35;
				}
				if (isRewardEnabled(1)) {
					SCORE += 20;
				}
				if (multiscore>=0) {
					unlock(3);
				}
				if (timescore == 0) {
					unlock(23);
				}
				if (SCORE == 0) {
					unlock(25);
				}
				if (mouseaim == 0) {
					unlock(26);
				}
				fullscore = SCORE+multiscore+healthscore+timescore+hitscore;
				bink.norm.text = "You scored "+SCORE+" normal points!";
				bink.multi.text = "You scored "+multiscore+" multicombat points!";
				bink.heal.text = "You scored "+healthscore+" health points!";
				bink.tim.text = "You scored "+timescore+" time points!";
				bink.hit.text = "You scored "+hitscore+" accuracy points!";
				bink.tot.text = "You scored a total of "+fullscore+" points!";
				if (molecount == 0) {
					unlock(16);
				}
				if (!nano) {
					unlock(17);
				}
				if (hitscore>=35) {
					unlock(10);
				}
				if (!changed) {
					if (leveltoplay == 5) {
						unlock(8);
					}
					if (leveltoplay == 16 && goodies.length>0) {
						unlock(31);
					}
				}

				if (fullscore>=highscore) {
					idea.data.Highscore = fullscore;
					idea.flush();
					highscore = idea.data.Highscore;
				}
				readcookie();
			} else if (HEALTH<=0) {
				//we died
				basicEnd();
				
				//die
				unlock(9);
				if (DIFF<1) {
					unlock(27);
				}
				
				changesceen(30);
				movelayer._visible = false;
				if (SCORE == 1) {
					gameover.score.text = "You scored "+SCORE+" point.";
				} else {
					gameover.score.text = "You scored "+SCORE+" points.";
				}
				gameover._visible = true;
				readcookie();
				var count:Number=0;
				for (var string in movelayer) {
					if(movelayer[string] instanceof MovieClip){
						movelayer[string].unloadMovie();
						delete movelayer[string].onEnterFrame;
						count++;
					}
				}
				removeMovieClip("movelayer.trackmc4");
				removeMovieClip("movelayer.trackmc3");
				removeMovieClip("movelayer.trackmc2");
				removeMovieClip("movelayer.trackmc");
				movelayer.gotoAndStop(1);
				for (var string in movelayer) {
					if(movelayer[string] instanceof MovieClip){
						removeMovieClip("movelayer."+string);
					}
				}
			} else if (HEALTH>=1) {
				//still playing
				
				//update health
				movelayer.Hud.la.text = (""+HEALTH);
				movelayer.Hud.healr.bar._xscale = (HEALTH/healthmod)*DIFF;
				
				//handle doom line
				movelayer.doom._x = this._x;
				if (this._y>movelayer.doom._y) {
					//death by falling too far
					HEALTH = 0;
					unlock(24);
				}
				
				//handle time limits
				if (dieontimeout){
					movelayer.Hud.timey._visible=true;
					var seconds:Number=time/35;
					var minutes:Number=Math.floor(seconds/60);
					seconds-=minutes*60;
					var secs:String=""+Math.floor(seconds);
					if(secs.length==1){
						secs="0"+secs;
					}
					movelayer.Hud.timey.text=minutes+":"+secs+"."+Math.floor((seconds-Math.floor(seconds))*10);
					if(time<=0){
						//death by time out
						HEALTH = 0;
					}
				}
				
				//handle winning by getting all the sub goals
				if (earned == goal) {
					WIN = 1;
				}
				
				
				this.olddy = this.dy;
				dv = 0;
				if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
					//done 
					if (this.dy>0) {
						this.dy = 0;
					}
					this.glidetime = 5;
					if (Key.isDown(_UP)) {
						if (!(movelayer.platforms.hitTest(movelayer.THead._x+movelayer._x-5, movelayer.THead._y+movelayer._y-18, true)||
						movelayer.platforms.hitTest(movelayer.THead._x+movelayer._x, movelayer.THead._y+movelayer._y-18, true)||
						movelayer.platforms.hitTest(movelayer.THead._x+movelayer._x+5, movelayer.THead._y+movelayer._y-18, true))) {
							if (_xmouse<this._x+movelayer._x) {
								this.gotoAndPlay(31);
							} else {
								this.gotoAndPlay(46);
							}
							this.dy -= 14;
							if (isRewardEnabled(14)) {
								var ok = true;
								//Am I hitting my head?
								for (var n = 3; n<90; n += 10) {
									if (movelayer.platforms.hitTest(this._x+movelayer._x-5, this._y+movelayer._y-n, true)||
										movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-n, true)||
										movelayer.platforms.hitTest(this._x+movelayer._x+5, this._y+movelayer._y-n, true)) {
										ok = false;
									}
								}
								if (ok) {
									this.dy -= 60;
								}
							}
						}
					}
				} else {
					//health>=1
					//You are alive
					//more or less all the code goes here
					//Am I hitting my head?
					if (movelayer.platforms.hitTest(movelayer.THead._x+movelayer._x-5, movelayer.THead._y+movelayer._y-15.2, true)||
						movelayer.platforms.hitTest(movelayer.THead._x+movelayer._x, movelayer.THead._y+movelayer._y-15.2, true)||
						movelayer.platforms.hitTest(movelayer.THead._x+movelayer._x+5, movelayer.THead._y+movelayer._y-15.2, true)) {
						if (this.dy<0) {
							this.dy = 0;
						}
						dv = 1;
						this.dx = this.dx*-1;
						while (movelayer.platforms.hitTest(movelayer.THead._x+movelayer._x-5, movelayer.THead._y+movelayer._y-15.2+this.dy, true)||
						movelayer.platforms.hitTest(movelayer.THead._x+movelayer._x, movelayer.THead._y+movelayer._y-15.2+this.dy, true)||
						movelayer.platforms.hitTest(movelayer.THead._x+movelayer._x+5, movelayer.THead._y+movelayer._y-15.2+this.dy, true)) {
							this.dy += 1;
						}
					}
					this.dy += GRAV;
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y+this.dy, true)) {
						this.glidetime = 5;
						if (Key.isDown(_UP)) {
							if (_xmouse<this._x+movelayer._x) {
								this.gotoAndPlay(31);
							} else {
								this.gotoAndPlay(46);
							}
							this.dy = -14;
							while (movelayer.platforms.hitTest(movelayer.THead._x+movelayer._x, movelayer.THead._y+movelayer._y-15.2+this.dy, true)) {
								this.dy += 1;
							}
							if (isRewardEnabled(14)) {
								var ok = true;
								for (var n = 3; n<90; n += 3) {
									if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-n, true)) {
										ok = false;
									}
								}
								if (ok) {
									this.dy -= 60;
								}
							}
						}
					} else if ((isRewardEnabled(0)) && (this.glidetime>0) && (Key.isDown(_UP)) && (this.dy == 0+GRAV)) {
						this.glidetime--;
						this.dy -= GRAV;
					}
				}
				if (Key.isDown(_UP)) {
				} else if (this.dy<=-0.5) {

					if (isRewardEnabled(11) && equiped == 4 && md == 1) {
					} else {
						this.dy /= 2;
					}
				}
				if (Key.isDown(_RIGHT)) {
					if ((Key.isDown(_UP)) && (this.dy<0)) {
						if ((this._currentframe>45) && (this._currentframe<60)) {
						} else {
							this.gotoAndPlay(46);
						}
					} else {
						if ((this._currentframe>16) & (this._currentframe<=29)) {
						} else {
							this.gotoAndPlay(16);
						}
					}
					this.dx += 1;
				} else if (Key.isDown(_LEFT)) {
					if ((Key.isDown(_UP)) && (this.dy<0)) {
						if ((this._currentframe>30) && (this._currentframe<45)) {
						} else {
							this.gotoAndPlay(31);
						}
					} else {
						if ((this._currentframe>2) & (this._currentframe<=14)) {
						} else {
							this.gotoAndPlay(2);
						}
					}
					this.dx -= 1;
				} else {
					var reduction = 1;
					if (isRewardEnabled(1)) {
						reduction = 0;
					}wa
					if (this.dx>=0) {
						if (this.dx<=reduction) {
							this.dx -= this.dx;
						} else {
							this.dx -= reduction;
						}
					} else {
						if (this.dx>=-reduction) {
							this.dx -= this.dx;
						} else {
							this.dx += reduction;
						}
					}
				}
				if (this.dx>0) {
					var dr = 1;
				} else {
					var dr = -1;
				}
				
				var bounceCoefficient:Number=-0.8;//-1.1
				
				if (movelayer.platforms.hitTest(this._x+movelayer._x+this.dx+3, this._y+movelayer._y+this.dy-22.5, true)) {
					//never seems to get here
					this.dx *= bounceCoefficient;
					dv = 1;
				}
				this.dy2 = 0;
				cnt = 0;
				while (movelayer.platforms.hitTest(this._x+movelayer._x+this.dx, this._y+this.dy+movelayer._y+this.dy2-0.5, true)) {
					if (!(movelayer.platforms.hitTest(movelayer.THead._x+movelayer._x-5, movelayer.THead._y+this.dy2-0.5+movelayer._y-18, true)||
						movelayer.platforms.hitTest(movelayer.THead._x+movelayer._x, movelayer.THead._y+this.dy2-0.5+movelayer._y-18, true)||
						movelayer.platforms.hitTest(movelayer.THead._x+movelayer._x+5, movelayer.THead._y+this.dy2-0.5+movelayer._y-18, true))) {
						if (Key.isDown(_UP)) {
							if (dr == -1) {
								this.gotoAndPlay(31);
							} else {
								this.gotoAndPlay(46);
							}
							this.dy = -14;
							if (isRewardEnabled(14)) {
								var ok = true;
								for (var n = 3; n<90; n += 3) {
									if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-n, true)) {
										ok = false;
									}
								}
								if (ok) {
									this.dy -= 60;
								}
							}
						}
					}else{
						cnt=15;
						break;
					}
					this.dy2 -= 0.5;
					cnt += 0.5;
					if(cnt>=17){
						break;
					}
				}
				if (cnt<17) {
					this.dy += this.dy2;
				} else if(dv==0) {
					//trace("bounce "+this.dx);
					this.dx *= bounceCoefficient;
					dv=1;
				}
				if (dv == 0) {
					if (movelayer.platforms.hitTest(movelayer.THead._x+movelayer._x+this.dx+dr*movelayer.THead._width/2, movelayer.THead._y+movelayer._y-15.2+this.dy, true)) {
						this.dx *= bounceCoefficient;
					}
				}
				if (isRewardEnabled(14)) {
					if (this.dy<=-10) {
						motionblur(movelayer.Guy,0,this.dy*3);
						motionblur(movelayer.THead,0,this.dy*3);
						motionblur(movelayer.Shootat0,0,this.dy*3);
					}
				}
				this.dyt = 0;
				if (this.dy<=-14) {
					if (isRewardEnabled(14)) {
						motionblur(movelayer.Guy,0,this.dy);
						motionblur(movelayer.THead,0,this.dy);
						motionblur(movelayer.Shootat0,0,this.dy);
						if (this.dy<=-50) {
							this.dyt = -60;
						} else {
						}
					}
					this.dy = -14;
				}

				if (this.dy>=12) {
					this.dy = 12;
				}
				
				//max out x velocity  
				if (this.dx>10) {
					this.dx = 10;
				}
				if (this.dx<=-10) {
					this.dx = -10;
				}
				this.dix = Math.floor(this.dx);
				if (this.dy<0) {
					this.diy = Math.ceil(this.dy+this.dyt);
				} else {
					this.diy = Math.floor(this.dy+this.dyt);
				}

				moveZuy(-this.dix, -this.diy);
				whack = false;
				//energy sword code
				if ((equiped == 2)) {
					for (var x = molecount-5; x<=molecount; x++) {
						mcray = movelayer.trackmc["Ray_"+x];
						if (mcray.equiped == 2) {
							mcray._x = movelayer.Shootat0._x;
							mcray._y = movelayer.Shootat0._y;
						}
					}
				}
				if (isRewardEnabled(3)) {
					movelayer.THead.head.gotoAndStop(2);
				} else {
					movelayer.THead.head.gotoAndStop(1);
				}
				if (isRewardEnabled(6)) {
					this.foot1.boot._visible = true;
					this.foot2.boot._visible = true;
				} else {
					this.foot1.boot._visible = false;
					this.foot2.boot._visible = false;
				}
				
				//update enemies in range
				//movelayer.Hud.output.text="Enemies in Range:"+enemiesInRange;
				enemiesInRange=0;
				fpsFrame++;
				if(fpsFrame==10){
					var now:Date=new Date();
					var secondDifference:Number=(now.getTime()-oldDate.getTime())/(fpsFrame*1000);
					var fps:Number=(Math.round((1/secondDifference)*100)/100);
					movelayer.Hud.output.text="FPS:"+fps;
					oldDate=now;
					fpsFrame=0;
				}
				
				//baddie targeting code
				TBADDIE = BADDIE;
				tbaddieparent = baddieparent;
				BADDIE = null;
				baddieparent = null;
				baddiehealth = 999;
				if (TARGET == null) {
					movelayer.Hud.ehealth._visible = false;
					movelayer.Hud.lae.text = "";
				} else {
					var tra = gettarget(true);
					var ratio = tra.health/tra.z;
					if ((ratio<0) || isNaN(ratio)) {
						ratio = 0;
						movelayer.Hud.ehealth._visible = false;
						movelayer.Hud.lae.text = "";
						TARGET = null;
					} else {
						movelayer.Hud.ehealth._visible = true;
						movelayer.Hud.ehealth.bar._xscale = ratio*100;
						movelayer.Hud.lae.text = tra.health;
					}
				}
				
			}
		}
	}
}
function damage(pain:Number) {
	if (pain == null) {
		trace(pain);
	} else if (pain == 0) {
	} else {
		HEALTH -= Math.max(Math.round(pain*PAIN), 1);
		whack = true;
	}
}
function goody() {
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
				this.reloadtime = 0;
				this.oldx = this._x;
				this.dead = false;
				this.near = false;
				goodies[goodies.length] = this;
			}
			var dx = this._x-movelayer.Guy._x;
			var dy = this._y-(movelayer.Guy._y-17);
			var dxy = Math.sqrt(dx*dx+dy*dy);
			if (this._currentframe == this._totalframes) {
				unlock(19);
				this.unloadMovie();
			}
			if (dxy<300) {
				if (!this.dead) {

					this.reloadtime--;
					hitbad(this);
					hitneutral(this);

					for (fa=0; fa<spikes.length; fa++) {
						var spi = spikes[fa];
						var dex = spi._x-this._x;
						var dey = spi._y-(this._y-15);
						var deis = Math.sqrt(dex*dex+dey*dey);
						if (deis<100) {
							if (this.hitTest(spi)) {
								this.health--;
							}
						}
					}
					var tux = null;
					for (var n = 0; n<teleports.length; n++) {
						var dox = this._x-teleports[n]._x;
						var doy = this._y-teleports[n]._y;
						var dos = Math.sqrt(dox*dox+doy*doy);
						if (dos<200 && Math.abs(doy)<100) {
							tux = teleports[n]._x;
						}
						if (teleports[n].hitTest(this)) {
							this._x = teleports[n].tox;
							this._y = teleports[n].toy;
						}
					}
					if (!isNaN(tux) && this.okmove) {
						if (tux>this._x) {
							if (this.dy>0) {
								this._x += 7;
							} else {
								this._x += 5;
							}
							this.legs.play();
							this.legs._xscale = this.head._xscale=-100;

							this.arms._yscale = -100;
							this.arms._rotation = 180;
						} else {
							if (this.dy>0) {
								this._x -= 7;
							} else {
								this._x -= 5;
							}
							this.legs.play();
							this.legs._xscale = this.head._xscale=100;
							this.arms._yscale = 100;
							this.arms._rotation = 0;
						}
					} else if (Math.abs(dx)<37) {
						this.legs.stop();
					} else if (movelayer.Guy._x>this._x && this.okmove) {
						if (this.dy>0) {
							this._x += 7;
						} else {
							this._x += 5;
						}
						this.legs.play();
						this.legs._xscale = this.head._xscale=-100;

						this.arms._yscale = -100;
						this.arms._rotation = 180;
					} else if (this.okmove) {
						if (this.dy>0) {
							this._x -= 7;
						} else {
							this._x -= 5;
						}
						this.legs.play();
						this.legs._xscale = this.head._xscale=100;
						this.arms._yscale = 100;
						this.arms._rotation = 0;
					}
					if ((movelayer.platforms.hitTest(this._x+movelayer._x+(this._x-this.oldx)*4, this._y+movelayer._y-15, true)) || (movelayer.platforms.hitTest(this._x+movelayer._x+(this._x-this.oldx)*4, this._y+movelayer._y-30, true))) {
						this._x = this.oldx;
						this.legs.stop();
					}
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dy = 0;
						var count = 0;
						while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-1, true)) {
							count++;
							this._y--;
						}
						if (count>20) {
							this._y += count;
						}
						if (movelayer.Guy._y+25<this._y) {
							this.dy = -10;
						}
					} else {
						var fall = true;
						for (fa=0; fa<fans.length; fa++) {
							var fan = fans[fa];
							var dex = fan._x-this._x;
							var dey = fan._y-(this._y-15);
							if (Math.abs(dex)<15) {
								if (dey>0) {
									if (dey<fan.high) {
										fall = false;
										this.dy = -10;
									}
								}
							}
						}
						if (fall) {
							this.dy += GRAV;
						}
					}
					if (this.dy>12) {
						this.dy = 12;
					}
					this._y += this.dy;
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dy = 0;
						var count = 0;
						while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y-1, true)) {
							count++;
							this._y--;
						}
						if (count>20) {
							this._y += count;
						}

					}
					this.oldx = this._x;
					var tra = gettarget(false);
					if (tra == null) {
					} else {
						//traget code
						var dix = dx;
						var dx = this._x-(tra.aim._x+tra._x);
						if (isNaN(dx)) {
							if (dix>0) {
								this.arms._yscale = 100;
								this.arms._rotation = 0;
							} else {
								this.arms._yscale = -100;
								this.arms._rotation = 180;
							}
						} else {

							var dy = (this._y-15)-(tra.aim._y+tra._y);
							var angle = Math.atan2(dy, dx);
							if (dx>0) {
								this.arms._yscale = 100;
								this.head._xscale = 100;

							} else {
								this.arms._yscale = -100;
								this.head._xscale = -100;
							}
							this.arms._rotation = angle/Math.PI*180;
							if (this.reloadtime<0) {
								this.arms.play();
								this.reloadtime = 10;
								var qw = angle;
								var xi = Math.cos(qw)*-30;
								var yi = Math.sin(qw)*-30;
								var z = movelayer.trackmc.attachMovie("AllyShot", ("Ray_"+molecount), molecount++);
								good = 55;
								z._x = this._x+xi;
								z._y = this._y+this.arms._y+yi;
								z.damage = 2;
								z.grenade = false;
								z.equiped = 1;
								z._rotation = this.arms._rotation;
								z.dy = Math.sin(qw)*10;
								z.dx = Math.cos(qw)*10;

								//#sound
								addSound(assetContainer.getSound("MachineFire"), "MachineFire", 1) ;
							}
						}
					}
					this.okmove = true;
					for (var n = 0; n<goodies.length; n++) {
						var good = goodies[n];
						if (good != this && !good.dead && good.dead != null) {
							//it's not me and it exists
							if (this.hitTest(good) && Math.abs(this._x-good._x)<17) {
								if (this._x>good._x) {
									this._x++;
								} else {
									this._x--;
								}
								this.okmove = false;
								break;
							}
						}
					}
					if (this.hitTest(movelayer.Guy) && Math.abs(this._x-movelayer.Guy._x)<17) {
						if (this._x>movelayer.Guy._x) {
							this._x++;
						} else {
							this._x--;
						}
						this.okmove = false;
					}
					if (this.health<0) {
						this.dead = true;
						this.play();
					}
				}
			}
		}
	}
}
function gettarget(tar) {
	if (tar) {
		//guy
		if (_level0[targetparent] == movelayer) {
			var tra = movelayer[TARGET];
		} else {
			var ptra = movelayer[targetparent];
			if (ptra == null) {
				var tra = movelayer.platforms[targetparent][TARGET];
			} else {
				var tra = ptra[TARGET];
			}
		}
	} else {
		//ally
		if (_level0[tbaddieparent] == movelayer) {
			var tra = movelayer[TBADDIE];
		} else {
			var ptra = movelayer[tbaddieparent];
			if (ptra == null) {
				var tra = movelayer.platforms[tbaddieparent][TBADDIE];
			} else {
				var tra = ptra[TBADDIE];
			}
		}
	}
	return tra;
}

function thro() {
	var left:Number = 1;
	if (_xmouse>movelayer.Shootat0._x+movelayer._x) {
		left = 0;
	}
	var mo:Number = 1;
	var qw:Number = movelayer.Shootat0._rotation/180*Math.PI;
	if (mouseaim == 0) {
		qw += Math.PI;
		left = 1;
		mo = -1;
	}
	var xi:Number = Math.cos(qw)*-35*(left*2-1)*mo;
	var yi:Number = Math.sin(qw)*-35*(left*2-1)*mo;
	var z:MovieClip = movelayer.trackmc.attachMovie("Grenade", ("Ray_"+molecount), molecount++);
	good = 85;
	z._x = movelayer.Shootat0._x+xi;
	z._y = movelayer.Shootat0._y+yi;
	z.damage = 0;
	z.health = 1;
	z.aire = 70;
	z.grenade = true;
	z.typ = 0;
	z.spd = 10;
	z.plows = 10;
	z.radius = 1;
	z._rotation = movelayer.Shootat0._rotation;
	qw = z._rotation/180*Math.PI;
	z.dy = Math.sin(qw)*8*(left*2-1);
	z.dx = Math.cos(qw)*8*(left*2-1);
	if (isRewardEnabled(7)) {
		z.dy = Math.sin(qw)*10*(left*2-1);
		z.dx = Math.cos(qw)*10*(left*2-1);
	}
	if (movelayer.platforms.hitTest(movelayer._x+z._x, movelayer._y+z._y, true)) {
		z.dead = 1;
	}
}

function shtpistol() {
	var left:Number = 1;
	if (_xmouse>movelayer.Shootat0._x+movelayer._x) {
		left = 0;
	}
	var mo:Number = 1;
	var qw:Number = movelayer.Shootat0._rotation/180*Math.PI;
	if (mouseaim == 0) {
		qw += Math.PI;
		left = 1;
		mo = -1;
	}
	var xi:Number = Math.cos(qw)*-30*(left*2-1)*mo;
	var yi:Number = Math.sin(qw)*-30*(left*2-1)*mo;
	var z:MovieClip = movelayer.trackmc.attachMovie("AllyShot", ("Ray_"+molecount), molecount++);
	good = 55;
	z._x = movelayer.Shootat0._x+xi;
	z._y = movelayer.Shootat0._y+yi;
	z.damage = 2;
	z.grenade = false;
	z.equiped = 1;
	z._rotation = movelayer.Shootat0._rotation+180*left+180;
	z.dy = Math.sin(qw)*10*(left*2-1)*mo;
	z.dx = Math.cos(qw)*10*(left*2-1)*mo;

	if (movelayer.platforms.hitTest(movelayer._x+z._x, movelayer._y+z._y, true)) {
		z.dead = 1;
	}
	//#sound    
	addSound(assetContainer.getSound("MachineFire"),"MachineFire",1);
}

function booma() {

	var left:Number = 1;
	if (_xmouse>movelayer.Shootat0._x+movelayer._x) {
		left = 0;
	}
	var mo:Number = 1;
	var qw:Number = movelayer.Shootat0._rotation/180*Math.PI;
	if (mouseaim == 0) {
		qw += Math.PI;
		left = 1;
		mo = -1;
	}

	var z:MovieClip = movelayer.trackmc.attachMovie("Boomarang", ("Ray_"+molecount), molecount++);
	good = 55;

	var po = {x:movelayer.Shootat0.boom.pot._x, y:movelayer.Shootat0.boom.pot._y};
	movelayer.Shootat0.boom.localToGlobal(po);
	po.x -= movelayer._x;
	po.y -= movelayer._y;
	z._x = po.x;
	z._y = po.y;


	z.damage = 3;
	z.grenade = true;
	z.typ = 2;
	z._rotation = movelayer.Shootat0._rotation+180*left+180;
	z.dy = Math.sin(qw)*10*(left*2-1)*mo;
	z.dx = Math.cos(qw)*10*(left*2-1)*mo;

	movelayer.Shootat0.boomes = z;
	if (movelayer.platforms.hitTest(movelayer._x+z._x, movelayer._y+z._y, true)) {
		z.dead = 1;
	}
}

function slash() {
	//clean function
	var z:MovieClip = movelayer.trackmc.attachMovie("Ray1", ("Ray_"+molecount), molecount++);

	z._x = movelayer.Shootat0._x;
	z._y = movelayer.Shootat0._y+10;
	z._rotation = movelayer.Shootat0._rotation;
	z._xscale = 100;
	z._yscale = 100;

	if (movelayer.Shootat0._xscale == -150) {
		z._xscale = -100;
	}
	if (mouseaim == 0) {
		z._xscale = 100;
		z._yscale = 100;
		if (movelayer.Shootat0._yscale != 150) {
			z._yscale = -100;
		}
	}
	z._visible = false;

	z.te = true;
	z.grenade = false;
	z.damage = 1;
	z.health = Number.POSITIVE_INFINITY+1;
	z.s = 0;
	z.equiped = 2;

	z.gotoAndStop(42);
	z.play();

	good = 55;
}

function droppilon(left:Number) {
	//clean function
	var po = {x:0, y:0};
	movelayer.Shootat0.remot.pil.localToGlobal(po);
	po.x = po.x-movelayer._x;
	po.y = po.y-movelayer._y;

	var z:MovieClip = movelayer.trackmc.attachMovie("Pilon", ("Ray_"+molecount), molecount++);
	z._x = po.x;
	z._y = po.y;
	z._xscale = z._yscale=150;
	z._rotation = movelayer.Shootat0._rotation+90;
	if (left == 0) {
		z._rotation += 180;
	}
	z.grenade = true;
	z.typ = 1;
	z.po = {x:0, y:0};
	z.spo.localToGlobal(z.po);
	z.po.x -= movelayer._x;
	z.po.y -= movelayer._y;
	remotebomb=z;
}

function manageArmorRewards(a) {
	if (isRewardEnabled(7)) {
		a.hand1.gotoAndStop(2);
		a.hand2.gotoAndStop(2);
	}
	if (isRewardEnabled(19)) {
		a.arm1.gotoAndStop(2);
		a.arm2.gotoAndStop(2);
	}
}

function aime() {
	if (pauseq == 0) {
		if (!paused) {
			//declares permanant variables
			if (isNaN(this.chr)) {
				this.chr = 0;
				this.fo = 1;
			}
			
			//declares temporary variables
			var change:Number;
			var wa:Number;
			var mi:Number;
			var des:Number;
			var qw:Number;
			var xi:Number;
			var yi:Number;
			var dis:Number;
			var ran:Number;
			var z:MovieClip;
			
			//declare and set
			var left:Number = 1;
			
			//constants
			var turnspeed:Number = 5;
			
			//clears graphics
			movelayer.graphs.clear();
			
			//reduces delay between shots
			this.reloadtime -= 1;
			this.midtime -= 1;
			
			//Change secondary weapon
			if (Key.isDown(_DOWN)) {
				if (secer == 0) {
					secer = 1;
					secondary++;
					if (!secondaries[secondary-1]||!secsAllowed[secondary-1]) {
						while (!secondaries[secondary-1]||!secsAllowed[secondary-1]) {
							secondary++;
							if (secondary>secondaries.length) {
								secondary = 1;
							}
						}
					}
				}
			} else {
				secer = 0;
			}
				
			var oldEquiped:Number=equiped;
			//change weapon
			if (Key.isDown(_NEX)) {
				if (forw == 0) {
					equiped++;
					if(!primsAllowed[equiped-1]||equiped>maxequiped){
						while(!primsAllowed[equiped-1]||equiped>maxequiped){
							equiped++;
							if (equiped>maxequiped) {
								equiped = 1;
							}
						}
					}
				}
				forw = 1;
			} else {
				forw = 0;
			}
			if (Key.isDown(_PREV)) {
				if (bacw == 0) {
					equiped--;
					if(!primsAllowed[equiped-1]||equiped<1){
						while(!primsAllowed[equiped-1]||equiped<1){
							equiped--;
							if (equiped<1) {
								equiped = maxequiped;
							}
						}
					}
				}
				bacw = 1;
			} else {
				bacw = 0;
			}
			
			if(equiped!=oldEquiped){
				changed = true;
			}
			
			//use number keys to set equiped
			if (Key.isDown(49) && maxequiped>=1 && primsAllowed[0]) {
				equiped = 1;
			} else if (Key.isDown(50) && maxequiped>=2 && primsAllowed[1]) {
				equiped = 2;
			} else if (Key.isDown(51) && maxequiped>=3 && primsAllowed[2]) {
				equiped = 3;
			} else if (Key.isDown(52) && maxequiped>=4 && primsAllowed[3]) {
				equiped = 4;
			} else if (Key.isDown(53) && maxequiped>=5 && primsAllowed[4]) {
				equiped = 5;
			} else if (Key.isDown(54) && maxequiped>=6 && primsAllowed[5]) {
				equiped = 6;
			} else if (Key.isDown(55) && maxequiped>=7 && primsAllowed[6]) {
				equiped = 7;
			} else if (Key.isDown(56) && maxequiped>=8 && primsAllowed[7]) {
				equiped = 8;
			} else if (Key.isDown(57) && maxequiped>=9 && primsAllowed[8]) {
				equiped = 9;
			} else if (Key.isDown(48) && maxequiped>=10 && primsAllowed[9]) {
				equiped = 10;
			}
			
			//changes frame
			movelayer.Shootat0.gotoAndStop(equiped);
			
			//change to secondary weapon
			if (Key.isDown(_SWAP)) {
				if (rethrow) {
					throwing = !throwing;
					rethrow = false;
					if (equiped == 2) {
						unlock(4);
					}
				}
			} else {
				rethrow = true;
			}

			manageArmorRewards(this.main);
			manageArmorRewards(this.thrw);
			manageArmorRewards(this.slsh);
			manageArmorRewards(this.sht);
			manageArmorRewards(this.remot);
			manageArmorRewards(this.boom);

			if (whack) {
				movelayer.Guy.filters = new Array(new GlowFilter(0x00ffff, 100, 2, 2));
				movelayer.THead.filters = new Array(new GlowFilter(0x00ffff, 100, 2, 2));
				movelayer.Shootat0.filters = new Array(new GlowFilter(0x00ffff, 100, 2, 2));
			} else {
				movelayer.Guy.filters = new Array();
				movelayer.THead.filters = new Array();
				movelayer.Shootat0.filters = new Array();
			}

			if (mouseaim == 1) {

				if (_xmouse<this._x+movelayer._x) {
					aimz(this,_xmouse-movelayer._x,_ymouse-movelayer._y,0);
					movelayer.THead._xscale = this._xscale=150;
				} else {
					aimz(this,_xmouse-movelayer._x,_ymouse-movelayer._y,180);
					left = 0;
					movelayer.THead._xscale = this._xscale=-150;
				}

				movelayer.Pointer._visible = true;

			} else {

				//turn to set num pad angles
				if (Key.isDown(100)) {
					if (Key.isDown(103)) {
						des = 22.5;
					} else if (Key.isDown(97)) {
						des = -22.5;
					} else {
						des = 0;
					}
				} else if (Key.isDown(103)) {
					if (Key.isDown(104)) {
						des = 67.5;
					} else {
						des = 45;
					}
				} else if (Key.isDown(104)) {
					if (Key.isDown(105)) {
						des = 112.5;
					} else {
						des = 90;
					}
				} else if (Key.isDown(105)) {
					if (Key.isDown(102)) {
						des = 157.5;
					} else {
						des = 135;
					}
				} else if (Key.isDown(102)) {
					if (Key.isDown(99)) {
						des = -157.5;
					} else {
						des = 180;
					}
				} else if (Key.isDown(99)) {

					if (Key.isDown(98)) {
						des = -112.5;
					} else {
						des = -135;
					}
				} else if (Key.isDown(98)) {
					if (Key.isDown(97)) {
						des = -67.5;
					} else {
						des = -90;
					}
				} else if (Key.isDown(97)) {
					des = -45;
				}

				change = 0;
				wa = 0;
				mi = 0;

				mi = tsy(this._rotation);
				wa = tsy(des);
				if (Math.abs(wa-mi)>turnspeed) {
					if ((mi+180<wa) || (wa<mi)) {
						if (wa+180<mi) {
							change = 1;
						} else {
							change = -1;
						}
					} else {
						change = 1;
					}
					this._rotation += turnspeed*change;
				} else {
					this._rotation = des;
				}

				if (Math.abs(this._rotation)>90) {
					this._yscale = -150;
					movelayer.THead._xscale = -150;
					left = 1;
				} else {
					movelayer.THead._xscale = 150;
					this._yscale = 150;
					left = 1;
				}

				if (Key.isDown(101) || Key.isDown(32)) {
					if (md == 0) {
						md = 1;
					}
				} else {
					semi = true;
					if (md == 1) {
						md = 0;
					}
				}

				movelayer.Pointer._visible = false;

			}
			//rotate energy sword blades
			if ((equiped == 2)) {
				for (var x = molecount-5; x<=molecount; x++) {
					mcray = movelayer.trackmc["Ray_"+x];
					if (mcray.equiped == 2) {
						mcray._rotation = movelayer.Shootat0._rotation;
						mcray._xscale = 100;
						mcray._yscale = 100;
						mcray._x = movelayer.Shootat0._x;
						mcray._y = movelayer.Shootat0._y;

						//var dir = -1;
						if (movelayer.Shootat0._xscale == -150) {
							mcray._xscale = -100;
							//dir = 1;
						}
						if (mouseaim == 0) {
							mcray._xscale = 100;
							mcray._yscale = 100;
							//dir = 1;
							if (movelayer.Shootat0._yscale != 150) {
								//dir = -1;
								mcray._yscale = -100;
							}
						}
					}
				}
			}

			if (throwing) {
				//use secondary weapons
				this.main._visible = false;
				this.remot._visible = false;
				this.slsh._visible = false;
				this.sht._visible = false;
				this.thrw._visible = false;
				this.boom._visible = false;
				if (secondary == 1) {
					//draw grenade path
					if (isRewardEnabled(13)) {
						movelayer.graphs.lineStyle(1,0xff0000,60);
						qw = (movelayer.Shootat0._rotation+180)/180*Math.PI;
						ci = left*2-1;
						adj = 180;
						if (ci == 0) {
							ci = -1;
							adj = 0;
						}
						var xi = Math.cos(qw)*35*ci;
						var yi = Math.sin(qw)*35*ci;
						var stx = movelayer.Shootat0._x+xi;
						var sty = movelayer.Shootat0._y+yi;
						var zdy = Math.sin(qw)*8*ci;
						var zdx = Math.cos(qw)*8*ci;
						if (isRewardEnabled(7)) {
							zdy = Math.sin(qw)*10*ci;
							zdx = Math.cos(qw)*10*ci;
						}
						var count = 0;
						while (true) {
							count++;
							movelayer.graphs.moveTo(stx,sty);
							zdy += GRAV/4;
							if (zdy>12) {
								zdy = 12;
							}
							stx += zdx;
							sty += zdy;
							if (count%2 == 0) {
								movelayer.graphs.lineTo(stx,sty);
							}
							if (count == 150 || movelayer.platforms.hitTest(stx+movelayer._x, sty+movelayer._y, true)) {
								break;
							}
						}

					}
					this.thrw._visible = true;
					if (this.thrw._currentframe == 1) {
						if (sammo[secondary-1]>0 && md == 1) {
							sammo[secondary-1]--;
							this.thrw.play();
						}
					}
				} else if (secondary == 2) {
					this.slsh._visible = true;
					if (this.slsh._currentframe == 1) {
						if (sammo[secondary-1]>0 && md == 1) {
							sammo[secondary-1]--;
							this.slsh.play();
						}
					}
				} else if (secondary == 3) {
					this.sht._visible = true;
					if (this.sht._currentframe == 1) {
						if (sammo[secondary-1]>0 && md == 1) {
							sammo[secondary-1]--;
							this.sht.play();
						}
					}
				} else if (secondary == 4) {
					this.remot._visible = true;
					if (this.remot._currentframe == 1) {
						if (sammo[secondary-1]>0 && md == 1 && semi) {
							this.remot.play();
							semi = false;
						}
					} else if (this.remot._currentframe<16) {
						var po = {x:0, y:0};
						this.remot.pil.localToGlobal(po);
						if (movelayer.platforms.hitTest(po.x, po.y, true)) {
							sammo[secondary-1]--;
							vtrace("Attached",10);
							droppilon(left);
							this.remot.gotoAndPlay(16);
						}
					} else if (this.remot._currentframe == 26 && md == 1 && semi) {
						this.remot.play();
						vtrace("Detonated Manually",10);
						detonate=true;
					}else if(this.remot._currentframe == 26 && remotebomb==null){
						//when the mine is detonated automatically
						this.remot.play();
					}
				} else if (secondary == 5) {
					this.boom._visible = true;
					if (this.boom._currentframe == 1) {
						if (sammo[secondary-1]>0 && md == 1) {
							sammo[secondary-1]--;
							this.boom.play();
						}
					} else if (this.boom._currentFrame == 15) {
						if (this.boomes._parent == null && sammo[secondary-1]>0) {
							this.boom.gotoAndStop(1);
						} else if (this.boomes.hitTest(this.boom.catv) && this.boomes._currentframe>3) {
							removeMovieClip(this.boomes);
							this.boom.play();
							sammo[secondary-1]++;
						}
					}
				}
			} else {
				//use primary weapons
				this.main._visible = true;
				this.sht._visible = false;
				this.thrw._visible = false;
				this.slsh._visible = false;
				this.remot._visible = false;
				this.boom._visible = false;
				if (isRewardEnabled(4)) {
					if (equiped == 1) {
						this.main.blaster._visible = false;
						this.main.gattling._visible = true;
					}
				}
				if (autofire>0) {
					autofire--;
					if (autofire%2 == 0) {
						if (equiped == 9) {
							//nutrino gun

							dis = 35;
							z = goodfi.apply(this, [left, dis]);

							z.equiped = 9;
							z.damage = 2;
							z.grenade = false;

							z.gotoAndPlay(236);

							if ((autofire+1)%3 == 0 || autofire%3 == 0) {
								//#sound
								addSound(assetContainer.getSound("MachineFire"),"MachineFire",1);
							}
						}
					}
				} else if (md == 1 && ammo[equiped-1]>0) {
					if (this.reloadtime<=0) {
						if (equiped == 1) {
							//machine gun

							ammo[equiped-1]--;
							this.main.play();
							this.main.gattling.play();
							this.main.blaster.play();

							dis = 30;
							this.maxtime = 6;

							if (isRewardEnabled(4)) {
								dis = 33;
								this.maxtime = 4;
							}

							this.reloadtime = this.maxtime;

							z = goodfi.apply(this, [left, dis]);

							z.equiped = 1;
							z.damage = 1;
							z.grenade = false;

							//#sound
							addSound(assetContainer.getSound("MachineFire"),"MachineFire",1);
							
							//fire 1000 bullets
							mainGunBulletsFired++;
							if(mainGunBulletsFired==1000){
								unlock(34);
							}
						} else if (equiped == 2) {
							//energy sword

							ammo[equiped-1]--;
							this.reloadtime = 1;
							good = 45;

							z = movelayer.trackmc.attachMovie("Ray1", ("Ray_"+molecount), molecount++);
							z._x = this._x;
							z._y = this._y;

							z.equiped = 2;
							z.damage = 1;
							z.health = Number.POSITIVE_INFINITY+1;
							z.s = 0;
							z.te = false;
							z.grenade = false;
							
							z._rotation = movelayer.Shootat0._rotation;
							z._xscale = 100;
							z._yscale = 100;
							z._x = movelayer.Shootat0._x;
							z._y = movelayer.Shootat0._y;

							//var dir = -1;
							if (movelayer.Shootat0._xscale == -150) {
							z._xscale = -100;
							//dir = 1;
							}
							if (mouseaim == 0) {
								z._xscale = 100;
								z._yscale = 100;
								//dir = 1;
								if (movelayer.Shootat0._yscale != 150) {
									//dir = -1;
									z._yscale = -100;
								}
							}

							z.gotoAndStop(42);
							z.play();

						} else if (equiped == 4) {
							//flame thrower

							ammo[equiped-1]--;
							this.reloadtime = this.maxtime=3;
							neutral = 55;

							ran = Math.random()*10;
							if (Math.random>.5) {
								ran *= -1;
							}

							qw = (this._rotation+ran+180*left+180)/180*Math.PI;

							if (Math.random()>=0.5) {
								z = movelayer.trackmc3.attachMovie('exdy', "d"+cept, cept++);
							} else {
								z = movelayer.trackmc3.attachMovie('exdr', "d"+cept, cept++);
							}

							xi = Math.cos(qw)*-35;
							yi = Math.sin(qw)*-35;

							z._x = this._x+xi;
							z._y = this._y+yi;
							if (movelayer.platforms.hitTest(movelayer._x+z._x, movelayer._y+z._y, true)) {
								z.dead = true;
							}

							z.z = 1;
							z.damage = 2;
							z.dy = Math.sin(qw)*-10;
							z.dx = Math.cos(qw)*-10;
							z.health = 1;

							if (isRewardEnabled(11)) {
								movelayer.Guy.dx += Math.cos(qw)*7;
								movelayer.Guy.dy += Math.sin(qw)*7;
							}

						} else if (equiped == 8) {
							//gravity gun

							ammo[equiped-1]--;
							this.main.play();
							this.reloadtime = this.maxtime=10;

							dis = 33;
							z = goodfi.apply(this, [left, dis, "Ray1", 10, 0, -5]);

							var po = {x:this.pot._x, y:this.pot._y};
							this.localToGlobal(po);
							po.x -= movelayer._x;
							po.y -= movelayer._y;
							z._x = po.x;
							z._y = po.y;
							if (movelayer.platforms.hitTest(movelayer._x+z._x, movelayer._y+z._y, true)) {
								z.dead = 1;
							}

							z.equiped = 8;
							z.damage = 10;
							z.grenade = false;

							z.gotoAndPlay(175);

						} else if (equiped == 9) {
							//nutrino gun
							if (semi) {

								ammo[equiped-1]--;
								semi = false;
								this.main.play();
								autofire = 10;
								this.reloadtime = this.maxtime=20;
							}
						} else if (equiped == 10) {
							//charge gun
							if (semi) {
								ammo[equiped-1]--;
								semi = false;
								this.chr = 1;
								this.reloadtime = this.maxtime=0;

							}
						} else if (equiped == 11) {
							//pulse gun
							ammo[equiped-1]--;
							this.main.play();
							this.reloadtime = this.maxtime=35;
							shootpulse(left);
						} else if (equiped == 6&&isRewardEnabled(23)) {
							//beam gun
							ammo[equiped-1]--;
							this.reloadtime = this.maxtime=3;
							shootbeam(left);
							//#sound
							addSound(assetContainer.getSound("Pow"),"Pow",1);
						}
					}
					if (this.midtime<=0) {
						if (semi) {
							if (equiped == 3) {
								//rpg

								ammo[equiped-1]--;
								this.main.play();
								this.midtime = this.maxtime=35;
								semi = false;

								dis = 32;

								z = goodfi.apply(this, [left, dis]);

								z.equiped = 3;
								z.damage = 0;
								z.grenade = false;

								z.gotoAndPlay(45);
								if (isRewardEnabled(20)) {
									var tra = gettarget(true);
									var ratio = tra.health/tra.z;
									if ((ratio<0) || isNaN(ratio)) {
									} else {
										z.lock = tra;
									}
								}
							} else if (equiped == 5) {
								//shot gun

								ammo[equiped-1]--;
								this.main.play();
								semi = false;
								this.midtime = this.maxtime=20;

								shootgun(left);

								//#sound
								addSound(assetContainer.getSound("Bang"),"Bang",1);
							} else if (equiped == 6&&!isRewardEnabled(23)) {
								//beam gun

								ammo[equiped-1]--;
								semi = false;
								this.midtime = this.maxtime=70;

								shootbeam(left);

								//#sound
								addSound(assetContainer.getSound("Pow"),"Pow",1);

							} else if (equiped == 7) {
								//nano box gun
								ammo[equiped-1]--;
								this.main.play();
								this.midtime = this.maxtime=30;
								semi = false;

								dis = 35;

								z = goodfi.apply(this, [left, dis]);

								z.equiped = 7;
								z.damage = 10;
								z.grenade = false;

								z.gotoAndPlay(134);
							}
						}
					}
				}
			}
			if (equiped == 10 && this.chr>0) {
				if (md == 0) {
					//charge gun
					this.main.gotoAndPlay(100);

					dis = 38;
					z = goodfi.apply(this, [left, dis, "Ray1", 10, 0, -10]);

					var po = {x:this.pot._x, y:this.pot._y};
					this.localToGlobal(po);
					po.x -= movelayer._x;
					po.y -= movelayer._y;
					z._x = po.x;
					z._y = po.y;
					if (movelayer.platforms.hitTest(movelayer._x+z._x, movelayer._y+z._y, true)) {
						z.dead = 1;
					}

					z.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 255*this.chr/100, 0, 0, 0);
					z.filters = [new BlurFilter(10*this.chr/100, 10*this.chr/100, 1)];
					z.equiped = 10;
					z.gotoAndStop(297);
					z.damager = this.chr;
					z.grenade = false;
					this.chr = 0;
					z.play();
				} else if (md == 1) {
					this.chr++;
					if (this.chr>100) {
						this.chr = 100;
					}
					this.main.gotoAndStop(this.chr);
				}
			}
		}
	}
}
function shootgun(left) {
	for (var ang:Number = -10; ang<20; ang += 10) {
		var z:MovieClip = goodfi.apply(movelayer.Shootat0, [left, 35, "Ray1", 10, ang]);

		z.equiped = 5;
		z.damage = 5;
		z.gotoAndPlay(88);
		z.play();
		z.grenade = false;
	}
	good = 55;
}

function shootpulse(left) {
	var zeu = null;

	for (var ang:Number = -10; ang<20; ang += 1) {
		var z:MovieClip = goodfi.apply(movelayer.Shootat0, [left, 35, "Ray1", 10, ang]);

		var po = {x:0, y:0};
		movelayer.Shootat0.pot.localToGlobal(po);
		po.x -= movelayer._x;
		po.y -= movelayer._y;
		z._x = po.x;
		z._y = po.y;
		if (movelayer.platforms.hitTest(movelayer._x+z._x, movelayer._y+z._y, true)) {
			z.dead = 1;
		}

		var qw:Number = (movelayer.Shootat0._rotation+ang)/180*Math.PI;
		z._x += Math.cos(qw)*-10*(left*2-1);
		z._y += Math.sin(qw)*-10*(left*2-1);

		z.equiped = 11;
		z.damage = 1;
		z.gotoAndPlay(358);
		z.play();
		z.grenade = false;

		z.next = zeu;
		zeu = z;
	}
	good = 55;
}

function shootbeam(left) {
	var n:Number = 1;
	while (true) {
		var dis:Number = 26+n*8;

		var z:MovieClip = goodfi.apply(movelayer.Shootat0, [left, dis]);

		z.equiped = 6;
		if(isRewardEnabled(23)){
			z.damage = 1;
		}else{
			z.damage = 5;
		}
		z.grenade = false;
		z.health = 1;
		z.gotoAndStop(85);
		z.play();


		if (movelayer.platforms.hitTest(z._x+movelayer._x, z._y+movelayer._y, true)) {
			break;
		}
		if (n>55) {
			break;
		}
		n++;
	}
	good = 55;
}

function aim() {
	if (pauseq == 0) {
		if (!paused) {
			if (isNaN(this.set)) {
				this.set = 1;
			}
			if (isNaN(this.dead)) {
				this.dead = 0;
			}
			if (this.dead == 2) {
				removeMovieClip(this);
			} else {
				if (this.grenade) {
					if (this.typ == 0) {
						//grenade
						if (movelayer.trackmc4.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
							explosion(this._x+this.dx,this._y+this.dy,this.radius,this.plows,this.spd,2,1);
							this.dead = 2;
						} else if (movelayer.trackmc2.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
							explosion(this._x+this.dx,this._y+this.dy,this.radius,this.plows,this.spd,2,1);
							this.dead = 2;
						} else if (movelayer.trackmc3.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
							explosion(this._x+this.dx,this._y+this.dy,this.radius,this.plows,this.spd,2,1);
							this.dead = 2;
							unlock(1);
						} else {
							this._x -= this.dx;
							this.dy -= GRAV/4;
							if (this.dy<=-12) {
								this.dy = -12;
							}
							this._y -= this.dy;
							this._rotation = Math.atan2(this.dy, this.dx)/Math.PI*180;
							this.aire--;
							if (this.aire == 0) {
								explosion(this._x+this.dx,this._y+this.dy,this.radius,this.plows,this.spd,2,1);
								this.dead = 2;
							} else if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
								explosion(this._x+this.dx*1,this._y+this.dy*1,this.radius,this.plows,this.spd,2,1);
								this.dead = 2;
							}
						}
					} else if (this.typ == 1) {
						//remote mine
						if (detonate) {
							detonate = false;
							this.dead = 2;
							explosion(this.po.x,this.po.y,10,20,9,3,1);
							removeMovieClip(this);
							remotebomb=null;
						}
					} else if (this.typ == 2) {
						//boomarang
						this._x -= this.dx*this.dir;
						this._y -= this.dy*this.dir;
						if (this._currentframe == this._totalframes) {
							removeMovieClip(this);
						}
						if (isRewardEnabled(21)) {
							if (this.dir == 1) {
								if (movelayer.platforms.hitTest(this._x+movelayer._x-this.dx*2, this._y+movelayer._y-this.dy*2, true)) {
									this.gotoAndPlay(22);
								}
							} else {
								var po = {x:0, y:0};
								movelayer.Shootat0.boom.catv.localToGlobal(po);
								po.x -= movelayer._x;
								po.y -= movelayer._y;
								var dx = this._x-po.x;
								var dy = this._y-po.y;
								var dis = Math.sqrt(dx*dx+dy*dy);
								this.dx = -dx/dis*10;
								this.dy = -dy/dis*10;

							}
						}
						if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
							unlock(28);
							this.dead = 1;
							miss++;
						}
					}
				} else if (this.equiped == 1) {
					//main machine gun
					if (movelayer.trackmc4.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 2;
						this.damage = 0;
						molenull--;
					}
					if (movelayer.trackmc2.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 2;
						this.damage = 0;
						molenull--;
					}
					this._x -= this.dx;
					this._y -= this.dy;
					if (this._currentframe == 41) {
						removeMovieClip(this);
					}
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 1;
						miss++;
					}
				} else if (this.equiped == 2) {
					//energy sword
					//see aime
					if (this._currentframe == 44) {
						removeMovieClip(this);
					}
				} else if (this.equiped == 3) {
					//rocket
					if (movelayer.trackmc4.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						explosion(this._x+this.dx,this._y+this.dy,this.radius,this.plows,this.spd,3,1);
						removeMovieClip(this);
						molenull--;
					}
					if (movelayer.trackmc2.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						explosion(this._x+this.dx,this._y+this.dy,this.radius,this.plows,this.spd,3,1);
						removeMovieClip(this);
						molenull--;
					}
					if (movelayer.trackmc3.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						explosion(this._x+this.dx,this._y+this.dy,this.radius,this.plows,this.spd,3,1);
						removeMovieClip(this);
						molenull--;
					}
					if (isRewardEnabled(8)) {
						var dx = this._x-_xmouse+movelayer._x;
						var dy = this._y-_ymouse+movelayer._y;
						ok = true;
						if (isRewardEnabled(20)) {
							if (this.lock != null) {
								var po = {x:0, y:0};
								this.lock.aim.localToGlobal(po);
								dx = this._x-po.x+movelayer._x;
								dy = this._y-po.y+movelayer._y;
							} else {
								ok = false;
							}
						}
						var angle = Math.atan2(dy, dx)/Math.PI*180;
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
						if (ok) {
							this._rotation += r;
						}
						this.dx = Math.cos(this._rotation/180*Math.PI)*10;
						this.dy = Math.sin(this._rotation/180*Math.PI)*10;
					}
					this._x -= this.dx;
					this._y -= this.dy;
					if (this._currentframe == 84) {
						explosion(this._x+this.dx,this._y+this.dy,this.radius,this.plows,this.spd,3,1);
						removeMovieClip(this);
					}else if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						miss++;
						explosion(this._x+this.dx,this._y+this.dy,this.radius,this.plows,this.spd,3,1);
						removeMovieClip(this);
					}
				} else if (this.equiped == 5) {
					if (movelayer.trackmc4.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 2;
						this.damage = 0;
						molenull--;
					}
					if (movelayer.trackmc2.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 2;
						this.damage = 0;
						molenull--;
					}
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
					if (this.damage<=0) {
						this.damage = 0;
						this.dead = 1;
					}
					this._x -= this.dx;
					this._y -= this.dy;
					if (this._currentframe == 133) {
						removeMovieClip(this);
					}
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 1;
						miss++;
					}
				} else if (this.equiped == 6) {
					if (this._currentframe == 87) {
						removeMovieClip(this);
					}
				} else if (this.equiped == 7) {
					if (movelayer.trackmc4.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 2;
						this.damage = 0;
						molenull--;
					}
					if (movelayer.trackmc2.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 2;
						this.damage = 0;
						molenull--;
					}
					this._x -= this.dx;
					this._y -= this.dy;
					if (this._currentframe == 174) {
						removeMovieClip(this);
					}
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 1;
						miss++;
					}
				} else if (this.equiped == 8) {
					if (movelayer.trackmc4.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 2;
						this.damage = 0;
						molenull--;
					}
					if (movelayer.trackmc2.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 2;
						this.damage = 0;
						molenull--;
					}
					if (movelayer.Pointer._y>this._y) {
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
					if (this._currentframe == 235) {
						removeMovieClip(this);
					}
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 1;
						miss++;
					}
				} else if (this.equiped == 9) {
					this._x -= this.dx;
					this._y -= this.dy;
					if (this._currentframe == 296) {
						removeMovieClip(this);
					}
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 1;
						miss++;
					}
				} else if (this.equiped == 10) {
					this._x -= this.dx;
					this._y -= this.dy;
					if (this._currentframe == 357) {
						removeMovieClip(this);
					}
					this.damage = this.damager;
					if (movelayer.trackmc4.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 2;
						this.damage = 0;
						molenull--;
					}
					if (movelayer.trackmc2.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 2;
						this.damage = 0;
						molenull--;
					}
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 1;
						miss++;
					}
				} else if (this.equiped == 11) {
					if (isNaN(this.bounce)) {
						this.bounce = 0;
					}
					this._x -= this.dx;
					this._y -= this.dy;
					if (this._currentframe == 388) {
						removeMovieClip(this);
					}
					if (movelayer.trackmc4.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 2;
						this.damage = 0;
						molenull--;
					}
					if (movelayer.trackmc2.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						this.dead = 2;
						this.damage = 0;
						molenull--;
					}
					if (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
						if (this.bounce == 0) {
							dis = Math.sqrt(this.dx*this.dx+this.dy*this.dy);
							while (movelayer.platforms.hitTest(this._x+movelayer._x, this._y+movelayer._y, true)) {
								this._x += this.dx/dis;
								this._y += this.dy/dis;
							}
							this.dx *= -0.8;
							this.dy *= -0.8;
							this.bounce = 1;
						} else {
							this.dead = 1;
							miss++;
						}
					}
					if (this.next != null && this.next._parent != null) {
						var po = {x:0, y:0};
						this.next.localToGlobal(po);
						this.globalToLocal(po);
						this.clear();
						if (Math.sqrt(po.x*po.x+po.y*po.y)>30) {
							this.next = null;
						} else {
							this.lineStyle(10,0xffff00);
							this.lineTo(po.x,po.y);
						}
					}
				}
			}
			
			if (this.dead == 2) {
				removeMovieClip(this);
			}else if(this.dead==1){
				this._visible=false;
				this.dead=2;
			}
		}
	}
}

function goodfi(left:Number, dis:Number, type:String, spd:Number, add:Number, vdis:Number) {
	//creates a bullet and fires it
	if (type == null) {
		type = "Ray1";
	}
	if (spd == null) {
		spd = 10;
	}
	if (add == null) {
		add = 0;
	}
	if (vdis == null) {
		vdis = 0;
	}
	var qw:Number = (this._rotation+add)/180*Math.PI;
	var xi:Number = Math.cos(qw)*dis*(left*2-1);
	var yi:Number = Math.sin(qw)*dis*(left*2-1);
	if (vdis != 0) {
		xi += Math.sin(qw)*vdis;
		yi += Math.cos(qw)*vdis;
	}

	var z:MovieClip = movelayer.trackmc.attachMovie(type, ("Ray_"+molecount), molecount++);
	z._x = this._x-xi;
	z._y = this._y-yi;
	z._rotation = 180+180*left+qw/Math.PI*180;
	if (movelayer.platforms.hitTest(movelayer._x+this._x-xi, movelayer._y+this._y-yi, true)) {
		z.dead = 1;
	}
	z.health = 1;
	z.dy = Math.sin(qw)*spd*(left*2-1);
	z.dx = Math.cos(qw)*spd*(left*2-1);

	good = 55;

	return z;
}

function isRewardEnabled(index:Number){
	return allowRewards&&activatedrewards[index];
}

function moveZuy(mX:Number, mY:Number):Void{
	//for the background
	movelayer.back._x-=mX/2;
	movelayer.back._y-=mY/2;
	//end for the background
	movelayer.Guy._x -= mX;
	movelayer.Guy._y -= mY;
	movelayer.THead._x -= mX;
	movelayer.THead._y -= mY;
	movelayer.Shootat0._x -= mX;
	movelayer.Shootat0._y -= mY;
	movelayer.Pointer._x -= mX;
	movelayer.Pointer._y -= mY;
	movelayer.Hud._x -= mX;
	movelayer.Hud._y -= mY;
	movelayer.pausemessage._x -= mX;
	movelayer.pausemessage._y -= mY;
	movelayer._x += mX;
	movelayer._y += mY;
}