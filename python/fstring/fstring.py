#!/usr/bin/env python3


a = ["uno", "dos", "tres"]
b = [f"{i:#04d} {e}" for i,e in enumerate(a)]

print(b)

