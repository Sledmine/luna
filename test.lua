local luna = require "luna"

local s = "  hello world  "
assert(s:trim() == "hello world")
assert(s:ltrim() == "hello world  ")
assert(s:rtrim() == "  hello world")
assert(s:replace(" ", "_") == "__hello_world__")
local split = s:split(" ")
assert(split[1] == "")
assert(split[2] == "")
assert(split[3] == "hello")
assert(split[4] == "world")
assert(split[5] == "")
assert(split[6] == "")
s = "hello world"
assert(s:split(" ")[1] == "hello")
assert(s:split(" ")[2] == "world")
assert(s:split()[1] == "h")
assert(s:split()[2] == "e")
assert(s:split()[3] == "l")
assert(s:split()[4] == "l")
assert(s:split()[5] == "o")

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

local values = table.values(t)
assert(values[1] == "a")
assert(values[2] == "b")
assert(values[3] == "c")

local filtered = table.filter(t, function(v, k) return v ~= "b" end)
assert(filtered[1] == "a")
assert(filtered[3] == "c")

local mapped = table.map(t, function(v, k) return v .. "!" end)
assert(mapped[1] == "a!")
assert(mapped[2] == "b!")
assert(mapped[3] == "c!")

local merged = table.merge({a = 1}, {b = 2}, {"test"}, {deep = {a = 1}})
assert(merged["a"] == 1)
assert(merged["b"] == 2)
assert(merged[1] == "test")
assert(merged["deep"]["a"] == 1)

s = "hello world"
local hex = s:tohex()
local unhex = hex:fromhex()
assert(hex == "68656c6c6f20776f726c64")
assert(unhex == "hello world")

assert(s:startswith("hello"))
assert(s:endswith("world"))

assert(string.template("luna says {a} {b}", {a = "hello", b = "world"}) == "luna says hello world")
assert(string.template("luna says {a} {b}.", {a = "hello"}) == "luna says hello .")

assert(string.includes("hello world", "hello"))

assert(luna.file.read("test/file.txt") == "lua is awesome!")
assert(luna.file.write("test/file.txt", "lua is awesome!") == true)

os.exit(0)
