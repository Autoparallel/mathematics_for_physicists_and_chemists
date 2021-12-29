This directory .../curve_thickening_framing/ uses Matlab to
construct a thickened version of a curve with the tangent and
normal vectors displayed if desired.

To work with this program, the user need only work with the file: 
    curve.m

Files inside the directory .../curve_thickening_framing/functions/
should be included in your path, but SHOULD NOT BE MODIFIED.

Inside curve.m one can decide on whether to frame the curve
    frame = true; (true includes tangent+normal vectors; 
replace with false otherwise)

In %% Curve parameters the user has access to the parameterization
of the curve. Only the variables 
    t_start, t_end, x, y, z
should be modified.

%% Thickening and framing settings should only have
    radius, numpoints
to modify. Radius describes the radius of the tube of the 
thickened curve. Numpoints can be increased to smooth out the tube.

%% Visualization
Plot bounds and ticks can be changed to suit visualization if
need be. All other variables are up to the user but are chosen
to be "generally good enough".