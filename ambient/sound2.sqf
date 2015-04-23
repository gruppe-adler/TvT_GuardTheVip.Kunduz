_radio2 = _this select 0;



[_radio2] spawn {

_obj = _this select 0;

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + "ambient\allah.ogg";

while {alive _obj} do {    

        
    playSound3D [_soundToPlay, _obj, false, getPosASL _obj, 10, 1, 100];    
    sleep 211;   
};
};