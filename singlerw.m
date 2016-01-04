%% individual random walk on a hex grid
%this script produces a random walk of a single particle on a hex grid. The
%grid is type 1, that is, a square grid with even cols shifted.

%% parameter setup
space=[100,101]; %define space size. Columns must be odd
pos=[50,50]; %define initial position
niter=1000; %number of iterations
global freq
freq=[2,2,0;%center
     2,3,0;%up
     3,2,0;%right
     3,1,0;%down right
     2,1,0;%down
     1,1,0;%down left
     1,2,0];%left
%% do the walk
%use a for loop for adding a step at a time
for i=1:niter
    pos(i+1,:)=rwhex1(pos(i,:),space); % one step
end

%% plot the positions
 plothex1(pos)