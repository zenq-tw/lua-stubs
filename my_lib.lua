---@diagnostic disable duplicate-set-field


core.load_global_script = cm.load_global_script

---Will look up the context object from the context cache or construct one with the type "context_object_typename" and the data (usually a CQI) from "construction_data", call the context function specified by context_function_id and return the value.
---@param class? string #optional, default value="CcoScriptObject" Context object id on which to call the function. If omitted, the function is called on the CcoScriptObject object.
---@param object_id string | integer some identificator (FIXME: is number is ok?)
---@param func string  usage "method_name()" #Function id on the context object to call. This can also be an expression, but the result must return a context id.
---@return ComponentContextObject | any
function common.get_context_value(class, object_id, func) end

---Will look up the context object from the context cache or construct one with the type "context_object_typename" and the data (usually a CQI) from "construction_data", call the context function specified by context_function_id and return the value.
---@param expression string  #Some context expression on the CcoScriptObject to call. Result must return a context id.
---@return ComponentContextObject | any
function common.get_context_value(expression) end


--- Will create a CcoScriptObject to context cache with specified value (or update existing objects value), and send notification of change so ContextInitScriptObject can refresh display of self and children
---@param unique_id string #the unique id for the value so can set and get the value
---@param value DumpableType
function common.set_context_value(unique_id, value) end


--- Kills the specified character, with the ability to also destroy their whole force if they are commanding one. The character may be specified by a lookup string or by character cqi.
---@param character_lookup_string integer | string #Character string of character to kill. This uses the standard character string lookup system. Alternatively, a number may be supplied, which specifies a character cqi.
---@param destroy_force boolean? #optional, default value=false Will also destroy the characters whole force if true.
function cm:kill_character(character_lookup_string, destroy_force) end


--- Hides or unhides a character from the view.
---@param character CHARACTER_SCRIPT_INTERFACE #Character
---@param hide boolean #hide = true, unhide = false
function cm:toggle_character_hidden_from_view(character, hide) end


--- Spawn a plague in a region.
---@param faction FACTION_SCRIPT_INTERFACE #Faction that spread the plague.
---@param region REGION_SCRIPT_INTERFACE #Target region.
---@param plague_key string #Plague key, from the plagues table.
function cm:spawn_plague_at_region(faction, region, plague_key) end


--- Spawn a plague at a settlement.
---@param faction FACTION_SCRIPT_INTERFACE #Faction that spread the plague.
---@param settlement SETTLEMENT_SCRIPT_INTERFACE #Target settlement.
---@param plague_key string #Plague key, from the plagues table.
function cm:spawn_plague_at_settlement(faction, settlement, plague_key) end


--- Spawn a plague at a military force.
---@param faction FACTION_SCRIPT_INTERFACE #Faction that spread the plague.
---@param military_force MILITARY_FORCE_SCRIPT_INTERFACE #Target military force.
---@param plague_key string #Plague key, from the plagues table.
function cm:spawn_plague_at_military_force(faction, military_force, plague_key) end


--- Applies an effect bundle to a military force by cqi for a number of turns (can be infinite).
---@param effect_bundle_key string #Effect bundle key from the effect bundles table.
---@param number_cqi integer #Command queue index of the military force to apply the effect bundle to.
---@param turns number #Number of turns to apply the effect bundle for. Supply 0 here to apply the effect bundle indefinitely (it can be removed later with campaign_manager:remove_effect_bundle_from_force if required).
function cm:apply_effect_bundle_to_force(effect_bundle_key, number_cqi, turns) end


--- Removes an effect bundle from a military force by cqi.
---@param effect_bundle_key string #Effect bundle key from the effect bundles table.
---@param number_cqi integer #Command queue index of the military force to remove the effect from.
function cm:remove_effect_bundle_from_force(effect_bundle_key, number_cqi) end


--- This function applies an effect bundle to a military force for a number of turns (can be infinite). It differs from campaign_manager:apply_effect_bundle_to_force by referring to the force by its commanding character's cqi.
---@param effect_bundle_key string #Effect bundle key from the effect bundles table.
---@param number_cqi integer #Command queue index of the military force's commanding character to apply the effect bundle to.
---@param turns number #Number of turns to apply the effect bundle for. Supply 0 here to apply the effect bundle indefinitely (it can be removed later with campaign_manager:remove_effect_bundle_from_characters_force if required).
function cm:apply_effect_bundle_to_characters_force(effect_bundle_key, number_cqi, turns) end


