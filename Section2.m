%% Blocking

clc
clear
wh = [0;0];
wh1(1,:,:)=wh;
sig = .6*eye(2);
sig1(1,:,:)=sig;
tau=.2;
C = [1 0];
for i=1:20
    G = sig*C'*((C*sig*C' + tau)^-1);
    sig = sig - G*C*sig;
    wh = wh + G*(1-C*wh);
    wh1(i+1,:,:)=wh;
    sig1(i+1,:,:)=sig;
    G1(i,:,:) = G;
end
C = [1 1];
for i=21:40
    G = sig*C'*((C*sig*C' + tau)^-1);
    sig = sig - G*C*sig;
    wh = wh + G*(1-C*wh);
    wh1(i+1,:,:)=wh;
    sig1(i+1,:,:)=sig;
    G1(i,:,:) = G;
end
figure('WindowState','maximized')
subplot(2,1,1)
plot(wh1(:,1))
hold on
plot(wh1(:,2),'k--')
hold on
xline(21,'g--')
legend('$$\hat{w}$$$$_{1}$$$${(t)}$$','$$\hat{w}$$$$_{2}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 40])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\hat{w}$$','Interpreter','latex')
title('Blocking','Interpreter','latex')
subplot(2,1,2)
plot(sig1(:,1,1))
hold on
plot(sig1(:,2,2),'k--')
hold on
xline(21,'g--')
legend('$$\sigma$$$$_{1}$$$${(t)}$$','$$\sigma$$$$_{2}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 40])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\sigma$$','Interpreter','latex')
saveas(gcf,'Fig8.png')


%% Unblocking

clc
clear
w=[1;0];
wh = [0;0];
wh1(1,:,:)=wh;
sig = .6*eye(2);
sig1(1,:,:)=sig;
tau=.2;
C = [1 0];
for i=1:20
    G = sig*C'*((C*sig*C' + tau)^-1);
    sig = sig - G*C*sig;
    wh = wh + G*(1-C*wh);
    wh1(i+1,:,:)=wh;
    sig1(i+1,:,:)=sig;
    G1(i,:,:) = G;
end
C = [1 1];
for i=21:40
    G = sig*C'*((C*sig*C' + tau)^-1);
    sig = sig - G*C*sig;
    wh = wh + G*(2-C*wh);
    wh1(i+1,:,:)=wh;
    sig1(i+1,:,:)=sig;
    G1(i,:,:) = G;
end

figure('WindowState','maximized')
subplot(2,1,1)
plot(wh1(:,1))
hold on
plot(wh1(:,2),'k--')
hold on
xline(21,'g--')
legend('$$\hat{w}$$$$_{1}$$$${(t)}$$','$$\hat{w}$$$$_{2}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 40])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\hat{w}$$','Interpreter','latex')
title('Unblocking','Interpreter','latex')
subplot(2,1,2)
plot(sig1(:,1,1))
hold on
plot(sig1(:,2,2),'k--')
hold on
xline(21,'g--')
legend('$$\sigma$$$$_{1}$$$${(t)}$$','$$\sigma$$$$_{2}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 40])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\sigma$$','Interpreter','latex')
saveas(gcf,'Fig9.png')

%% Backward Blocking

clc
clear
wh = [0;0];
wh1(1,:,:)=wh;
sig = .6*eye(2);
sig1(1,:,:)=sig;
tau=.1;
C = [1 1];
for i=1:40
    G = sig*C'*((C*sig*C' + tau)^-1);
    sig = sig - G*C*sig;
    wh = wh + G*(1-C*wh);
    wh1(i+1,:,:)=wh;
    sig1(i+1,:,:)=sig;
    G1(i,:,:) = G;
end
C = [1 0];
for i=41:100
    G = sig*C'*((C*sig*C' + tau)^-1);
    sig = sig - G*C*sig;
    wh = wh + G*(1-C*wh);
    wh1(i+1,:,:)=wh;
    sig1(i+1,:,:)=sig;
    G1(i,:,:) = G;
end

figure('WindowState','maximized')
subplot(2,1,1)
plot(wh1(:,1))
hold on
plot(wh1(:,2),'k--')
hold on
xline(41,'g--')
legend('$$\hat{w}$$$$_{1}$$$${(t)}$$','$$\hat{w}$$$$_{2}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 80])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\hat{w}$$','Interpreter','latex')
title('Backward Blocking','Interpreter','latex')
subplot(2,1,2)
plot(sig1(:,1,1))
hold on
plot(sig1(:,2,2),'k--')
hold on
xline(41,'g--')
legend('$$\sigma$$$$_{1}$$$${(t)}$$','$$\sigma$$$$_{2}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 80])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\sigma$$','Interpreter','latex')
saveas(gcf,'Fig10.png')

