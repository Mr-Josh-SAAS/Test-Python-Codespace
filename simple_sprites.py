# Section 1 - Your code
from utils import *

set_background("moon")

s1 = create_sprite("fish", -200, 0)
s2 = create_sprite("stitch", 200, 0)

######################################################################
# Section 2 - Keeping the window open (DON'T CHANGE!!)
window.update()
turtle.exitonclick()