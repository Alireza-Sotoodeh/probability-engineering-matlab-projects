%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Author: Alireza Sotoodeh (Student ID: 401412056) 
Subject: Correlation Analysis of Random Variables
Description: Demonstrates the correlation between random variables Y and Z 
             under different conditions and generates scatter plots.
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialization
% This section clears the command window, closes all figures, and clears the workspace variables.
clc;        % Clear command window
close all;  % Close all figures
clear all;  % Clear workspace variables

%% Parameters
% Define the number of samples for the simulation.
N = 1000000;  % Number of samples

%% Part a: Y and Z are independent and normally distributed
% Generate independent random variables Y and Z from a standard normal distribution.
Y = randn(N, 1); % Y ~ N(0,1)
Z = randn(N, 1); % Z ~ N(0,1)

% Compute the covariance and correlation between Y and Z.
cov_YZ = cov(Y, Z);
corr_YZ = cov_YZ(1, 2) / sqrt(cov_YZ(1, 1) * cov_YZ(2, 2));
disp(['Part a: Correlation between independent Y and Z: ', num2str(corr_YZ)])

% Scatter plot of Y and Z.
figure('Units', 'normalized', 'Position', [0.1, 0.1, 0.8, 0.8]);
scatter(Y, Z, 10, 'filled', 'MarkerFaceAlpha', 0.6); % Use filled circles with transparency
title(['Part a: Scatter plot of Y and Z (independent), Corr = ', num2str(corr_YZ)], 'FontSize', 14, 'Interpreter', 'none');
xlabel('Y', 'FontSize', 12);
ylabel('Z', 'FontSize', 12);
grid on;
ax = gca; % Get current axis
ax.GridAlpha = 0.3; % Adjust grid transparency

%% Part b: Z = 2Y + 3
% Define Z as a linear transformation of Y.
Z = 2*Y + 3;

% Compute the covariance and correlation between Y and Z.
cov_YZ = cov(Y, Z);
corr_YZ = cov_YZ(1, 2) / sqrt(cov_YZ(1, 1) * cov_YZ(2, 2));
disp(['Part b: Correlation between Y and Z = 2Y + 3: ', num2str(corr_YZ)])

% Scatter plot of Y and Z.
figure('Units', 'normalized', 'Position', [0.1, 0.1, 0.8, 0.8]);
scatter(Y, Z, 10, 'filled', 'MarkerFaceAlpha', 0.6); % Use filled circles with transparency
title(['Part b: Scatter plot of Y and Z (Z = 2Y + 3), Corr = ', num2str(corr_YZ)], 'FontSize', 14, 'Interpreter', 'none');
xlabel('Y', 'FontSize', 12);
ylabel('Z', 'FontSize', 12);
grid on;
ax = gca; % Get current axis
ax.GridAlpha = 0.3; % Adjust grid transparency

%% Part c: Plot rows of matrix X
% Define matrix X with Y and Z as its rows.
X = [Y'; Z'];

% Plot row 1 vs row 2 of matrix X.
figure('Units', 'normalized', 'Position', [0.1, 0.1, 0.8, 0.8]);
plot(X(1, :), X(2, :), '.');
title('Part c: Plot of row 1 vs row 2 of matrix X', 'FontSize', 14, 'Interpreter', 'none');
xlabel('Row 1 (Y)', 'FontSize', 12);
ylabel('Row 2 (Z)', 'FontSize', 12);
grid on;
ax = gca; % Get current axis
ax.GridAlpha = 0.3; % Adjust grid transparency

%% Part d: Define Z to achieve r_YZ = 2/3
% Define parameters for the desired correlation.
sigma_Y = 1;
sigma_Z = 1;
r = 2/3;

% Define the mean vector and covariance matrix.
mu = [0; 0];
Sigma = [sigma_Y^2, r*sigma_Y*sigma_Z; r*sigma_Y*sigma_Z, sigma_Z^2];

% Cholesky decomposition to create correlated random variables.
R = chol(Sigma);
Y = randn(N, 1);
Z = randn(N, 1);
Z_combined = R * [Y, Z]';

Y_new = Z_combined(1, :)';
Z_new = Z_combined(2, :)';

% Compute the covariance and correlation between Y_new and Z_new.
cov_YZ = cov(Y_new, Z_new);
corr_YZ = cov_YZ(1, 2) / sqrt(cov_YZ(1, 1) * cov_YZ(2, 2));
disp(['Part d: Correlation between Y and Z with r = 2/3: ', num2str(corr_YZ)])

% Scatter plot of Y_new and Z_new.
figure('Units', 'normalized', 'Position', [0.1, 0.1, 0.8, 0.8]);
scatter(Y_new, Z_new, 10, 'filled', 'MarkerFaceAlpha', 0.6); % Use filled circles with transparency
title(['Part d: Scatter plot of Y and Z with r = 2/3, Corr = ', num2str(corr_YZ)], 'FontSize', 14, 'Interpreter', 'none');
xlabel('Y', 'FontSize', 12);
ylabel('Z', 'FontSize', 12);
grid on;
ax = gca; % Get current axis
ax.GridAlpha = 0.3; % Adjust grid transparency

%% Save Results
% Create a folder to save results if it doesn't exist.
result_folder = 'Result_Project_2';
if ~exist(result_folder, 'dir')
    mkdir(result_folder);
end

% Save figures as PNG in the Result_Project_2 folder.
saveas(figure(1), fullfile(result_folder, 'part_a_scatter_plot.png'));
saveas(figure(2), fullfile(result_folder, 'part_b_scatter_plot.png'));
saveas(figure(3), fullfile(result_folder, 'part_c_plot.png'));
saveas(figure(4), fullfile(result_folder, 'part_d_scatter_plot.png'));