figure('WindowState','maximized')

wh3(:)=wh1(1,:);
sig3(:,:)=sig1(1,:,:);
data=mvnrnd(wh3,sig3,10000);
hist3(data,'Nbins',[1 1]*100,'CdataMode','auto')
xlabel('$$\hat{w}$$$$_1$$','Interpreter','latex')
ylabel('$$\hat{w}$$$$_2$$','Interpreter','latex')
title('t = 1','Interpreter','latex')
colorbar
view(2)
saveas(gcf,'Fig11.png')
figure('WindowState','maximized')
wh3(:)=wh1(19,:);
sig3(:,:)=sig1(19,:,:);
data=mvnrnd(wh3,sig3,10000);
hist3(data,'Nbins',[1 1]*100,'CdataMode','auto')
xlabel('$$\hat{w}$$$$_1$$','Interpreter','latex')
ylabel('$$\hat{w}$$$$_2$$','Interpreter','latex')
title('t = 19','Interpreter','latex')
colorbar
view(2)
saveas(gcf,'Fig12.png')


figure('WindowState','maximized')
wh3(:)=wh1(100,:);
sig3(:,:)=sig1(80,:,:);
data=mvnrnd(wh3,sig3,10000);
hist3(data,'Nbins',[1 1]*100,'CdataMode','auto')
xlabel('$$\hat{w}$$$$_1$$','Interpreter','latex')
ylabel('$$\hat{w}$$$$_2$$','Interpreter','latex')
title('t = 80','Interpreter','latex')
colorbar
view(2)
saveas(gcf,'Fig13.png')
%%
for i = 1:100
    wh3(:)=wh1(i,:);
    sig3(:,:)=sig1(i,:,:);
    data=mvnrnd(wh3,sig3,10000);
    hist3(data,'Nbins',[1 1]*100,'CdataMode','auto')
    xlabel('$$\hat{w}$$$$_1$$','Interpreter','latex')
    ylabel('$$\hat{w}$$$$_2$$','Interpreter','latex')
    title(['t = $',num2str(i),'$'],'Interpreter','latex')
    xlim([-1,2])
    ylim([-1,2])
    colorbar
    view(2)
    pause(.1)
end

%% adding Process Noise To Blocking
clc
clear
wh = [0;0];
wh1(1,:,:)=wh;
sig = .6*eye(2);
sig1(1,:,:)=sig;
tau=.2;
C = [1 0];
for i=1:20
    G = (sig+.01)*C'*((C*(sig+.01)*C' + tau)^-1);
    sig = (sig+.01) - G*C*(sig+.01);
    wh = wh + G*(1-C*wh);
    wh1(i+1,:,:)=wh;
    sig1(i+1,:,:)=sig;
    G1(i,:,:) = G;
end
C = [1 1];
for i=21:40
    G = (sig+.01)*C'*((C*(sig+.01)*C' + tau)^-1);
    sig = (sig+.01) - G*C*(sig+.01);
    wh = wh + G*(1-C*wh);
    wh1(i+1,:,:)=wh;
    sig1(i+1,:,:)=sig;
    G1(i,:,:) = G;
end
figure('WindowState','maximized')
subplot(2,1,1)
plot(wh1(:,1))
hold on
plot(wh1(:,2),'k--')
hold on
xline(21,'g--')
legend('$$\hat{w}$$$$_{1}$$$${(t)}$$','$$\hat{w}$$$$_{2}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 40])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\hat{w}$$','Interpreter','latex')
title('Blocking','Interpreter','latex')
subplot(2,1,2)
plot(sig1(:,1,1))
hold on
plot(sig1(:,2,2),'k--')
hold on
xline(21,'g--')
legend('$$\sigma$$$$_{1}$$$${(t)}$$','$$\sigma$$$$_{2}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 40])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\sigma$$','Interpreter','latex')
saveas(gcf,'Fig14.png')

%% adding Process Noise To Unblocking

clc
clear
w=[1;0];
wh = [0;0];
wh1(1,:,:)=wh;
sig = .6*eye(2);
sig1(1,:,:)=sig;
tau=.2;
C = [1 0];
for i=1:20
    G = (sig+.01)*C'*((C*(sig+.01)*C' + tau)^-1);
    sig = (sig+.01) - G*C*(sig+.01);
    wh = wh + G*(1-C*wh);
    wh1(i+1,:,:)=wh;
    sig1(i+1,:,:)=sig;
    G1(i,:,:) = G;
