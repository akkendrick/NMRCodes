function [sign, kDiffFactor] = estimateKdiffFactor_withSign(K,k_estimates,maxFactor)

[row, col] = size(k_estimates);
kDiffFactor = zeros(size(k_estimates));
sign = zeros(size(k_estimates));


if maxFactor == 1

    for a = 1:row
        for b = 1:col

            factor1 = K(a)/k_estimates(a,b);
            factor2 = k_estimates(a,b)/K(a);

            kDiffFactor(a,b) = max([factor1 factor2]);
            
            if factor1 > factor2
                sign(a,b) = -1.0;
            else
                sign(a,b) = 1.0;
            end
            
        end
    end
else
    for a = 1:row
        for b = 1:col

            factor1 = k_estimates(a,b)/K(a);
            kDiffFactor(a,b) = factor1;
        end
    end
    
end
    
    

end

