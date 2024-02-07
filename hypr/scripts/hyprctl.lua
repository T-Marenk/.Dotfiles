#!/usr/bin/lua

local commands = {
  Spotify_Player = [[hyprctl dispatch togglefloating
    hyprctl dispatch resizeactive exact 60% 55%
    hyprctl dispatch moveactive exact 752 42]]
}

local command = [[echo -e '  Spotify_Player' | wofi -i --dmenu]]

local op = io.popen(command)
if (op == nil) then
  os.exit()
end

local result = op:read("a")

result = string.gsub(result, "\n", "")

local alph = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
local first = string.sub(result, 1, 1)
local index = alph:find(first)

if not index then
  result = result:sub(6)
end

op:close()

local exe = commands[result]
os.execute(exe)
