

//first we declare some cookie related constants
var acheivements:Array = new Array("Beat Level 0", "Chained", "1 Minute", "MultiCombat", "Sword Grenade",
								   "Aided Suicide", "Rapid Release", "Crazy Points", "Stuborn Gunner", "Death",
								   "Ammo Saver", "Wasn't Me", "Unfair", "Oops", "Risk",
								   "Unnessecary", "Shotless", "Health Saver", "Command", "Irresponsible",
								   "Beacon", "Mine Sweeper", "1 Hour", "Slow", "DBF",
								   "No Score", "No Mouse", "How", "Lost Boomarang", "Toolbox",
								   "My Claw", "Protector", "Rock It", "Overkill", "1000 Bullets",
								   "10 Kills", "100 Kills", "500 Kills", "Beat level 10");
var acheivedpay:Array = new Array(1, 4, 3, 4, 2,
								  2, 3, 4, 5, 2,
								  3, 4, 5, 5, 6,
								  5, 10, 9, 11, 6,
								  11, 5, 7, 5, 4,
								  6, 3, 5, 3, 11,
								  3, 10, 7, 5, 5,
								  2, 8, 11, 8);
var acheivementsdescriptions:Array = new Array("You have successfully completed the first level of Idea.", "You have detonated a grenade by throwing it into an explosion. Dosen't it look cool?!", "You've played IDEA for 1 minute!", "Good job, you have earned elusive multi-combat points.", "Do you have all your bases covered? With the sword and grenade fighting style you can both defelect bullets and bomb opponents.", "Suicide drones sent at you to their deaths. The least you could do is help make the pain go away.* *-Not a representation the of Abarrow's views.", "With great power comes ... great reflexes? Don't waste time, shoot your rpg when the time is right.", "Nicely done. Breaking the 500 point highscore line. Insert rude joke about still being a noob here.", "You can change guns by pressing e and/or q. You're not limited to one weapon.", "Even the worst players die. Wait, is that how the saying goes?", "Save ammo, save money, save robots' lives?", "It's so nice of that robot to helping you.", "I wish I could aim. But I'm a mere basic horizontal turret.", "Remember all rewards have their problems.", "Is it wise, to fight that with the first gun?", "Don't be so wasteful!", "Pb is bad for the enviroment!", "Nanoboxs, who needs them?", "You have destroyed K-19's command computer.", "You let him die! You're a terrible person!", "You have found a robot beacon.", "You would be a great help in Afganistan!* *-Abarrow does not support war.", "You've played IDEA for 1 hour!", "Wow you took a really long time to beat that level!", "Death by falling.", "How did you not score a single normal point. Hint: By flying.", "Use the power of the num pad!", "How did you loose on recreational?", "Skill, is needed to use a boomarang.", "You have found a toolbox.", "Wait, how did you kill me with my own claw?", "You managed to protect an ally in level 16! Wow!", "You killed a flamer with what?", "Because there's no kill like it.", "You fired how many?","Good job, only a billion times more robots to kill!","Well done, don't forget we still have a lot of robots to kill.","You're a serial killer! Get the pun?","You are well on your way to saving the republic.");
var acheivelength:Number = 39;

var rewards:Array = new Array("Glide", "Slide", "Time Reload", "Helmet", "Gattling",
							  "Endoplotion", "Boots", "Gauntet", "Guided", "Knife",
							  "Pistol", "Rocket", "Beserk", "Arc", "Super Jump",
							  "Detonator", "Boomarang", "Next Weapon", "Anti Gravity", "Vambraces",
							  "Lock On", "Smart Boomarang", "Mine", "Continuous Beam", "Nano Drain");
var rewardpay:Array = new Array(5, 3, 4, 7, 9,
								5, 7, 7, 9, 7,
								6, 9, 10, 7, 10,
								12, 6, 20, 8, 6,
								8, 9, 7, 20, 7);
