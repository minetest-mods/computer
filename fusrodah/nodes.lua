
-- Copyright (C) 2012-2013 Diego Martínez <kaeza@users.sf.net>
-- License is WTFPL (see README.txt).

-- Just a generic Baby Tower, modeled somewhat after my old Dell cabinet
--  (an Intel Celeron @ 233MHz, with 160MB of ram and 4GB of disk; good
--  old times).
computer.register("babytower", "Baby Tower",
    computer.pixelnodebox(16, {
        -- X   Y   Z   W   H   L
        {  1,  5,  6, 14, 11,  6 },   -- Monitor Screen
        {  3,  7, 12, 10,  7,  4 },   -- Monitor Tube
        {  0,  0,  6, 16,  5, 10 },   -- CPU
        {  0,  0,  0, 12,  1,  5 },   -- Keyboard
        { 13,  0,  0,  3,  3,  5 },   -- Mouse
    })
);

-- Amiga 500 lookalike
-- Fun fact: "Amiga" is spanish for "female friend" ("Amigo" is for male);
--  that's why this computer was named "She Friend". 
computer.register("shefriendSOO", "SheFriend SOO",
    computer.pixelnodebox(32, {
        -- X   Y   Z   W   H   L
        {  0,  0, 17, 32, 32, 12 },   -- Monitor Screen
        {  3,  3, 29, 26, 26,  3 },   -- Monitor Tube
        {  0,  0,  0, 32,  4, 17 },   -- Keyboard
    })
);

-- Sony PlayStation lookalike
-- Fun fact: Swapping the first letters gives valid words :)
-- Pony SureiSutteshun!!!
computer.register("slaystation", "Pony SlayStation",
    computer.pixelnodebox(32, {
        -- X   Y   Z   W   H   L
        {  0,  0, 11, 32,  6, 21 },   -- Console
        {  1,  0,  1,  4,  2,  9 },   -- Controller 1 L Grip
        { 10,  0,  1,  4,  2,  9 },   -- Controller 1 R Grip
        {  5,  0,  4,  5,  2,  5 },   -- Controller 1 Center
        { 18,  0,  1,  4,  2,  9 },   -- Controller 2 L Grip
        { 27,  0,  1,  4,  2,  9 },   -- Controller 2 R Grip
        { 22,  0,  4,  5,  2,  5 },   -- Controller 2 Center
    })
);

-- Some generic laptop. Sony VAIO came to mind when thinking about a name :)
-- Fun fact: "Vanio" sounds like "baño" ("bathroom" in spanish, pronounced
--  as something like "bah-nee-oh")
computer.register("vanio", "Pony Vanio",
    computer.pixelnodebox(32, {
        -- X   Y   Z   W   H   L
        {  0,  0,  4, 32,  3, 24 },   -- Keyboard
        {  0,  3, 25, 32, 21,  3 },   -- Screen
    })
);

-- Sinclair ZX Spectrum lookalike
computer.register("spectre", "SX Spectre",
    computer.pixelnodebox(32, {
        -- X   Y   Z   W   H   L
        {  3,  0,  0, 26,  4, 17 },   -- Keyboard
        { 18,  0, 18, 12,  6, 14 },   -- Tape Player
    })
);

-- Sony PlayStation 2 lookalike
computer.register("slaystation2", "Pony SlayStation 2",
    computer.pixelnodebox(32, {
        -- X   Y   Z   W   H   L
        {  2,  2, 11, 28,  3, 19 },   -- Console (Upper part)
        {  2,  0, 11, 26,  2, 19 },   -- Console (Lower part)
        {  1,  0,  1,  4,  2,  9 },   -- Controller 1 L Grip
        { 10,  0,  1,  4,  2,  9 },   -- Controller 1 R Grip
        {  5,  0,  1,  5,  2,  8 },   -- Controller 1 Center
        { 18,  0,  1,  4,  2,  9 },   -- Controller 2 L Grip
        { 27,  0,  1,  4,  2,  9 },   -- Controller 2 R Grip
        { 22,  0,  1,  5,  2,  8 },   -- Controller 2 Center
    })
);

-- Commodore 64 lookalike
computer.register("admiral64", "Admiral 64",
    computer.pixelnodebox(32, {
        -- X   Y   Z   W   H   L
        {  0,  0,  0, 32,  4, 18 },   -- Keyboard
    })
);

-- Commodore 128 lookalike
computer.register("admiral128", "Admiral 128",
    computer.pixelnodebox(32, {
        -- X   Y   Z   W   H   L
        {  0,  0,  0, 32,  4, 27 },   -- Keyboard
    })
);

-- Old node name
minetest.register_alias("computer:computer", "computer:babytower");
