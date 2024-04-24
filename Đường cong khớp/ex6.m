days = [0, 0.25, 0.5, 1, 2, 3, 4, 5, 6, 8, 10];
drug_released = [2.5, 3.6, 5.3, 9.5, 14.0, 16.5, 18.8, 21.5, 23.2, 26.8, 28.4];

model_func = @(params, t) params(1) * (1 - exp(-params(2) * t));

objective_func = @(params) sum((drug_released - model_func(params, days)).^2);

initial_params = [10, 2];

best_params = fminsearch(objective_func, initial_params);

best_model_prediction = model_func(best_params, days);

plot(days, drug_released, 'o', days, best_model_prediction, '-')
xlabel('Days')
ylabel('Micrograms drug released')
legend('Data', 'Model')
title('Exponential Model Fit to Data')

a = best_model_prediction-drug_released;
disp(sum(a.^2));
disp('Best-fit parameters:');
disp(['C = ', num2str(best_params(1))]);
disp(['a = ', num2str(best_params(2))]);