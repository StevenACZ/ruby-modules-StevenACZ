# You are Warrior

- When you are created, you will be given a `name`. You start with a `life` of 100 points and no weapon (`nil`)

- When you are asked for `name` you will return your name
- When you are asked for `life` you will return your life
- When you are asked for `weapon` you will return your weapon

- When you are asked to `receive_weapon` you will be given a weapon. You should store that weapon and respond with `puts` "Now I have a [weapon]}" where weapon is the name of the weapon.

- When you are asked to `receive_damage` you will be given an amount. You should reduce your life by that amount.
- When you are asked to `receive_healing` you will be given an amount. You should increase your life by that amount but without going beyond 100 points.

- When you are asked for `alife?` you will retun `true` if your life is greater than zero, false otherwise.

- You are capable of doing `BattleMoves` but that is thanks a extra module you have.

# The BattleMoves module

- The BattleMoves module has the method `attack` and `heal`.

- The method `attack` expects a target (another warrior) to attack to. First it announce with `puts` "[attacker name] attacks [target name]!" Then, the method calls the `receive_damage` method over the target and pass the power of the attacker weapon as the amount. Finally, it `puts` "[attacker name] inflected [attacker weapon power] damage to [target name]. Now they have [target life] of life"

- The method `heal` calculates the amount of healing base on the weapon of the caller (the warrior who call `heal`). If the weapon name is "sword", thw amount of healing is 15, if the weapon name is "staff" the amount of healing is 30. Then, it calls the method `receive_healing` of the caller and pass the amount of healing. Finally it `puts` "[caller name] heals himself, now has [caller life] of life".

(you can think of caller as the attacker even he is not attacking in this move)

- The `Warrior` has `BattleMoves`

# The Armory module

- The Armory module only have a constant variable which store all the weapons by name (using a hash). Each weapon has a name and a power. The "sword" has a power of 25 and the "staff" has a power of 20. One weapon looks like `{ name: "dagger", power: 15 }` and the hash of weapons looks like `WEAPONS = { "dagger" => { name: "dagger", power: 15 }, ... }`. Complete the armory with the sword and staff.
