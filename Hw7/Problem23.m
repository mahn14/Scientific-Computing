%% Problem 23: Polynomial Interpolation

% Exercise 3.3 from SciComp with Matlab/Octave, 4th Ed.

    %data
year = [1975, 1980, 1985, 1990];
west = [72.8, 74.2, 75.2, 76.4];
east = [70.2, 70.2, 70.3, 71.2];

    %computing coefficients
degree = length(year) - 1;
coefW = polyfit(year, west, degree);
coefE = polyfit(year, east, degree);

    %construct polynomial
PW = @(t) polyval(coefW, t);
PE = @(t) polyval(coefE, t);

    %estimating with interpolant
EstW = [PW(1977), PW(1983), PW(1988)];
EstE = [PE(1977), PE(1983), PE(1988)];
    
    
    
    
    