# Persistent saving

## General idea

The idea is to save one big array of everything in the server's
`profileNamespace` every X minutes, loading it on next game start.

The array consists of multiple pieces of data (per-player metadata,
global renown value, saved player-built objects, etc.) that get
individually exported as global variables and `publicVariable`'d.

**This means they are free to read on any client, but any modification
must be done on the server only, or via unscheduled `remoteExec` on
the server (to prevent race conditions).** Logically, they should also
be `publicVariable`'d after the modification to push latest info to
the clients.

## Player metadata

The big save array contains (amongst other things) per-player metadata,
indexed by Steam ID of each player. These contain saved loadout, traits,
maybe rank/specialization in the future, etc.

The player state is saved on disconnect by the `savePlayer` function
(called on the server) and is restored by `loadPlayer` (called on the
client) when the same player (same Steam ID) re-joins the campaign.

One of the fields in the player state is the loadout (player gear), which
receives special handling - if the player is alive and medically stable
on disconnect, the soldier body is deleted and the loadout saved.
If the player unit is bleeding out or is dead on disconnect, any gear
is left on the corpse (for others to recover) and the player receives
default loadout on next reconnect, identical to the one received while
respawning.

(Depending on other metadata like rank, this may be different than the
gear initially assigned to the player upon first joining the campaign.)
