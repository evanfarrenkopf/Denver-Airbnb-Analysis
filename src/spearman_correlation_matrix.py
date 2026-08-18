# Calculate Spearman correlation coeffecient for gentrification and Airbnb data

import pandas as pd

matrix_data = pd.read_csv("/Users/evanfarrenkopf/Desktop/Projects/Airbnb/data/matrix_data.csv", sep=";")

print(matrix_data)

# neighborhood_summary: one row per neighborhood, one column per metric
metrics = ["rent_growth_pct_z","household_income_growth_pct_z","white_nonhispanic_growth_pct_z","listings_count","str_density","avg_revenue","pct_multi_listing_hosts"]

corr_matrix = matrix_data[metrics].corr(method="spearman")

# Reshape to long format for an easy Tableau heatmap
corr_long = corr_matrix.reset_index().melt(id_vars="index", var_name="metric_y", value_name="correlation")
corr_long = corr_long.rename(columns={"index": "metric_x"})

corr_long.to_csv("data/spearman_correlation_matrix.csv", index=False)