#!/usr/bin/lua

local a = 1.0;
local b = 3.0;
local c = 4.0;
local d = (a + b + c) / 3;

print('average = ', d);

-- version 2
local x = { 1.0, 3.0, 4.0 };
local sum = 0;
local n = 0;
for i, v in ipairs(x) do
    n = n + 1;
    sum = sum + v;
end
avg = sum / n;
print('average = ', avg);

-- version 3
local x = { 1.0, 3.0, 4.0 };
local sum = 0;
for i, v in ipairs(x) do
    sum = sum + v;
end
avg = sum / #x;
print('average = ', avg);


