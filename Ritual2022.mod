return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`Ritual2022` mod must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("Ritual2022", {
			mod_script       = "scripts/mods/Ritual2022/Ritual2022",
			mod_data         = "scripts/mods/Ritual2022/Ritual2022_data",
			mod_localization = "scripts/mods/Ritual2022/Ritual2022_localization",
		})
	end,
	packages = {
		"resource_packages/Ritual2022/Ritual2022",
	},
}
