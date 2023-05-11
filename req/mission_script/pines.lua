local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
ponr_value = 0
ponr_toggle = false
if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 700
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 660
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 630
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 590
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 560
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 500
		ponr_toggle = true		
	end
end

return {
	--Pro Job PONR 
	[106282] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	[105069] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	[100288] = {
		values = {
            sound_event = "earthquake_siren"
		}
	},
	[104193] = {
		values = {
            sound_event = "earthquake_siren"
		}
	},
	[106309] = {
		values = {
            enabled = false
		}
	}
}