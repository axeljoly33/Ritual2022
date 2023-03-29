local mod = get_mod("Ritual2022")

mod.is_it_active = false
local hard_mode_mutators = {
	"geheimnisnacht_2021_hard_mode"
}

mod.start_event = function(self)
    if not mod.is_it_active then
        local level_key = Managers.state.game_mode:level_key()

        if string.find(level_key, "inn_level") or string.find(level_key, "morris_hub") then 
            mod:echo("[Ritual mutator] You cannot activate it in the hub.")
        else
            mod.is_it_active = true

            local loaded = PackageManager:has_loaded("resource_packages/dlcs/geheimnisnacht_2021_event", geheimnisnacht_2021)
            if not loaded then
                -- mod:echo("[RITUAL]: Loading package: %s", resource_packages/dlcs/geheimnisnacht_2021_event)
                PackageManager:load("resource_packages/dlcs/geheimnisnacht_2021_event", "geheimnisnacht_2021", nil, true, nil)
            end

            local pop_chat = true
            local message = Localize("system_chat_geheimnisnacht_2021_hard_mode_on")
        
            Managers.chat:add_local_system_message(1, message, pop_chat)

            local mutator_handler = Managers.state.game_mode._mutator_handler

            mutator_handler:initialize_mutators(hard_mode_mutators)

            for i = 1, #hard_mode_mutators, 1 do
                mutator_handler:activate_mutator(hard_mode_mutators[i])
            end
        end
    end
end

mod.stop_event = function(self)
    if mod.is_it_active then
        mod.is_it_active = false

        local pop_chat = true
        local message = Localize("system_chat_geheimnisnacht_2021_hard_mode_off")
    
        Managers.chat:add_local_system_message(1, message, pop_chat)

        local mutator_handler = Managers.state.game_mode._mutator_handler

        for i = 1, #hard_mode_mutators, 1 do
            local mutator_name = hard_mode_mutators[i]
            local mutator_active = mutator_handler:has_activated_mutator(mutator_name)
    
            if mutator_active then
                mutator_handler:deactivate_mutator(mutator_name)
            end
        end
    end
end