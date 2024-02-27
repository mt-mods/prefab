local damage = tonumber(minetest.settings:get("prefab.electric_fence_damage")) or 30
if minetest.settings:get_bool("creative_mode") then damage = 0 end

local has_default = minetest.get_modpath("default")

minetest.register_node("prefab:concrete", {
    drawtype = "normal",
	description = "Block of Prefab Concrete",
	paramtype = "light",
	tiles = {"prefab_concrete.png"},
	is_ground_content = false,
	groups = {cracky = 2, ud_param2_colorable = 1},
})

if minetest.get_modpath("unifieddyes") then
    minetest.override_item("prefab:concrete", {
        palette = "unifieddyes_palette_extended.png",
        airbrush_replacement_node = "prefab:concrete_colored"
    })

    minetest.register_node("prefab:concrete_colored", {
        drawtype = "normal",
        description = "Colored block of Prefab Concrete",
        paramtype = "light",
        paramtype2 = "color",
        palette = "unifieddyes_palette_extended.png",
        tiles = {"prefab_concrete.png"},
        is_ground_content = false,
        groups = {cracky = 2,ud_param2_colorable = 1,not_in_creative_inventory = 1},
        on_construct = unifieddyes.on_construct,
        on_dig = unifieddyes.on_dig,
    })

    unifieddyes.register_color_craft({
        output = "prefab:concrete_colored",
        palette = "extended",
        type = "shapeless",
        neutral_node = "prefab:concrete",
        recipe = {
            "NEUTRAL_NODE",
            "MAIN_DYE"
        }
    })
end

if minetest.get_modpath("moreblocks") then
    stairsplus:register_all("prefab", "concrete", "prefab:concrete", {
        description = "Prefab Concrete",
        tiles = {"prefab_concrete.png"},
        groups = {cracky=2}
    })

    -- compat for old worlds, alias normal stairs and slabs to moreblocks variant
    minetest.register_alias_force("prefab:concrete_stair", "prefab:stair_concrete")
    minetest.register_alias_force("prefab:concrete_slab", "prefab:slab_concrete")
    minetest.register_alias("prefab:concrete_stair_inverted", "prefab:stair_concrete")
    minetest.register_alias("prefab:concrete_slab_inverted", "prefab:slab_concrete")
end

if has_default then
	-- node has grass texture from default
	minetest.register_node("prefab:concrete_with_grass", {
		description = "Prefab Concrete with Grass",
		paramtype = "light",
		tiles = {
			"default_grass.png",
			"prefab_concrete.png",
			"prefab_concrete_grass.png"
		},
		is_ground_content = false,
		drop = "prefab:concrete",
		groups = {cracky=2},
	})
end

minetest.register_node("prefab:concrete_wall", {
    drawtype = "nodebox",
	description = "Prefab Concrete Wall Section",
	tiles = {
        "prefab_concrete.png",
        "prefab_concrete.png",
        "prefab_concrete_wall.png",
        "prefab_concrete_wall.png",
        "prefab_concrete_wall.png",
        "prefab_concrete_wall.png"
    },
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.437500,0.500000,0.500000,0.437500},
			{-0.437500,-0.500000,-0.500000,0.437500,0.500000,0.500000},
		},
	},
	is_ground_content = false,
	drop = "prefab:concrete_wall",
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_slit", {
    drawtype = "nodebox",
	description = "Prefab Horizontal Concrete Slit",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,-0.000000,0.500000},
			{-0.500000,0.187500,-0.500000,0.500000,0.500000,0.500000},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,0.500000,0.500000},
		},
	},
	is_ground_content = false,
	drop = "prefab:concrete_slit",
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_window", {
	drawtype = "nodebox",
	description = "Prefab Concrete Framed Window",
	tiles = {
		"prefab_concrete.png",
		"prefab_concrete.png",
		"prefab_concrete.png",
		"prefab_concrete.png",
		"prefab_concrete_window.png",
		"prefab_concrete_window.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	use_texture_alpha = "clip",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,-0.250000,0.500000},
			{-0.500000,0.250000,-0.500000,0.500000,0.500000,0.500000},
			{0.250000,-0.500000,-0.500000,0.500000,0.500000,0.500000},
			{-0.500000,-0.500000,-0.500000,-0.250000,0.500000,0.500000},
			{-0.500000,-0.500000,-0.000000,0.500000,0.500000,0.000000},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,0.500000,0.500000},
		},
	},
	is_ground_content = false,
	drop = "prefab:concrete_window",
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_ladder", {
	drawtype = "signlike",
	description = "Prefab Concrete Ladder",
	tiles = {"prefab_concrete_ladder.png"},
	inventory_image = "prefab_concrete_ladder.png",
	wield_image = "prefab_concrete_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	drop = "prefab:concrete_ladder",
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_fence", {
	description = "Prefab Concrete Fence",
	drawtype = "fencelike",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	tiles = {"prefab_concrete.png"},
	is_ground_content = false,
	drop = "prefab:concrete_fence",
	groups = {cracky=2},
})

