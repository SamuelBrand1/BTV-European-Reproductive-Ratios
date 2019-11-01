%Short Script for testing if EU mean rainfalls has NaN values in land areas

I = ~isnan(EUMeanRainLastWeek(:,:,1));
[d1,d2,d3] = size(EUMeanRainLastWeek);

for i = 1:d1
    for j = 1:d2
        if I(i,j)
            if sum(isnan(EUMeanRainLastWeek(i,j,:))) > 0
                'Land based nans'
                i
                j
                
            end
        end
        
    end
end
