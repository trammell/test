#!/usr/bin/lua

local a = nil;
print(tostring(a));
print(type(a));

local b = 10;
print(b .. " is a " .. type(b));
print(tostring(b))

local c = 'foo bar baz'
print(c .. " is a " .. type(c));
print(tostring(c))

local d = true
print(tostring(d) .. " => " .. type(d));

f = function (x)
    return x * 2
end

print(type(f));
print(tostring(f));

