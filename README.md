# GunGame

## Prototype video game still in active development

## ---Concept---

This will be a rouge-like similar to enter the gungeon but with a twist. 

When a player fires a weapon, ie a gun or laser rifle they will be knocked back a certain amount, because of this knockback the player must utilize knockback to navigate levels and dodge enemy attacks. 

To encourage utlizing the knockback feature there will be no dodge button, instead during knockback you will recieve i-frames which will count as your 'dodge' mechanic. 

## ---Progress---

Currently this game is very much in early development, its core knockback feature has been implemented but no levels except a beta test level have been added yet. It is not in a playable state, but can be tested by installing godot and running the game, is not compiled yet so you will need godot to test/run it. 

## --- Design Plan ---

1. Physics/Knockback System Polishing &check;
2. Finish creating 3 gun types, so far pistol has been completed and AR type is in development
2. Level Design/Random level generation
3. Implement guns to have the ability to be modified by adding component modifies (to be used by items that ie increase damage, etc.)
3. Rouge Like design implements, further gun creation
4. Base Enemy design, and spawning mechanics. Will design at least 2 enemies in this stage.
5. 1st Boss Design
6. More GUNS!!!
7. Art Design, replace temp assets with custom ones

The above plan only will implement the first level to keep scope in check and not expand scope to be unmanegable. 

## --- Experimental Gun Ideas ---

- Grappling Hook that pushes you back instead of forward
- Portal Gun that swaps places with the player and an enemy
- Minigun that shoots the player around the map like crazy
- Spin gun that spawns spinning bullets, however makes the player get knocked back at an angle
- Angle gun, similar to above but has 2 forms, left and right, depending on form knockback player accordingly


## --- Item Ideas ---

- Heavy Boots -> Increases defense but decreases Knockback by a percentage 
- Ice Skates -> Significantly increases knockback of all guns, while also increasing i-frames 
- Ammo Boost -> Increases ammo recharge time for a specific gun (can only be applied to one gun)
