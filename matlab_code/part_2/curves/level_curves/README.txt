level_curves.m contains all of its own necessary functionality.
No other external functions should be needed.

%% Domain and function
Modify the axes range x and y bounds to describe a domain 
for our function. Under %function, provide the
function f of interest in terms of X and Y. Be sure to use the '.'
operator when necessary.

To display gradient vector field, modify
    gradient = true; (set to 'false' if you do not want arrows)
Fill in
    fx = partial derivative of f with respect to x
    fy = partial derivative of f with respect to y


%% Plotting
Tune the variables constants and number_of_colors.
    constants = [ c_1 c_2 c_3 ... ]
    is an array of constant values that you want displayed as curves

    number_of_colors = num
    is a positive integer that sets the total number of colors to use
    while coloring the graph.
