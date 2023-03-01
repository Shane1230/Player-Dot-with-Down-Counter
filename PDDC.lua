Hooks:PostHook(HUDTeammate, "init", "dot_with_down_counter", function(self)
	local teammate_panel = self._player_panel
	local name = self._panel:child("name")
	local name_bg = self._panel:child("name_bg")
	local RP = self._panel:child("player"):child("revive_panel")
	local arrow = RP:child("revive_arrow")
	local dot = self._panel:child("callsign")
	
	self._panel:child("callsign"):set_visible(true)
	self._panel:child("callsign_bg"):set_visible(true)
	
	local _,_,_,h = name:text_rect()
	
	name:set_leftbottom(name:h() + 19, teammate_panel:h() - 70 - 2)
	name_bg:set_x(name:x())
	name_bg:set_h(h + 2)
	
	RP:set_h(name:h() + 1)
	RP:set_left(self._panel:child("callsign"):right() + 3)
	RP:child("revive_amount"):set_y(1)
	RP:child("revive_amount"):set_font_size(17)
	
	arrow:set_visible(false)
end)

Hooks:PostHook(HUDTeammate, "set_state", "only_for_teammate_dot", function(self, state)
	local teammate_panel = self._panel
	local is_player = state == "player"
	local name = teammate_panel:child("name")
	local name_bg = self._panel:child("name_bg")
	
	if not self._main_player then
		if is_player then
			name:set_x(48 + name:h() + 4 + 19)
			name_bg:set_x(name:x())
			name:set_bottom(teammate_panel:h() - 30)
		else
			name:set_x(48 + name:h() + 4)
			name:set_bottom(teammate_panel:h())
		end
	end
end)