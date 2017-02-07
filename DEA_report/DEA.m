% DEA solver
% 11/13/16 created by Atsushi Hori
% Notes:
% The data matrix should be given inputs first then outputs
% The number of inputs and outputs should be given in the variables
% "inputs" and "outputs", respectively.
    4881,1071,619,1287,591,97,546;
    4744,956,637,1240,609,107,608;
    4806,952,544,1234,518,56,497;
    4810,964,583,1230,559,77,533;
    4747,910,499,1199,475,104,468;
    4914,1063,684,1338,649,118,560;
    4828,907,594,1234,565,82,573;
    4797,961,519,1203,497,62,435;
    4838,1049,572,1205,548,67,434;
    4813,1001,500,1180,473,60,463;
    4789,1149,506,1171,475,59,503];
m = 2; % # of inputs
s= 5; % # of outputs
n=size(D,2); % # of DMUs
X = D(1:m,:); % input matrix
Y = D(m+1:m+s,:); % output matrix
% Solve LPO
uvk = [];
fvalk = [];
lambdak = [];
% uv are separated by: u is coef. of x and v is coef. of y

for i=1:n
    [uv,fval,exitflag,data,lambda] = linprog(-[zeros(m,1);Y(:,i)],[-X;Y].',zeros(n,1),[X(:,i);zeros(s,1)].',1,zeros(m+s,1));
    uvk = [uvk uv];
    fvalk = [fvalk fval];
    lambdak = [lambdak lambda];
end
DMU_eff  = [];
for o=1:n
    DMU_effk = zeros(m+s,1);
    for j=1:n
        DMU_effk = DMU_effk + lambdak(o).ineqlin(j)*[X(:,j);Y(:,j)];
    end
    DMU_eff = [DMU_eff DMU_effk];
end