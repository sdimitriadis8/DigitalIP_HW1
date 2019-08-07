%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%
%&%                                                   %&%
%&%        ������� ���������� ������� �.�.:359        %&%
%&%                                                   %&%
%&%    �.08 - ������ �������� ������������ �������    %&%
%&%          �������� ��� ����������� ������          %&%
%&%                                                   %&%
%&%           1� ���������������� ������              %&%
%&%                    ����� 2                        %&%
%&%                                                   %&%
%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%
%--------------------------------------------------------
% � ���������� 'valcam', �������� ��� ������ ��� ��������
% ��� ��� �� ����� ��� ��� ������������� ��� ����� ���
% 8x8. �� ����������� ��� ����������������� ����� � ��������
% ��� ����������� DCT, � ��������� ��� 20 ��� 10
% ����-�������-����-����������� ����������� ���� �����
% ��� � ����������� 2D-DCT �����.
%%
% �������������, �������� �� ����:

% ����� 2.1:
% ----------
% ������� ��� �������, ��� ������� ��
% ��������������, ��� �� �����
f=imread('cameraman.tif');
figure('Name','Cameraman');     % �������� ��� ������� �������
imshow(f);  % ��� �������� ������ ��� ����������
%%
% ����� 2.2:
% ----------
% ����������� ������ ��� ������� ��� �������
% ���������� ��� Matlab :

% http://www.mathworks.com/help/images/...
% ...ref/blockproc.html#output_argument_d119e6718

% ��� ��� ����� ������ ��� �� ���� �������,
% ������������� � ������� ��� ��������
% ��� ������� �� ����:
fun1 = @(block_struct) mydct2(block_struct.data);
% � fun1 ����� � ��������� ��� ������� �� ������ � blockproc, ����� ���
% �������� ��� ���������� ��������.��� �������� �� ��������� ���������,
% ��� mydct2.

% ��� �������� ����������� �� ��������� ���� blockproc ���� ���� 8x8              
I2 = blockproc(f,[8 8],fun1); % ����, � blockproc, ���� �������������
                              % ��� �������� ���, ���� ���� �� �����.

figure('Name','mydct2');      % �������� ��� �������������
imshow(I2);                   % ��� I2 �� ��� DCT ��� �����
%%
% ����� 2.3:
% ----------
% ������ ������� �� ��� ��������� howmax(.,q) ��� ������� ����
% q-"���������������" ����������� DCT (��� 20) ��� ��� �����������
% ���� ���� ����� 8x8 �� ����:
fun2 = @(block_struct) howmax(block_struct.data,20);
I3 = blockproc(I2,[8 8],fun2);

figure('Name','DCT 20');  % �������� ��� �������������
imshow(I3);               % ��� blockproc �� ������ �� ����
                          % 20 ����-�������-����-������������
                          % �����������
%%
% ����� 2.4:
% ----------
% ��������, ����������� ��� ���������� 2D-DCT ����
% ����� 8x8, ��������������� �� ��������� idct2, �� ����:
fun3 = @(block_struct) idct2(block_struct.data);
I4 = blockproc(I3,[8 8],fun3);

figure('Name','IDCT 20');     % �������� ��� ����������� �������������
imshow(I4);                   % ��� ��� IDCT, �� ������ ���� ��
                              % ������������ �� uint8 �����

I4=uint8(I4); % ��������� �� uint8 �����
figure('Name','IDCT(UINT8) 20'); % �������� ��� ����������� �������������
imshow(I4);                    % ��� ��� IDCT, �� ������ �� ���� uint8

% �� PSNR ��� ���������� �� ���� 20 �����: 
psnr20DCT = psnr(I4,f)

%%
% ����� 2.5:
% ----------
% ��������� ��� ����������:
% ������� �� ���� ��������� ���� 10
% ��������������� ����������� DCT
% ��� ������:
fun4 = @(block_struct) howmax(block_struct.data,10);
I5 = blockproc(I2,[8 8],fun4);

figure('Name','DCT 10');     % �������� ��� �������������
imshow(I5);                  % ��� blockproc �� ������ �� ����
                             % 10 ����-�������-����-������������
                             % �����������
% ��� ����������, ����������� ��� ���������� 2D-DCT ����
% ����� 8x8, ��������������� �� ��������� idct2, ���� ����
I6 = blockproc(I5,[8 8],fun3);

figure('Name','IDCT 10');     % ��� �������� ��� �������������
imshow(I6);                   % ��� IDCT �� ������ ���� ��
                              % ������������ �� uint8 �����

I6=uint8(I6); % ��������� �� uint8 �����
figure('Name','IDCT(UINT8) 10'); % ��� �������� ��� �������������
imshow(I6);                    % ��� IDCT �� ������ ����� uint8

% �� PSNR ��� ���������� �� ���� 10 �����: 
psnr10DCT = psnr(I6,f)