end
C = [1 1];
for i=21:40
    G = (sig+.01)*C'*((C*(sig+.01)*C' + tau)^-1);
    sig = (sig+.01) - G*C*(sig+.01);
    wh = wh + G*(2-C*wh);
    wh1(i+1,:,:)=wh;
    sig1(i+1,:,:)=sig;
    G1(i,:,:) = G;
end

figure('WindowState','maximized')
subplot(2,1,1)
plot(wh1(:,1))
hold on
plot(wh1(:,2),'k--')
hold on
xline(21,'g--')
legend('$$\hat{w}$$$$_{1}$$$${(t)}$$','$$\hat{w}$$$$_{2}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 40])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\hat{w}$$','Interpreter','latex')
title('Unblocking','Interpreter','latex')
subplot(2,1,2)
plot(sig1(:,1,1))
hold on
plot(sig1(:,2,2),'k--')
hold on
xline(21,'g--')
legend('$$\sigma$$$$_{1}$$$${(t)}$$','$$\sigma$$$$_{2}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 40])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\sigma$$','Interpreter','latex')
saveas(gcf,'Fig15.png')

%% Changing Measurement Noise Blocking

clc
clear
wh = [0;0];
wh1(1,:,:)=wh;
sig = .6*eye(2);
sig1(1,:,:)=sig;
tau=.02;
C = [1 0];
for i=1:20
    G = sig*C'*((C*sig*C' + tau)^-1);
    sig = sig - G*C*sig;
    wh = wh + G*(1-C*wh);
    wh1(i+1,:,:)=wh;
    sig1(i+1,:,:)=sig;
    G1(i,:,:) = G;
end
C = [1 1];
for i=21:40
    G = sig*C'*((C*sig*C' + tau)^-1);
    sig = sig - G*C*sig;
    wh = wh + G*(1-C*wh);
    wh1(i+1,:,:)=wh;
    sig1(i+1,:,:)=sig;
    G1(i,:,:) = G;
end

figure('WindowState','maximized')
subplot(2,1,1)
plot(wh1(:,1))
hold on
plot(wh1(:,2),'k--')
hold on
xline(21,'g--')
legend('$$\hat{w}$$$$_{1}$$$${(t)}$$','$$\hat{w}$$$$_{2}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 40])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\hat{w}$$','Interpreter','latex')
title('Blocking','Interpreter','latex')
subplot(2,1,2)
plot(sig1(:,1,1))
hold on
plot(sig1(:,2,2),'k--')
hold on
xline(21,'g--')
legend('$$\sigma$$$$_{1}$$$${(t)}$$','$$\sigma$$$$_{2}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 40])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\sigma$$','Interpreter','latex')
saveas(gcf,'Fig16.png')
%% Unblocking

clc
clear
w=[1;0];
wh = [0;0];
wh1(1,:,:)=wh;
sig = .6*eye(2);
sig1(1,:,:)=sig;
tau=.02;
C = [1 0];
for i=1:20
    G = sig*C'*((C*sig*C' + tau)^-1);
    sig = sig - G*C*sig;
    wh = wh + G*(1-C*wh);
    wh1(i+1,:,:)=wh;
    sig1(i+1,:,:)=sig;
    G1(i,:,:) = G;
end
C = [1 1];
for i=21:40
    G = sig*C'*((C*sig*C' + tau)^-1);
    sig = sig - G*C*sig;
    wh = wh + G*(2-C*wh);
    wh1(i+1,:,:)=wh;
    sig1(i+1,:,:)=sig;
    G1(i,:,:) = G;
end

figure('WindowState','maximized')
subplot(2,1,1)
plot(wh1(:,1))
hold on
plot(wh1(:,2),'k--')
hold on
xline(21,'g--')
legend('$$\hat{w}$$$$_{1}$$$${(t)}$$','$$\hat{w}$$$$_{2}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 40])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\hat{w}$$','Interpreter','latex')
title('Unblocking','Interpreter','latex')
subplot(2,1,2)
plot(sig1(:,1,1))
hold on
plot(sig1(:,2,2),'k--')
hold on
xline(21,'g--')
legend('$$\sigma$$$$_{1}$$$${(t)}$$','$$\sigma$$$$_{2}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 40])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\sigma$$','Interpreter','latex')
saveas(gcf,'Fig17.png')

