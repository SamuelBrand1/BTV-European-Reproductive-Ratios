function [ VC ] = VC_per_biting_vector_array(d_E,T,M )
% This function returns an array of vectorial capacities per biting midge

%Relevant daily temperature dependent rates and probabilities

biting_rate = @(T) max(0.0002.*T.*(T - 3.7).*(41.9 - T ).^(1/2.7),0);
mort_rate = @(T) min(max(0.009.*exp(0.16.*T),exp(-10.*(T+2))),10); %Very high mortality below -2 deg
incubation_rate = @(T) max(0.018.*(T-13.4),0);
P_H = 0.9;
P_V = 0.05;
%EIP normalised time distribution function
if d_E >0
    F_E = @(t) gamcdf(t,1/d_E,d_E);
else
    F_E = @(t) heaviside(t - 1);
end

%Calculate cumulative rates and per day biting probs
CumIncubationRate = cumsum(incubation_rate(T));
CumMortalityRate = cumsum(mort_rate(T));
biting_prob_per_day = 1 - exp(-biting_rate(T));


% V = @(n) P_V*P_H*(F_E(CumIncubationRate((n+1):end)-CumIncubationRate(n)).*exp(-(CumMortalityRate((n+1):end)-CumMortalityRate(n))).*biting_prob_per_day((n+1):end) );
V = @(n) P_V*P_H*sum(F_E(CumIncubationRate((n+1):end)-CumIncubationRate(n)).*exp(-(CumMortalityRate((n+1):end)-CumMortalityRate(n))).*biting_prob_per_day((n+1):end) );

VC = arrayfun(V,(1:M)');



end

