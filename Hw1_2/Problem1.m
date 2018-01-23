%% Homework 1
format long e

    % Problem 1

% a.) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
X1 = [];
X2 = [];
for i = 1:length(X)
    if X(i) < 0.5
        X1(end + 1) = X(i);
    else
        X2(end + 1) = X(i);
    end
end
X1 = sort(X1);
X2 = sort(X2);

%finding length
length(X1);
length(X2);

%finding k1 and k2
k1 = 0;
k2 = 0;
for i = 1:length(X1)
    if X1(i) == 0.4153003514934103
        k1 = i;
    end
end
for i = 1:length(X2)
    if X2(i) == 0.5862331732986853
        k2 = i;
    end
end


% b.) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

f1 = strophoids(X1(511));
f2 = strophoids(X2(511));


% c.) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
V = [];
for i = 1:length(X)
    V(end + 1) = strophoids(X(i));
end
plot(X, V)


