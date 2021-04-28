clear all;
close all;
clc;

C = [0    27    27     0     0     0     0     0     0
    0     0     0     5    12    10     0     0     0
    0     0     0     0    15     0     0    12     0
    0     0     0     0     0     8     6     0     0
    0     0     0     3     0     0     6    10     0
    0     0     0     0     0     0     0     0    18
    0     0     0     0     0     0     0     0    12
    0     0     0     0     0     0     0     0    22
    0     0     0     0     0     0     0     0     0];

[f, maxflow] = Maxflow(C);

%f �������䷽��
%��C������֪����1Ϊs�㣬9Ϊt��
%maxflow �������
function [f, maxflow] = Maxflow(C)
[row,column] = size(C);
s = 1;
t = column;
f = zeros(row);%f����Ϊ����������󣬳�ʼ��Ϊ0����
maxflow = 0;
%����BFS�������б�����ʹ��queue
while 1
    vis = [];%��ʾ�Ѿ����ʹ��Ľڵ�
    vis = [vis s];
    queue_head = s; %��ͷ
    queue_tail = s; %��β
    queue = zeros( 1, row);  %���е�����Žڵ��������Ƚ��ȳ�ԭ��
    queue( queue_head) = s;
    queue_head = queue_head + 1;
    per = zeros( 1, row);%��ʾÿ���ڵ��ǰ���ڵ�
    per( s) = s;
    while queue_tail ~= queue_head
        pos = queue( queue_tail);
        for nxt = 1:row
            if C( pos, nxt)-f( pos, nxt)>0 && isempty( find(vis == nxt,1))
                queue( queue_head) = nxt;
                queue_head = queue_head + 1;
                vis = [vis nxt];
                per(nxt) = pos;
            end
        end
        queue_tail = queue_tail + 1;
    end
    
    if per(t) == 0      %�޷������㣬�㷨����
        break;
    end
    
    %�ӻ���������ص�Դ��
    path = [];%��¼·��  Ѱ������· 
    pos_tmp = row;
    e_cnt = 0;%�����ı���
    while pos_tmp ~= s  % ���ݸ��� ���� ���߿����ӵ�����
        if C(per(pos_tmp),pos_tmp)-f(per(pos_tmp),pos_tmp)>0
            e_val = C(per(pos_tmp),pos_tmp)-f(per(pos_tmp),pos_tmp);
            path = [path;per(pos_tmp) pos_tmp e_val 1];%��ʾ�����
            pos_tmp = per( pos_tmp);
        end
        if C(pos_tmp,per(pos_tmp)) > 0 && f(pos_tmp,per(pos_tmp))>0
            e_val = f(pos_tmp,per(pos_tmp));
            path = [path;per(pos_tmp) pos_tmp e_val -1];%��ʾ�����
            pos_tmp = per( pos_tmp);
        end
        
        e_cnt = e_cnt + 1;
    end
    
    min_val = min(path(:,3));
    maxflow = maxflow + min_val;
    for pos = 1:e_cnt
        if path(pos,4) == 1
            f( path(pos,1),path(pos,2)) = f( path(pos,1),path(pos,2)) + min_val;
        else
            f( path(pos,1),path(pos,2)) = f( path(pos,1),path(pos,2)) - min_val;
        end
    end
end

end
