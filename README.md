
## License
This project is licensed under the Creative Commons BY-NC-ND 4.0 License.  
[Read the full license here](https://creativecommons.org/licenses/by-nc-nd/4.0/)

## contact
For feedback, suggestions, or issues, feel free to open an **issue** on this GitHub repo or reach me at yamenebajy@gmail.com.

## How to play
1) after you launch the game, you will be faced with the stats screen, delete the default value to see what is it for, or check the stats screen info later in this file, change them as you wish and press start
2) on the top of your screen you will find, left to write, information text, currently selected object icon which is default none and it can be pressed to clear selection or cancel commands, time left for this turn, navigation arrows you can press to move around the game grid, manual end turn button, turn information text, resources of current player
3) you will see the game grid, green tiles are open space, tiles with wood are wood node resources, grey tiles are metal node resources
4) on the first turn you are asked to choose any tile to place your main building at, your choice cant be changed after so be wise, after you place your building end your turn and pass for the next player
5) after all players get their castles the true game starts, take turn to gather resources, build, train units, and destroy your enemies
6) check building, units and systems sections for more info

## building:
1) fort: the first phase of the main building, you can train a horse or a spearman, and you can evolve to castle
2) castle: second phase, can upgrade to mega castle
3) mega castle: third and last phase
4) farm: gives food each turn with bonus if its adjacent to main
5) mine: gives wood or metal each turn with bonus if its adjacent to main, can only be placed on metal or wood nodes
6) barracks, allows to train other units
7) wooden wall: an obstacle, requires castle phase to be built
8) stone wall: the more annoying version of wooden wall, also requires castle phase

## units
*all units can move, attack once per turn, and build any building except for the main buildings*
1) spearman: can attack an adjacent unit and does bonus damage to horses
2) horse: moves a lot, can only attack by moving to the tile the target is on, since a tile cant have two units on it, if the attack doesnt kill the target, the horse must have an extra move after attacking to move to a different empty tile, or else the attack isnt performed
3) musketeer: ranged unit, check systems.7
4) cannon: heavy ranged unit, check systems.7
5) knight: heavily armored unit, check systems.2, can attack an adjacent unit

## systems
1) the player with the last main building standing wins, if max number of turns is reached then the player with more health on their main wins, if there is a tie the resources and units are calculated
2) a unit armor is a special value that, to deal damage to an armored unit, you must do more damage than its armor in one turn, or else your damage is totally ignored
3) if you choose to build or train a thing or attack or move a unit, you are asked to choose an adjacent tile for it to be placed, you can cancel the action by cancelling your selection by presing that button on top left
4) farms and mines adjacent to your main building give more resources
5) each turn after selecting your main building you can choose one resource type and get some of it
6) the number of units you can have at a moment is limited by yout population
7) ranged units can only target and adjacent tile for attacking, then its projectile will move for its range in the selected direction
8) upgrading main building is the only way to heal it, sometime it may be wiser to not upgrade
9) units trained cant move on their first turn

## stats screen layout
column 1 contains the number of players, starting resources for each player, number of wood and metal nodes, map size by tile, resources earned per farm or mine each turn(disabled for testing reasons, edit in the rows on right) and the bonus received for being adjacent to the main building

column 2 contains the max number of turns and the max time (second) for each turn
the grid on the left is unit stats as follows

fort: health armor income population

castle: health armor income population food_cost wood_cost metal_cost

mega_castle: health armor income population food_cost wood_cost metal_cost

farm: health armor income food_cost wood_cost metal_cost

barracks: health armor food_cost wood_cost metal_cost

mine: health armor income food_cost wood_cost metal_cost

wooden_wall: health armor food_cost wood_cost metal_cost

stone_wall: health armor food_cost wood_cost metal_cost

spearman: health moves_per_turn population_required food_cost wood_cost metal_cost main_building_phase_required damage damage_to_horse

horse: health moves_per_turn population_required food_cost wood_cost metal_cost main_building_phase_required damage 

musketeer: health moves_per_turn population_required food_cost wood_cost metal_cost main_building_phase_required damage range

cannon: health moves_per_turn population_required food_cost wood_cost metal_cost main_building_phase_required damage range

knight: health moves_per_turn population_required food_cost wood_cost metal_cost main_building_phase_required damage 

## The-Iron-Grid
The Iron Grid is a local turn-based strategy game for any number of players on one device. Choose your castle spot, gather resources, and evolve from Fort to Castle to Mega Castle. With simple units, deep tactics, and fully customizable stats, every match is a unique strategic battle!