var rewardsdescriptions:Array = new Array("Practicle: At the turning point of your jump float in the air for a moment (5 frames).", "Goofy: I just can't stop. He just can't stop.", "Practicle: Show reload time like never before.", "Practicle: When fighting robots it's good to keep yo're head safe. No really heads are unreplacable.", "Practicle: What if you're first gun was better? Introducing the gattling gun.", "Goofy: Kaboom never felt so cold.", "Practicle: Shoes! I have to get them.", "Practicle: Even whithout clear opposable thumbs, hands are vital.", "Practicle: Shoot rockets auround corners!", "Both: Who needs grenades when you have a knife?", "Both: Another gun, but smaller.", "Goofy: I can fly.", "Risky: Losse 50 health and deal one damage more per hit.", "Practicle: Know where your grenades will go.", "Practical: It's in the name.", "Practical: Place explosive charges, blow them up with a detonator. What's not to love?", "Semi-Practicle: With skill a deadly weapon, without, a toy.", "Practicle: Wait you are not supposed to get that until next level!", "Goofy and Practicle: Gravity, who needs it?", "Practicle: Yet more armor.", "Practicle: The ultimate fire and forget missiles. Note: Guided must be turned on for this to work.", "Practicle: This is why the boomarang is useful.", "Fianlly the real use of the remote detonator.* *Abarrow does not support land mines, because they mame children.", "Goofy and Practicle: The particle beam that doesn't stop.","Practicle: It's time to heal!");
var rewardlength:Number = 25;


var hasreadcookie:Boolean=false;

//defaults for idea's settings
var defaultsettings:Array=["3", "1", "1", "1", "1", "1", "1"];

//defaults for idea's totals
var defaulttotals:Array=[0,0];


//other varriables

//setup a bunch of variables
//start time of a speed test
var startTime:Number;
//is a speed test occuring
var testing:Boolean=false;
//end time of speed test
var testId:String;
//Array of allies.
var goodies:Array=null;
//Count of targets in range.
var enemiesInRange:Number=0;
//are we using the mouse (1) or keyboard (0) to aim
var mouseaim:Number=1;
//Are transitions turned on? 1 -> yes, 0 -> no
var transitions:Number=1;
var levelxml:XML=new XML();
//Difficulty coefficient.
var DIFF:Number = 1;
//Used as a final defense agianst things acting when they shouldn't.
var pauseq:Number = 1;
//Used to define the next level to be played, after a cutscene.
var leveltoplay:Number = 0;
//Number of active trace commands.
var vtraces:Number=0;
//An array of the multicombat constants of weapons.
var multiscores:Array = new Array(4, 1, 4, 2, 5, 1, 3, 4, 4, 5, 1);
//Keyboard key codes corresponding to commands.
var _UP:Number=87;
var _LEFT:Number=65;
var _DOWN:Number=83;
var _RIGHT:Number=68;
var _SWAP:Number=82;
var _NEX:Number=69;
var _PREV:Number=81;
//Bitmap data used for transitions.
var changebit:BitmapData = new BitmapData(400, 400, true, 0x00000000);
var previousLevel:Number=-1;

//setup properties
weaponChoice._visible=false;
instructions._visible=false;
medi._visible = false;
acheiver._visible = false;
gameover._visible = false;
movelayer._visible = false;
lob._visible = false;
bink._visible = false;
levs._visible = false;
la.text._visible = false;
sound._visible = false;
buyer._visible = false;
opt._visible=false;
changer.count = 0;
chnager.max = 0;
changer.changing = false;

/*
Ensures everything is done loading before the cookie is read.
*/
onEnterFrame=function(){
	readcookie();
	delete onEnterFrame;
}

