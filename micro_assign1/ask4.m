clear all;
close all;

T = 150:1:10000

K1 = 15000./T + 20;
K2 = 7000./T + 60;
K3 = 47000./T + 4;
K4 = 61000./T + 2;

figure(1);
hold on;
plot(T, K1, color = 'm', "linewidth", 1,8);
plot(T, K2, color = 'r', "linewidth", 1,8);
plot(T, K3, color = 'b', "linewidth", 1,8);
plot(T, K4, color = 'k', "linewidth", 1,8);
hold off;
xlabel("Units")
ylabel("Cost per unit")
legend("Large circuit board", "FPGA", "SoC-1", "SoC-2");

