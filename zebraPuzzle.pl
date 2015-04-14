%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zebra Puzzle in Prolog
% @irstavr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Four people: Sara, Sue, Steve, Sam
% Men sat across each other.
% Women sat across each other.
% Four different desserts: cake, pie, ice-cream,e fruit-cup.
% Four different beverages: coffee, milk, water, tea.

% Conditions given:
% (a) Sara never drinks milk.
% (b) The cake came with coffee.
% (c) Sam sat beside the person who ordered pie.
% (d) The person with the ice cream sat across from the person with tea.
% (e) Steve always orders water.
% (f) Sue did not eat pie.

% Question: Who ate the fruit-cup?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 4 Positions on the round table
pos(1).
pos(2). 
pos(3). 
pos(4).

% across(X,Y): means: X sits across of Y on the table
% that means that having 4 total positions we 
% can find the people's positions by calculating: (n+2)%4 
across(A, B) :- 
    pos(A), 
    B is (A+2) mod 4.

% beside(X,Y):  means: X sits across of Y on the table
% that means that having 4 total positions we 
% can find the people's positions by calculating: (n+1)%2
beside(A, B) :- 
    pos(A), 
    B is (A+1) mod 2.

% Make the 4 different positions to be unique.
unique_pos(A, B, C, D) :-
    pos(A), pos(B), pos(C), pos(D),
    \+ A=B, \+ A=C, \+ A=D,
          \+ B=C, \+ B=D,
                  \+ C=D.

% Given the known Conditions,
% we set up the constraints for the 4 different positions
% that we have on our clause:
find_solution(Sara, Sue, Steve, Sam,
              Pie, Fruit_cup, Ice_cream, Cake,
              Coffee, Tea, Water, Milk) :-
    % (c) Sam sat beside the person who ordered pie
    beside(Sam, Pie),
    % (b) The cake came with coffee
    Cake = Coffee,    
    % (d) The person with the ice cream sat across from the person with tea.
    across(Ice_cream, Tea),
    % (e) Steve always orders water.
    Steve = Water,
    % The men and women sat across from each other
    across(Steve, Sam),
    across(Sara, Sue),
    % Every item has to be only in 1 position, so we have:
    unique_pos(Pie, Cake, Ice_cream, Fruit_cup),
    unique_pos(Milk, Coffee, Tea, Water),
    unique_pos(Sara, Sue, Steve, Sam),
    % (a) Sara never drinks milk
    \+ Sara = Milk,
    % (f) Sue did not eat pie
    \+ Sue = Pie.