/*
Reads the idea cookie and acts opon the settings.
*/
function readcookie() {
	//Yet to optimize.
	idea = SharedObject.getLocal("Idea", "/");
	acheived = idea.data.acheived;
	zed = idea.data.level;
	highscore = idea.data.Highscore;
	//make sure they don't have a highscore of infinity
	if(highscore==Infinity){
		//fatal error code
		for(var n=0;n<10;n++){
			trace("**");
		}
		trace("Fatal Error");
		for(var n=0;n<10;n++){
			trace("**");
		}
		highscore=5000;
	}
	activatedrewards = idea.data.activatedrewards;
	rewarded = idea.data.rewarded;
	if (acheived == null) {
		acheived = new Array();
		for (n=0; n<acheivelength; n++) {
			acheived[n]=false;
		}
		idea.data.acheived = acheived;

		idea.flush();
	} else if (acheived.length != acheivelength) {
		acheiv = [];
		for (n=0; n<acheived.length; n++) {
			acheiv[n] = acheived[n];
		}
		for (m=n; m<acheivelength; m++) {
			acheiv[m] = false;
		}
		acheived = acheiv;
		idea.data.acheived = acheived;
		idea.flush();
	}
	if (rewarded == null) {
		rewarded = new Array();
		for (m=0; m<rewardlength; m++) {
			rewarded[m] = false;
		}
		idea.data.rewarded = rewarded;
		idea.flush();
	} else if (rewarded.length != rewardlength) {
		var rewarde = new Array();
		for (n=0; n<rewarded.length; n++) {
			rewarde[n] = rewarded[n];
		}
		for (m=n; m<rewardlength; m++) {
			rewarde[m] = false;
		}
		rewarded = rewarde;
		idea.data.rewarded = rewarded;
		idea.flush();
	}
	if (activatedrewards == null) {
		var active = new Array();
		for (n=0; n<rewarded.length; n++) {
			active[n] = false;
		}
		activatedrewards = active;
		idea.data.activatedrewards = activatedrewards;
		idead.flush();

	} else if (activatedrewards.length != rewardlength) {
		var active = new Array();
		for (n=0; n<activatedrewards.length; n++) {
			active[n] = activatedrewards[n];
		}
		for (m=n; m<rewardlength; m++) {
			active[m] = false;
		}
		activatedrewards = active;
		idea.data.activatedrewards = activatedrewards;
		idea.flush();
	}
	if (isNaN(zed)) {
			idea.data.level = 0;
			idea.flush();
			zed = 0;
	}
	if (isNaN(highscore)) {
		idea.data.Highscore = 0;
		highscore = 0;
		idea.flush();
	}
	
	//totals
	totals=idea.data.totals;
	if(totals==null){
		totals=defaulttotals;
		timetotal = idea.data.timetotal;
		if(timetotal!=null){
			totals[0]=timetotal;
		}
		idea.flush();
	}
	idea.data.timetotal=null;
	timetotal=totals[0];
	killtotal=totals[1];
	if (killtotal>=10) {
		unlock(35);
	}
	if (killtotal>=100) {
		unlock(36);
	}
	if (killtotal>=500) {
		unlock(37);
	}
	//options saving
	settings=idea.data.settings;
	if(settings==null){
		settings=defaultsettings
		idea.data.settings=settings;
		idea.data.flush();
	}else if(settings.length!=defaultsettings.length){
		for(n=settings.length;n<defaultsettings.length;n++){
			settings.push(defaultsettings[n]);
		}
		idea.data.settings=settings;
		idea.data.flush();
	}
	opt.qual.select(settings[0]);
	opt.tra.select(settings[1]);
	opt.con.select(settings[2]);
	opt.mos.select(settings[3]);
	Diff.gro.select(settings[4]);
	opt.son.select(settings[5]);
	opt.bri.setValue(settings[6]);
	_root.transform.colorTransform=new ColorTransform(settings[6], settings[6], settings[6], 1, 0, 0, 0, 0, 0);
	
	if (highscore>500) {
		unlock(7);
	}
	if (zed>=1) {
		unlock(0);
	}
	if (zed>=11) {
		unlock(38);
	}
	if (timetotal>=2100) {
		unlock(2);
	}
	if (timetotal>=126000) {
		unlock(22);
	}
	
	var cookieout:String="";
	
	money = 0;
	for (n=0; n<acheivedpay.length; n++) {
		if (acheived[n]) {
			cookieout+=n+". Acheived "+acheivements[n]+" value "+acheivedpay[n]+".\n";
			money += acheivedpay[n];
		} else {
			cookieout+=n+". Yet to acheive "+acheivements[n]+" value "+acheivedpay[n]+".\n";
		}
	}
	for (n=0; n<rewardpay.length; n++) {
		if (rewarded[n]) {
			var ons:String="Disabled";
			if(activatedrewards[n]){
				ons="Enabled";
			}
			cookieout+=n+". Bought "+rewards[n]+" value "+rewardpay[n]+". It is currently "+ons+".\n";
			money -= rewardpay[n];
		} else {
			cookieout+=n+". Yet to buy "+rewards[n]+" value "+rewardpay[n]+".\n";
		}
	}
	moneystring = "Money: "+money;
	highscoree.text = "HighScore:"+highscore;
	var hours:Number=Math.floor(timetotal/35/60/60);
	var mins:Number=Math.floor(timetotal/35/60%60);
	cookieout+="You have played for "+hours+" hours and "+mins+" minutes!\n";
	cookieout+="You have killed "+killtotal+" enemies!\n";
	
	for (n in levs) {
		var tar = levs[n];
		//custom level code
		if ((tar._name == "dne") || (tar._name == "lye") || (tar._name=="cus")) {
		} else {
			showLevel(tar);
		}
	}
	if(!hasreadcookie){
		hasreadcookie=true;
		trace(cookieout);
	}
}

