# Denver-Airbnb-Analysis
Analyzing the Airbnb market and its pressures on housing and gentrification in Denver, Colorado.
View the Tableau dashboard here: [https://public.tableau.com/views/AirbnbAnalysis_17870269877930/Marketsizeandconcentration?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link](url)

# Executive Summary

What began as an exploratory market analysis of short term rentals became an insight into displacement trends in the second-most actively gentrified city in America. In this project, I first analyze who profits from Airbnb listings in Denver, and after noticing that rental density is highest in historically gentrified neighborhoods, further analyze the correlation as well as Airbnb’s impact on the housing market. 

# Methodology

I collected market data from InsideAirbnb and demographic data from 2011 to 2025 from the American Census Survey (ACS) at the tract level. Denver redrew its census tracts in 2015, so I interpolated pre- and post- 2015 tracts into current neighborhood boundaries. Using this data, I calculated z-scores of percent changes of gentrification pressure indicators: median rent increase, median household income increase, white population rate increase, and summed these scores into a composite Gentrification Pressure Index. I also computed a Spearman correlation matrix between these individual variables and Airbnb count and density. All relevant variables were inflation adjusted using the Consumer Price Index. 

# Skills

SQL: multi-table joins, CTE’s, recursion, case

Python: pandas, geopandas, API calls, numpy, statistics, geospatial analysis and interpolation

Tableau: data visualization, statistics, correlation matrix

# Results 

While the revenue generated from Airbnb often funnels back into the local economy, it comes with worrying signs of housing pressure and gentrification.

  1. Over 80% of the revenue generated from Airbnb goes to local operations, with over 50% going directly to Coloradan hobbyist hosts.
The highest grossing neighborhoods are downtown: Five Points, Highland, and Union Station see the highest total annual revenue, along with some of the most Airbnbs.

  2. The most lucrative listings are outside the city: Central Park has the highest average annual revenue per listing at $60k.
Notable housing pressure: areas near downtown have seen up to 4.6% of long term housing removed from the market to be rented on Airbnb. That pressure is exacerbated in Highland and CBD, where 50% of listings are owned by large commercial operations

  3. Obvious gentrification correlation
    a. As Airbnb density increases, so does gentrification pressure.
    b. Airbnb increase has a strong positive correlation with rent increase, household income increase, and white population rate increase - all signs of housing displacement. 

# Next Steps

  1. Assess causation, not just correlation. Does a growing Airbnb market cause gentrification? Vice-versa? Use more extensive historical data to plot the relationship between the two factors.
   
  2. Automate the data pipeline to apply this methodology seamlessly to any city. 
