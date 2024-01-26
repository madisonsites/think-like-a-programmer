# 2-1. Using only single-character output statements that output a
# hash mark, a space, or an end-of-line,
# write a program that produces the following shape:
########
 ######
  ####
   ##


# Notes from the chapter (attempting to force myself to step through the act of reduction, just as ths author did):
# A good first weapon is reduction.
# How can we reduce this problem to a point where it’s easy to solve?
# What if the pattern was a whole square instead of half of a square?

# A square (half of a pyramid reduction)
# Modifying this to match the problems above (instead of the exact one earlier in the chapter)
# Write a program that uses only two output statements, cout ("#" and "\n"),
# to produce a pattern of hash symbols shaped like a perfect 8x4 square:
########
########
########
########

# This may be enough to get us going, but suppose we didn’t know how to tackle this either.
# We could reduce the problem further, making a single line of hash symbols instead of the square.

# A line (half of a pyramid FURTHER reduction)
# Write a program that uses only two output statements, cout ("#" and "\n"),
# to produce a line of eight hash symbols:
########

# notes:
# there was a constraint of only setting one variable
# also, book was written with C++ examples
# I'm using the best ruby-translation of it here
# and will adjust the final answer to be more ruby-like
def hash_line
  hash_count = 1
  while hash_count <= 8 do
    print "#"
    hash_count += 1
  end
  # never occured to me to use puts on its own for a new line, but now feels obvious
  puts
end
# hash_line
# OUTPUT:
########

# Now we can go back up a level, to a square
def hash_square
  row = 1
  while row <= 4 do
    hash_count = 1

    while hash_count <= 8 do
      print "#"
      hash_count += 1
    end
    puts
    row += 1
  end
end
# hash_square
# OUTPUT:
########
########
########
########

# What we require is a mechanism to adjust the number of symbols produced on each row
# so that the first row gets eight symbols, the second row gets six, and so on.
# Let's make another reduced version problem

# Count down by counting up
# 4.times do |row|
# puts EXPRESSION
# end

# If we want an expression that decreases as row increases,
# our first thought might be to stick a minus sign in front of the values
#  of row by multiplying row by –2.
# This produces numbers that go down, but not the desired numbers.
# We may be closer than we think, though.
# What’s the difference between the desired value and the value given by multiplying row by –2?

# Row   Desired Value   Row * –2    Difference from Desired Value
# 1           8           –2                  10
# 2           6           –4                  10
# 3           4           –6                  10
# 4           2           –8                  10

# Difference is a fixed value: 10
# This means the expression we need is row * -2 + 10.

def count_down
  row = 1
  while row <= 4 do
    puts row * -2 + 10
    row += 1
  end
end
# count_down
# OUTPUT:
# 8
# 6
# 4
# 2

# That works, we can apply that to the square above...

def hash_half_square
  row = 1
  while row <= 4 do
    hash_count = 1
    hash_limit = row * -2 + 10
    while hash_count <= hash_limit do
      print "#"
      hash_count += 1
    end
    puts
    row += 1
  end
end
# hash_half_square
# OUTPUT:
########
######
####
##

# Awesome, so now we nee to add the "spaces" to the left of the hashes.
# This isn't part of the step-through problems, so I'm on my own now

def hash_pyramid
  row = 1
  while row <= 4 do
    hash_limit = row * -2 + 10
    # divide by two as spaces are on each side
    # but we only need to account for the front space
    space_limit = (8 - hash_limit)/2

    front_space_count = 0
    while front_space_count < space_limit do
      print " "
      front_space_count += 1
    end

    hash_count = 1
    while hash_count <= hash_limit do
      print "#"
      hash_count += 1
    end

    puts
    row += 1
  end
end
# hash_pyramid
# OUTPUT:
########
 ######
  ####
   ##

# With that working, let's make this less of a C++ translation and more ruby-like
def ruby_hash_pyramid
  longest_hash = 8
  4.times do |row|
    hash_length = longest_hash - (row * 2)
    spaces = " " * row
    hashes = "#" * hash_length

    print spaces + hashes + "\n"
  end
end
# ruby_hash_pyramid

# OUTPUT:
########
 ######
  ####
   ##


