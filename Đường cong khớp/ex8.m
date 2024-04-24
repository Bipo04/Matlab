days = [0, 0.25, 0.5, 1, 2, 3, 4, 5, 6, 8, 10, 12, 16, 21];
micrograms = [2.5, 3.6, 5.3, 9.5, 14.0, 16.5, 18.8, 21.5, 23.2, 26.8, 28.4, 28.4, 28.5, 29.5];

linear_model = polyfit(days, micrograms, 1);
quadratic_model = polyfit(days, micrograms, 2);
cubic_model = polyfit(days, micrograms, 3);
exponential_model = fminsearch(@(params) sum((params(1) * (1 - exp(-params(2) * [days, 12, 16, 21])) - [micrograms, 28.4, 28.5, 29.5]).^2), [10, 2]);

predicted_days = 10:0.1:21; % Tạo các ngày dự đoán từ 10 đến 21 với bước là 0.1
predicted_values_linear = polyval(linear_model, predicted_days);
predicted_values_quadratic = polyval(quadratic_model, predicted_days);
predicted_values_cubic = polyval(cubic_model, predicted_days);
predicted_values_exponential = exponential_model(1) * (1 - exp(-exponential_model(2) * predicted_days));

figure;
plot(days, micrograms, 'bo', 'DisplayName', 'Original Data');
hold on;

plot(predicted_days, predicted_values_linear, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Linear Model');
plot(predicted_days, predicted_values_quadratic, 'g-', 'LineWidth', 1.5, 'DisplayName', 'Quadratic Model');
plot(predicted_days, predicted_values_cubic, 'c-', 'LineWidth', 1.5, 'DisplayName', 'Cubic Model');
plot(predicted_days, predicted_values_exponential, 'm-', 'LineWidth', 1.5, 'DisplayName', 'Exponential Model');

xlabel('Days');
ylabel('Drug released');
title('Prediction Through 21 Days');
legend('Original Data', 'Linear Model', 'Quadratic Model', 'Cubic Model', 'Exponential Model');

error_day_12 = [abs(micrograms(end) - day_12_predictions(1)), abs(micrograms(end) - day_12_predictions(2)), abs(micrograms(end) - day_12_predictions(3)), abs(micrograms(end) - day_12_predictions(4))];
error_day_16 = [abs(micrograms(end) - day_16_predictions(1)), abs(micrograms(end) - day_16_predictions(2)), abs(micrograms(end) - day_16_predictions(3)), abs(micrograms(end) - day_16_predictions(4))];
error_day_21 = [abs(micrograms(end) - day_21_predictions(1)), abs(micrograms(end) - day_21_predictions(2)), abs(micrograms(end) - day_21_predictions(3)), abs(micrograms(end) - day_21_predictions(4))];

figure;
bar([12, 16, 21], [error_day_12; error_day_16; error_day_21]);
xlabel('Day');
ylabel('Residual');
title('Residuals');
legend('Linear Model', 'Quadratic Model', 'Cubic Model', 'Exponential Model');
