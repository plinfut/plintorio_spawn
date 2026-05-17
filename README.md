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
  - Optionally change the floor to a single tile type for the whole area.
    - Optionally mark the center (spawn point) with a different type.
    - Choose whether to only replace land, or water as well.
      - If fish are not removed, water tiles holding these will be kept regardless of this setting, leaving some tiny puddles if the rest of the lake *is* removed.
- Optionally create a tree barrier around the clean area to keep enemies out.
  - Optionally allow the tree barrier to break down as trees die from absorbing pollution.
- Cleaning settings only apply to new maps. Existing saves created with this mod enabled will continue to use the cleaning settings and barrier width at the time of creation.
  - Newer barrier decay settings do apply to all saves that include a protective tree barrier, but can be changed at any point.

## Known Issue

Not all dead trees will be removed, so the barrier will leave some traces forever unless chopped manually. (Some trees seem to never "die enough" to qualify, and lowering the threshold removed too many too early.) But enough trees will be removed to offer no protection whatsoever anymore when pollution spreads way too much, so the decay does accomplish its goal regardless of it not being as perfect as intended.

## Inspiration

- [Safe Start](https://mods.factorio.com/mod/SafeStart) by [davidhindman](https://mods.factorio.com/user/davidhindman)
- [Ore Eraser](https://mods.factorio.com/mods/tergiver/ore-eraser) by [tergiver](https://mods.factorio.com/user/tergiver)
- [Lawn Mower](https://mods.factorio.com/mod/lawn-mower) by [LCStark](https://mods.factorio.com/user/LCStark)

## Backstory & Design Choices

As "a bit" of a perfectionist (maybe even mild undiagnosed OCD), it always annoyed me how forests, cliffs and irregular ore patches in fixed positions pushed me towards messy factory layouts. I wanted a clear area to start with and create my own resources in the map editor. I also didn't like biters appearing before I set up proper perimeter and while I still had to improvise my defenses.

Safe Start and Ore Eraser came to the rescue! But I regularly came up with new strategies requiring a fresh start and had to keep clearing the ores on every new map. I also disliked how the barriers of Safe Start were permanent and made defenses obsolete, making the game __too__ easy for my taste. So I decided to learn how to make my own mods so I could keep enemies away for a while but allow them in once I was prepared, hence the decaying barrier in this mod. And while I was modifying the spawn area, I thought I could just as well remove the ores in the same process too instead of manually.

Another thing I did on every map was covering the whole safe zone in light dirt for a consistent look. This can be done in the vanilla map editor, but was a manual task. With my new mod already combing through the spawn area modifying things, why not let it take care of that too? With the spaceship wreck removed, it's easy to lose track of the actual spawnpoint, so I wanted to mark that with another tile type. But then there were the decorative elements that served no purpose but to give the world a more diverse (also known as messy) look. I found Lawn Mower to deal with that, but again: manually, every single time I decided to start over because I learned something new. As my own mod already came so far, that should be another job for it.

At this point I was happy with it, but it took a lot of work. I figured that if I made it a little more flexible with settings instead of hardcoded values, it may be useful to others as well and provide a better return of value for the time I put in. So here it is: my very first Factorio mod available to the public! I hope you enjoy it as much as I do. And if not, learning how to add settings was still fun for me, and maybe it will come in handy if I decide to start another game yet again.

The next section feels a bit off at the time of writing as this is my only mod for now. But I have plans for several more and wrote the following to be included in all of them. It will fit better once I publish the rest.

## About Plintorio

All my mods are primarily developed for my own specific use cases and I don't plan on making major additions I wouldn't use myself. But I'm open to small changes for others, and your suggestions may inspire me to use my own mods differently too, so bigger changes aren't out of the question. (And Factorio is pretty flexible, so some updates might be easier than you'd think.) All feedback is welcome and will be taken into consideration.

Some features may feel like cheating, but I learned an important lesson a while ago: there is no right or wrong way to play games. Adjusting the single player mode doesn't affect anyone else in Factorio and as you bought it, you have the right to enjoy it the way *you* want. You don't have to stick to how the creators intended it or how others prefer it.