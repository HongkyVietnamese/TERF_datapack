data modify entity @s[tag=terf_warp_core_vfx_hor_x_top] interpolation_duration set value 30
$data modify entity @s[tag=terf_warp_core_vfx_hor_x_top] transformation.translation[1] set value $(Hpos_y)f
$data modify entity @s[tag=terf_warp_core_vfx_hor_x_top] transformation.scale[1] set value $(Upos_y)f
data modify entity @s[tag=terf_warp_core_vfx_hor_z_top] interpolation_duration set value 30
$data modify entity @s[tag=terf_warp_core_vfx_hor_z_top] transformation.translation[1] set value $(Hpos_y)f
$data modify entity @s[tag=terf_warp_core_vfx_hor_z_top] transformation.scale[1] set value $(Upos_y)f

data modify entity @s[tag=terf_warp_core_vfx_hor_x_bottom] interpolation_duration set value 30
$data modify entity @s[tag=terf_warp_core_vfx_hor_x_bottom] transformation.translation[1] set value -$(Hneg_y)f
$data modify entity @s[tag=terf_warp_core_vfx_hor_x_bottom] transformation.scale[1] set value $(Uneg_y)f
data modify entity @s[tag=terf_warp_core_vfx_hor_z_bottom] interpolation_duration set value 30
$data modify entity @s[tag=terf_warp_core_vfx_hor_z_bottom] transformation.translation[1] set value -$(Hneg_y)f
$data modify entity @s[tag=terf_warp_core_vfx_hor_z_bottom] transformation.scale[1] set value $(Uneg_y)f