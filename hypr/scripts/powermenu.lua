#!/usr/bin/lua

local commands = {
  Poweroff = "loginctl poweroff now",
  Reboot = "loginctl reboot",
  Lock = "swaylock",
  Logout = "hyprctl dispatch exit"
}
local command = "echo -e '  Poweroff\n  Reboot\n  Lock\n  Logout' | wofi -i --dmenu"
local op = io.popen(command)
local result = "";
if (op ~= nil) then
  result = op:read("a")
  op:close()
end
result = string.gsub(result, "\n", "")
command = commands[result:sub(6)]
os.execute(command)
