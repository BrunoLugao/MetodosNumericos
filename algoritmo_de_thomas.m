%  Resolve o sistema  n x n  tridiagonal para y:
%
%  [ a(1)  c(1)                                  ] [  y(1)  ]   [  f(1)  ]
%  [ b(2)  a(2)  c(2)                            ] [  y(2)  ]   [  f(2)  ]
%  [       b(3)  a(3)  c(3)                      ] [        ]   [        ]
%  [            ...   ...   ...                  ] [  ...   ] = [  ...   ]
%  [                    ...    ...    ...        ] [        ]   [        ]
%  [                        b(n-1) a(n-1) c(n-1) ] [ y(n-1) ]   [ f(n-1) ]
%  [                                 b(n)  a(n)  ] [  y(n)  ]   [  f(n)  ]
%
%  f deve ser um vetor (coluna or linha) de tamanho n
%  a, b, c devem ser vetores de tamnaho n (note que b(1) e c(n) não são usados)
%%%%%  Example
% n = 5; a = 4*ones(n,1); b = ones(n,1); c = 3*ones(n,1);
% f = rand(n,1);
% y = tridiag(a,b,c,f);
%%%%%  check solution
% A = diag(a,0) + diag(ones(n-1,1),-1) + diag(3*ones(n-1,1),1)
% A*y - f
function y = algoritmo_de_thomas(a,b,c,f)
  
  n = length(f);
  v = zeros(n,1);   
  y = v;
  w = a(1);
  y(1) = f(1)/w;
  
    for i=2:n
      v(i-1) = c(i-1)/w;
      w = a(i) - b(i)*v(i-1);
      y(i) = ( f(i) - b(i)*y(i-1) )/w;
    endfor
    
    for j=n-1:-1:1
     y(j) = y(j) - v(j)*y(j+1);
    endfor
    
    disp(y)
    
endfunction
