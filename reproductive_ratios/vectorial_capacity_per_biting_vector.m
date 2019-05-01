function [VC,profile_VC] = vectorial_capacity_per_biting_vector( d_E,m,temp,windspeed )
%This function creates the vectorial capacity by multiplying the
%transmission prob with the midge potential along with H->V transmission

p_V = 0.05; %probability of transmission to vector from infectious host


[total_potential,profile_potential] = midge_infectious_potential_with_delays(d_E, m+1,temp,windspeed );

VC = p_V*total_potential;

profile_VC = p_V*profile_potential;

end

