--[[-----------------------------------------------------------------------------------------------
---- BASIC CONFIGURATION
-------------------------------------------------------------------------------------------------]]

-- Persist map generation settings within the map on first load
if storage.plintorio_spawn_enabled == nil then
    storage.plintorio_spawn_enabled = settings.startup["plintorio_spawn_enabled"].value
    storage.plintorio_spawn_radius = settings.startup["plintorio_spawn_radius"].value
    storage.plintorio_spawn_trees_width = settings.startup["plintorio_spawn_trees_width"].value
    storage.plintorio_spawn_change_floor = settings.startup["plintorio_spawn_change_floor"].value
    storage.plintorio_spawn_tile_main = settings.startup["plintorio_spawn_tile_main"].value
    storage.plintorio_spawn_tile_center = settings.startup["plintorio_spawn_tile_center"].value
    storage.plintorio_spawn_keep_water = settings.startup["plintorio_spawn_keep_water"].value
    storage.plintorio_spawn_keep_fish = settings.startup["plintorio_spawn_keep_fish"].value
    storage.plintorio_spawn_keep_ores = settings.startup["plintorio_spawn_keep_ores"].value
    storage.plintorio_spawn_keep_trees = settings.startup["plintorio_spawn_keep_trees"].value
    storage.plintorio_spawn_keep_rocks = settings.startup["plintorio_spawn_keep_rocks"].value
    storage.plintorio_spawn_keep_wreck = settings.startup["plintorio_spawn_keep_wreck"].value
    storage.plintorio_spawn_destroy_decoratives = settings.startup["plintorio_spawn_destroy_decoratives"].value
end
        
--[[-----------------------------------------------------------------------------------------------
---- HARDCODED & CALCULATED CONFIGURATION
-------------------------------------------------------------------------------------------------]]

-- Calculate the boundaries of the clean zone and safe zone.
local cleanMax = storage.plintorio_spawn_radius * 32
local cleanMin = -1 * cleanMax
local safeMax = cleanMax - storage.plintorio_spawn_trees_width
local safeMin = -1 * safeMax
-- Define water tile types.
local waterTypes = {
    ["deepwater"] = true,
    ["deepwater-green"] = true,
    ["water"] = true,
    ["water-green"] = true,
    ["water-mud"] = true,
    ["water-shallow"] = true,
}
-- Define entities NOT to destroy.
local excludedEntities = {
    ["character"] = true
}
if storage.plintorio_spawn_keep_fish then
    excludedEntities["fish"] = true
end
if storage.plintorio_spawn_keep_ores then
    excludedEntities["coal"] = true
    excludedEntities["copper-ore"] = true
    excludedEntities["crude-oil"] = true
    excludedEntities["iron-ore"] = true
    excludedEntities["stone"] = true
    excludedEntities["uranium-ore"] = true
end
if storage.plintorio_spawn_keep_trees then
    excludedEntities["dead-dry-hairy-tree"] = true
    excludedEntities["dead-grey-trunk"] = true
    excludedEntities["dead-tree-desert"] = true
    excludedEntities["dry-hairy-tree"] = true
    excludedEntities["dry-tree"] = true
    excludedEntities["tree-01"] = true
    excludedEntities["tree-02"] = true
    excludedEntities["tree-02-red"] = true
    excludedEntities["tree-03"] = true
    excludedEntities["tree-04"] = true
    excludedEntities["tree-05"] = true
    excludedEntities["tree-06"] = true
    excludedEntities["tree-06-brown"] = true
    excludedEntities["tree-07"] = true
    excludedEntities["tree-08"] = true
    excludedEntities["tree-08-brown"] = true
    excludedEntities["tree-08-red"] = true
    excludedEntities["tree-09"] = true
    excludedEntities["tree-09-brown"] = true
    excludedEntities["tree-09-red"] = true
end
if storage.plintorio_spawn_keep_rocks then
    excludedEntities["big-rock"] = true
    excludedEntities["big-sand-rock"] = true
    excludedEntities["huge-rock"] = true
end
if storage.plintorio_spawn_keep_wreck then
    excludedEntities["crash-site-spaceship-wreck-small-1"] = true
    excludedEntities["crash-site-spaceship-wreck-small-2"] = true
    excludedEntities["crash-site-spaceship-wreck-small-3"] = true
    excludedEntities["crash-site-spaceship-wreck-small-4"] = true
    excludedEntities["crash-site-spaceship-wreck-small-5"] = true
    excludedEntities["crash-site-spaceship-wreck-small-6"] = true
    excludedEntities["crash-site-chest-1"] = true
    excludedEntities["crash-site-chest-2"] = true
    excludedEntities["crash-site-spaceship"] = true
    excludedEntities["crash-site-spaceship-wreck-big-1"] = true
    excludedEntities["crash-site-spaceship-wreck-big-2"] = true
    excludedEntities["crash-site-spaceship-wreck-medium-1"] = true
    excludedEntities["crash-site-spaceship-wreck-medium-2"] = true
    excludedEntities["crash-site-spaceship-wreck-medium-3"] = true
