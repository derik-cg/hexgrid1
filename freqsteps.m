%given a center, simulate overlapping steps and compute the frequency of
%each next step
%ic=zeros(3,3);%initial condition for the first loop
freq=[2,2,0;%center
     2,3,0;%up
     3,2,0;%right
     3,1,0;%down right
     2,1,0;%down
     1,1,0;%down left
     1,2,0];%left
% for i=2:1000
%     tmp=rwhex1([2,2],space);
%     ic(tmp(1),tmp(2))=ic(tmp(1),tmp(2))+1;
% end
    tmp=pos(i+1,:);
    if tmp==[2,3] %up
        freq(2,3)=freq(2,3)+1;
    elseif tmp==[3,2];%right
        freq(3,3)=freq(3,3)+1;
    elseif tmp==[3,1] % down right
        freq(4,3)=freq(4,3)+1;
    elseif tmp==[2,1] % down
        freq(5,3)=freq(5,3)+1;
    elseif tmp==[1,1] %down left
        freq(6,3)=freq(6,3)+1;
    elseif tmp==[1,2] %left
        freq(7,3)=freq(7,3)+1;
    end

%plothex1(ic) %for the first loop
% stem3(freq(:,1),freq(:,2),freq(:,3))