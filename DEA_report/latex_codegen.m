% LaTeX table code generator (matrix -> latex table)
% created by Atsushi Hori 11/13/16

function [] = latex_codegen(A)
    n = size(A,1);
    m = size(A,2);
    fprintf('\\begin{table}\n')
    fprintf('\\begin{tabular}\n')
    for i=1:n
        if (m>1)
            for j=1:m-1
                fprintf('%8.2f &', A(i,j))
            end
        end
        fprintf('%8.2f \\\\ \n', A(i,m))
    end
    fprintf('\\end{tabular}\n')
    fprintf('\\end{table}\n')
end