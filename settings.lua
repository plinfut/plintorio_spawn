--[[-----------------------------------------------------------------------------------------------
        STARTUP SETTINGS
-------------------------------------------------------------------------------------------------]]
data:extend({
    {
        name = "plintorio_spawn_clean_size",
        type = "int-setting",
        default_value = 640,
        minimum_value = 128,
        order = "a[clean-zone]-a[size]",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_replace_terrain",
        type = "bool-setting",
        default_value = false,
        order = "a[clean-zone]-b[terrain]-a[enabled]",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_tile_main",
        type = "string-setting",
        default_value = "dirt-1",
        auto_trim = true,
        order = "a[clean-zone]-b[terrain]-b[tile-main]",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_tile_center",
        type = "string-setting",
        default_value = "grass-1",
        auto_trim = true,
        order = "a[clean-zone]-b[terrain]-c[tile-center]",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_replace_water",
        type = "bool-setting",
        default_value = false,
        order = "a[clean-zone]-b[terrain]-d[water]",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_remove_fish",
        type = "bool-setting",
        default_value = false,
        order = "a[clean-zone]-c[entities]-a[fish]",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_remove_enemies",
        type = "bool-setting",
        default_value = true,
        order = "a[clean-zone]-c[entities]-b[enemies]",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_remove_crash_site",
        type = "bool-setting",
        default_value = false,
        order = "a[clean-zone]-c[entities]-c[crash-site]",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_remove_cliffs",
        type = "bool-setting",
        default_value = false,
        order = "a[clean-zone]-c[entities]-d[cliffs]",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_remove_rocks",
        type = "bool-setting",
        default_value = false,
        order = "a[clean-zone]-c[entities]-e[rocks]",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_remove_trees",
        type = "bool-setting",
        default_value = false,
        order = "a[clean-zone]-c[entities]-f[trees]",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_remove_ores",
        type = "bool-setting",
        default_value = false,
        order = "a[clean-zone]-c[entities]-g[ores]",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_remove_decoratives",
        type = "bool-setting",
        default_value = false,
        order = "a[clean-zone]-d[decoratives]",
        setting_type = "startup"
    },
    {
        name = "plintorio_spawn_trees_width",
        type = "int-setting",
        default_value = 5,
        minimum_value = 0,
        maximum_value = 32,
        order = "b[barrier]-a[width]",
        setting_type = "startup"
    }
})

--[[-----------------------------------------------------------------------------------------------
        MAP SETTINGS
-------------------------------------------------------------------------------------------------]]
data:extend({
    {
        name = "plintorio_spawn_decay_enabled",
        type = "bool-setting",
        default_value = true,
        order = "a[barrier]-a[decay]-a[enabled]",
        setting_type = "runtime-global"
    },
    {
        name = "plintorio_spawn_decay_interval",
        type = "int-setting",
        default_value = 300,
        minimum_value = 1,
        order = "a[barrier]-a[decay]-b[interval]",
        setting_type = "runtime-global"
    },
    {
        name = "plintorio_spawn_decay_damage",
        type = "int-setting",
        default_value = 100,
        minimum_value = 0,
        maximum_value = 120,
        order = "a[barrier]-a[decay]-c[damage]",
        setting_type = "runtime-global"
    },
    {
        name = "plintorio_spawn_decay_chance",
        type = "int-setting",
        default_value = 25,
        minimum_value = 1,
        maximum_value = 100,
        order = "a[barrier]-a[decay]-d[chance]",
        setting_type = "runtime-global"
    }
})
