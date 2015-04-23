//------------------------------
// Script: talk.sqf
// Writer: Cuel
// Created: 2013-03-10
// Edited: 2013-03-14
//------------------------------
//this addAction["<t color='#A1C7A2'>Reden</t>","scripts\talk.sqf",0, 100, true, true, "","player distance general < 4 && alive general && player == vip"];

(_this select 0) removeAction (_this select 2);

_unit = general;
_exit = false;
hint "Bleiben Sie in der Nähe des Bürgermeisters!";

sleep 3;
cutText ["Bürgermeister: Salam Alaikum.","PLAIN"];
sleep 2;
_sentarr = [
	"Wir erwarten von Ihnen eine umfangreiche Entschädigung für diesen Vorfall.",
	"Sehen Sie, zwei meiner Cousins sind tot. Meine beiden Enkel sind tot.",
	"Wir werden von den Taliban bedroht. Wir werden bedroht, weil wir mit Ihnen reden.",
	"Sagen Sie mir, wie sich mich schützen wollen.",
	"Warum kommen Sie erst jetzt?",
	"Die Amerikaner wollen töten, töten, töten. Mehr wollen sie nicht.",
	"Allah akhbar.",
	"Bei mir sind sie nicht sicher!",
	"Wohlmöglich ist es schon zu spät.",
	"Ich kann Ihnen das Versteck der Taliban nicht sagen. Niemand weiß, wo sie sind.",
	"Diese Soldaten werden Sie nicht schützen können.",
	"Manchmal wünsche ich mir die Russen zurück.",
	"Sie haben uns getötet für nichts. So viele Kinder.",
	"Ich fühle mich beobachtet seit dem Bombardement.",
	"Wir brauchen Geld, wir brauchen Schutz.",
	"Ich kann in dieser Gegend für nichts garantieren. Niemand kann das.",
	"Verlassen Sie die Gegend, solange sie noch können. Verlassen Sie das Land. Unser Land."];

for "_i" from 0 to 6 do
{
	if (player distance _unit > 10) exitWith {_exit = true};
	_nr = _sentarr select (floor (random (count _sentarr)));
	cutText [format ["Bürgermeister: %1",_nr],"PLAIN"];
	_sentarr = _sentarr - [_nr];
	sleep 6 + (random 5);
};
if (_exit) exitWith {hint "Bleiben Sie in der Nähe des Bürgermeisters!"; _unit addAction["<t color='#A1C7A2'>Reden</t>","scripts\talk.sqf",0, 100, true, true, "","player distance general < 4 && alive general && player == vip"]; };

cutText ["Bürgermeister: Alaikum Salam!","PLAIN"];

CUL_talked = true; publicVariable "CUL_talked";