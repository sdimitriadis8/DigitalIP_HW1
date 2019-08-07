%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%
%&%                                                   %&%
%&%        ������� ���������� ������� �.�.:359        %&%
%&%                                                   %&%
%&%    �.08 - ������ �������� ������������ �������    %&%
%&%          �������� ��� ����������� ������          %&%
%&%                                                   %&%
%&%           1� ���������������� ������              %&%
%&%                 ��������� ColOrd                  %&%
%&%                                                   %&%
%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%
%--------------------------------------------------------
function [g] = ColOrd(M)
% � 'ColOrd' ����� ��� ���������, ��� (������� �� ������
% ��� ���������� ������ ��� ������������� ��� ��� ��������
% ��� ���������� 'Turn2Dto1D',) �������� ��� ������ 64x1 ���
% ���������� ��� ��� ��� ��������� �� �����.
    [m,n]=size(M);
    t=0;
    l=0;
    for j=1:m
        t=t+1;
        for k=1:n
            g(t,k+32*l)=M(j,k);
        end
        if (mod(j,64)==0)
            t=0;
            l=l+1;
        end
    end
end