/*
Updates a level to show if you have unlocked it.
*/
function showLevel(a:MovieClip) {
	a.tex.text = ("Level "+a.level);
	if (a.level>zed) {
		a.loc._visible=true;
	}else{
		a.loc._visible=false;
	}
}

/*
Finishes a cutscene.
*/
function continuer() {
	_root.changesceen(30);
	medi._visible = false;
	lob._visible = false;
	medi.lod.contentPath = null;
	gamevar(leveltoplay);
}

/*
Skips a cutscene.
*/
medi.ski.onPress = function() {
	if (pauseq == 1) {
		continuer();
	}
};


/*
Sets up a level's cutscene if there is one, if not starts the level. 
*/
function startLevel() {
	//custom level code
	if (zed>=this.level) {
		_root.changesceen(30);
		if (this._parent._visible) {
			this._parent._visible = false;
			leveltoplay = this.level;
			if (this.level == 2 || this.level == 4 || this.level == 6 || this.level == 10 || this.level==14 || this.level == 18) {
				gamevar(leveltoplay);
			} else{
				lob._visible = true;
				medi._visible = true;
				if (this.level == 0) {
					medi.lod.contentPath = "cut_scenes/quake2.swf";
				} else if (this.level == 1) {
					medi.lod.contentPath = "cut_scenes/behemoth.swf";
				} else if (this.level == 3) {
					medi.lod.contentPath = "cut_scenes/facility.swf";
				} else if (this.level == 5) {
					medi.lod.contentPath = "cut_scenes/thick.swf";
				} else if (this.level == 7) {
					medi.lod.contentPath = "cut_scenes/shotdown.swf";
				} else if (this.level == 8) {
					medi.lod.contentPath = "cut_scenes/runner.swf";
				} else if (this.level == 9) {
					medi.lod.contentPath = "cut_scenes/luck.swf";
				} else if (this.level == 11) {
					medi.lod.contentPath = "cut_scenes/board.swf";
				} else if (this.level == 12) {
					medi.lod.contentPath = "cut_scenes/gunship.swf";
				} else if (this.level == 13) {
					medi.lod.contentPath = "cut_scenes/station.swf";
				} else if (this.level == 15) {
					medi.lod.contentPath = "cut_scenes/surivival.swf";
				} else if (this.level == 16) {
					medi.lod.contentPath = "cut_scenes/train.swf";
				} else if (this.level == 17){
					medi.lod.contentPath = "cut_scenes/seige.swf";
				}
			}
		}
	}else{
		vtrace("You must first beat level "+(this.level-1)+".", -1, 0xff0000);
	}
}

