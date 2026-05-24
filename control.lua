-- Import necessary modules
local mSet = require("control.mod_settings")
local cleaner = require("control.cleaner")
local terrain = require("control.terrain")
local barrier = require("control.barrier")

--[[-----------------------------------------------------------------------------------------------
    HELPER FUNCTIONS
-------------------------------------------------------------------------------------------------]]

-- (Re)loads the mod settings and (re)creates the barrier decay trigger.
local function applySettings()
    mSet.refresh()
    script.on_nth_tick(nil)
    if mSet.treesWidth > 0 and mSet.decayEnabled then
        script.on_nth_tick(mSet.decayInterval*60, barrier.decay)
    end
end

--[[-----------------------------------------------------------------------------------------------
    TRIGGERS
-------------------------------------------------------------------------------------------------]]

-- Load settings upon new game or game load
script.on_init(applySettings)
script.on_load(applySettings)

-- Clean & protect chunks upon generation
script.on_event(defines.events.on_chunk_generated, function(event)

    -- Skip planets other than Nauvis
    local surface = event.surface
    if surface.name ~= "nauvis" then
        return
    end

    -- Skip chunks outside the clean zone
    local pos = event.position
    if pos.x < mSet.cleanMinC or pos.x >= mSet.cleanMaxC or pos.y < mSet.cleanMinC or pos.y >= mSet.cleanMaxC then
        return
    end

    -- Clean & protect the generated chunk
    cleaner.process(event)
    terrain.process(event)
    barrier.init(event)

end)

-- Adjust barrier decay on mod settings change
script.on_event(defines.events.on_runtime_mod_setting_changed, applySettings)
