%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Author: Alireza Sotoodeh (Student ID: 401412056) 
Subject: Transformation and Distribution Analysis of Gaussian Random Variable
Description: Generates a Gaussian random variable X, applies the transformation Z = e^{-X},
             and analyzes the distribution of Z. It demonstrates the correctness of the 
             transformation by comparing the histogram of Z with its theoretical PDF.
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialization
% This section clears the command window, closes all figures, and clears the workspace variables.
clc;        % Clear command window
close all;  % Close all figures
clear all;  % Clear workspace variables

%% Parameters
% Define parameters for the Gaussian random variable.
mu = -1; % Mean of the normal distribution
sigma = 2; % Standard deviation of the normal distribution
n = 2000; % Number of samples

%% Generate X ~ N(mu, sigma^2)
% Generate a Gaussian random variable X with mean mu and standard deviation sigma.
X = mu + sigma * randn(1, n);

%% Apply the transformation Z = e^(-X)
% Transform X to Z using the given transformation.
Z = exp(-X);

%% Define the PDF of Z
% Define the probability density function of Z.
f_Z = @(z) (1./z) .* (1 / (sqrt(2 * pi) * sigma)) .* exp(-((log(z) - mu).^2) / (2 * sigma^2));

%% Plot histogram of Z and compare with its PDF
% Plot the histogram of Z.
figure('Units', 'normalized', 'Position', [0.1, 0.1, 0.8, 0.8]); % Create a figure window with normalized units
h = histogram(Z, 'Normalization', 'pdf', 'FaceColor', [0.2, 0.6, 0.5], 'EdgeColor', 'none', 'FaceAlpha', 0.7);
hold on;

% Generate values for z to plot f_Z(z)
z_values = linspace(min(Z), max(Z), 1000);

% Plot the PDF f_Z(z)
p = plot(z_values, f_Z(z_values), 'r', 'LineWidth', 2);
hold off;

% Customize the plot appearance
ax = gca; % Get current axis
ax.FontSize = 14; % Increase font size
ax.GridAlpha = 0.3; % Adjust grid transparency
ax.LineWidth = 1.5; % Thicker axis lines
ax.Box = 'on'; % Box around the plot
grid on;

% Labels and title
xlabel('z', 'FontSize', 16, 'FontWeight', 'bold', 'Color', [0.1, 0.3, 0.6]); % Label for x-axis
ylabel('Probability Density', 'FontSize', 16, 'FontWeight', 'bold', 'Color', [0.1, 0.3, 0.6]); % Label for y-axis
title('Histogram of Z and its PDF', 'FontSize', 18, 'FontWeight', 'bold', 'Color', [0.1, 0.3, 0.6]); % Title of the plot
legend('Histogram of Z', 'PDF f_Z(z)', 'FontSize', 14, 'Location', 'northeast'); % Legend for the plot

% Add text annotations to the plot
text(max(z_values) * 0.7, max(f_Z(z_values)) * 0.8, ['\mu = ', num2str(mu)], 'FontSize', 14, 'Color', 'b', 'FontWeight', 'bold'); % Mean
text(max(z_values) * 0.7, max(f_Z(z_values)) * 0.7, ['\sigma = ', num2str(sigma)], 'FontSize', 14, 'Color', 'b', 'FontWeight', 'bold'); % Standard deviation
text(max(z_values) * 0.7, max(f_Z(z_values)) * 0.6, ['Number of samples = ', num2str(n)], 'FontSize', 14, 'Color', 'b', 'FontWeight', 'bold'); % Number of samples

% Display parameters in command window
disp(['mu = ', num2str(mu)]);
disp(['sigma = ', num2str(sigma)]);
disp(['Number of samples = ', num2str(n)]);

%% Save Results
% Create a folder to save results if it doesn't exist.
result_folder = 'Result_Project_3';
if ~exist(result_folder, 'dir')
    mkdir(result_folder);
end

% Save the figure as PNG in the Result_Project_Transformation folder.
saveas(gcf, fullfile(result_folder, 'transformation_histogram_pdf.png'));
