local luna = require "luna"
local inspect = require "inspect"

local s = "  hello world  "
assert(s:trim() == "hello world")
assert(s:ltrim() == "hello world  ")
assert(s:rtrim() == "  hello world")
assert(s:replace(" ", "_") == "__hello_world__")
--assert(s:split(" ") == {"", "", "hello", "world", "", ""})

---@type string[]
local t = {"a", "b", "c"}

local t2 = table.copy(t)
assert(t2[1] == t[1])

local i = table.indexof(t, "b")
assert(i == 2)

local t3 = table.flip(t)
assert(t3["a"] == 1)

local v = table.find(t, function(v, k) return v == "b" end)
assert(v ~= nil)

os.exit(0)
