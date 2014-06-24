--Adapted from Jeija's digilines_lcd code by crazyginger72

--LGPLv3 applies to all this code
--WTFPL applies to textures and any other content used form the 'digilines_lcd' mod


--* parts are currently not possible because you cannot set the pitch of an entity from lua

-- Font: 04.jp.org

-- load characters map
local chars_file = io.open(minetest.get_modpath("computer").."/characters", "r")
local charmap = {}
local max_chars = 12
if not chars_file then
print("[computer_DL_monitor] E: character map file not found")
else
while true do
local char = chars_file:read("*l")
if char == nil then
break
end
local img = chars_file:read("*l")
chars_file:read("*l")
charmap[char] = img
end
end

local lcds = {
-- on ceiling
--* [0] = {delta = {x = 0, y = 0.4, z = 0}, pitch = math.pi / -2},
-- on ground
--* [1] = {delta = {x = 0, y =-0.4, z = 0}, pitch = math.pi / 2},
-- sides
[2] = {delta = {x = 0.4, y = 0, z = 0}, yaw = math.pi / -2},
[3] = {delta = {x = -0.4, y = 0, z = 0}, yaw = math.pi / 2},
[4] = {delta = {x = 0, y = 0, z = 0.4}, yaw = 0},
[5] = {delta = {x = 0, y = 0, z = -0.4}, yaw = math.pi},
}

local reset_meta = function(pos)
minetest.get_meta(pos):set_string("formspec", "field[channel;Channel;${channel}]")
end

local clearscreen = function(pos)
local objects = minetest.get_objects_inside_radius(pos, 0.5)
for _, o in ipairs(objects) do
if o:get_entity_name() == "computer:text" then
o:remove()
end
end
end

local prepare_writing = function(pos)
lcd_info = lcds[minetest.get_node(pos).param2]
if lcd_info == nil then return end
local text = minetest.add_entity(
{x = pos.x + lcd_info.delta.x,
y = pos.y + lcd_info.delta.y,
z = pos.z + lcd_info.delta.z}, "computer:text")
text:setyaw(lcd_info.yaw or 0)
--* text:setpitch(lcd_info.yaw or 0)
return text
end

local on_digiline_receive = function(pos, node, channel, msg)
local meta = minetest.get_meta(pos)
local setchan = meta:get_string("channel")
if setchan ~= channel then return end

meta:set_string("text", msg)
clearscreen(pos)
if msg ~= "" then
prepare_writing(pos)
end
end

local lcd_box = {
type = "wallmounted",
wall_top = {-8/16, 7/16, -8/16, 8/16, 8/16, 8/16}
}

minetest.register_node("computer:dl_monitor", {
	description = "Monitor for Digilines",
	tiles = {"computer_monitor_t.png","computer_monitor_bt.png","computer_monitor_l.png","computer_monitor_r.png","computer_monitor_b.png","computer_monitor_f_dl.png"},
	--inventory_image =
	paramtype = "light",
	light_source = 8,
	paramtype2 = "facedir",
	walkable = false,
	is_ground_content = true,
	groups = {crumbly=3},
	--sounds = default.node_sound_dirt_defaults(),
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.4375, 0.4375, 0.5, 0.4375, 0.5}, 
			{-0.25, -0.5, 0.25, 0.25, -0.466981, 0.5}, 
			{-0.1875, -0.5, 0.456609, 0.1875, 0.0283019, 0.5}, 
			{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, -0.125}, 
			},
		},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.4375, 0.4375, 0.5, 0.4375, 0.5}, 
			{-0.25, -0.5, 0.25, 0.25, -0.466981, 0.5}, 
			{-0.1875, -0.5, 0.456609, 0.1875, 0.0283019, 0.5}, 
			{-0.4375, -0.5, -0.4375, 0.4375, -0.4375, -0.125}, 
			},
		},
after_place_node = function (pos, placer, itemstack)
local param2 = minetest.get_node(pos).param2
if param2 == 0 or param2 == 1 then
minetest.add_node(pos, {name = "computer:dl_monitor", param2 = 3})
end
prepare_writing (pos)
end,

on_construct = function(pos)
reset_meta(pos)
end,

on_destruct = function(pos)
clearscreen(pos)
end,

on_receive_fields = function(pos, formname, fields, sender)
if (fields.channel) then
minetest.get_meta(pos):set_string("channel", fields.channel)
end
end,

digiline =
{
receptor = {},
effector = {
action = on_digiline_receive
},
},


})

minetest.register_entity("computer:text", {
collisionbox = { 0, 0, 0, 0, 0, 0 },
visual = "upright_sprite",
textures = {},

on_activate = function(self)
local meta = minetest.get_meta(self.object:getpos())
local text = meta:get_string("text")
self.object:set_properties({textures={generate_texture(create_lines(text))}})
end
})

-- CONSTANTS
local LCD_WITH = 100
local LCD_PADDING = 8

local LINE_LENGTH = 12
local NUMBER_OF_LINES = 5

local LINE_HEIGHT = 14
local CHAR_WIDTH = 5

create_lines = function(text)
local line = ""
local line_num = 1
local tab = {}
for word in string.gmatch(text, "%S+") do
if string.len(line)+string.len(word) < LINE_LENGTH and word ~= "|" then
if line ~= "" then
line = line.." "..word
else
line = word
end
else
table.insert(tab, line)
if word ~= "|" then
line = word
else
line = ""
end
line_num = line_num+1
if line_num > NUMBER_OF_LINES then
return tab
end
end
end
table.insert(tab, line)
return tab
end

generate_texture = function(lines)
local texture = "[combine:"..LCD_WITH.."x"..LCD_WITH
local ypos = 16
for i = 1, #lines do
texture = texture..generate_line(lines[i], ypos)
ypos = ypos + LINE_HEIGHT
end
return texture
end

generate_line = function(s, ypos)
local i = 1
local parsed = {}
local width = 0
local chars = 0
while chars < max_chars and i <= #s do
local file = nil
if charmap[s:sub(i, i)] ~= nil then
file = charmap[s:sub(i, i)]
i = i + 1
elseif i < #s and charmap[s:sub(i, i + 1)] ~= nil then
file = charmap[s:sub(i, i + 1)]
i = i + 2
else
print("[computer_DL_monitor] W: unknown symbol in '"..s.."' at "..i)
i = i + 1
end
if file ~= nil then
width = width + CHAR_WIDTH
table.insert(parsed, file)
chars = chars + 1
end
end
width = width - 1

local texture = ""
local xpos = math.floor((LCD_WITH - 2 * LCD_PADDING - width) / 2 + LCD_PADDING)
for i = 1, #parsed do
texture = texture..":"..xpos..","..ypos.."="..parsed[i]..".png"
xpos = xpos + CHAR_WIDTH + 1
end
return texture
end