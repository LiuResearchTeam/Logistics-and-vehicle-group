clear all
C=[2 15 13 4;10 4 14 15;9 14 16 13;7 8 11 9];
[Matching,Cost]=Hungarian (C);
disp('���Ž����Ϊ:');%���ָ�ɷ���������ֵ
Matching
disp('���Ž�Ϊ:');
Cost
