% DEA_MATLAB tool
% 11/13/16 created by Atsushi Hori
% Notes:
% The data matrix should be given inputs first then outputs
% The number of inputs and outputs should be given in the variables
% "inputs" and "outputs", respectively.

function [] = DEA(D,inputs,outputs)

n1=size(D,1);
n2=size(D,2);

if (inputs + outputs == n1)
    n=n2; % # of DMUs
    m=n1; % # of eval items
elseif (inputs + outputs == n2)
    n=n1;
    m=n2;
    D=D'; % transpose matrix
else
    fprintf('The sum of inputs and outputs should be equal to the number of evaluation items.\n');
    return;
end

X = D(1:inputs,:); % input matrix
Y = D(inputs+1:inputs+outputs,:); % output matrix

% declare variables
uvk = [];
fvalk = [];
lambdak = [];
% uv are separated by: u is coef. of x and v is coef. of y

for i=1:n
    % solve DMU i's LP
    [uv,fval,exitflag,data,lambda] = linprog(-[zeros(inputs,1);Y(:,i)],...
        [-X;Y].',zeros(n,1),[X(:,i);zeros(outputs,1)].',1,zeros(m,1));

    if (exitflag~=1)
        fprintf('Optimization DMU %d was not successfully terminated.\n',i);
        return;
    end

    uvk = [uvk uv]; % catenate vectors
    fvalk = [fvalk fval]; % catenate obj. values
    lambdak = [lambdak lambda]; % catenate dual variables (Lagrange multipliers)

end

DMU_eff  = [];

for o=1:n
    % compute DMU o's efficient (lambda)
    DMU_effk = zeros(m,1);
    for j=1:n
        DMU_effk = DMU_effk + lambdak(o).ineqlin(j) * [X(:,j);Y(:,j)];
    end
    DMU_eff = [DMU_eff DMU_effk];
end

fprintf('---- The result ----\n');

for i=1:n
    fprintf('-DMU %2d''s obj.-', i);
end
fprintf('\n');

for j=1:m
    for o=1:n
        fprintf('%15.3f',DMU_eff(j,o));
    end
    fprintf('\n');
end

end
