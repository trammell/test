#!/usr/bin/lua


function double(y)
	return 2 * y
end

print(double(double(double(3))))

f = function (x, ...)
	x(...)
end
f(print, "1 2 3")

f(print, 1, 2, 3)



