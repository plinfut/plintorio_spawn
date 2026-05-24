# Plintorio - Clean & Safe Spawn Area

A mod for the game Factorio that provides a cleaner and safer spawn area on new maps than vanilla map generation does.

## Features

- Create a clean zone of configurable size around the spawn point.
    - Optionally remove decoratives (bushes, roots, decal, etc.) from this zone.
    - Optionally remove entities from this zone. Each category can be configured to be removed or kept:
        - Fish
        - Ore patches
        - Trees
        - Rocks
        - Crashed spaceship
        - Enemies
        - Cliffs
    - Optionally change the floor to a single tile type for the whole area.
        - Optionally mark the center (spawn point) with a different type.
        - Choose whether to only replace land, or water as well.
          - If fish are not removed, water tiles holding these will be kept regardless of this setting, leaving some tiny puddles if the rest of the lake *is* removed.
- Optionally create a tree barrier around the clean area to keep enemies out.
    - Optionally allow the tree barrier to break down as trees die from absorbing pollution.

## Known Issue

Not all dead trees will be removed, so the barrier will leave some traces forever unless chopped manually. (Some trees seem to never "die enough" to qualify, and lowering the threshold removed too many too early.) But enough trees will be removed to offer no protection whatsoever anymore when pollution spreads way too much, so the decay does accomplish its goal regardless of it not being as perfect as intended.

## Inspiration

- [Safe Start](https://mods.factorio.com/mod/SafeStart) by [davidhindman](https://mods.factorio.com/user/davidhindman)
- [Ore Eraser](https://mods.factorio.com/mods/tergiver/ore-eraser) by [tergiver](https://mods.factorio.com/user/tergiver)
- [Lawn Mower](https://mods.factorio.com/mod/lawn-mower) by [LCStark](https://mods.factorio.com/user/LCStark)

## About Plintorio

All my mods are primarily developed for my own specific use cases and I don't plan on making major additions I wouldn't use myself. But I'm open to small changes for others, and your suggestions may inspire me to use my own mods differently too, so bigger changes aren't out of the question. (And Factorio is pretty flexible, so some updates might be easier than you'd think.) All feedback is welcome and will be taken into consideration.

Some features may feel like cheating, but I learned an important lesson a while ago: there is no right or wrong way to play games. Adjusting the single player mode doesn't affect anyone else in Factorio and as you bought it, you have the right to enjoy it the way *you* want. You don't have to stick to how the creators intended it or how others prefer it.
