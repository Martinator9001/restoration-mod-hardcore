Hooks:PostHook(MoneyTweakData, "init", "SC_MoneyTweaks", function(self, tweak_data)
	--spending cash and offshore cash split
	self.offshore_rate = 0.1 -- spending cash part of total
	self.mandatory_mult = 0.9 -- offshore cash part of total

	-- New Pro Job Bonus
	self.pro_job_new = 0
	--if one down, give 20% more cash/exp
	if Global.game_settings and Global.game_settings.one_down then
		self.pro_job_new = 1.2
	end
	self.difficulty_multiplier_payout = {
	 	0.25,
	 	0.875,
	 	1.625,
	 	2.525,
	 	3.525,
	 	4.4,
	 	4.875
	 }
	local smallest_cashout = (self.stage_completion[1] + self.job_completion[1]) * self.offshore_rate
	local max_mult = 12500
	local biggest_weapon_cost = math.round((self.biggest_cashout * 1.15) * max_mult)
	local smallest_weapon_cost = math.round(smallest_cashout * 3)
	self.weapon_cost = self._create_value_table(smallest_weapon_cost, biggest_weapon_cost, 40 * max_mult, true, 1.1)
	local biggest_weapon_mod_cost = math.round(self.biggest_cashout * 0.5)
	local smallest_weapon_mod_cost = math.round(smallest_cashout * 3)
	self.modify_weapon_cost = self._create_value_table(smallest_weapon_mod_cost, biggest_weapon_mod_cost, 10, true, 1.2)
	self.max_small_loot_value = 1000000000  --this is stupid but it works
	--MONEY CHANGES--
	self.bag_values.counterfeit_money = 1565
	--vvv this is actually jewelry as well.  in the alpha/pre-release, they were named 'Diamonds' but it was changed to 'Jewelry' for release.  but the ID of it didn't change.  fix their mistake later
	--self.bag_values.diamonds = 2265 
	self.bag_values.red_diamond = 21000
	self.bag_values.meth = 11500

	--Event's over, no more killing cash
	self.moneythrower = {
		max_kills_per_session = 0,
		kill_to_offshore_multiplier = 0
	}	
end)