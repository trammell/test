#!/usr/bin/lua

local a = { 'foo', 'bar', 'baz' }
print(a)
print(tostring(a))
for i, v in ipairs(a) do
    print(i .. ' => ' .. v)
end


local b = {
	['foo'] = 'bar',
	['monster'] = 'truck',
}
print(tostring(b))
for k, v in pairs(b) do
    print(k .. ' => ' .. v)
end

local c = { 'foo', 'bar', 'baz', 'quux' }
for k, v in pairs(c) do
    print(k .. ' => ' .. v)
	 if k < 3 then print(v) end
end





