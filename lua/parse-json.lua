#!/usr/bin/lua

-- read simple.json
local f = assert(io.open('simple.json', 'r'))
local body = f:read("*all")
f:close()

-- parse it into a table
local cjson = require "cjson"
tbl = cjson.decode(body)

-- determine the binding name
print(tbl.recipients[1].metadata.stream)


