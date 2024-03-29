%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%
%&%                                                   %&%
%&%        ������� ���������� ������� �.�.:359        %&%
%&%                                                   %&%
%&%    �.08 - ������ �������� ������������ �������    %&%
%&%          �������� ��� ����������� ������          %&%
%&%                                                   %&%
%&%           1� ���������������� ������              %&%
%&%                     ����� 3                       %&%
%&%                                                   %&%
%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%
%--------------------------------------------------------
% ���� 3.1 & 3.2:
% -----------------
% ������� ��� �������, ��� ������� �� 
% ��������������, ��� �� �����
f=imread('cameraman.tif');

% � fun ����� � ��������� ��� ������� �� ������ � blockproc.
fun = @(block_struct) Turn2Dto1D(block_struct.data);
% ��� ������� �� ��������� ��������� ��� Turn2Dto1D,
% ��� �� ������������ ���� 8x8 ����� �� �������� 64x1

% ��� �������� ����������� �� ��������� ���� blockproc ���� ���� 8x8                    
I2 = blockproc(f,[8 8],fun);  % ����, � blockproc, ���� �������������
                              % ��� �������� ���, ���� ���� �� �����.

% �������� �� ��������� ��� ������ 64x1 ��� ��� ������ f,
% ��� �� ���� ����������� �� ��� 8x8 �����������, �� ��� �����
% ��� ���� ��� ��� 32(256/8) �������, �� ������
Si=ColOrd(I2); % ���� �� ���������� s(i), ����� �� ������ ��� ������
               % ��� ����� ���������� 64x1 ��� 1024 �� ������.
%%
% ����� 3.3:
% ----------
% ��� ��� ���������� ��� ����� �����, �(s) ��� s(i) ������:
sumSi=zeros(64,1); % ������������ ��� ������� ������ ���
hs=zeros(64,1);    % �������� ��� Matlab
Si=double(Si); % (��� ������� �� s(i), �� ��� ���� double)
for j=1:64
    for k=1:1024
       sumSi(j)=sumSi(j)+Si(j,k); % ������� �� ���� ������, ��� 
                                  % �������� ������������� ��� s(i)
    end
    hs(j)=1/1024*sumSi(j); % ������ ���� �������� �� 1024
end
%%
% ����� 3.3:
% ----------
% ��� ��� ���������� ��� ������ �������������� [C], ������:
diffs=zeros(64,1024); % ������������ ��� ������ ��������
for j=1:64
        for k=1:1024
            diffs(j,k)=Si(j,k)-hs(j); % ��������� ��� �������� ��� S(i)
                                      % ��� ��� ����������� ����� �����
        end
end
% ���� � ������� ��������������, [C], ����� � ��������:
C=1/1024*(diffs*diffs'); 
%%
% ����� 3.4:
% ----------
% ������������ �� �������������� ��� ��� ��������� ���
% ������ ��������������, ����� ������� V ��� D ����������
[V,D] = eig(C);
% ����� ���������� ��� ������������ �����������,
% ������������ �� �������������� ��� [C],
% ��� ����� �� ������ ��� V �� ����:
% ��������� �� ����� ���� �����������-������...
for j=1:64
    n(j)=norm(V(:,j)); 
end
% ... ��� ������ ���� ����� �� ��� �������� ��������
for j=1:64
    Phi(:,j)=1/n(j)*V(:,j); % (�������������� ���������������)
end
% ����� ����� ��� � ���������� ������� [�], ��� ����������� KLT
%%
% ����� 3.5:
% ----------
% ��� ��� ���������� ��� KLT ���� ����������� s(i), ������:
Ti=Phi'*Si; % ������, ���� ������ ��� �� ������ t=[V]s � t=[�]'s
            % ���� s=[U]t ��� [U]=[V]'=[�].
%%
% ����� 3.6:
% ----------
% ����, ��� ��� ������ ��� t(i), ���������� ����
% 20 ����-�������-����-������������ �����������
% ��� ����������� ���� ����������
for j=1:1024
    Ti20Max(:,j)=howmax(Ti(:,j),20);
end
%%
% ����� 3.7:
% ----------
% ������������ ��� ���������� KLT ��� �������� �����������
% ��� ������ �� ��� ���������� ~s(i)
SiNew20=Phi*Ti20Max;

% ����, ������������ �� 64x1 ����������-������ �� 8x8 �����,
% ���� ���� ���� ���� (�������� � ��������� Turn1Dto2D ��
% ���� �������� 64x1, ��� ����� ��� �����)
h=0;
t=0;
NewImg20=zeros(256);
for j=1:1024
  Block8x8=Turn1Dto2D(SiNew20(:,j)); % ��������� ���������� ���
                                   % ���� ����������� ��� ����� ���
                                   % ����������� 8x8 �����, ��� ��
                                   % ���������� ��������� �������
  % ����������� ��������� �� ������ ���� ���� 
  % ���� ������ ������
  for k=1:8
      for l=1:8
          NewImg20(k+h,l+t)=Block8x8(k,l); % ������� ��� 8x8 ����� 
                                           % ��� ��� ������
      end
  end
  if t+8==256 % ���� ���� ��� ������������� ��� ������� 256 ������
      h=h+8;  % ������������� 8 ������� ���� ��� ����������� 
      t=0;    % ��� ������� ��� ������ ��� �� ����������� � ����������
  else
      t=t+8;  % �� ��������� ��� ��� ���� ����������� � �������
              % ������������� 8 ������ �����
  end
end

figure('Name','IKLT 20')     % �������� ��� ������� ������ ���
imshow(NewImg20);            % ��� ����������� 
NewImg20=uint8(NewImg20);
figure('Name','IKLT(UINT8) 20')     % �������� ��� ������� �� ����� uint8
imshow(NewImg20); 
psnr20KLT = psnr(NewImg20,f) % ����������� ��� PSNR 

%%
% ����� 3.8:
% ----------
% �����, ��� ��� ������ ��� t(i), ���������� ����
% 10 ����-�������-����-������������ �����������
% ��� ����������� ���� ����������
for j=1:1024
    Ti10Max(:,j)=howmax(Ti(:,j),10);
end

% ������������ ��� ���������� KLT ��� �������� �����������
% ��� ������
SiNew10=Phi*Ti10Max;

% ����, ������������ �� 64x1 ����������-������ �� 8x8 �����,
% ���� ���� ���� ����, ���� ������ ��� ����
% (�� ������ ���� ����������� ������� ������������� ���)
h=0;
t=0;
NewImg10=zeros(256);
for j=1:1024
  Block8x8=Turn1Dto2D(SiNew10(:,j));
  for k=1:8
      for l=1:8
          NewImg10(k+h,l+t)=Block8x8(k,l);
      end
  end
  if t+8==256
      h=h+8;
      t=0;
  else
      t=t+8;
  end
end

figure('Name','IKLT 10')     % �������� ��� ������� ���� ���
imshow(NewImg10);            % ��� ����������� 
NewImg10=uint8(NewImg10);
figure('Name','IKLT(UINT8) 10')% �������� ��� ������� �� ����� uint8
imshow(NewImg10); 
psnr10KLT = psnr(NewImg10,f) % ����������� ��� PSNR