if minetest.get_modpath("doors") then
	doors.register_door("prefab:concrete_door", {
		description = "Concrete Door",
		inventory_image = "prefab_concrete_door_inv.png",
		groups = {cracky=2,door=1},
		tiles = {"prefab_concrete_door.png"},
		only_placer_can_open = true,
	})
end

minetest.register_node("prefab:concrete_cylinder", {
	drawtype = "nodebox",
	description = "Prefab Concrete Cylinder",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375000,-0.500000,-0.500000,0.500000,0.500000,0.500000},
			{-0.5,-0.500000,0.375000,0.500000,0.500000,0.500000},
			{-0.500000,-0.500000,-0.500000,-0.375000,0.500000,0.500000},
			{-0.500000,-0.500000,-0.500000,0.500000,0.500000,-0.375000},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,0.500000,0.500000},
		},
	},
	is_ground_content = false,
	drop = "prefab:concrete_cylinder",
	groups = {cracky=2,falling_node=1},
})

minetest.register_node("prefab:concrete_bollard", {
	drawtype = "nodebox",
	description = "Prefab Concrete Bollard",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.312500,-0.500000,-0.312500,0.312500,-0.312500,0.312500},
			{-0.250000,-0.500000,-0.250000,0.250000,-0.250000,0.250000},
			{-0.187500,-0.500000,-0.187500,0.187500,0.062500,0.187500},
			{-0.250000,0.062500,-0.250000,0.250000,0.125000,0.250000},
			{-0.312500,0.125000,-0.312500,0.312500,0.250000,0.312500},
			{-0.250000,0.250000,-0.250000,0.250000,0.312500,0.250000},
			{-0.187500,0.312500,-0.187500,0.187500,0.375000,0.187500},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.350000,-0.500000,-0.350000,0.350000,0.400000,0.350000},
		},
	},
	is_ground_content = false,
	drop = "prefab:concrete_bollard",
	groups = {cracky=2,falling_node=1},
})

minetest.register_node("prefab:concrete_bench", {
	drawtype = "nodebox",
	description = "Prefab Concrete Bench",
	tiles = {"prefab_concrete.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125000,-0.500000,-0.062500,0.125000,0.062500,0.062500},
			{-0.500000,0.062500,-0.312500,0.500000,0.187500,0.312500},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.350000,0.500000,0.300000,0.350000},
		},
	},
	is_ground_content = false,
	drop = "prefab:concrete_bench",
	groups = {cracky=2,falling_node=1},
})

minetest.register_node("prefab:concrete_railing", {
	description = "Concrete Railing",
	sounds = has_default and default.node_sound_stone_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
	tiles = {"prefab_concrete.png"},
	sunlight_propagates = true,
	groups = {cracky = 1},
	node_box = {
		type = "connected",
		fixed          = {{0.0625,-0.5,0.0625,-0.0625,0.1875,-0.0625}},
		connect_front  = {{-0.0625,0.1875,-0.5,0.0625,0.3125,0.0625}},
		connect_back   = {{-0.0625,0.1875,-0.0625,0.0625,0.3125,0.5}},
		connect_left   = {{-0.5,0.1875,-0.0625,0.0625,0.3125,0.0625}},
		connect_right  = {{-0.0625,0.1875,-0.0625,0.5,0.3125,0.0625}}
	},
	selection_box = {
		type = "fixed",
		fixed = {{-0.5,-0.5,-0.5,0.5,0.3125,0.5}}
	},
	is_ground_content = false,
	connects_to = {"prefab:concrete_railing","prefab:concrete_catwalk"}
})
minetest.register_alias("prefab:concrete_railing_corner", "prefab:concrete_railing")

