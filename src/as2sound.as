//sounde engine start
var sounds:Array = new Array();
var soundpaused:Boolean = false;
var soundvol:Number=50;
var soundon:Boolean=true;

function setVolume(volume:Number) {
	for (var n = 0; n<sounds.length; n++) {
		sounds[n].setVolume(volume);
	}
	soundvol=volume;
}

function getVolume():Number {
	return soundvol;
}

function destroySounds() {
	for (var n = 0; n<sounds.length; n++) {
		sounds[n].stop();
	}
	sounds = new Array();
}

function stopSounds() {
	for (var n = 0; n<sounds.length; n++) {
		sounds[n].spot = sounds[n].position;
		sounds[n].stop();
	}
	soundpaused = true;
}

function playSounds() {
	for (var n = 0; n<sounds.length; n++) {
		sounds[n].start(sounds[n].spot/1000);
	}
	soundpaused = false;
}

function toggleSounds() {
	if (soundpaused) {
		playsounds();
	} else {
		stopsounds();
	}
}

function cleanSounds(){
	//this function ensures finished sounds
	//run there onSoundComplete
	var cleaned:Number=0;
	for (var n = sounds.length-1; n>=0; n--) {
		if(sounds[n].position==sounds[n].duration){
			sounds[n].onSoundComplete.apply(sounds[n]);
			cleaned++;
		}else{
		}
	}
}

function endSounds(){
	//ends all the sounds
	for (var n = sounds.length-1; n>=0; n--) {
		sounds[n].onSoundComplete.apply(sounds[n]);
	}
}

function infiniteSoundLoop(){
	this.start();
}

function noninfiniteSoundLoop() {
	this.loops--;
	if(isNaN(this.loops)){
		this.loops=0;
	}
	if (this.loops>0) {
		this.start();
	} else {
		var len:Number=sounds.length;
		sounds.splice(arrayIndexOf(sounds, this), 1);
		if(len-sounds.length!=1){
			trace("Doooooooooom "+(sounds.length-len));
		}
	}
}

function arrayIndexOf(ar:Array, value:Object):Number{
	for(var n:Number=0;n<ar.length;n++){
		if(ar[n]==value){
			return n;
		}
	}
	return -1;
}

function attachAddSound(sid:String, id:String, loops:Number){
	if(soundon){
		var sounde:Sound = new Sound();
		sounde.attachSound(sid);
		addSound(sounde, id, loops);
	}
}

function addSound(sounde:Object, id:String, loops:Number) {
	//this function play a sounde 
	//a number of times equal to loops
	//or ifinitly if loops == -1
	//and gives it an id
	if(soundon){
		if (loops == -1) {
			sounde.start();
			sounde.onSoundComplete = infiniteSoundLoop;
		} else {
			sounde.loops = loops;
			sounde.start();
			sounde.onSoundComplete = noninfiniteSoundLoop;
		}
		sounde.id = id;
		sounde.spot = 0;
		sounde.setVolume(soundvol);
		if(soundpaused){
			sounde.spot = sounde.position;
			sounde.stop();
		}
		sounds.push(sounde);
	}
}

function requestSound(sounde, id:String, loops:Number) {
	//this checks if a sounde with a given id is playing
	//if not it runs addSound(id, loops)
	var soundeok:Boolean = true;
	for (var n = 0; n<sounds.length; n++) {
		if (sounds[n].id == id) {
			soundeok = false;
			break;
		}
	}
	if (soundeok) {
		addSound(sounde, id, loops);
	}
}

//sounde engine end