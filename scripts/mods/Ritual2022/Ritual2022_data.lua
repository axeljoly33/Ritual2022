local mod = get_mod("Ritual2022")

return {
	name = "Ritual mutator",
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = {
			{
				setting_id      = "activate_ritual2022",
				type            = "keybind",
				default_value   = {},
				keybind_trigger = "pressed",
				keybind_type    = "function_call",
				function_name   = "start_event"
			},
			{
				setting_id      = "deactivate_ritual2022",
				type            = "keybind",
				default_value   = {},
				keybind_trigger = "pressed",
				keybind_type    = "function_call",
				function_name   = "stop_event"
			}
		}
	}
}
