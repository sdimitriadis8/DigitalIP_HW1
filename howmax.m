%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%
%&%                                                   %&%
%&%        ������� ���������� ������� �.�.:359        %&%
%&%                                                   %&%
%&%    �.08 - ������ �������� ������������ �������    %&%
%&%          �������� ��� ����������� ������          %&%
%&%                                                   %&%
%&%           1� ���������������� ������              %&%
%&%                 ��������� howmax                  %&%
%&%                                                   %&%
%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%
%--------------------------------------------------------
function [g] = howmax(M,q)
% � 'howmax' ����� ��� ���������, ��� ������� �� ������
% ���� ����������� ������ ��� ������� ��� q-����-�������-
% -����-����������� ����� ��� ��� ��������� ��� ���������.

[m,n]=size(M);
count=0;
j=0;
k=0;
Z=abs(M);
while j<=m
    while k<=n
        [min_val,idx]=min(Z(:)); % ������� �� ���� ��� ��������� ���������
        [row,col]=ind2sub(size(M),idx); % ��� ����������� �� ��������
        Z(row,col)=Inf;                 % �� +�� (+Infinity)
        count=count+1;
        if(count==(8*8-q))
            j=m;
            k=n;
        end
        k=k+1;
    end
    k=1;
    j=j+1;
end
for j=1:m
    for k=1:n
        if(Z(j,k)==Inf); % ������� ��� ����� ��� ���� +��
            M(j,k)=0;    % ��� ��� ���������, ���� �������
    end
end
g=M;
end

