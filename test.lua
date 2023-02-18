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

local copied = table.copy(t)
assert(copied[1] == t[1])

local index = table.indexof(t, "b")
assert(index == 2)

local flipped = table.flip(t)
assert(flipped["a"] == 1)

local found = table.find(t, function(v, k) return v == "b" end)
assert(found ~= nil)

local keys = table.keys(t)
assert(keys[1] == 1)
assert(keys[2] == 2)
assert(keys[3] == 3)

local filtered = table.filter(t, function(v, k) return v ~= "b" end)
assert(filtered[1] == "a")
assert(filtered[3] == "c")

os.exit(0)
