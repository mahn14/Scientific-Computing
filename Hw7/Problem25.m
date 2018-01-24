%% Problem 25

x = [-55, -25, -5, 25, 55];
k = 1.5;

%a.) Graph
    %preparation
y = [3.7, 3.27, 3.15, 3.47, 3.62];
degree = length(x) - 1;
coef = polyfit(x, y, degree);
temperature = @(t) polyval(coef, t);
X = -65:0.01:65;

    %plotting
z = linspace(x(1), x(end), 1000); p = temperature(z);
plot(z, p, 'LineWidth', 2); grid on
hold on; plot(x, y, 'r*'); hold off
axis([-60, 70, 2.2, 4]);


%b.) Estimating
temp = [temperature(-65), temperature(-17), temperature(0), temperature(17), temperature(65)];



