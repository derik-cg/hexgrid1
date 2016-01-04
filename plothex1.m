function plothex1(pos)
%% plot a matrix of hex type 1 for a single individual
%transform all even cols substracting one half
for i=1:length(pos)%go row by row until the end
    if mod(pos(i,1),2)%find if column is even or odd
    else
        pos(i,2)=pos(i,2)-0.5; %substract one half
    end
end
%pos
plot(pos(:,1),pos(:,2))
end