minetest.register_node("prefab:electric_fence", {
	drawtype = "nodebox",
	description = "Electric Fence",
	tiles = {"prefab_electric_fence.png"},
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "facedir",
	damage_per_second = damage,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,0.062500,-0.062500,0.500000,0.187500,0.062500},
			{-0.500000,-0.250000,-0.062500,0.500000,-0.125000,0.062500},
		},
	},
	is_ground_content = false,
	drop = "prefab:electric_fence",
	groups = {cracky=2},
})

minetest.register_node("prefab:electric_fence_corner", {
	drawtype = "nodebox",
	description = "Electric Fence Corner",
	tiles = {
		"prefab_electric_fence_corner_top.png",
		"prefab_electric_fence_corner_top.png",
		"prefab_electric_fence_corner_side1.png",
		"prefab_electric_fence_corner_side2.png",
		"prefab_electric_fence_corner_side1.png",
		"prefab_electric_fence_corner_side2.png"
	},
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "facedir",
	damage_per_second = damage,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,0.062500,-0.062500,0.062500,0.187500,0.062500},
			{-0.500000,-0.250000,-0.062500,0.062500,-0.125000,0.062500},
			{-0.062500,0.062500,-0.062500,0.062500,0.187500,0.500000},
			{-0.062500,-0.250000,-0.062500,0.062500,-0.125000,0.500000},
			{-0.125000,-0.500000,-0.125000,0.125000,0.500000,0.125000},
		},
	},
	is_ground_content = false,
	drop = "prefab:electric_fence_corner",
	groups = {cracky=2},
})

minetest.register_node("prefab:electric_fence_end", {
	drawtype = "nodebox",
	description = "Electric Fence End",
	tiles = {
		"prefab_electric_fence_end1.png",
		"prefab_electric_fence_end1.png",
		"prefab_concrete.png",
		"prefab_concrete.png",
		"prefab_electric_fence_end2.png",
		"prefab_electric_fence_end1.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,0.062500,-0.062500,0.500000,0.187500,0.062500},
			{-0.500000,-0.250000,-0.062500,0.500000,-0.125000,0.062500},
			{-0.500000,-0.500000,-0.250000,-0.375000,0.500000,0.250000},
			{-0.375000,-0.437500,-0.250000,-0.250000,0.375000,0.250000},
			{0.250000,-0.312500,-0.125000,0.375000,0.250000,0.125000},
			{0.000000,-0.312500,-0.125000,0.125000,0.250000,0.125000},
		},
	},
	is_ground_content = false,
	drop = "prefab:electric_fence_end",
	groups = {cracky=2},
})

minetest.register_node("prefab:concrete_catwalk",{
	drawtype="nodebox",
	description= "Prefab Concrete Catwalk",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = { 'prefab_concrete.png', },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,-0.375000,0.500000},
			{-0.500000,-0.500000,-0.062500,-0.437500,0.500000,0.062500},
			{0.443299,-0.500000,-0.062500,0.500000,0.500000,0.062500},
			{0.443299,0.448454,-0.500000,0.500000,0.500000,0.500000},
			{-0.500000,0.448454,-0.500000,-0.437500,0.500000,0.500000},
		},
	},
	is_ground_content = false,
	groups={cracky=2},
	drop = "prefab:concrete_catwalk",
})

if minetest.get_modpath("slats") and minetest.get_modpath("default") then
	slats.register_slat(
		"prefab",
		"prefab:concrete",
		{cracky = 2},
		"prefab_concrete.png^slats_slat_overlay.png^[makealpha:255,126,126",
		"Prefabe concrete Slat",
		default.node_sound_stone_defaults()
	)
end
