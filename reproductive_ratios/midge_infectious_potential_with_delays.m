function [total_potential,profile_potential ] = midge_infectious_potential_with_delays(d_E, m,temp,windspeed )
%The expected number of hosts infected on day n by a midge which was
%inoculated on day m-1 given a sequence of daily temperatures and the
%windspeed and rainfall on days n

% B = [t ; B_t] is the unit rate reference biting rate which is either solved for in
% this code or given
% d_E,d_G are dispersions

%NB: DELAY MODEL ONLY HAS d_B = 1

T = temp(m:end); %relevant temperature sequence
W = windspeed(m:end);%relevant windspeed


%Relevant daily temperature dependent rates

biting_rate = @(T) max(0.0002.*T.*(T - 3.7).*(41.9 - T ).^(1/2.7),0);
mort_rate = @(T) max(0.009.*exp(0.16.*T),exp(-10.*(T+2))); %Very high mortality below -2 deg
incubation_rate = @(T) max(0.018.*(T-13.4),0);
P_H = 0.9;
p_B = @(T) 1 - exp(-biting_rate(T));%

%EIP normalised time distribution function
if d_E >0
    F_E = @(t) gamcdf(t,1/d_E,d_E);
else
    F_E = @(t) heaviside(t - 1);
end

%Calculate cumulative rates and therefore probabilities
CumIncubationRate = cumsum(incubation_rate(T));
EIP_prob_vect = F_E(CumIncubationRate);
CumMortalityRate = cumsum(mort_rate(T));
Survived_prob_vect = exp(-CumMortalityRate);


%Calculate biting with and without wind effects
if max(windspeed)>0
    %Array of biting with delays due to windy weather
    biting_prob_per_day = biting_array_with_delays(T(1:max_L),W(1:max_L));
else
    %Basic Poisson process
    biting_prob_per_day = 1 - exp(-biting_rate(T));
end
%Combine calculation
profile_potential = P_H*EIP_prob_vect.*biting_prob_per_day.*Survived_prob_vect ;
total_potential = sum(profile_potential );
end

