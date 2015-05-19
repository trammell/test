#!/usr/bin/env python2.4


boards_text = """
Bloomington-Lake Special Service District Board
Central Avenue Advisory Board
Chicago-Lake Special Service District Advisory Board
Chicago Avenue Advisory Board (Also known as 48th St E and Chicago Ave S)
Downtown Skyway Advisory Committee
Dinkytown Advisory Board
Franklin Avenue East Advisory Board
Hennepin Theatre District Advisory Board
Linden Hills Advisory Board (Also known as 43rd St W and Upton Ave S)
Nicollet Avenue South Advisory Board
Nicollet Mall Advisory Board
Riverview Advisory Board
South Hennepin Avenue Advisory Board
Stadium Village Advisory Board
Uptown Advisory Board (Formerly Hennepin-Lake)
"""

boards = filter(lambda s: len(s) > 0, boards_text.split("\n"))

import pdb; pdb.set_trace()

