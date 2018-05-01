/*
    KPLIB_fnc_init_fetchParams

    File: fn_init_fetchParams.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-01-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Fetches all mission parameters to global variables
    Also reads the KPLIB_config.sqf

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Check for ACE
KPLIB_ace_enabled = isClass (configFile >> "CfgVehicles" >> "ACE_module");
KPLIB_ace_medical = isClass (configfile >> "CfgPatches" >> "ace_medical");

KPLIB_param_source = ["LoadSaveParams", 1] call BIS_fnc_getParamValue;

if(isServer) then {
    call KPLIB_fnc_init_paramsFetch;

    KPLIB_initParamsDone = true;
    publicVariable "KPLIB_initParamsDone";
} else {
    waitUntil {!isNil "KPLIB_initParamsDone"};
    waitUntil {KPLIB_initParamsDone};
};

// Read the KPLIB_config.sqf file
call compile preprocessFileLineNumbers "KPLIB_config.sqf";

true
