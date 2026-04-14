scoreboard players add @s terf_data_E 1
execute if score @s[tag=terf_containment] terf_data_E matches ..1800 run scoreboard players remove @s terf_data_E 4
execute if score @s terf_data_E matches ..-1 run function terf:entity/machines/warp_core/states/overload/stop

execute if score @s terf_data_E matches 2000.. run function terf:entity/machines/warp_core/states/detonation/start

particle minecraft:large_smoke ~ ~ ~ 1 1 1 0 1 force
execute unless entity @s[tag=terf_containment] run particle minecraft:small_flame ~ ~ ~ 0 0 0 0.1 100 force

execute if score @s terf_data_E matches 1800..1802 run function terf:entity/explosion/small_explosion/summon
execute if score @s terf_data_E matches 1800.. run particle minecraft:large_smoke ~ ~ ~ 0 0 0 1 100 force
execute if score @s terf_data_E matches 1800.. run particle flash{color:[1,1,1,1]} ~ ~ ~ 0.1 0.1 0.1 0 1 force

execute if score @s terf_data_E matches 1810 run playsound terf:alarms.civil_alert_siren_4 master @a[distance=0..] ~ ~ ~ 50 1

#======================== Sound ========================

scoreboard players operation temp2 terf_states = @s terf_data_E
scoreboard players remove temp2 terf_states 1700
execute if score temp2 terf_states matches ..-1 run scoreboard players set temp2 terf_states 0
scoreboard players operation temp2 terf_states *= 10 terf_states

scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states += temp2 terf_states
scoreboard players add temp terf_states 5000

data modify storage terf:temp args set value {arg1:'playsound terf:alarms.alarm2 master @a[distance=0..] ~.5 ~3 ~.5 10 '}
execute store result storage terf:temp args.arg2 float 0.0001 run scoreboard players get temp terf_states
function datapipes_lib:require/with_args/2 with storage terf:temp args

#======================== Glow visuals ========================
scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states *= 3 terf_states

scoreboard players operation opacity terf_states = temp terf_states
scoreboard players operation opacity terf_states /= 36 terf_states
execute if score opacity terf_states matches ..27 run scoreboard players set opacity terf_states 26
execute if score opacity terf_states matches 255.. run scoreboard players set opacity terf_states 255

#convert blackbody color to RGB in hex for displaying
scoreboard players operation temp terf_states /= 10 terf_states
execute if score temp terf_states matches 1983.. run scoreboard players set temp terf_states 1982
data modify storage terf:temp args set value {arg1:'data modify storage terf:temp args.color set from storage terf:constants blackbody_hex.'}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states

function datapipes_lib:require/with_args/2 with storage terf:temp args
scoreboard players operation height terf_states = @s terf_data_B

#set color to text displays from args.color
$execute as @e[type=minecraft:text_display,tag=terf_warp_core_overheat_display,tag=terf_related_$(machine_id)] run function terf:entity/machines/warp_core/states/overload/as_text_displays
