function [VC] = create_VC_per_midge_array(Temp_array,EIP_dispersion)
%Creates the per midge vectorial capacity -- this is the expected number of
%future infections of a single midge infected in a grid cell on a certain
%day

%% Define VC array as same size as temperature array but with 100 less days
[d1,d2,d3] = size(Temp_array);

VC = -99*ones(d1,d2,d3-100 );

%% Solve for VC per infected midge

for i = 1:d1
    for j = 1:d2
         if ~isnan(Temp_array(i,j,1)) %Only calculate for land areas
            T = permute(Temp_array(i,j,:),[3 1 2]); %reshape into a vector of future temperatures for that grid cell
            VC(i,j,:) = VC_per_biting_vector_array(EIP_dispersion,T,d3-100);
       
        else
        
        VC(i,j,:) = NaN;
        
         end
    
    
    end

end

end