%% S1->-r


clc
clear
w=1;
wh = 0;
wh1(1)=wh;
sig = .6;
sig1(1)=sig;
tau=.2;
C = 1;
for i=1:20
    G = sig*C'*((C*sig*C' + tau)^-1);
    sig = sig - G*C*sig;
    wh = wh + G*(1-C*wh);
    wh1(i+1)=wh;
    sig1(i+1)=sig;
    G1(i) = G;
end
C = 1;
for i=21:400
    G = sig*C'*((C*sig*C' + tau)^-1);
    sig = sig - G*C*sig;
    wh = wh + G*(-1-C*wh);
    wh1(i+1)=wh;
    sig1(i+1)=sig;
    G1(i) = G;
end

figure('WindowState','maximized')
subplot(2,1,1)
plot(wh1)
hold on

xline(21,'g--')
legend('$$\hat{w}$$$$_{1}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlim([1 400])
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\hat{w}$$','Interpreter','latex')
subplot(2,1,2)
plot(sig1)
hold on
xline(21,'g--')
xlim([1 400])
legend('$$\sigma$$$$_{1}$$$${(t)}$$','Interpreter','latex')
grid on
grid minor
xlabel('Trial Number','Interpreter','latex')
ylabel('$$\sigma$$','Interpreter','latex')
saveas(gcf,'Fig18.png')

%% Betha
clc
clear
i=0;
p1=randperm(99,4);
C1=zeros(100,1);
C1(p1)=1;
for gam = 0.1:.1:15
    i=i+1;
    
    for j=1:1000
        phi = normrnd(0,7,[1 100]);
        w = 0;
        wh = 0;
        tau=.2;
        sig=1.5;
        w1(i,j,1)=w;
        for q = 1:100
            w = w + C1(q)*phi(q);
            r=w+normrnd(0,.2);
            C=1;
            G = sig*C'*((C*sig*C' + tau)^-1);
            sig = sig - G*C*sig;
            wh = wh + G*(w-C*wh);
            betha=((r-wh)^2)/(sig+tau);
            if betha>=gam
                sig=15;
                G = sig*C'*((C*sig*C' + tau)^-1);
%                 sig = sig - G*C*sig;
                wh = wh + G*(r-C*wh);
            end
            sig1(i,j,q)=sig;
            wh1(i,j,q)=wh;
            w1(i,j,q)=w;
            r1(i,j,q)=r;
            betha1(i,j,q)=betha;
        end
        wh2(:)=wh1(i,j,:);
        w2(:)=w1(i,j,:);
        MSE1(i,j)=.05*(sum((w2-wh2).^2,'all'));
    end
end

MSE2=mean(MSE1');
err1=std(MSE1')./sqrt(1000);
%%
figure('WindowState','maximized')
xd=0.1:.1:15;
errorbar(xd',MSE2,err1)
grid on
grid minor
xlabel('$\gamma$','Interpreter','latex')
ylabel('MSE','Interpreter','latex')
[mi,I1]=min(MSE2);
title(['The Optimum $\gamma$ = ',num2str(xd(I1))],'Interpreter','latex')
k1=randperm(1000,1);
wh3(:)=wh1(I1,k1,:);
w3(:)=w1(I1,k1,:);
r3(:)=r1(I1,k1,:);
saveas(gcf,'Fig19.png')
figure('WindowState','maximized')
subplot(2,1,1)
plot(w3,'kx')
hold on
plot(r3,'rs','MarkerSize',2)
legend('$${w}$$','$${r}$$','Interpreter','latex')
xlabel('Trial Number','Interpreter','latex')
grid on
grid minor
subplot(2,1,2)
plot(wh3,'kx')
legend('$$\hat{w}$$','Interpreter','latex')
xlabel('Trial Number','Interpreter','latex')
grid on
grid minor
saveas(gcf,'Fig20.png')

figure('WindowState','maximized')
sig3(:)=sig1(I1,k1,:);
beth3(:)=betha1(I1,k1,:);
plot(sig3,'k--','LineWidth',1.5)
hold on
plot(beth3,'r')
hold on
yline(xd(I1),'g--','LineWidth',.5)
ylim([0 5])
xlabel('Trial Number','Interpreter','latex')
legend('$\sigma$ (ACh)','$\beta$ (NE)','$\gamma$','Interpreter','latex')
grid on
grid minor

saveas(gcf,'Fig21.png')