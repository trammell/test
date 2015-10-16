#!/usr/bin/lua

print('----- part 1 -----')
local d = {
	['172.16.137.150'] = 'White',
	['36.42.78.85'] = 'Black',
	['12.34.56.78'] = 'Black',
	['1.2.3.4'] = 'White',
}

for k, v in pairs(d) do
	 if v == 'White' then print(k) end
end


print('----- part 2 -----')

d['1.2.3.4'] = nil
for k, v in pairs(d) do
	 if v == 'White' then print(k) end
end
