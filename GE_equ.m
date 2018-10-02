% �������ܣ�ʵ��Ax=b������Ԫ��˹��ȥ����Gauss Elimination��������AΪn�׷���
% ���룺����A��b
% ������õ��Ľ����x
% ʹ�÷�Χ������Ԫ��˹��ȥ�������ȶ���������С�������������̬�����飨n<=30��
% ˳������ʽ��������0���Գ����������ϸ�Խ�ռ�ž���ʱ����ʹ��

function x = GE_equ(A, b)
%%  ����Ԫ��˹��ȥ�����任����
Ab = [A, b];
[~, n] = size(A);
for k = 1: n - 1
     % ����Ԫ���ҵ���k�����ֵ����һ�У����������Խ�����
    [~, w] = max(abs(Ab(k: n, k)));
    Ab([k, w + k - 1], :) = Ab([w + k - 1, k], :);
    
     % �������õ�k�е�ֵ������
    Ab(k + 1: n, k) = Ab(k + 1: n, k) / Ab(k, k);
    Ab(k + 1: n, k + 1: end) = Ab(k + 1: n, k + 1: end) - Ab(k + 1: n, k) * Ab(k, k + 1: end);
end

A = Ab(:, 1: size(A, 2));
b = Ab(:, end - size(b, 2) + 1: end);

%% ������RΪ�����������Ǿ���ʱ����ⷽ����
x_temp = zeros(n, size(b, 2)); % Ԥ��x������
x = zeros(n, size(b, 2));

for k = 1: n
    x_temp(end, :) = b(end, :) ./ A(end, end); % �����n��x
    b = b - A(:, end) * x_temp(end, :); % �Ѽ��������x����뷽�̣��򻯷���
    x(n - k + 1, :) = x_temp(n - k + 1, :);
    x_temp(end, :) = [];
    A(:, end) = [];
    A(end, :) = [];
    b(end, :) = [];
end

end