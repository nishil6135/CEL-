% Define the coefficient matrix A
n=100;
a=zeros(n,n);
c=zeros(n,1);

c(1)=-54;
c(n)=-28;
c(2:n-1)=0;

a=zeros(n,n);
a(1,1)=-2;
a(n,n)=-2;

for i=1:n-1
    a(i,i)=-2;
    a(i,i+1)=1;
    a(i+1,i)=1;
end
% Compute the eigenvalues and eigenvectors of A
[V, D] = eig(a);

% Extract the diagonal matrix of eigenvalues
lambda = diag(D);

% Define the right-hand side vector b


% Initialize the solution vector x
x = zeros(size(c));

% Solve for each component of x
for i = 1:length(lambda)
    x = x + (V(:,i)' * c / lambda(i)) * V(:,i);
end

% Display the solution
disp('Solution x:');
disp(x);

%Timer
tic
elapsed_time=toc;

disp(['Elapsed time: ', num2str(elapsed_time),' seconds']);