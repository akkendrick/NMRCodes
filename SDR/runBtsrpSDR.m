% Estimate K, hardcoded for SDR model from T2ml via bootstrap

% Needed data, must specify to run
logT2ML;
logPhi;
logK;

n = [2]
m = [1]

if isempty(n) && isempty(m)
    [b_boot, n_boot, m_boot] = bootstrap_fun([logT2ML, logPhi, logK], Nboot);
elseif ~isempty(n) && isempty(m)
    [b_boot, n_boot, m_boot] = bootstrap_fun([logT2ML, logPhi, logK], Nboot, n);
else
    [b_boot, n_boot, m_boot] = bootstrap_fun([logT2ML, logPhi, logK], Nboot, n, m);   % m, n fixed
end


median_b = median(b_boot)
std_b = std(b_boot);


