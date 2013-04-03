
-- Amiga 500 lookalike
-- Fun fact: "Amiga" is spanish for "female friend" ("Amigo" is for male);
--  that's why this computer was named "She Friend". 
computer.register("computer:shefriendSOO", {
    description = "SheFriendSOO";
    tiles_off = { front=true; };
    node_box = computer.pixelnodebox(32, {
        -- X   Y   Z   W   H   L
        {  0,  0, 17, 32, 32, 12 },   -- Monitor Screen
        {  3,  3, 29, 26, 26,  3 },   -- Monitor Tube
        {  0,  0,  0, 32,  4, 17 },   -- Keyboard
    });
});

-- Some generic laptop. Sony VAIO came to mind when thinking about a name :)
-- Fun fact: "Vanio" sounds like "baño" ("bathroom" in spanish, pronounced
--  as something like "bah-nee-oh")
computer.register("computer:vanio", {
    description = "Pony Vanio";
    tiles_off = { front=true; top=true; left=true; right=true; back=true; };
    node_box = computer.pixelnodebox(32, {
        -- X   Y   Z   W   H   L
        {  0,  0,  4, 32,  3, 24 },   -- Keyboard
        {  0,  3, 25, 32, 21,  3 },   -- Screen
    });
    node_box_off = computer.pixelnodebox(32, {
        -- X   Y   Z   W   H   L
        {  0,  0,  4, 32,  3, 24 },   -- Keyboard
        {  0,  3,  4, 32,  3, 24 },   -- Screen
    });
});

-- Sony PlayStation lookalike
-- Fun fact: Swapping the first letters gives valid words :)
-- Pony SureiSutteshun!!!
computer.register("computer:slaystation", {
    description = "Pony SlayStation";
    tiles_off = { top=true; };
    node_box = computer.pixelnodebox(32, {
        -- X   Y   Z   W   H   L
        {  0,  0, 11, 32,  6, 21 },   -- Console
        {  1,  0,  1,  4,  2,  9 },   -- Controller 1 L Grip
        { 10,  0,  1,  4,  2,  9 },   -- Controller 1 R Grip
        {  5,  0,  4,  5,  2,  5 },   -- Controller 1 Center
        { 18,  0,  1,  4,  2,  9 },   -- Controller 2 L Grip
        { 27,  0,  1,  4,  2,  9 },   -- Controller 2 R Grip
        { 22,  0,  4,  5,  2,  5 },   -- Controller 2 Center
    });
});

-- Sony PlayStation 2 lookalike
-- Fun fact: Swapping the first letters gives valid words :)
-- Pony SureiSutteshun!!!
computer.register("computer:slaystation2", {
    description = "Pony SlayStation 2";
    tiles_off = { front=true; };
    node_box = computer.pixelnodebox(32, {
        -- X   Y   Z   W   H   L
        {  2,  2, 11, 28,  3, 19 },   -- Console (Upper part)
        {  2,  0, 11, 26,  2, 19 },   -- Console (Lower part)
        {  1,  0,  1,  4,  2,  9 },   -- Controller 1 L Grip
        { 10,  0,  1,  4,  2,  9 },   -- Controller 1 R Grip
        {  5,  0,  1,  5,  2,  8 },   -- Controller 1 Center
        { 18,  0,  1,  4,  2,  9 },   -- Controller 2 L Grip
        { 27,  0,  1,  4,  2,  9 },   -- Controller 2 R Grip
        { 22,  0,  1,  5,  2,  8 },   -- Controller 2 Center
    });
});

-- Sinclair ZX Spectrum lookalike
computer.register("computer:specter", {
    description = "SX Specter";
    tiles_off = { };
    node_box = computer.pixelnodebox(32, {
        -- X   Y   Z   W   H   L
        {  3,  0,  0, 26,  4, 17 },   -- Keyboard
        { 18,  0, 18, 12,  6, 14 },   -- Tape Player
    });
});

-- Nintendo Wii lookalike.
computer.register("computer:wee", {
    description = "Nientiendo Wee";
    tiles_off = { front=true; };
    node_box = computer.pixelnodebox(32, {
        -- X   Y   Z   W   H   L
        { 11,  0,  3, 10,  6, 26 },   -- Base
        { 12,  6,  4,  8, 22, 24 },   -- Top
    });
});

-- Apple iPad lookalike.
computer.register_handheld("computer:piepad", {
    description = "Snapple Piepad";
});
