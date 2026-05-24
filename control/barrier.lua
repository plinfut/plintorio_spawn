--[[-----------------------------------------------------------------------------------------------
        DEPENDENCIES
-------------------------------------------------------------------------------------------------]]
local mSet = require("mod_settings")

--[[-----------------------------------------------------------------------------------------------
        HELPER FUNCTIONS
-------------------------------------------------------------------------------------------------]]

-- Returns whether a ChunkPosition is part of the edge of the clean zone
local function isOuterChunk(pos)
    return pos.x == mSet.cleanMinC or pos.x == mSet.cleanMaxC-1 or pos.y == mSet.cleanMinC or pos.y == mSet.cleanMaxC-1
end

-- Returns whether a tile is outside the safe zone.
-- (When only working within the clean zone, that makes it within the tree barrier.)
local function isInTreeBarrier(x, y)
    return x < mSet.safeMin or x > mSet.safeMax or y < mSet.safeMin or y > mSet.safeMax
end

-- Plants a tree at the given position
local function plantTree(surface, x, y)
    surface.create_entity {
        name = "tree-01",
        position = { x + 0.5, y + 0.5 },
        raise_built = false,
        create_build_effect_smoke = false
    }
end

-- Plants a tree on every tile within the tree barrier
local function createBarrier(surface, area)
    if mSet.treesWidth > 0 then
        for x = area.left_top.x, area.right_bottom.x do
            for y = area.left_top.y, area.right_bottom.y do
                if isInTreeBarrier(x, y) then
                    plantTree(surface, x, y)
                end
            end
        end
    end
end

-- Returns whether the given tree is dead
local function isDead(tree)
    return tree.tree_stage_index_max == 0 or tree.tree_gray_stage_index_max == 0 or
            ((tree.tree_stage_index/tree.tree_stage_index_max) + (tree.tree_gray_stage_index/tree.tree_gray_stage_index_max)) >= mSet.decayDamage
end

--[[-----------------------------------------------------------------------------------------------
        BARRIER MODULE
-------------------------------------------------------------------------------------------------]]

-- Initialize the barrier module
local barrier = {}

-- Create the barrier within a chunk defined in an on_chunk_generated event
function barrier.init(event)
    if mSet.treesWidth > 0 and isOuterChunk(event.position) then
        createBarrier(event.surface, event.area)
    end
end

function barrier.decay()
    local trees = game.get_surface("nauvis").find_entities_filtered{ type="tree", area={{mSet.cleanMinT,mSet.cleanMinT},{mSet.cleanMaxT,mSet.cleanMaxT} }}
    for _, tree in pairs(trees) do
        if math.random() <= mSet.decayChance and isDead(tree) and isInTreeBarrier(tree.position.x, tree.position.y) then
            tree.destroy()
        end
    end
end

-- Return the barrier module
return barrier
