function [H] = DLT(matches)
%DLT performes a normalized Direct Linear Transformation
%   Detailed explanation goes here

p1 = matches(:,1:2)';
p2 = matches(:,3:4)';

% Convert to homogeneous coordinates.
if (size(p1,1) ~= 3)
    p1 = padarray(p1,[1 0],1,'post');
    p2 = padarray(p2,[1 0],1,'post');
end

% Normalization
% Transform the image coordinates according to x^_i = Tx_i and x'^_i =
% T'x'_i where T and T' are normalizing transformation conssiting of a
% translation and scaling.
[p1,t1] = normalise2dpts(p1);
[p2,t2] = normalise2dpts(p2);

x2 = p2(1,:);
y2 = p2(2,:);
z2 = p2(3,:);

% Ah = 0
a = [];
for i=1:size(p1,2)
    current = [zeros(1,3)     -z2(i)*p1(:,i)'   y2(i)*p1(:,i)'; ...
            z2(i)*p1(:,i)'   zeros(1,3)     -x2(i)*p1(:,i)'];
    a = [a; current];
end

% Obtain the SVD of A. The unit singular vector corresponding to the
% smallest singular value is the solucion h. A = UDV' with D diagonal with
% positive entries, arranged in descending order down the diagonal, then h
% is the last column of V.
[u,d,v] = svd(a);

H = reshape(v(:,9),3,3)';

% Desnormalization
H = (inv(t2) * H * t1)';
end