/*
Shows or hides idea's main menu.
*/
function menustuffvisible(a:Boolean) {
	Play._visible = a;
	qus._visible = a;
	cidea._visible = a;
	Idea._visible = a;
	snd._visible = a;
	highscoree._visible = a;
	toacheive._visible = a;
	Diff._visible = a;
	toopt._visible=a;
}

/*
Moves from idea's main menu to the level selection menu.
*/
Play.onRelease = function() {
	changesceen(30);
	menustuffvisible(false);
	levs._visible = true;
};

/*
Moves from idea's main menu to the instructions menu.
*/
qus.onRelease = function(){
	changesceen(30);
	menustuffvisible(false);
	instructions._visible = true;
}

/*
Moves from idea's main menu to the acheivements menu.
*/
toacheive.te.onRelease = function() {
	changesceen(30);
	menustuffvisible(false);
	acheiver._visible = true;
};

/*
Moves from idea's main menu to the options menu.
*/
toopt.te.onRelease = function() {
	changesceen(30);
	menustuffvisible(false);
	opt._visible=true;
};

/*
Moves from a sub menu to idea's main menu.
*/
function leavesubmenu() {
	if (this._parent._parent._parent._visible) {
		changesceen(30);
		menustuffvisible(true);
		Idea.gotoAndPlay(1);
		this._parent._parent._parent._visible = false;
		this._parent._parent._parent.gotoAndStop(1);
	}
}

/*
Unlocks a reward
*/
function unloc(a:MovieClip) {
	idea.data.rewarded[a.nam] = true;
	idea.flush();
	readcookie();
	setupReward(a);
}


/*
Setups the visual display of an acheivement.
*/
function setupAcheivement(a:MovieClip) {
	//show acheivement name
	a.namer.text = replaceall(acheivements[a.nam], "_", " ");
	
	//show money earned from the acheivement
	a.pa.text = acheivedpay[a.nam];
	
	//have we unlocked this acheivement
	var ok:Boolean = acheived[a.nam]==true;
	
	//destroy the old icon
	a.image.removeMovieClip();
	
	//add a new one
	var img_mc:MovieClip;
	if (ok) {
		img_mc = a.attachMovie(a.img, "image", a.getNextHighestDepth());
		img_mc._xscale = a.scx;
		img_mc._yscale = a.scy;
		img_mc._x = a.imgx;
		img_mc._y = a.imgy;
	} else {
		img_mc = a.attachMovie("lock", "image", a.getNextHighestDepth());
		img_mc._xscale = 300;
		img_mc._yscale = 300;
		img_mc._x = -20;
		img_mc._y = 20;
	}
	
	//describe the acheivement when we click the icon
	img_mc.onRelease = describeAcheivement;
}

/*
Describes the clicked acheivement.
*/
function describeAcheivement() {
	vtrace(this._parent.namer.text+": "+acheivementsdescriptions[this._parent.nam], -1, 0xffffff);
}

/*
Describes the clicked reward.
*/
function describeReward() {
	vtrace(this._parent.namer.text+": "+rewardsdescriptions[this._parent.nam], -1, 0xffffff);
}

/*
Try to buy a reward.
*/
function buy(a:MovieClip) {
	var remainder:Number = money-rewardpay[a.nam];
	if (remainder>=0) {
		buyer._visible = true;
		buyer.disclaimer.text = "Are you sure you want to buy "+a.namer.text+"? You currently have "+money+"$ after buying "+a.namer.text+" you will have "+remainder+"$. All purchases are final.";
		buyer.affect = a;
	} else {
		trace("Insuficient funds.");
	}
}

