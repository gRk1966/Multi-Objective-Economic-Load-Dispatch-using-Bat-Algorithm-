global data B Pd
% This program solves the economic dispatch with Bmn coefficients by batalgarithm
cost1= [85.6348    8.43205  0.002035
        303.7780    6.41031  0.003866
        847.1484    7.42890  0.002182
        274.2241    8.30154  0.001345
        847.1484    7.42890  0.002182
        202.0258    6.91559  0.005963];
    cost2=[80.9019   -0.3812   0.006323
        28.82490   -0.79027  0.006483
        324.1775   -1.36061  0.003174
        610.2535   -2.39928  0.006732
        324.1775   -1.36061  0.003174
        50.3808    -0.39077  0.006181];
    cost3=[51.3778   5.05928  0.001206
        182.2605   3.84624  0.002320
        508.5207   4.45647  0.001284
        165.3433   4.97641  0.000813
        508.2507   4.45647  0.001284
        121.2133   4.14938  0.003578];
    cost4=[5080.148  -61.01945   0.265110
        3824.770   -29.95221   0.140053
        1342.851   -9.552794   0.105929
        1819.625   -12.74642   0.106409
        1342.851   -9.5522794  0.105929
        1138.107  -12.19812   0.403144];
    
 mwlimits =[50  250
           50  400
           100  600
           50  400
           150  600
           50  250];
% Loss coefficients it should be squarematrix of size nXn where n is the no
% of plants
B=1e-2*[0.0194    0.0083    0.0002   -0.0024   -0.0008   -0.0034
    0.0083    0.0121    0.0022   -0.0027   -0.0012   -0.0046
    0.0002    0.0022    0.0250   -0.0046   -0.0031   -0.0082
   -0.0024   -0.0027   -0.0046    0.0145    0.0042   -0.0032
   -0.0008   -0.0012   -0.0031    0.0042    0.0100   -0.0066
   -0.0034   -0.0046   -0.0082   -0.0032   -0.0066    0.0137];
% Demand (MW)
Pd=1800;
% setting the  algorithm parameters.
sr1=1.0*cost1;
data=[sr1(:,3) sr1(:,2) sr1(:,1) mwlimits];  

M = 1000;   
    pop = 30;   
    dim = length(data(:,1));   
    gamma = 0.9;
    alpha = 0.99;
    r0Max = 1;
    r0Min = 0;
    AMax = 2;
    AMin = 1;
    freqDMax = 1.5;
    freqDMin = 0;
     G = 10;   
    probMax = 0.9;
    probMin = 0.6;
    thetaMax = 1;
    thetaMin = 0.5;
    wMax = 0.9;
    wMin = 0.5;
    CMax = 0.9;
    CMin = 0.1;
  [ x, fMin ] = NBA( @eldnba, M, pop, dim, G, gamma, alpha, ...
    r0Max, r0Min, AMax, AMin, freqDMax, freqDMin, probMax, probMin, ...
    CMax, CMin, thetaMax, thetaMin, wMax, wMin )
 [ F Pgg Pl]=eldnba(x)
 cost1;gencost1
cost2;gencost2
cost3;gencost3 
cost4;gencost4
sr2=1.0*cost2;
 data=[sr2(:,3) sr2(:,2) sr2(:,1) mwlimits];  
 [ x, fMin ] = NBA( @eldnba, M, pop, dim, G, gamma, alpha, ...
    r0Max, r0Min, AMax, AMin, freqDMax, freqDMin, probMax, probMin, ...
    CMax, CMin, thetaMax, thetaMin, wMax, wMin )
 [ F Pgg Pl]=eldnba(x)
cost1;gencost1
cost2;gencost2
cost3;gencost3
cost4;gencost4

sr3=1.0*cost3;
data=[sr3(:,3) sr3(:,2) sr3(:,1) mwlimits];  
 [ x, fMin ] = NBA( @eldnba, M, pop, dim, G, gamma, alpha, ...
    r0Max, r0Min, AMax, AMin, freqDMax, freqDMin, probMax, probMin, ...
    CMax, CMin, thetaMax, thetaMin, wMax, wMin )
 [ F Pgg Pl]=eldnba(x)
cost1;gencost1
cost2;gencost2
cost3;gencost3
cost4;gencost4   
    
sr4=1.0*cost4;
    data=[sr4(:,3) sr4(:,2) sr4(:,1) mwlimits];  
 [ x, fMin ] = NBA( @eldnba, M, pop, dim, G, gamma, alpha, ...
    r0Max, r0Min, AMax, AMin, freqDMax, freqDMin, probMax, probMin, ...
    CMax, CMin, thetaMax, thetaMin, wMax, wMin )
 [ F Pgg Pl]=eldnba(x)
cost1;gencost1
cost2;gencost2
cost3;gencost3
cost4;gencost4  

sr5=0.25*cost1+0.25*cost2+0.25*cost3+0.25*cost4;
    data=[sr5(:,3) sr5(:,2) sr5(:,1) mwlimits];  
 [ x, fMin ] = NBA( @eldnba, M, pop, dim, G, gamma, alpha, ...
    r0Max, r0Min, AMax, AMin, freqDMax, freqDMin, probMax, probMin, ...
    CMax, CMin, thetaMax, thetaMin, wMax, wMin )
 [ F Pgg Pl]=eldnba(x)
cost1;gencost1
cost2;gencost2
cost3;gencost3
cost4;gencost4  

sr6=0.4*cost1+0.3*cost2+0.2*cost3+0.1*cost4;
   data=[sr6(:,3) sr6(:,2) sr6(:,1) mwlimits];  
 [ x, fMin ] = NBA( @eldnba, M, pop, dim, G, gamma, alpha, ...
    r0Max, r0Min, AMax, AMin, freqDMax, freqDMin, probMax, probMin, ...
    CMax, CMin, thetaMax, thetaMin, wMax, wMin )
 [ F Pgg Pl]=eldnba(x)
cost1;gencost1
cost2;gencost2
cost3;gencost3
cost4;gencost4   
        
sr7=0.6*cost1+0.2*cost2+0.1*cost3+0.1*cost4;
    data=[sr7(:,3) sr7(:,2) sr7(:,1) mwlimits];  
[ x, fMin ] = NBA( @eldnba, M, pop, dim, G, gamma, alpha, ...
    r0Max, r0Min, AMax, AMin, freqDMax, freqDMin, probMax, probMin, ...
    CMax, CMin, thetaMax, thetaMin, wMax, wMin )
 [ F Pgg Pl]=eldnba(x)
cost1;gencost1
cost2;gencost2
cost3;gencost3
cost4;gencost4   
            

