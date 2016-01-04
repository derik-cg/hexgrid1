function newpos=rwhex1(pos,space)
%% random walk on a hex grid type 1
%the hex grid type 1 is the square grid where even columns are shifted down
%by one half
% to decide which direction, use an uniform random number
global freq
flip=rand; %get the uniform random number
if pos(1)==0 & (pos(2)>0 & pos(2)<space(2))                 %left border
    %in the left border there are four choices of movement
    if flip<1/4
        % display('up')
        %freq(2,3)=freq(2,3)+1; %accumulates the frequency
        newpos(1)=pos(1);
        newpos(2)=pos(2)+1;
    elseif flip>=1/4 & flip<2/4
        %display('up and right')
        %freq(3,3)=freq(3,3)+1; %accumulates the frequency
        newpos(1)=pos(1)+1;
        newpos(2)=pos(2)+1;
    elseif flip>=2/4 & flip<3/4
        %display('right')
        %freq(4,3)=freq(4,3)+1; %accumulates the frequency
        newpos(1)=pos(1)+1;
        newpos(2)=pos(2);
    elseif flip>=3/4
        %display('down')
        %freq(5,3)=freq(5,3)+1; %accumulates the frequency
        newpos(1)=pos(1);
        newpos(2)=pos(2)-1;
    else
        error('flip outside')
    end
elseif (pos(1)>0 & pos(1)<space(1)) & pos(2)==space(2)          %top border
    %the movement depends on the column
    if mod(pos(1),2) %column is odd
        %only three options or movement are possible
        if flip<1/3
            %display('right')
            newpos(1)=pos(1)+1;
            newpos(2)=pos(2);
        elseif flip>=1/3 & flip<2/3
            %display('down')
            newpos(1)=pos(1);
            newpos(2)=pos(2)-1;
        elseif flip>2/3
            %display('left')
            newpos(1)=pos(1)-1;
            newpos(2)=pos(2);
        else
            error('flip outside')
        end
    else %column is even
        %five options for movement are possible
        if flip<1/5
            %display('right')
            newpos(1)=pos(1)+1;
            newpos(2)=pos(2);
        elseif flip>=1/5 & flip<2/5
            %display('right and down')
            newpos(1)=pos(1)+1;
            newpos(2)=pos(2)-1;
        elseif flip>=2/5 & flip<3/5
            %display('down')
            newpos(1)=pos(1);
            newpos(2)=pos(2)-1;
        elseif flip>=3/5 & flip<4/5
            %display('down and left')
            newpos(1)=pos(1)-1;
            newpos(2)=pos(2)-1;
        elseif flip>4/5
            %display('left')
            newpos(1)=pos(1)-1;
            newpos(2)=pos(2);
        else
            error('flip outside')
        end
    end
elseif pos(1)==space(1) & (pos(2)>0 & pos(2)<space(2))      %  right border
    %four options of movement are possible
    if flip<1/4
        %display('down')
        newpos(1)=pos(1);
        newpos(2)=pos(2)-1;
    elseif flip>=1/4 & flip<2/4
        %display('left')
        newpos(1)=pos(1)-1;
        newpos(2)=pos(2);
    elseif flip>=2/4 & flip<3/4
        %display('left and up')
        newpos(1)=pos(1)-1;
        newpos(2)=pos(2)+1;
    elseif flip>3/4
        %display('up')
        newpos(1)=pos(1);
        newpos(2)=pos(2)+1;
    else
        error('flip outside')
    end
elseif (pos(1)>0 & pos(1)<space(2)) & pos(2)==0              %bottom border
    %the movement depends if the col is even or odd
    if mod(pos(1),2) %odd col
        %five options of movement are possible
        if flip<1/5
            %display('up')
            newpos(1)=pos(1);
            newpos(2)=pos(2)+1;
        elseif flip>=1/5 & flip<2/5
            %display('up and right')
            newpos(1)=pos(1)+1;
            newpos(2)=pos(2)+1;
        elseif flip>=2/5 & flip<3/5
            %display('right')
            newpos(1)=pos(1)+1;
            newpos(2)=pos(2);
        elseif flip>=3/5 & flip<4/5
            %display('left')
            newpos(1)=pos(1)-1;
            newpos(2)=pos(2);
        elseif flip>4/5
            %display('left and up')
            newpos(1)=pos(1)-1;
            newpos(2)=pos(2)+1;
        else
            error('flip outside')
        end
    else %col is even
        %three options of movement are possible
        if flip<1/3
            %display('up')
            newpos(1)=pos(1);
            newpos(2)=pos(2)+1;
        elseif flip>=1/3 & flip<2/3
            %display('right')
            newpos(1)=pos(1)+1;
            newpos(2)=pos(2);
        elseif flip>2/3
            %display('left')
            newpos(1)=pos(1)-1;
            newpos(2)=pos(2);
        else
            error('flip outside')
        end
    end
