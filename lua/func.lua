#!/usr/bin/lua

f = function (x, ...)
	x(...)
end
f(print, "1 2 3")

f(print, 1, 2, 3)



