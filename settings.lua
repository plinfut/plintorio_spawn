--[[-----------------------------------------------------------------------------------------------
---- STARTUP SETTINGS
-------------------------------------------------------------------------------------------------]]
data:extend({
    {
        name = "plintorio_spawn_enabled",
        type = "bool-setting",
        default_value = true,
        order = "a",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_radius",
        type = "int-setting",
        default_value = 10,
        minimum_value = 2,
        order = "b",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_trees_width",
        type = "int-setting",
        default_value = 5,
        minimum_value = 0,
        maximum_value = 32,
        order = "c",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_change_floor",
        type = "bool-setting",
        default_value = true,
        order = "da",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_tile_main",
        type = "string-setting",
        default_value = "dirt-1",
        auto_trim = true,
        order = "db",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_tile_center",
        type = "string-setting",
        default_value = "grass-1",
        auto_trim = true,
        order = "dc",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_keep_water",
        type = "bool-setting",
        default_value = true,
        order = "dd",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_keep_fish",
        type = "bool-setting",
        default_value = true,
        order = "de",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_keep_ores",
        type = "bool-setting",
        default_value = true,
        order = "ea",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_keep_trees",
        type = "bool-setting",
        default_value = false,
        order = "eb",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_keep_rocks",
        type = "bool-setting",
        default_value = false,
        order = "ec",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_keep_wreck",
        type = "bool-setting",
        default_value = true,
        order = "ed",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_destroy_decoratives",
        type = "bool-setting",
        default_value = true,
        order = "ee",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_decay_interval",
        type = "int-setting",
        default_value = 5,
        minimum_value = 1,
        order = "f",
        setting_type = "startup"
    }
})

--[[-----------------------------------------------------------------------------------------------
---- MAP SETTINGS
-------------------------------------------------------------------------------------------------]]
data:extend({
    {
        name = "plintorio_spawn_decay_enabled",
        type = "bool-setting",
        default_value = true,
        order = "a",
        setting_type = "runtime-global"
    },
    {
        name = "plintorio_spawn_decay_chance",
        type = "int-setting",
        default_value = 25,
        minimum_value = 1,
        maximum_value = 100,
        order = "c",
        setting_type = "runtime-global"
    }
})