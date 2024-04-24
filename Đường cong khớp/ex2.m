days = [0, 0.25, 0.5, 1, 2, 3, 4, 5, 6, 8, 10];
drug_released = [2.5, 3.6, 5.3, 9.5, 14.0, 16.5, 18.8, 21.5, 23.2, 26.8, 28.4];

p = polyfit(days, drug_released, 1);

model_values = polyval(p, days);

residuals = drug_released - model_values;

disp(sum(residuals.^2))