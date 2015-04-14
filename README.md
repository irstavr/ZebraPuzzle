# ZebraPuzzle
The zebra puzzle is a well-known logic puzzle. It is often called Einstein's Puzzle or Einstein's Riddle. http://en.wikipedia.org/wiki/Zebra_Puzzle
###############################################################################################################

This is a version of Zebra puzzle:

Steve, Sue, Sara, and Sam were seated at a table in a restaurant. 
The men sat across from each other, as did the women. 
They each ordered a different dessert and a different beverage. 
In addition,
(a) Sara never drinks milk.
(b) The cake came with coffee.
(c) Sam sat beside the person who ordered pie.
(d) The person with the ice cream sat across from the person with tea.
(e) Steve always orders water.
(f) Sue did not eat pie.

The question is ...Who ordered the fruit cup?

########################################################################

Usage:

Load code included in repository:

Load solver:
| ?- consult(zebraPuzzle.pl).

Run solver:
| ?- 
find_solution(Sara, Sue, Steve, Sam,
              Pie, Fruit_cup, Ice_cream, Cake,
              Coffee, Tea, Water, Milk).

Solution will be written on the output.
