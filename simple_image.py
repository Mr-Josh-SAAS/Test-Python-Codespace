import turtle

# Setup the turtle
t = turtle.Turtle()
t.speed(1)  # Slow speed to see the drawing process

# Draw a square
for i in range(4):
    t.forward(100)  # Move forward 100 pixels
    t.left(90)      # Turn left 90 degrees

# Keep the window open
turtle.exitonclick()