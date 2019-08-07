%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%
%&%                                                   %&%
%&%        ������� ���������� ������� �.�.:359        %&%
%&%                                                   %&%
%&%    �.08 - ������ �������� ������������ �������    %&%
%&%          �������� ��� ����������� ������          %&%
%&%                                                   %&%
%&%           1� ���������������� ������              %&%
%&%                 ����� 1.3                         %&%
%&%                                                   %&%
%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%
%--------------------------------------------------------
function [dctf2d2]=mydct2(f)
% � "mydct2", ����� � ���������� ��������� ����������� ��� "���������
% ��������������� �����������"(DCT), ��� ������ ����������(2D) ������ 
% ���������� f(x,y). � ����������� ��� 2D-DCT ������� �� ����� ��� mydct, 
% ��� ���� ���������� ��� ��� �������� �� ��� ���� ������: 
%
% 1)����������� � ��������� �� ������ ��� ���� ������ ���������.
%
% 2)������������ ��� ������ mxn ��� ���������, ���� ���� �� ������ ���, 
% �� ������ ������� ��� �� ������� ���, ������.
%
% 3)��������������� �� ���� 1 ��� ��� ��� ������, ���� ����� �� ������
% �� ����� �������.
%
% 4)������������ ���� ��� ����������� ������ ���� �� ������� �� ���������.

[m,n]=size(f); % ������������ ����� ��� ��� ���������� ��� ���������� f(x)
dctf2d1=zeros(m,n); % ������������ ������� (�������� ��� Matlab)
dctf2d2=zeros(m,n); % ...
    % ��� ����������� �� ���� 1 ��� �������:
    for k=1:m
        dctf2d1(k,:)=mydct(f(k,:)); % ����������� ��� dct ��� ���� ������
    end
    
% ������� ��� ������������� ��� �������� �������������: 
% (������������ ��� �� �����������)    
%   disp('1� ������ ���������� (���� ��� ���������)');
%   disp(dctf2d1);
%% (���� 2 ��� �������)
    dctf2d1=dctf2d1'; % ��������� ��� ������ 
%%
% ��� ����������� �� ���� 3 ��� �������:
    for k=1:n
        dctf2d2(k,:)=mydct(dctf2d1(k,:)); % ����������� dct ��� "������"
    end
%% (���� 4 ��� �������)
    dctf2d2=dctf2d2'; % ������ ��������� ��� ������ 
%%

% ������� ��� ������������� ��� �������� �������������: 
% (������������ ��� �� �����������) 
%   disp('��� ����, � 2D-DCT ��� f(x,y) ���� ��� 2D-DFT ��� g(x,y), �����:');
end

