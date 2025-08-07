clear;
clc;
tic;
global data B Pd
% This program solves the economic dispatch with Bmn coefficients by BAT
% Algorithm 
% The data matrix should have 5 columns of fuel cost coefficients and plant  limits.
% 1.a ($/MW^2) 2. b $/MW 3. c ($) 4.lower lomit(MW) 5.Upper limit(MW)
%no of rows denote the no of plants(n)
data=[0.07  7  140	200 500
0.095	10	150	150  300 
0.09 8.5 120	250  350
0.09 11  100	 200  300
0.080 10.5 120 250  500
0.075 12 190 300 500];
% Loss coefficients it should be squarematrix of size nXn where n is the no
% of plants
B=1e-2*[0.0194    0.0083    0.0002   -0.0024   -0.0008   -0.0034
    0.0083    0.0121    0.0022   -0.0027   -0.0012   -0.0046
    0.0002    0.0022    0.0250   -0.0046   -0.0031   -0.0082
   -0.0024   -0.0027   -0.0046    0.0145    0.0042   -0.0032
   -0.0008   -0.0012   -0.0031    0.0042    0.0100   -0.0066
   -0.0034   -0.0046   -0.0082   -0.0032   -0.0066    0.0137];
% Demand (MW)
Pd=1944;
% setting the  algorithm parameters.
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
 [ F P1 Pl]=eldnba(x)
 toc;
 %   F is the total fuel cost
 %P1 is the allocation vector
% Pl is the transmission losss