/*
Sets up the visual display of a reward.
*/
function setupReward(a:MovieClip) {
	//show reward name
	a.namer.text = replaceall(rewards[a.nam], "_", " ");
	
	//show reward cost
	a.pa.text = rewardpay[a.nam];
	
	//have you bought the reward
	var ok:Boolean=rewarded[a.nam]==true;
	if (ok) {
		a.purchase._visible = false;
	}
	
	//destroy the old icon
	a.image.removeMovieClip();
	
	//add a new one
	var img:MovieClip;
	if (ok) {
		img = a.attachMovie(a.img, "image", a.getNextHighestDepth());
		img._xscale = a.scx;
		img._yscale = a.scy;
		img._x = a.imgx;
		img._y = a.imgy;
		img.onRelease = describeReward;
	} else {
		img = a.attachMovie("lock", "image", a.getNextHighestDepth());
		img._xscale = 300;
		img._yscale = 300;
		img._x = -20;
		img._y = 20;
	}
}

/*
Sets if a reward is activated.
*/
function activater(a:Number, b:Boolean) {
	if (rewarded[a]) {
		activatedrewards[a] = b;
	}
	//save preferences
	idea.data.activatedrewards = activatedrewards;
	idead.flush();
}

//setup methods
changer.attachBitmap(changebit,7000);
changer.onEnterFrame = function() {
	if (this.changing) {
		this.count++;
		changebit.fillRect(new Rectangle(200-200/this.max*this.count, 0, 2*200/this.max*this.count, 400),0x00000000);
		if (this.count == this.max) {
			changing = false;
		}
	}
};


function changesceen(max:Number) {
	if(transitions==1){
		changebit.draw(this);
		changer.changing = true;
		changer.count = 0;
		if (isNaN(max)) {
			max = 200;
		}
		changer.max = max;
	}
}

function vtrace(message:String, tim:Number, col:Number){
	if(tim==null){
		tim=100;
	}else if(tim==-1){
		tim=message.length;
	}
	if(col==null){
		col=0x00ff00;
	}	
	
	/*var maxlength:Number=80;
	if(message.length>maxlength){
		var mes1:String=message.substr(0, Math.floor(message.length/2));
		var mes2:String=message.substr(Math.floor(message.length/2), message.length-Math.floor(message.length/2));
		vtrace(mes1, tim*mes1.length/message.length, col);
		vtrace(mes2, tim*mes2.length/message.length, col);
	}else{*/
		var field:TextField=output.createTextField("t"+output.getNextHighestDepth(),output.getNextHighestDepth(),0,0,400,17);
		field.autoSize="left";
		field.text=message.substr(0,1);
		field.message=message;
		field.tim=tim;
		field.setTextFormat(new TextFormat("Geniso",20,col));
		field.col=col;
		field.embedFonts=true;
		field.selectable=false;
		vtraces++;
	//}
}

output.onEnterFrame=function(){
	if(vtraces!=0){
		var xc:Number=0;
		var newest:TextField=output["t"+(xc)];
		while(newest==null){
			xc++;
			var newest=output["t"+(xc)]
		}
		newest._y=-newest._height-5;
		if(newest.text.length==1){
			newest._x=5;
		}else if(newest._x+newest._width>400){
			newest._x-=3;
		}
		if(newest.text==newest.message){
			newest.tim--;
			
			if(newest.tim<0){
				newest._alpha-=10;
				if(newest._alpha<=0){
					vtraces--;
					newest.removeTextField();
				}
			}
		}else{
			newest.text=newest.message.substr(0, newest.text.length+1);
			newest.setTextFormat(new TextFormat("Geniso",20,newest.col));
			newest.embedFonts=true;
		}
	}
}

function unlock(ind:Number){
	if(!acheived[ind]){
		vtrace("Acheivement Unlocked: "+acheivements[ind]+": "+acheivementsdescriptions[ind], -1, 0xffffff);
		acheived[ind] = true;
		idea.data.acheived = acheived;
		idea.flush();
	}
}