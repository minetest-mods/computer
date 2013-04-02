
-- Copyright (C) 2012-2013 Diego Martínez <kaeza@users.sf.net>
-- License is WTFPL (see README.txt).

minetest.register_craft({
    output = "computer:babytower";
    recipe = {
        { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", },
        { "homedecor:plastic_sheeting", "default:glass", "homedecor:plastic_sheeting", },
        { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", },
    };
});

minetest.register_craft({
    output = "computer:shefriendSOO";
    recipe = {
        { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", },
        { "homedecor:plastic_sheeting", "default:glass", "homedecor:plastic_sheeting", },
        { "homedecor:plastic_sheeting", "default:wood", "homedecor:plastic_sheeting", },
    };
});

minetest.register_craft({
    output = "computer:slaystation";
    recipe = {
        { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", },
        { "homedecor:plastic_sheeting", "default:wood", "homedecor:plastic_sheeting", },
    };
});

minetest.register_craft({
    output = "computer:vanio";
    recipe = {
        { "homedecor:plastic_sheeting", "", "", },
        { "default:glass", "", "" },
        { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", },
    };
});

minetest.register_craft({
    output = "computer:spectre";
    recipe = {
        { "", "", "homedecor:plastic_sheeting", },
        { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", },
        { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", },
    };
});

minetest.register_craft({
    output = "computer:slaystation2";
    recipe = {
        { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", },
        { "homedecor:plastic_sheeting", "default:steel_ingot", "homedecor:plastic_sheeting", },
    };
});

minetest.register_craft({
    output = "computer:admiral64";
    recipe = {
        { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", },
        { "default:wood", "default:wood", "default:wood", },
    };
});

minetest.register_craft({
    output = "computer:admiral128";
    recipe = {
        { "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", "homedecor:plastic_sheeting", },
        { "default:steel_ingot", "default:steel_ingot", "default:steel_ingot", },
    };
});
