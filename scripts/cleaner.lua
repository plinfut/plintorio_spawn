--[[-----------------------------------------------------------------------------------------------
        DEPENDENCIES
-------------------------------------------------------------------------------------------------]]
local mSet = require("mod_settings")

--[[-----------------------------------------------------------------------------------------------
        HELPER FUNCTIONS
-------------------------------------------------------------------------------------------------]]

-- Destroys all decoratives within a chunk defined in an on_chunk_generated event
-- (Only if configured to, otherwise does nothing)
local function destroyDecoratives(event)
    if mSet.remDecor then
        event.surface.destroy_decoratives(event.area)
    end
end

-- Destroys all configured entities within a chunk defined in an on_chunk_generated event
local function destroyEntities(event)
    local entities = event.surface.find_entities(event.area)
    for _,entity in pairs(entities) do
        if entity.can_be_destroyed() and (mSet.remEntTypes[entity.type] or mSet.remEntNames[entity.name]) then
            entity.destroy()
        end
    end
end

--[[-----------------------------------------------------------------------------------------------
        CLEANER MODULE
-------------------------------------------------------------------------------------------------]]

-- Initialize the cleaner module
local cleaner = {}

-- Cleans a chunk defined in an on_chunk_generated event
function cleaner.process(event)
    destroyDecoratives(event)
    destroyEntities(event)
end

-- Return the cleaner module
return cleaner
