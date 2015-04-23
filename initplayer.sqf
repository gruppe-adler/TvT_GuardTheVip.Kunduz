CUL_fn_Equip = {
	removeHeadGear player;
	removeVest player;
	removeUniform player;
	player unassignItem "NVGoggles";
	player removeItem "NVGoggles";
	removeAllWeapons player;
	if (backpack player != "") then {removeBackPack player};
	switch (side player) do {
		case blufor: {
			"respawn_east" setmarkeralphalocal 0;
			if (str player != "vip") then {
				(group player) setGroupID  ["Team Shield"];
			
				if ((str player) in ["s1","s2","s3","s4","s5","s6"]) then {
					player linkItem "ItemGPS";
				
					player addUniform "ARC_GER_Tropentarn_Uniform";
					player addHeadGear "ARC_UN_M2000";
					player addVest "ARC_GER_Tropentarn_Plate_Carrier";
					player addMagazine "HandGrenade";
				}else{
					player addUniform "ARC_GER_Tropentarn_Uniform";
					player addHeadGear "ARC_UN_M2000"; 
					player addVest "ARC_GER_Tropentarn_Plate_Carrier";
				};
			}else{
					player linkItem "ItemGPS";
					
					player forceAddUniform "GER_Tropentarn_Officer_Uniform";
					player addHeadGear "ARC_Beret_UN";
					player addVest "V_PlateCarrier1_blk";
					for "_i" from 1 to 2 do {player addItemToUniform "16Rnd_9x21_Mag";};

					for "_i" from 1 to 4 do {player addItemToVest "AGM_Bandage";};
					for "_i" from 1 to 2 do {player addItemToVest "AGM_Morphine";};
					for "_i" from 1 to 2 do {player addItemToVest "AGM_Epipen";};
					for "_i" from 1 to 2 do {player addItemToVest "AGM_CableTie";};
					player addItemToVest "AGM_EarBuds";
					for "_i" from 1 to 8 do {player addItemToVest "16Rnd_9x21_Mag";};

					player addGoggles "G_Squares_Tinted";
					player addWeapon "hgun_P07_F";
					player addWeapon "Binocular";
					player linkItem "ItemMap";
					player linkItem "ItemCompass";
					player linkItem "ItemWatch";
					player linkItem "tf_anprc152";
					player linkItem "ItemGPS";

					[] spawn {
					while {alive player} do {
							waitUntil {uniform player != "GER_Tropentarn_Officer_Uniform" || headGear player != "ARC_Beret_UN" || vest player != "V_PlateCarrier1_blk"};
							{deleteVehicle _x} forEach (nearestObjects[player,["WeaponHolder"],3]);
							removeHeadGear player;
							removeVest player;
							removeUniform player;
							player addUniform "GER_Tropentarn_Officer_Uniform";
							player addHeadGear "ARC_Beret_UN";
							player addVest "V_PlateCarrier1_blk";
							};
					};
			};
		};
		case opfor: {
			//"respawn_west" setmarkeralphalocal 0;
			{_x setMarkerColorLocal "ColorRed"; _x setMarkerTextLocal " VIP eliminieren"}forEach ["helimark","rogainmark","generalmark","dockmark"];
			{_x setMarkerTextLocal " VIP eliminieren"}forEach ["helimark","rogainmark"];
			player addUniform "U_CAF_AG_EEUR_FATIGUES_03";
			player addVest "V_TacVest_oli";
			
		};
		default {};
	};
	
	
	
};
[] call CUL_fn_Equip;

player addEventHandler ["Respawn",{
	(_this select 1) spawn {
		sleep 3; 
		hidebody _this;
		sleep 5;
		deleteVehicle _this;
	};
	[] spawn CUL_fn_Equip;
}];

waitUntil {time > 0};
player switchMove "amovpercmstpslowwrfldnon";

[] execVM "markAssassins.sqf";
[] execVM "markBlufor.sqf";