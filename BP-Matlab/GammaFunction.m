%fplot(@gamma, 'LineWidth',2)

x = linspace(0.01, 5, 1000);  % Define a range of positive numbers
y = gamma(x);                 % Calculate the gamma function for these numbers

% Filter the values where gamma(x) is less than 50
x_filtered = x(y < 25);
y_filtered = y(y < 25);

figure;                       % Create a new figure
plot(x_filtered, y_filtered, 'LineWidth', 2);   % Plot the filtered gamma function
xlabel('x');
ylabel('\Gamma(x)');
title('Gamma Function for \Gamma(x) < 50');
grid on;