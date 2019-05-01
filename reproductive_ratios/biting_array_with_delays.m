function [ B_array] = biting_array_with_delays( temp,windspeed )
%Gives the expected number of bites per day given varying temp and delays
%in biting due to strong winds

BR = @(n) max(0.0002*temp(n)*(temp(n) - 3.7)*(41.9 - temp(n) )^(1/2.7),0);%Rate at which gonotrophic cycle ends
p_I = @(n) 1 - min(exp(-0.18*windspeed(n) + 0.07^2*windspeed(n)*windspeed(n)/2),1);%prob of being inactive due to wind
p_B = @(n) 1 - exp(-BR(n));% prob that a given midge finishes gonotrophic cycle and seeks a blood meal
L = length(temp);

%Each row in M matrix is the prob that the midge is either in oogenesis
%leading into dusk or is ready to make a blood meal but was interupted by
%strong winds

M = [1 0;zeros(L-1,2)];
B_array(1,1) = M(1,:)*[(1-p_I(1))*p_B(1) ; (1-p_I(1))]; %Expected biting on day 1 after inoculation

for i = 2:L

    M(i,:) = M(i-1,:)*[1-(p_B(i)*p_I(i)),p_B(i)*p_I(i);1-p_I(i),p_I(i)];%Action of the transition matrix on distribution before active period day i after inoculation
    B_array(i,1) = M(i,:)*[(1-p_I(i))*p_B(i) ; (1-p_I(i))]; %Expected bites on day i after inoculation
    
end



end

