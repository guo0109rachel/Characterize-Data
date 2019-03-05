%Input the data first
datamax=max(data);
newdata=data./datamax*100;
acquire=[data(:,1),newdata(:,2),data(:,3),newdata(:,4)];%,data(:,5),newdata(:,6)];%,data(:,7),newdata(:,8)];