# The Iron Grid

---

## 📄 License

This project is licensed under the **Creative Commons BY-NC-ND 4.0 License**. License
[Read the full license here](https://creativecommons.org/licenses/by-nc-nd/4.0/)

---

**The Iron Grid** is a local turn-based strategy game built for multiple players on a single device. Choose your castle location, gather resources, train your army, and dominate your enemies in tactical warfare. With focus on strategy, customizable stats, and evolving structures, every match delivers a fresh and competitive experience.

---

## ✨ Features

* Turn-based gameplay for any number of local players
* Castle evolution system: Fort → Castle → Mega Castle
* Resource gathering (wood, metal, food)
* Build and upgrade various structures
* Train diverse units with unique abilities
* Fully customizable game stats and random map
* Victory through destruction, survival, or domination

---

## 🎮 How to Play

1. **Stats Screen**: Upon launching the game, you'll land on the stats screen. Delete the default values to reveal placeholders or refer to the detailed layout below. Adjust the game settings as desired, then press "Start."

2. **Interface Overview**: At the top of the screen (from left to right), you'll see:

   * info text
   * Current selection icon (click to deselect or cancel actions)
   * Timer for the current turn
   * Navigation arrows (to move around the map)
   * End Turn button
   * Turn information
   * Player resource display

3. **Map Grid Overview**:

   * **Green tiles** = Open space
   * **Tiles with wood** = Wood nodes
   * **Gray tiles** = Metal nodes

4. **First Turn**: Players choose a tile to place their main building. This decision is permanent. Be strategic. After placing, end your turn and pass to the next player.

5. **Game Loop**: Players take turns to:

   * Gather resources
   * Build structures
   * Train units
   * Strategically eliminate opponents

6. **Victory Conditions**:

   * Last player with a main building standing wins
   * If max turns are reached, the player with the healthiest main wins
   * Ties are resolved by comparing resources and remaining units

---

## 🏫 Buildings

* **Fort**: First phase of main building. Trains Spearman and Horse. Evolves to Castle.
* **Castle**: Second phase. Can upgrade to Mega Castle.
* **Mega Castle**: Final phase.
* **Farm**: Generates food each turn; bonus when adjacent to main building.
* **Mine**: Generates wood or metal each turn (must be placed on a corresponding node); bonus near main.
* **Barracks**: Trains advanced units.
* **Wooden Wall**: Requires Castle phase; serves as an obstacle.
* **Stone Wall**: Stronger wall; also requires Castle phase.

---

## 💪 Units

(All units can move, attack once per turn, and construct non-main buildings.)

* **Spearman**: attacks adjacent target; bonus damage vs. horses.
* **Horse**: Mobile unit; must move to target's tile to attack. If target survives the attack and the horse got no more moves to retreat, the attack fails.
* **Musketeer**: Ranged attacker. See "Systems.6".
* **Cannon**: Heavy ranged unit. See "Systems.6".
* **Knight**: Attacks adjacent target, heavily armored; see "Systems.1".

---

## 🧰 Systems

* **Armor Mechanic**: Damage must exceed armor in a single attack to affect armored units; otherwise, it's ignored.
* **Building & Action Confirmation**: When selecting a unit or building or commanding move or attack, you'll be prompted to select an adjacent tile. Cancel actions by clicking the top-left button.
* **Adjacency Bonuses**: Farms and mines near your main building produce more.
* **Main Resource Claim**: Select your main each turn to claim a bonus resource.
* **Population Cap**: Your army is limited by available population provided by main building.
* **Ranged Targeting**: Ranged units only target adjacent tiles for direction; then projectiles travel in that direction based on unit range.
* **Main Upgrades**: Only way to heal your main building. Sometimes, it's wiser not to upgrade quickly.
* **Fresh Units**: Newly trained units cannot act on the same turn.

---

## 🔢 Stats Screen Layout

* **Column 1**:

  * Number of players
  * Starting resources
  * Node count (wood, metal)
  * Map size (tiles)
  * Farm/mine output per turn *(disabled for testing)*
  * Adjacency bonuses

* **Column 2**:

  * Max turns
  * Max time (per turn, in seconds)

* **Left Grid (Unit Stats)**:
  Each row represents an entity with attributes like:

  1) fort: health armor income population

  2) castle: health armor income population food\_cost wood\_cost metal\_cost

  3) mega\_castle: health armor income population food\_cost wood\_cost metal\_cost

  4) farm: health armor income food\_cost wood\_cost metal\_cost

  5) barracks: health armor food\_cost wood\_cost metal\_cost

  6) mine: health armor income food\_cost wood\_cost metal\_cost

  7) wooden\_wall: health armor food\_cost wood\_cost metal\_cost

  8) stone\_wall: health armor food\_cost wood\_cost metal\_cost

  9) spearman: health moves\_per\_turn population\_required food\_cost wood\_cost metal\_cost main\_building\_phase\_required damage damage\_to\_horse

  10) horse: health moves\_per\_turn population\_required food\_cost wood\_cost metal\_cost main\_building\_phase\_required damage

  11) musketeer: health moves\_per\_turn population\_required food\_cost wood\_cost metal\_cost main\_building\_phase\_required damage range

  12) cannon: health moves\_per\_turn population\_required food\_cost wood\_cost metal\_cost main\_building\_phase\_required damage range

  13) knight: health moves\_per\_turn population\_required food\_cost wood\_cost metal\_cost main\_building\_phase\_required damage

---

## ℹ️ Contact

Got feedback or suggestions? Found a bug? Reach out!

* Open an issue on this GitHub repo
* Or email: [yamenebajy@gmail.com](mailto:yamenebajy@gmail.com)

---

Ready to rule The Iron Grid? Dive in, choose your strategy, and outplay them all!
