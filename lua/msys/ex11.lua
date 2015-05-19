#!/usr/bin/lua

function average(arr)
	sum = 0
	max = arr[1]
	for i, v in ipairs(arr) do
		if tonumber(v) ~= nil then
			sum = sum + v
			if v > max then max = v end
		end
	end
	avg = sum / #arr;
   return avg, max
end

local x = { 1.0, 3.0, 4.0 };
print(average(x))