--- Removes an effect bundle from a military force by its commanding character's cqi.
---@param effect_bundle_key string #Effect bundle key from the effect bundles table.
---@param number_cqi integer #Command queue index of the character commander of the military force to remove the effect from.
function cm:remove_effect_bundle_from_characters_force(effect_bundle_key, number_cqi) end


--- Returns the garrison army from a garrison residence. By default this returns the land army armed citizenry - an optional flag instructs the function to return the naval armed citizenry instead.
---@param garrison_residence GARRISON_RESIDENCE_SCRIPT_INTERFACE #Garrison residence.
---@param get_naval boolean? #optional, default value=false Returns the naval armed citizenry army, if set to true.
---@return MILITARY_FORCE_SCRIPT_INTERFACE #armed citizenry army 
function cm:get_armed_citizenry_from_garrison(garrison_residence, get_naval) end


--- Replace the name of a character with a new value supplied directly from script. No database lookup will be performed. Be warned that our lua implementation only deals with ANSI strings, so the name will be limited to latin characters.
--- <br>If a value is not required for a particular name type then a blank string may be supplied for that parameter.
---@param character CHARACTER_SCRIPT_INTERFACE
---@param forename string
---@param surname string
---@param clan_name string
---@param other_name string
function cm:change_character_custom_name(character, forename, surname, clan_name, other_name) end


do

	---generic/meta interface (not real one)
	---@generic X_SCRIPT_INTERFACE
	---@class X_LIST_SCRIPT_INTERFACE <X_SCRIPT_INTERFACE>
	--- Returns the item at the index. Make sure the index is between 0 and (max items - 1)
	---@field item_at fun(self: X_LIST_SCRIPT_INTERFACE, positive:integer): X_SCRIPT_INTERFACE
	--- Returns the number of items in the list
	---@field num_items fun(self: X_LIST_SCRIPT_INTERFACE): integer
	--- Returns a true if there are 0 items in the list
	---@field is_empty fun(self: X_LIST_SCRIPT_INTERFACE): boolean
	local X_LIST_SCRIPT_INTERFACE = {}

end

--- An iterator for use with model objects in campaign and battle. When used in a for loop with a model list object, the iterator function returns the index and next item provided by the list object each loop pass.<br />
--- In campaign, this iterator supports all model list objects such as `region_list`, `character_list`, `military_force_list` etc. 
--- <br>In battle, this iterator supports model list objects such as `battle_alliances`, `battle_armies` and `battle_units`, as well as `script_units` script collection objects.
---@param parent_list_object X_LIST_SCRIPT_INTERFACE #parent list object
---@return fun(): integer, any #list item iterator
function model_pairs(parent_list_object) end

--- An iterator for use with uicomponent objects, which returns each child in succession. When used in a for loop with a uicomponent object, the iterator function returns the index number and the child corresponding to that index each loop pass.
---@param parent_uicomponent_object UIC #parent uicomponent object
---@return fun(): integer, any #child uicomponent iterator
function uic_pairs(parent_uicomponent_object) end


do
	---@class CharacterGarrisonTargetAction
	local CharacterGarrisonTargetAction = {}
	function CharacterGarrisonTargetAction:mission_result_critial_success() end
	function CharacterGarrisonTargetAction:mission_result_success() end
	function CharacterGarrisonTargetAction:mission_result_opportune_failure() end
	function CharacterGarrisonTargetAction:mission_result_failure() end
	function CharacterGarrisonTargetAction:mission_result_critial_failure() end
	function CharacterGarrisonTargetAction:ability() end
	function CharacterGarrisonTargetAction:attribute() end
    ---@return string?
	function CharacterGarrisonTargetAction:agent_action_key() end
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterGarrisonTargetAction:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterGarrisonTargetAction:character() end
end

