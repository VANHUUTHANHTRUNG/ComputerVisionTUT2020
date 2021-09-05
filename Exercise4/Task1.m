%% Task 1
%% a)
x = [-2 2];
y = [1 5];
figure
hold on
scatter(x,y,'filled');
yline(0);
xline(0);
plot(x,y);
title('x - y space');
hold off

% Hough transformation : y = x * m + b => A * mb = B
A = [-2 1;
     2 1];
B = [1;5];
mb = A\B;
figure
hold on
scatter(mb(1),mb(2),'r','filled');
text(mb(1),mb(2),['(' num2str(mb(1)) ',' num2str(mb(2)) ')'])
yline(0);
xline(0);
title('m - b space');
hold off
%% b)
rho = linspace(-pi/2,pi/2);
p1 = -2 * cos(rho) + 1 * sin(rho);
p2 = 2 * cos(rho) + 5 * sin(rho);
syms r p
eqns = [-2 * cos(r) + 1 * sin(r) == p,2 * cos(r) + 5 * sin(r) == p];
vars = [r p];
[solr, solp] = solve(eqns,vars);
figure
hold on
plot(rho,p1,'blue');
plot(rho,p2,'red');
scatter(solr,solp,'filled');
for k = 1:numel(solr)
    text(solr(k),solp(k),['(' num2str(double(solr(k))) ',' num2str(double(solp(k))) ')']);
end
title('Hough transformation - Bipolar coordinate');
hold off
%% c) What advantages does the Polar coordinate form have over Cartesian coordinate form?
%  - It is possible to represent vertical line in Polar coordinate without
%  using infinite m
%  - Parameters domains are bounded
%  - Some algebraic expressions become less complex.
%  - Some expressions involving differentials, like integrals, can become solvable analytically, that are not solvable analytically in Cartesian coordinates.