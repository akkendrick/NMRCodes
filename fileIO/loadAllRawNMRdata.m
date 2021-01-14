function [T2dist,T2logbins,SEdecayTime,SEdecayUniform,SEdecay,oneDVectors,...
    oneDVectorsUniform, nmrName] = loadAllRawNMRdata(siteName)

    kanWash_sites = {'dpnmr_larned_east','dpnmr_larned_lwph','dpnmr_larned_west',...
    'dpnmr_leque_east','dpnmr_leque_west','dpnmrA11','dpnmrA12',...
    'dpnmrC1S','dpnmrC1SE','dpnmrC1SW'};

    wisc_sites = {'Site1-WellG5','Site1-WellG6','Site2-WellPN1','Site2-WellPN2'};
       
    if sum(strcmp(siteName,kanWash_sites) == 1)
        %rawBaseDir = '/Volumes/GoogleDrive/My Drive/Stanford/USGS Project/Kansas_Wash_Data/';
        rawBaseDir = 'I:\My Drive\Stanford\USGS Project\Kansas_Wash_Data\';

        site = siteName;
        name = siteName;
        nmrName = siteName;
        
        in1 = [rawBaseDir site '/' name '_T2_dist' '.txt']; 
        in2 = [rawBaseDir site '/' name '_T2_bins_log10s' '.txt']; 
    
        T2dist = load(in1);
        T2logbins = load(in2)';
        SEdecayTime = NaN;
        SEdecayUniform = NaN;
        SEdecay = NaN;
        oneDVectors = NaN;
        oneDVectorsUniform = NaN;
        
    elseif sum(strcmp(siteName,wisc_sites) == 1)
        rawBaseDir = 'E:\Dropbox\Research\Lab Files\Field Data\USGS Data\';

        if strcmp(siteName,'Site1-WellG5')
            site = 'Site1-WellG5';
            name = 'G5_W1_tr5_20x_16p5_up_F1n2_wRIN_wRFI_Reg50_Va1';
            nmrName = site;
            offset = 0.95;
        elseif strcmp(siteName,'Site1-WellG6')
            site = 'Site1-WellG6';
            name = 'G6_W2_tr5_20x_16p75_up_F_wRIN_wRFI_reg50_Va1';
            nmrName = site;
            offset = 0.75;
        elseif strcmp(siteName,'Site2-WellPN1')
            site = 'Site2-WellPN1';
            name = 'Pl_W1_Tr5_20x_MPp75aLS_F1n2_wRIN_wRFI_Reg50_Va1';
            nmrName = site;
            offset = 0.75;
        elseif strcmp(siteName,'Site2-WellPN2')
            site = 'Site2-WellPN2';
            name = 'W2_Tr5_20x_MPp75aLS_Reg50_wRIN_wRFI_Va1';
            nmrName = site;
            offset = 0.75;
        else
            disp('Not a good filename')
            return
        end
        
       in1 = [rawBaseDir site '/' site '_T2_dist' '.txt']; 
       in2 = [rawBaseDir site '/' site '_T2_bins_log10s' '.txt'];  
       in3 = [rawBaseDir site '/' site '_SE_decay_time' '.txt'];
       in4 = [rawBaseDir site '/' site '_SE_decay_uniform' '.txt'];
       in5 = [rawBaseDir site '/' site '_SE_decay' '.txt'];
       in6 = [rawBaseDir site '/' site '_1Dvectors' '.txt'];
       in7 = [rawBaseDir site '/' site '_1Dvectors_uniform' '.txt'];

       
       
       T2dist = load(in1);
       T2dist(:,1) = T2dist(:,1) - offset; 
       T2logbins = load(in2);
       SEdecayTime = load(in3);
       SEdecayUniform = load(in4);
       SEdecay = load(in5);
       oneDVectors = dlmread(in6,'\t',1,0);
       oneDVectorsUniform = dlmread(in7,'\t',1,0);
       
        
    else
        disp('Not a good filename')
        return
    end



end

