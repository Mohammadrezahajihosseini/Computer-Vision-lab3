% Cleanup/initialization
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;

%% Load the two sets of corresponding points and arrange them in two matrices
%P1 and P2 with 3 rows and N columns, where N is the Number of corrisponding points
t = input('Enter Shape name Rubic or Mire:','s');
switch t
    case 'Mire'
            P1 = load('Mire/Mire1.points');
            P1 = P1';
            P1 = [P1; ones(1,size(P1,2))];
            P2 = load('Mire/Mire2.points');
            P2 = P2';
            P2 = [P2; ones(1, size(P2,2))];
    case  'Rubic'
            P1 = load('Rubik/Rubik1.points');
            P1 = P1';
            P1 = [P1; ones(1,size(P1,2))];
            P2 = load('Rubik/Rubik2.points');
            P2 = P2';
            P2 = [P2; ones(1, size(P2,2))];
end

%% Call the function for estimating the fundamental matrix F from P1 and P2
n = input('Select version of  Eight Points Algorithm (In case if you are interests for first version enter 1 otherwise enter 2)\n Enter number of version:');
switch n
    case 1
    F = EightPointsAlgorithmNVe1(P1,P2);
    case 2
    F = EightPointsAlgorithmNVe2(P1,P2);
end


%% Visualize the results and evaluate your estimated F 
switch t
    case 'Mire'
        Im1 = imread('Mire/Mire1.pgm');
        Im2 = imread('Mire/Mire2.pgm');
        %%                                  P1, P2 empty sets
        visualizeEpipolarLines(Im1, Im2, F, [], []);
    case 'Rubic'
    %% Visualize the results and evaluate your estimated F 
        Im1 = imread('Rubik/Rubik1.pgm');
        Im2 = imread('Rubik/Rubik2.pgm');
        %%                                  P1, P2 empty sets
        visualizeEpipolarLines(Im1, Im2, F, [], []);
end 