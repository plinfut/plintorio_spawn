--[[-----------------------------------------------------------------------------------------------
        DEPENDENCIES
-------------------------------------------------------------------------------------------------]]
local mSet = require("mod_settings")

--[[-----------------------------------------------------------------------------------------------
        HELPER FUNCTIONS
-------------------------------------------------------------------------------------------------]]

-- Returns the new name of a tile, or false to keep it unchanged.
-- Specifically: tileCenter for coordinates between -3 and 2, false for water if replWater is false
-- and tileMain for anything else.
local function getTargetTileType(surface, x, y)
    if x >= -3 and x <= 2 and y >= -3 and y <= 2 then
        return mSet.tileCenter
    elseif not mSet.replWater and surface.get_tile(x, y).prototype.fluid then
        return false
    else
        return mSet.tileMain
    end
end

-- Changes the terrain type of all tiles in the given area.
-- Uses getTargetTileType() to determine the new terrain type of each tile.
local function changeTerrain(surface, area)
    local tiles = {}
    for x = area.left_top.x, area.right_bottom.x do
        for y = area.left_top.y, area.right_bottom.y do
            local tileType = getTargetTileType(surface, x, y)
            if (tileType) then
                table.insert(tiles, {name=tileType, position={x,y}})
            end
        end
    end
    surface.set_tiles(tiles, false, "abort_on_collision")
end

--[[-----------------------------------------------------------------------------------------------
        TERRAIN MODULE
-------------------------------------------------------------------------------------------------]]

-- Initialize the terrain module
local terrain = {}

-- Changes the terrain within a chunk defined in an on_chunk_generated event
function terrain.process(event)
    if mSet.replTerrain then
        changeTerrain(event.surface, event.area)
    end
end

-- Return the terrain module
return terrain
