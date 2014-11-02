%max_cut_sdp.m
%petersen graph

n=10; %number of nodes
A=zeros(n,n); %adjacency matrix
edges=[[1,2];[2,3];[3,4];[4,5];[5,1];...
       [1,6];[2,7];[3,8];[4,9];[5,10];...
       [6,8];[6,9];[7,9];[7,10];[8,10]];
A(sub2ind(size(A),edges(:,1),edges(:,2)))=1;
A=A+A';

%% yalmip

% yalmip('clear');
% X=sdpvar(n);
% constraints=[X>=0; diag(X)==ones(n,1)];
% objective=-trace(A*(ones(n,n)-X))/4;
% maxcutsol=solvesdp(constraints,objective)

%% CVX

cvx_begin sdp
    variable X(n,n) symmetric
    minimize(-trace(A*(ones(n,n)-X))/4)
    subject to
    diag(X)==ones(n,1)
    X>=0
    X == semidefinite(n);
cvx_end

