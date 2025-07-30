%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Author: Alireza Sotoodeh (Student ID: 401412056) 
Subject: Convergence of Mean and Covariance
Description: Demonstrates convergence of sample mean and covariance to
             expected values as sample size (N) increases. Computes and
             plots mean and covariance for specific N values, and evaluates
             error convergence.
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialization
% This section clears the command window, closes all figures, and clears the workspace variables.
clc;        % Clear command window
close all;  % Close all figures
clear all;  % Clear workspace variables

%% Parameters
% Define the parameters for the simulation.
n = 2;                      % Dimension of the vector
number_of_samples = 50000;  % Default number of samples for mean and covariance computation
expected_mean = 10;        % Expected mean value
expected_covariance = 3;  % Expected covariance value

%% Define N_values
% Specific values of N to evaluate for error convergence.
N_values = [number_of_samples, 1000, 100, 10, 1];

%% Create a folder to save results if it doesn't exist
% Check if the 'Results' folder exists; if not, create it.
result_folder = 'Results_Project_1';
if ~exist(result_folder, 'dir')
    mkdir(result_folder);
end

%% Compute Mean and Covariance
% Initialize arrays to store mean and covariance values for different N values.
mean_values = zeros(n, length(N_values));
cov_values = zeros(n, n, length(N_values));

% Loop over each value of N in N_values to generate random vectors and compute sample mean and covariance.
for j = 1:length(N_values)
    N = N_values(j);
    
    % Generate N random vectors with specified mean and covariance.
    random_vectors = expected_mean + sqrt(expected_covariance) * randn(n, N);
    
    % Compute sample mean.
    sample_mean = mean(random_vectors, 2);
    
    % Center the vectors around the expected_mean.
    centered_vectors = random_vectors - expected_mean * ones(n, N);
    
    % Compute sample covariance.
    sample_covariance = (centered_vectors * centered_vectors') / N;
    
    % Store mean and covariance.
    mean_values(:, j) = sample_mean;
    cov_values(:, :, j) = sample_covariance;
end

%% Plot Mean and Covariance Convergence
% This section plots the convergence of sample mean and covariance values.

figure('WindowState', 'maximized'); % Open figure in fullscreen

% Plot convergence of mean values.
subplot(2, 1, 1);
plot(N_values, mean_values(1, :), 'b-', 'LineWidth', 2); % Blue for first dimension mean
hold on;
plot(N_values, mean_values(2, :), 'g-', 'LineWidth', 2); % Green for second dimension mean
plot(N_values, expected_mean * ones(size(N_values)), 'k--', 'LineWidth', 1); % Expected mean line
hold off;
xlabel('Number of Samples (N)', 'FontSize', 12);
ylabel('Mean Value', 'FontSize', 12);
title('Convergence of Sample Mean', 'FontSize', 14);
legend('Dimension 1', 'Dimension 2', 'Expected Mean', 'Location', 'best');
grid on;
xlim([min(N_values) max(N_values)]);

% Add vertical text annotations for mean.
mean_annotation_x = max(N_values) * 1.03;
mean_annotation_y = mean(mean_values(:, end));
mean_text = sprintf('N = %d\nExpected Mean = %.2f', number_of_samples(end), expected_mean);
text(mean_annotation_x, mean_annotation_y, mean_text, ...
    'FontSize', 10, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'left', 'Rotation', 90);

% Plot convergence of covariance values.
subplot(2, 1, 2);
plot(N_values, squeeze(cov_values(1, 1, :)), 'b-', 'LineWidth', 2); % Blue for (1,1) element
hold on;
plot(N_values, squeeze(cov_values(2, 2, :)), 'g-', 'LineWidth', 2); % Green for (2,2) element
plot(N_values, expected_covariance * ones(size(N_values)), 'k--', 'LineWidth', 1); % Expected covariance line
hold off;
xlabel('Number of Samples (N)', 'FontSize', 12);
ylabel('Covariance Value', 'FontSize', 12);
title('Convergence of Sample Covariance', 'FontSize', 14);
legend('Covariance (1,1)', 'Covariance (2,2)', 'Expected Covariance', 'Location', 'best');
grid on;
xlim([min(N_values) max(N_values)]);

% Add vertical text annotations for covariance.
cov_annotation_x = max(N_values) * 1.03;
cov_annotation_y = mean(squeeze(cov_values(:, :, end)), 'all') ;
cov_text = sprintf('N = %d\nExpected Cov = %.2f', number_of_samples(end), expected_covariance);
text(cov_annotation_x, cov_annotation_y, cov_text, ...
    'FontSize', 10, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'left', 'Rotation', 90);

% Adjust subplot spacing.
sgtitle('Mean and Covariance Convergence', 'FontSize', 16); % Overall title for the figure

% Save figure in the Results folder as PNG.
saveas(gcf, fullfile(result_folder, 'mean_and_covariance_convergence.png'));

%% Calculate Errors
% Calculate errors for selected N_values by comparing computed values with expected values.
mean_errors = vecnorm(mean_values - expected_mean);
cov_errors = zeros(size(N_values));

for j = 1:length(N_values)
    % Calculate Frobenius norm of the difference between sample covariance and expected covariance.
    cov_errors(j) = norm(squeeze(cov_values(:, :, j)) - expected_covariance * eye(n), 'fro');
end

%% Plot Error Convergence
% This section plots the convergence of errors in sample mean and covariance values.

figure('WindowState', 'maximized'); % Open figure in fullscreen

% Plot errors for mean convergence.
subplot(2, 1, 1);
loglog(N_values, mean_errors, 'ro-', 'LineWidth', 2); % Red for mean error
xlabel('Number of Samples (N)', 'FontSize', 12);
ylabel('Mean Error Norm', 'FontSize', 12);
title('Error Convergence of Sample Mean', 'FontSize', 14);
grid on;
xlim([min(N_values) max(N_values)]);

% Add text outside and to the right of the plot (vertical).
text(max(N_values)*1.2, mean(mean_errors) - (mean(mean_errors) - min(mean_errors)), ...
    sprintf('Expected Mean = %.2f', expected_mean), ...
    'FontSize', 10, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'left', 'Rotation', 90);

% Plot errors for covariance convergence.
subplot(2, 1, 2);
loglog(N_values, cov_errors, 'bs-', 'LineWidth', 2); % Blue for covariance error
xlabel('Number of Samples (N)', 'FontSize', 12);
ylabel('Covariance Error Norm', 'FontSize', 12);
title('Error Convergence of Sample Covariance', 'FontSize', 14);
grid on;
xlim([min(N_values) max(N_values)]);

% Add text outside and to the right of the plot (vertical).
text(max(N_values)*1.2, mean(cov_errors) - (mean(cov_errors) - min(cov_errors)), ...
    sprintf('Expected Cov = %.2f', expected_covariance), ...
    'FontSize', 10, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'left', 'Rotation', 90);

% Adjust subplot spacing.
sgtitle('Error Convergence of Sample Mean and Covariance', 'FontSize', 16); % Overall title for the figure

% Save figure in the Results folder as PNG.
saveas(gcf, fullfile(result_folder, 'error_convergence.png'));

%% Display the Accuracy Results
% Display the expected mean and covariance values, and the errors for selected N values.

disp('Expected Mean:');
disp(expected_mean);
disp('Expected Covariance:');
disp(expected_covariance);
disp('Errors with selected N values:');
disp(table(N_values', mean_errors', cov_errors', 'VariableNames', {'N', 'MeanError', 'CovError'}));
