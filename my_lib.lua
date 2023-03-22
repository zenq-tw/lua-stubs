core.load_global_script = cm.load_global_script

---Will look up the context object from the context cache or construct one with the type "context_object_typename" and the data (usually a CQI) from "construction_data", call the context function specified by context_function_id and return the value.
---@param class? string #optional, default value="CcoScriptObject" Context object id on which to call the function. If omitted, the function is called on the CcoScriptObject object.
---@param object_id string | integer some identificator (FIXME: is number is ok?)
---@param func string  usage "method_name()" #Function id on the context object to call. This can also be an expression, but the result must return a context id.
---@return ComponentContextObject | any
function common.get_context_value(class, object_id, func) end

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