end
    
--[[-----------------------------------------------------------------------------------------------
---- HELPER FUNCTIONS
-------------------------------------------------------------------------------------------------]]

-- Returns the new name of a tile, or false to keep it unchanged.
-- Specifically: tileCenter for coordinates between -3 and 3, false for water if keepWater is true 
-- and tileMain for anything else.
local function getTargetTileType(surface, x, y)
    if x >= -3 and x <= 2 and y >= -3 and y <= 2 then
        return storage.plintorio_spawn_tile_center
    elseif storage.plintorio_spawn_keep_water and waterTypes[surface.get_tile(x, y).name] then
        return false
    else
        return storage.plintorio_spawn_tile_main
    end
end

-- Returns whether a tile is within the tree barrier.
-- Specifically: within the clean zone but not within the safe zone (the area within the tree barrier)
local function isInTreeBarrier(x, y)
    return (x >= cleanMin and x <= cleanMax and y >= cleanMin and y <= cleanMax) and 
            not (x >= safeMin and x <= safeMax and y >= safeMin and y <= safeMax)
end

-- Plants a tree at the given position.
local function plantTree(surface, x, y)
    surface.create_entity {
        name = "tree-01",
        position = { x + 0.5, y + 0.5 },
        raise_built = false,
        create_build_effect_smoke = false
    }
end

-- Returns whether the given tree is dead.
local function isDeadTree(tree)
    return tree.tree_stage_index_max == 0 or tree.tree_gray_stage_index_max == 0 or
            ((tree.tree_stage_index/tree.tree_stage_index_max) + (tree.tree_gray_stage_index/tree.tree_gray_stage_index_max)) >= 1
end

--[[-----------------------------------------------------------------------------------------------
    PROCESSING FUNCTIONS
-------------------------------------------------------------------------------------------------]]

-- Destroys all decoratives if that feature is enabled or does nothing otherwise.
local function destroyDecoratives(surface, area)
    if storage.plintorio_spawn_destroy_decoratives then
        surface.destroy_decoratives(area)
    end
end

-- Destroys all entities not present in excludedEntities.
local function destroyEntities(surface, area)
    local entities = surface.find_entities(area)
    for _,entity in pairs(entities) do
        if entity.can_be_destroyed() and not excludedEntities[entity.name] then
            entity.destroy()
        end
    end
end

-- Updates the surface tiles if that feature is enabled or does nothing otherwise.
local function changeFloor(surface, area)
    if storage.plintorio_spawn_change_floor then
        local tiles = {}
        for x = area.left_top.x, area.right_bottom.x do
            for y = area.left_top.y, area.right_bottom.y do
                local tileType = getTargetTileType(surface, x, y)
                if (tileType) then
                    table.insert(tiles, {name=tileType, position={x,y}})
                end
            end
        end
        surface.set_tiles(tiles, true, "abort_on_collision")
    end
end

-- Creates the tree barrier.
local function plantTrees(surface, area)
    if storage.plintorio_spawn_trees_width > 0 then
        for x = area.left_top.x, area.right_bottom.x do
            for y = area.left_top.y, area.right_bottom.y do
                if isInTreeBarrier(x, y) then
                    plantTree(surface, x, y)
                end
            end
        end
    end
end

local function removeTrees()
    if settings.global["plintorio_spawn_decay_enabled"].value then
        local trees = game.surfaces[1].find_entities_filtered{ type = "tree", area = { left_top={x=cleanMin, y=cleanMin}, right_bottom={x=cleanMax, y=cleanMax} } }
        for _, tree in pairs(trees) do
            if math.random(1, 100) <= settings.global["plintorio_spawn_decay_chance"].value and isDeadTree(tree) and isInTreeBarrier(tree.position.x, tree.position.y) then
                tree.destroy()
            end
        end
    end
end

--[[-----------------------------------------------------------------------------------------------
    TRIGGERS
-------------------------------------------------------------------------------------------------]]

-- Skip cleaning checks altogether when mod was disabled at map generation.
if storage.plintorio_spawn_enabled then
    -- Clean chunks upon generation
    script.on_event(defines.events.on_chunk_generated, function(event)

          -- Skip planets other than Nauvis.
          local surface = event.surface
          if surface.name ~= "nauvis" then
              return
          end
          
          -- Skip chunks outside the clean zone.
          local area = event.area
          if (area.left_top.x >= cleanMax or area.left_top.y >= cleanMax or area.right_bottom.x <= cleanMin or area.right_bottom.y <= cleanMin) then
              return
          end
          
          -- Clean generated area.
          destroyDecoratives(surface, area)
          destroyEntities(surface, area)
          changeFloor(surface, area)
          plantTrees(surface, area)

    end)
end

-- Start the tree decay process if a tree barrier was generated.
if storage.plintorio_spawn_trees_width > 0 then
    script.on_nth_tick((settings.startup["plintorio_spawn_decay_interval"].value * 3600), removeTrees)
end