days = [0, 0.25, 0.5, 1, 2, 3, 4, 5, 6, 8, 10];
drug_released = [2.5, 3.6, 5.3, 9.5, 14.0, 16.5, 18.8, 21.5, 23.2, 26.8, 28.4];

orders = 1:3;
residuals_all = cell(length(orders), 1);
sum_of_squares_residuals_all = zeros(length(orders), 1);

for i = 1:length(orders)
    p = polyfit(days, drug_released, orders(i));
    
    model_values = polyval(p, days);
    
    residuals = drug_released - model_values;
    residuals_all{i} = residuals;
    
    sum_of_squares_residuals_all(i) = sum(residuals.^2);
    
    subplot(length(orders), 1, i)
    plot(days, drug_released, 'o', days, model_values, '-')
    xlabel('Days')
    ylabel('Micrograms drug released')
    title(['Polynomial Order ', num2str(orders(i))])
    legend('Data', 'Model')
end

figure
for i = 1:length(orders)
    subplot(length(orders), 1, i)
    bar(days, residuals_all{i})
    xlabel('Days')
    ylabel('Residuals')
    title(['Residuals of Model (Order ', num2str(orders(i)), ')'])
end

disp('Sum of squares of residuals:')
disp(sum_of_squares_residuals_all);