clear all
C=[2 15 13 4;10 4 14 15;9 14 16 13;7 8 11 9];
[Matching,Cost]=Hungarian (C);
disp('最优解矩阵为:');%输出指派方案和最优值
Matching
disp('最优解为:');
Cost
