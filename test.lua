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
split = s:split(" ")
assert(split[1] == "hello")
assert(split[2] == "world")

split = s:split()
assert(split[1] == "h")
assert(split[2] == "e")
assert(split[3] == "l")
assert(split[4] == "l")
assert(split[5] == "o")

s = "^[123]?%d %u%l+ %d%d%d%d%$"
assert(s:escapep() == "%^%[123%]%?%%d %%u%%l%+ %%d%%d%%d%%d%%%$")

s = "hello world"
assert(s:count("l") == 3)
s = "hello world hello world"
assert(s:count("l") == 6)
s = "hello\nworld\nhello\nworld\n"
assert(s:count("\n") == 4)

---@type string[]
local t = {"a", "b", "c"}

local copied = table.copy(t)
assert(copied[1] == t[1])

local index = table.indexof(t, "b")
assert(index == 2)

local flipped = table.flip(t)
assert(flipped["a"] == 1)

local found = table.find(t, function(v, k)
    return v == "b"
end)
assert(found ~= nil)
assert(table.find(t, "b"))

local keys = table.keys(t)
assert(keys[1] == 1)
assert(keys[2] == 2)
assert(keys[3] == 3)

local values = table.values(t)
assert(values[1] == "a")
assert(values[2] == "b")
assert(values[3] == "c")

local filtered = table.filter(t, function(v, k)
    return v ~= "b"
end)
assert(filtered[1] == "a")
assert(filtered[2] == "c")
filtered = table.kfilter(t, function(v, k)
    return v ~= "b"
end)
assert(filtered[1] == "a")
assert(filtered[3] == "c")

local mapped = table.map(t, function(v, k)
    return v .. "!"
end)
assert(mapped[1] == "a!")
assert(mapped[2] == "b!")
assert(mapped[3] == "c!")
local mapped = table.map(t, function(v, k)
    return {value = v, key = k}
end)
assert(mapped[1].key == 1)
assert(mapped[1].value == "a")
assert(mapped[2].key == 2)
assert(mapped[2].value == "b")
assert(mapped[3].key == 3)
assert(mapped[3].value == "c")

local merged = table.merge({a = 1}, {b = 2}, {"test"}, {deep = {a = 1}})
assert(merged["a"] == 1)
assert(merged["b"] == 2)
assert(merged[1] == "test")
assert(merged["deep"]["a"] == 1)

local extended = table.extend(t, {"d"}, {"e", {1, 2, 3}}, {1, 2, 3})
assert(extended[1] == "a")
assert(extended[2] == "b")
assert(extended[3] == "c")
assert(extended[4] == "d")
assert(extended[5] == "e")
assert(extended[6][1] == 1)
assert(extended[6][2] == 2)
assert(extended[6][3] == 3)
assert(extended[7] == 1)
assert(extended[8] == 2)
assert(extended[9] == 3)

local appended = table.append(t, "d", "e", "f")
assert(appended[1] == "a")
assert(appended[2] == "b")
assert(appended[3] == "c")
assert(appended[4] == "d")
assert(appended[5] == "e")
assert(appended[6] == "f")

local reversed = table.reverse(t)
assert(reversed[1] == "c")
assert(reversed[2] == "b")
assert(reversed[3] == "a")

local slice = table.slice(t, 1, 2)
assert(slice[1] == "a")
assert(slice[2] == "b")
assert(slice[3] == nil)

local chunks = table.chunks({1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, 3)
assert(chunks[1][1] == 1)
assert(chunks[1][2] == 2)
assert(chunks[1][3] == 3)
assert(chunks[2][1] == 4)
assert(chunks[2][2] == 5)
assert(chunks[2][3] == 6)
assert(chunks[3][1] == 7)
assert(chunks[3][2] == 8)
assert(chunks[3][3] == 9)
assert(chunks[4][1] == 10)
assert(chunks[4][2] == nil)

local count = table.count(t)
assert(count == 3)
count = table.count({"a", "b", "b", "c"}, "b")
assert(count == 2)

local keyof = table.keyof(t, "b")
assert(keyof == 2)
local keyof = table.keyof({a = 1, b = 2, c = 3}, 2)
assert(keyof == "b")

local flatten = table.flatten({1, 2, {3, 4}, {5, 6, {7, 8}}})
assert(flatten[1] == 1)
assert(flatten[2] == 2)
assert(flatten[3] == 3)
assert(flatten[4] == 4)
assert(flatten[5] == 5)
assert(flatten[6] == 6)
assert(flatten[7] == 7)
assert(flatten[8] == 8)

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

assert(luna.file.write("test/file.txt", "lua is awesome!") == true)
assert(luna.file.read("test/file.txt") == "lua is awesome!")
assert(luna.file.exists("test/file.txt") == true)
assert(luna.file.remove("test/file.txt") == true)
assert(luna.file.frombytes("test/file.txt", {
    0x6c,
    0x75,
    0x61,
    0x20,
    0x69,
    0x73,
    0x20,
    0x61,
    0x77,
    0x65,
    0x73,
    0x6f,
    0x6d,
    0x65,
    0x21
}) == true)
assert(luna.file.tobytes("test/file.txt")[1] == 0x6c)
assert(luna.binary.read("test/file.txt") == "lua is awesome!")
assert(luna.binary.write("test/file.txt", "lua is awesome!") == true)

assert(luna.bool("true") == true)
assert(luna.bool("false") == false)
assert(luna.bool("1") == true)
assert(luna.bool("0") == false)
assert(luna.bool(1) == true)
assert(luna.bool(0) == false)
assert(luna.bool(true) == true)
assert(luna.bool(false) == false)

assert(luna.bit(true) == 1)
assert(luna.bit(false) == 0)
assert(luna.bit(1) == 1)
assert(luna.bit(0) == 0)
assert(luna.bit("") == 0)
assert(luna.bit("1") == 1)
assert(luna.bit("notboolean") == 0)

os.exit(0)