---PLAIN ONLY: for some fucking reason CA replaced default with their own implementation. See `string.find_lua()` for normal variant
---@param subject string
---@param substring string !!!
---@param start_from? number
---@return integer?, integer?
function string.find(subject, substring, start_from) end


---native lua string.find()
---@param subject string
---@param substring_or_pattern string
---@param start_from? number
---@param plain? boolean
---@return integer?, integer?
function string.find_lua(subject, substring_or_pattern, start_from, plain) end


do
	---@class LoadingGame: userdata
	local LoadingGame = {}
	
	---@class SavingGame: userdata
	local SavingGame = {}
end


do
	---@class ScriptEventPendingBattle
	local ScriptEventPendingBattle = {}

	---@return PENDING_BATTLE_SCRIPT_INTERFACE
	function ScriptEventPendingBattle:pending_battle() end
end


---@class script_units: script_unit


do
	---@class battle_vector
	local battle_vector = {}

	--- Returns the distance from a supplied vector to the subject vector in metres.
	---@param vector battle_vector #vector
	---@return number distance #in m 
	function battle_vector:distance(vector) end

	--- Returns the distance from a supplied vector to the subject vector in metres, but disregarding any height difference.
	---@param vector battle_vector #vector
	---@return number distance #in m 
	function battle_vector:distance_xz(vector) end
end


do
	---@class battle_capture_location_manager
	local battle_capture_location_manager = {}
	
	--- Retrieves a battle_capture_location by numerical index. If no capture location exists at the supplied index then nothing is returned. The number of capture locations on the battlefield can be queried using battle_capture_location_manager:count.
	---@param index integer
	---@return battle_capture_location #capture location 
	function battle_capture_location_manager:item(index) end

end


do
	---@class battle_manager
	local battle_manager = {}

	--- Registers a function to be called when a specified phase change occurs. Phase change notifications are sent to the script by the game when the battle changes phases, from 'Deployment' to 'Deployed' and on to 'VictoryCountdown' and 'Complete'. The battle manager writes debug output whenever a phase change occurs, regardless of whether any callback has been registered for it.<br />
	--- This wraps the underlying functionality provided by battle:register_battle_phase_handler. See that function's documentation for a list of phase change events that may be listened for.
	---@param phase_name 'Deployment'|'Deployed'|'VictoryCountdown'|'Complete' #phase name
	---@param callback function #callback
	function battle_manager:register_phase_change_callback(phase_name, callback) end
end




--- out is a table that provides multiple methods for outputting text to the various available debug console spools. It may be called as a function to output a string to the main Lua console spool, but the following table elements within it may also be called to output to different output spools:<br />
--- grudges<br />
--- ui<br />
--- chaos<br />
--- traits<br />
--- help_pages<br />
--- interventions<br />
--- invasions<br />
--- design<br />
---  <br />
--- out supplies four additional functions that can be used to show tab characters at the start of lines of output:<br />
--- FunctionDescriptionout.inc_tabIncrements the number of tab characters shown at the start of the line by one.out.dec_tabDecrements the number of tab characters shown at the start of the line by one. Decrementing below zero has no effect.out.cache_tabCaches the number of tab characters currently set to be shown at the start of the line.out.restore_tabRestores the number of tab characters shown at the start of the line to that previously cached.
--- Tab levels are managed per output spool. To each of these functions a string argument can be supplied which sets the name of the output spool to apply the modification to. Supply no argument or a blank string to modify the tab level of the main output spool.
---@param output string|number #output
function out(output) end


---print provided values in HUD
---#### comes from mod `PJConsole`
---@param ... any
function dout(...) end

--- Writes output to the lua_mod_log.txt text file, and also to the game console.
---@param output_text any #output text
function ModLog(output_text) end




do 
	---@class UIC
	local UIC = {}
	
	--- Finds and returns a child of this uicomponent by a series of string names and numeric indexes. The function will step through each argument, attempting to find the uicomponent specified, and using that as the parent from which to find the next. A numeric index argument finds an immediate child of the current search subject, whereas a string name initiates a recursive search through all children/descendants of this uicomponent.
	---@param ... any #One or more search targets in a sequence. Each search target should be an index number or string name.
	---@return UIC #of found component 
	function UIC:SequentialFind(...) end

end