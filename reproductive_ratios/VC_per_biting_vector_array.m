function [ VC ] = VC_per_biting_vector_array(d_E,T,M )
% This function returns an array of vectorial capacities per biting midge
%d_E is the dispersion of the EIP distribution, we default to 0.1 which is
%equivalent to the EIP being a 10stage phase-type distribution
% T is a time series of daily temperatures
%M is the last day to calculate for

%Relevant daily temperature dependent rates and probabilities

biting_rate = @(T) max(0.0002.*T.*(T - 3.7).*(41.9 - T ).^(1/2.7),0);
mort_rate = @(T) min(max(0.009.*exp(0.16.*T),exp(-10.*(T+2))),10); %Very high mortality below -2 deg
incubation_rate = @(T) max(0.018.*(T-13.4),0);
P_H = 0.9; %Probability of transmission from midge to host
P_V = 0.05;%Probability of transmission from host to midge
%EIP normalised time distribution function
if d_E >0
    F_E = @(t) gamcdf(t,1/d_E,d_E);
else
    F_E = @(t) heaviside(t - 1);
end

%Calculate cumulative rates and per day biting probs for every day
CumIncubationRate = cumsum(incubation_rate(T));
CumMortalityRate = cumsum(mort_rate(T));
biting_prob_per_day = 1 - exp(-biting_rate(T));

%Function that gives the VC for a midge biting on day n
V = @(n) P_V*P_H*sum(F_E(CumIncubationRate((n+1):end)-CumIncubationRate(n)).*exp(-(CumMortalityRate((n+1):end)-CumMortalityRate(n))).*biting_prob_per_day((n+1):end) );

% This gives the answer for days 1:M
VC = arrayfun(V,(1:M)');



end

