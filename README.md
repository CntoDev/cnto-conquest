# CNTO Conquest

## Overview
Conquest is a slow and methodical gamemode of supply, reputation, and strategy. Aspects not often seen in missions are on display, such as: Logistics, Law, and a learning enemy. It is entirely centered around the persistence of the map state, keeping progress alive and making death a difficulty not otherwise encountered.

## The Premise
You are a recruit newly drafted from the Takistani National Police into a new military unit being assembled by the Takistani National Army. The Northwestern Takistanis religious extremists have resented the secular Takistani government - which is supported by the NATO coalition - for some time now, and have begun an insurrection across the country. While the army fights a frontline war without, it is your job to begin your patrols and conquer the enemy within.

## The Game Loop
CNTO will begin as ex-police in a lawless land with the task of forming a functioning military police unit, a FOB, and ridding Northern Takistan of extremists. The game mode begins with choosing a base location and building the first FOB - the new recruits have just enough cash to build a barracks and a flag pole. From there, tasks are aplenty: they range from simple patrols to assaulting known extremist outposts. Other tasks, such as helping the locals and respecting their land will help as well, but more importantly earn you **renown** in the eyes of NATO.

Through the spending of supplies and earning enough **renown**, players can unlock new gear and weapons over time, or have their commander buy extra firepower such as transportation, artillery fire support, or even NATO air support. Death is permanent, and recruits are in short supply. Each village that is liberated, helped, or simply likes you can provide fresh recruits that will bolster your ranks as garrison forces or active elements (i.e. players respawns). The game ends once Anizay is back under Takistani control.

## The Map
Anizay will act as the Northern region of Takistan. It is here that insurgents have made a foothold by appealing to the rural population through extremist religious beliefs and acting against government policies that have left much of this arid region underdeveloped.

The lush, Northwestern area is extremely coveted and home to the largest city. It is the main supplier of food to the region, which has left many villages in the arid regions starving due to supply shortages and a cut off of trade due to the extremist presence.

The Takistani capital is located to the south of this map, as such you will begin Conquest at the southern edges of the map with little more than a truck, your trusty AKs and some supplies to build a grassroots FOB.

Points of interest include the large city, the airfield, and an abandoned army camp, all of which will be heavily defended by the insurgents.

## Supply
Used for a wide variety of purposes in game **Supply** takes many forms but will always look like the following and will never deviate from it.

### Generating Supply
Takistani Command will issue supply depending on your success with pacificing the countryside of Anizay, tracked through tasks completed.

Supply can also be obtained through the following:
- Extremist outposts and convoys
- Looting villages (this will negatively impact opinion)
- Securing strategic locations such as factories, oil fields, etc.

### Spending Supply
Supply is used for:
- Buying personal gear upgrades such as new weapons, helmets, vests, or backpacks
- Recruiting friendly AI garrisons that can defend valuable locations
- Acquiring new vehicle assets such has humvees
- Enabling emplacements such as turrets, mortars, or AA

## Personal Gear
Through conquering the map and taking back territory for the government, but also by helping the locals, will raise your NATO **renown**. You will also personally attain higher ranks over time (so long as you don’t die).

Acquiring new personal gear requires the following:
- Supply to pay for the gear
    - 1 Supply for Tier I gear
    - 3 Supply for Tier II gear
    - 9 Supply for Tier III gear
    - These are placeholder costs and may change from class to class

- A certain standing with NATO for more advanced gear
    - \>33% = Tier II unlocked
    - \>66% = Tier III unlocked

## The Basic Loadout
The basic loadout will include the following and is applied spawning and player death:
- 1x AKM (no scope option)
- 5x AKM mags
- 4x basic bandages
- 2x tourniquets
- Takistan Police uniform
- Field hat
- Slash bandolier

## Model metadata
CNTO Conquest uses global vars to represent state of the world. Those variables are maintained and stored in persistence subsystem loop and autosaved according to mission parameters.

`cnto_cq_saved_players` - represents metadata about players hashed by player steam UID.

`cnto_cq_saved_renown` - represents metadata about **Renown**.

`cnto_cq_saved_fortify_credits` - represents metadata about **Fortify Credits**.

`cnto_cq_saved_fortify_objects` - represents metadata about all fortification objects built by players.

`cnto_cq_saved_locations` - represents **Locations** (control points) metadata.

`cnto_cq_saved_bases` - represents **Bases** (player bases) metadata.
