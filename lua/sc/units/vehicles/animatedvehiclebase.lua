Hooks:PostHook(AnimatedVehicleBase, "set_enabled", "woohoo_wow", function(self, state)
	--this is possibly really shit, but it does in fact work
	-- also yes, you can in fact do special textures for every vehicle in the game this way and make them difficulty, faction, and level dependent as long as you make a unique-
	-- sequence for material switches. neat stuff, isn't it?
	
	local level = Global.level_data and Global.level_data.level_id	
	local faction = tweak_data.levels:get_ai_group_type()
	local difficulty = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
    local unit_name = self._unit:name()
	
    if faction == "nypd" or faction == "america" or faction == "zombie" then	 
        if self._unit:damage():has_sequence("mat_blueswat") and difficulty < 5 then
            self._unit:damage():run_sequence_simple("mat_blueswat")
        elseif self._unit:damage():has_sequence("mat_fbi") and difficulty == 5 or difficulty == 6 then
            self._unit:damage():run_sequence_simple("mat_fbi")
        elseif self._unit:damage():has_sequence("mat_gensec") and difficulty == 7  then
            self._unit:damage():run_sequence_simple("mat_gensec")    
        elseif self._unit:damage():has_sequence("mat_zeals") and difficulty == 8 then
            self._unit:damage():run_sequence_simple("mat_zeals")    
        end
	elseif faction == "lapd" or faction == "fbi" then	 
        if self._unit:damage():has_sequence("mat_blueswat") and difficulty < 5 then
            self._unit:damage():run_sequence_simple("mat_blueswat")
        elseif self._unit:damage():has_sequence("mat_fbi")  and difficulty == 5 or difficulty == 6 then
            self._unit:damage():run_sequence_simple("mat_fbi")
        elseif self._unit:damage():has_sequence("mat_fbi") and difficulty == 7  then
            self._unit:damage():run_sequence_simple("mat_fbi")    
        elseif self._unit:damage():has_sequence("mat_zeals") and difficulty == 8 then
            self._unit:damage():run_sequence_simple("mat_zeals")    
        end
	elseif faction == "murkywater" then
        if self._unit:damage():has_sequence("mat_murky") then
            self._unit:damage():run_sequence_simple("mat_murky")
        end		
	elseif faction == "russia" then
        if self._unit:damage():has_sequence("mat_reapers") then
            self._unit:damage():run_sequence_simple("mat_reapers")
        end  		
	end
	
	if self._unit:damage() and self._unit:damage():has_sequence("change_material_to_murkywater") and faction == "murkywater" then
		self._unit:damage():run_sequence_simple("change_material_to_murkywater")
	elseif self._unit:damage() and self._unit:damage():has_sequence("change_material_to_mexican") and faction == "federales"  then
		self._unit:damage():run_sequence_simple("change_material_to_mexican")	
	end
	
end)