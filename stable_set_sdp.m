%stable_set_sdp.m
%compute the Lovasz number of the Petersen graph

%G=(V,E)
%Gx<=b, G is incidence matrix: rows, edges
%b is a vector of all ones: b=[1,1,1,...,1]^T

n=10; %number of vertices
%edges is a |E|x2 matrix
edges=[[1,2];[2,3];[3,4];[4,5];[5,1];...
       [1,6];[2,7];[3,8];[4,9];[5,10];...
       [6,8];[6,9];[7,9];[7,10];[8,10]];

%% yalmip

% M=sdpvar(n+1,n+1,'symmetric');
% y=sdpvar(n,1);
% %constraints=[M(1,1)==1, M(2:(n+1),1)==y, diag(M(2:(n+1),2:(n+1)))==y, M(sub2ind(size(M),edges(:,1)+1,edges(:,2)+1))==0, M>=0];
% constraints=[M(1,1)==1,...
%              M(2:(n+1),1)==y,...
%              diag(M(2:(n+1),2:(n+1)))==y,...
%              M(sub2ind(size(M),edges(:,1)+1,edges(:,2)+1))==0,... %Mij=0 if (i,j) in E
%              M>=0];
% sol=solvesdp(constraints,-sum(y))
% double(sum(y))

%% CVX

cvx_begin sdp
    variable M(n+1,n+1) symmetric
    variable y(n)
    
    minimize(-sum(y))    
    subject to
    M(1,1)==1
    M(2:(n+1),1)==y
    diag(M(2:(n+1),2:(n+1)))==y
    M(sub2ind(size(M),edges(:,1)+1,edges(:,2)+1))==0
    M>=0
    
cvx_end