elseif pos(1)==0 & pos(2)==0                            %bottom left corner
    %three options of movement are possible
    if flip<1/3
        %display('up')
        newpos(1)=pos(1);
        newpos(2)=pos(2)+1;
    elseif flip>=1/3 & flip<2/3
        %display('right and up')
        newpos(1)=pos(1)+1;
        newpos(2)=pos(2)+1;
    elseif flip>2/3
        %display('right')
        newpos(1)=pos(1)+1;
        newpos(2)=pos(2);
    else
        error('flip outside')
    end
elseif pos(1)==0 & pos(2)==space(2)                        %top left corner
    %two options of movement are possible
    if flip<1/2
        %display('right')
        newpos(1)=pos(1)+1;
        newpos(2)=pos(2);
    elseif flip>1/2
        %display('down')
        newpos(1)=pos(1);
        newpos(2)=pos(2)-1;
    else
        error('flip outside')
    end
elseif pos(1)==space(1) & pos(2)==space(2)                %top right corner
    %two options of movement are possible
    if flip<1/2
        %display('left')
        newpos(1)=pos(1)-1;
        newpos(2)=pos(2);
    elseif flip>1/2
        %display('down')
        newpos(1)=pos(1);
        newpos(2)=pos(2)-1;
    else
        error('flip outside')
    end
elseif pos(1)==space(1) & pos(2)==0                    %bottom right corner
    %three options of movement are possible
    if flip<1/3
        %display('left')
        newpos(1)=pos(1)-1;
        newpos(2)=pos(2);
    elseif flip>=1/3 & flip<2/3
        %display('left and up')
        newpos(1)=pos(1)-1;
        newpos(2)=pos(2)+1;
    elseif flip>2/3
        %display('up')
        newpos(1)=pos(1);
        newpos(2)=pos(2)+1;
    else
        error('flip outside')
    end
else                                                 %interior
    %split in six pieces. It depends on the column
    if mod(pos(1),2) %odd col
        %row is odd
        if flip<1/6
            %display('up')
            %freq(2,3)=freq(2,3)+1; %accumulates the frequency
            newpos(1)=pos(1);
            newpos(2)=pos(2)+1;
        elseif flip>=1/6 & flip<2/6
            %display('right')
            %freq(3,3)=freq(3,3)+1; %accumulates the frequency
            newpos(1)=pos(1)+1;
            newpos(2)=pos(2);
        elseif flip>=2/6 & flip<3/6
            %display('up right')
            %freq(4,3)=freq(4,3)+1; %accumulates the frequency
            newpos(1)=pos(1)+1;
            newpos(2)=pos(2)+1;
        elseif flip>=3/6 & flip<4/6
            %display('down')
            %freq(5,3)=freq(5,3)+1; %accumulates the frequency
            newpos(1)=pos(1);
            newpos(2)=pos(2)-1;
        elseif flip>=4/6 & flip<5/6
            %display('left')
            %freq(6,3)=freq(6,3)+1; %accumulates the frequency
            newpos(1)=pos(1)-1;
            newpos(2)=pos(2);
        elseif flip>5/6
            %display('left and up')
            %freq(7,3)=freq(7,3)+1; %accumulates the frequency
            newpos(1)=pos(1)-1;
            newpos(2)=pos(2)+1;
        end
    else
        if flip<1/6
            %display('up')
            %freq(2,3)=freq(2,3)+1; %accumulates the frequency
            newpos(1)=pos(1);
            newpos(2)=pos(2)+1;
        elseif flip>=1/6 & flip<2/6
            %display('right')
            %freq(3,3)=freq(3,3)+1; %accumulates the frequency
            newpos(1)=pos(1)+1;
            newpos(2)=pos(2);
        elseif flip>=2/6 & flip<3/6
            %display('down right')
            %freq(4,3)=freq(4,3)+1; %accumulates the frequency
            newpos(1)=pos(1)+1;
            newpos(2)=pos(2)-1;
        elseif flip>=3/6 & flip<4/6
            %display('down')
            %freq(5,3)=freq(5,3)+1; %accumulates the frequency
            newpos(1)=pos(1);
            newpos(2)=pos(2)-1;
        elseif flip>=4/6 & flip<5/6
            %display('down left')
            %freq(6,3)=freq(6,3)+1; %accumulates the frequency
            newpos(1)=pos(1)-1;
            newpos(2)=pos(2)-1;
        elseif flip>5/6
            %display('left')
            %freq(7,3)=freq(7,3)+1; %accumulates the frequency
            newpos(1)=pos(1)-1;
            newpos(2)=pos(2);
        else
            error('flip outside')
        end
    end
end