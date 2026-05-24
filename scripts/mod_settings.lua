local CHUNK_SIZE = 32

-- Initialize the mod settings module
local mSet = {}

function mSet.refresh()
    -- Calculate the dimensions of the zones
    mSet.cleanMaxC = math.ceil((settings.startup["plintorio_spawn_clean_size"].value / 2) / CHUNK_SIZE)
    mSet.cleanMinC = -1 * mSet.cleanMaxC
    mSet.cleanMaxT = mSet.cleanMaxC * CHUNK_SIZE
    mSet.cleanMinT = -1 * mSet.cleanMaxT
    mSet.safeMax = mSet.cleanMaxT - settings.startup["plintorio_spawn_trees_width"].value
    mSet.safeMin = -1 * mSet.safeMax

    -- Create shortcuts for terrain settings
    mSet.replTerrain = settings.startup["plintorio_spawn_replace_terrain"].value
    mSet.tileMain = settings.startup["plintorio_spawn_tile_main"].value
    mSet.tileCenter = settings.startup["plintorio_spawn_tile_center"].value
    mSet.replWater = settings.startup["plintorio_spawn_replace_water"].value

    -- Collections of entities to remove
    mSet.remEntTypes = {}
    mSet.remEntNames = {}

    -- Process fish setting
    if settings.startup["plintorio_spawn_remove_fish"].value then
        mSet.remEntTypes["fish"] = true
    end

    -- Process cliffs setting
    if settings.startup["plintorio_spawn_remove_cliffs"].value then
      mSet.remEntTypes["cliff"] = true
    end

    -- Process crash site setting
    if settings.startup["plintorio_spawn_remove_crash_site"].value then
        mSet.remEntNames["crash-site-chest-1"] = true
        mSet.remEntNames["crash-site-chest-2"] = true
        mSet.remEntNames["crash-site-spaceship"] = true
        mSet.remEntNames["crash-site-spaceship-wreck-big-1"] = true
        mSet.remEntNames["crash-site-spaceship-wreck-big-2"] = true
        mSet.remEntNames["crash-site-spaceship-wreck-medium-1"] = true
        mSet.remEntNames["crash-site-spaceship-wreck-medium-2"] = true
        mSet.remEntNames["crash-site-spaceship-wreck-medium-3"] = true
        mSet.remEntNames["crash-site-fire-flame"] = true
        mSet.remEntNames["crash-site-spaceship-wreck-small-1"] = true
        mSet.remEntNames["crash-site-spaceship-wreck-small-2"] = true
        mSet.remEntNames["crash-site-spaceship-wreck-small-3"] = true
        mSet.remEntNames["crash-site-spaceship-wreck-small-4"] = true
        mSet.remEntNames["crash-site-spaceship-wreck-small-5"] = true
        mSet.remEntNames["crash-site-spaceship-wreck-small-6"] = true
        mSet.remEntNames["crash-site-explosion-smoke"] = true
        mSet.remEntNames["crash-site-fire-smoke"] = true
    end

    -- Process ores setting
    if settings.startup["plintorio_spawn_remove_ores"].value then
        mSet.remEntTypes["resource"] = true
    end

    -- Process rocks setting
    if settings.startup["plintorio_spawn_remove_rocks"].value then
        mSet.remEntNames["big-rock"] = true
        mSet.remEntNames["big-sand-rock"] = true
        mSet.remEntNames["huge-rock"] = true
    end

    -- Process trees setting
    if settings.startup["plintorio_spawn_remove_trees"].value then
        mSet.remEntTypes["tree"] = true
    end

    -- Process trees setting
    if settings.startup["plintorio_spawn_remove_enemies"].value then
        mSet.remEntTypes["turret"] = true
        mSet.remEntTypes["unit"] = true
        mSet.remEntTypes["unit-spawner"] = true
    end

    -- Create shortcut for remove decoratives setting
    mSet.remDecor = settings.startup["plintorio_spawn_remove_decoratives"].value

    -- Create shortcut for the trees width setting
    mSet.treesWidth = settings.startup["plintorio_spawn_trees_width"].value

    -- Create shortcut for decay settings
    mSet.decayEnabled = settings.global["plintorio_spawn_decay_enabled"].value
    mSet.decayInterval = settings.global["plintorio_spawn_decay_interval"].value
    mSet.decayDamage = settings.global["plintorio_spawn_decay_damage"].value / 100
    mSet.decayChance = settings.global["plintorio_spawn_decay_chance"].value / 100


end

-- Return the mod settings module
return mSet
