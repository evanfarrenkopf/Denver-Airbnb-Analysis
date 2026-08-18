USE airbnb;

-- Create table for all listing data, cleaning data first
CREATE TABLE listings (
    id                                              BIGINT PRIMARY KEY,
    listing_url                                     VARCHAR(255),
    scrape_id                                       BIGINT,
    last_scraped                                    DATE,
    source                                          VARCHAR(50),
    name                                             VARCHAR(255),
    description                                     TEXT,
    neighborhood_overview                           TEXT,
    picture_url                                     TEXT,
    host_id                                         BIGINT,
    host_url                                        VARCHAR(255),
    host_profile_id                                 BIGINT,
    host_profile_url                                VARCHAR(255),
    host_name                                       VARCHAR(100),
    host_since                                      DATE,
    hosts_time_as_user_years                        INT,
    hosts_time_as_user_months                       INT,
    hosts_time_as_host_years                        INT,
    hosts_time_as_host_months                       INT,
    host_location                                   VARCHAR(255),
    host_about                                      TEXT,
    host_response_time                              VARCHAR(50),
    host_response_rate                              DECIMAL(5,2),
    host_acceptance_rate                            DECIMAL(5,2),
    host_is_superhost                               BOOLEAN,
    host_thumbnail_url                              TEXT,
    host_picture_url                                TEXT,
    host_neighbourhood                              VARCHAR(100),
    host_listings_count                             INT,
    host_total_listings_count                       INT,
    host_verifications                              TEXT,
    host_has_profile_pic                            BOOLEAN,
    host_identity_verified                          BOOLEAN,
    neighbourhood                                   VARCHAR(255),
    neighbourhood_cleansed                          VARCHAR(100),
    neighbourhood_group_cleansed                    VARCHAR(100),
    latitude                                        DECIMAL(10,8),
    longitude                                       DECIMAL(11,8),
    property_type                                   VARCHAR(100),
    room_type                                       VARCHAR(50),
    accommodates                                    INT,
    bathrooms                                       DECIMAL(3,1),
    bathrooms_text                                  VARCHAR(50),
    bedrooms                                        INT,
    beds                                             INT,
    amenities                                       TEXT,
    price                                           DECIMAL(10,2),
    price_quote_checkin_date                        DATE,
    price_quote_checkout_date                       DATE,
    price_quote_total_price                         DECIMAL(10,2),
    price_quote_price_per_night                     DECIMAL(10,2),
    price_quote_raw                                 TEXT,
    minimum_nights                                  INT,
    maximum_nights                                  INT,
    minimum_minimum_nights                          INT,
    maximum_minimum_nights                          INT,
    minimum_maximum_nights                          INT,
    maximum_maximum_nights                          INT,
    minimum_nights_avg_ntm                          DECIMAL(6,1),
    maximum_nights_avg_ntm                          DECIMAL(8,1),
    calendar_updated                                VARCHAR(50),
    has_availability                                BOOLEAN,
    availability_30                                 INT,
    availability_60                                 INT,
    availability_90                                 INT,
    availability_365                                INT,
    calendar_last_scraped                           DATE,
    number_of_reviews                               INT,
    number_of_reviews_ltm                           INT,
    number_of_reviews_l30d                          INT,
    availability_eoy                                INT,
    number_of_reviews_ly                            INT,
    estimated_occupancy_l365d                       INT,
    estimated_revenue_l365d                         DECIMAL(12,2),
    first_review                                    DATE,
    last_review                                     DATE,
    review_scores_rating                            DECIMAL(3,2),
    review_scores_accuracy                          DECIMAL(3,2),
    review_scores_cleanliness                       DECIMAL(3,2),
    review_scores_checkin                           DECIMAL(3,2),
    review_scores_communication                     DECIMAL(3,2),
    review_scores_location                          DECIMAL(3,2),
    review_scores_value                             DECIMAL(3,2),
    license                                         VARCHAR(50),
    instant_bookable                                BOOLEAN,
    calculated_host_listings_count                  INT,
    calculated_host_listings_count_entire_homes     INT,
    calculated_host_listings_count_private_rooms    INT,
    calculated_host_listings_count_shared_rooms     INT,
    reviews_per_month                               DECIMAL(6,2)
);

INSERT INTO listings
SELECT CAST(id AS UNSIGNED),
    listing_url,
    CAST(scrape_id AS UNSIGNED),
    STR_TO_DATE(NULLIF(last_scraped, ''), '%Y-%m-%d'),
    source,
    name,
    description,
    neighborhood_overview,
    picture_url,
    CAST(host_id AS UNSIGNED),
    host_url,
    CAST(NULLIF(host_profile_id, '') AS UNSIGNED),
    host_profile_url,
    host_name,
    STR_TO_DATE(NULLIF(host_since, ''), '%Y-%m-%d'),
    NULLIF(hosts_time_as_user_years, '') + 0,
    NULLIF(hosts_time_as_user_months, '') + 0,
    NULLIF(hosts_time_as_host_years, '') + 0,
    NULLIF(hosts_time_as_host_months, '') + 0,
    NULLIF(host_location, ''),
    host_about,
    NULLIF(host_response_time, ''),
    NULLIF(REPLACE(host_response_rate, '%', ''), '') + 0,
    NULLIF(REPLACE(host_acceptance_rate, '%', ''), '') + 0,
    CASE host_is_superhost WHEN 't' THEN 1 WHEN 'f' THEN 0 END,
    host_thumbnail_url,
    host_picture_url,
    NULLIF(host_neighbourhood, ''),
    NULLIF(host_listings_count, '') + 0,
    NULLIF(host_total_listings_count, '') + 0,
    host_verifications,
    CASE host_has_profile_pic WHEN 't' THEN 1 WHEN 'f' THEN 0 END,
    CASE host_identity_verified WHEN 't' THEN 1 WHEN 'f' THEN 0 END,
    NULLIF(neighbourhood, ''),
    NULLIF(neighbourhood_cleansed, ''),
    NULLIF(neighbourhood_group_cleansed, ''),
    NULLIF(latitude, '') + 0.0,
    NULLIF(longitude, '') + 0.0,
    NULLIF(property_type, ''),
    NULLIF(room_type, ''),
    NULLIF(accommodates, '') + 0,
    NULLIF(bathrooms, '') + 0.0,
    NULLIF(bathrooms_text, ''),
    NULLIF(bedrooms, '') + 0,
    NULLIF(beds, '') + 0,
    amenities,
    NULLIF(REPLACE(REPLACE(price, '$', ''), ',', ''), '') + 0.0,
    STR_TO_DATE(NULLIF(price_quote_checkin_date, ''), '%Y-%m-%d'),
    STR_TO_DATE(NULLIF(price_quote_checkout_date, ''), '%Y-%m-%d'),
    NULLIF(REPLACE(REPLACE(price_quote_total_price, '$', ''), ',', ''), '') + 0.0,
    NULLIF(REPLACE(REPLACE(price_quote_price_per_night, '$', ''), ',', ''), '') + 0.0,
    price_quote_raw,
    NULLIF(minimum_nights, '') + 0,
    NULLIF(maximum_nights, '') + 0,
    NULLIF(minimum_minimum_nights, '') + 0,
    NULLIF(maximum_minimum_nights, '') + 0,
    NULLIF(minimum_maximum_nights, '') + 0,
    NULLIF(maximum_maximum_nights, '') + 0,
    NULLIF(minimum_nights_avg_ntm, '') + 0.0,
    NULLIF(maximum_nights_avg_ntm, '') + 0.0,
    NULLIF(calendar_updated, ''),
    CASE has_availability WHEN 't' THEN 1 WHEN 'f' THEN 0 END,
    NULLIF(availability_30, '') + 0,
    NULLIF(availability_60, '') + 0,
    NULLIF(availability_90, '') + 0,
    NULLIF(availability_365, '') + 0,
    STR_TO_DATE(NULLIF(calendar_last_scraped, ''), '%Y-%m-%d'),
    NULLIF(number_of_reviews, '') + 0,
    NULLIF(number_of_reviews_ltm, '') + 0,
    NULLIF(number_of_reviews_l30d, '') + 0,
    NULLIF(availability_eoy, '') + 0,
    NULLIF(number_of_reviews_ly, '') + 0,
    NULLIF(estimated_occupancy_l365d, '') + 0,
    NULLIF(estimated_revenue_l365d, '') + 0.0,
    STR_TO_DATE(NULLIF(first_review, ''), '%Y-%m-%d'),
    STR_TO_DATE(NULLIF(last_review, ''), '%Y-%m-%d'),
    NULLIF(review_scores_rating, '') + 0.0,
    NULLIF(review_scores_accuracy, '') + 0.0,
    NULLIF(review_scores_cleanliness, '') + 0.0,
    NULLIF(review_scores_checkin, '') + 0.0,
    NULLIF(review_scores_communication, '') + 0.0,
    NULLIF(review_scores_location, '') + 0.0,
    NULLIF(review_scores_value, '') + 0.0,
    NULLIF(license, ''),
    CASE instant_bookable WHEN 't' THEN 1 WHEN 'f' THEN 0 END,
    NULLIF(calculated_host_listings_count, '') + 0,
    NULLIF(calculated_host_listings_count_entire_homes, '') + 0,
    NULLIF(calculated_host_listings_count_private_rooms, '') + 0,
    NULLIF(calculated_host_listings_count_shared_rooms, '') + 0,
    NULLIF(reviews_per_month, '') + 0.0
FROM listings_staging;

-- Create table for all host data
CREATE TABLE hosts AS
	SELECT 
		host_id,
		hosts_time_as_host_years AS tenure_years,
		hosts_time_as_host_months AS tenure_months,
		host_is_superhost AS is_superhost,
		host_identity_verified AS identity_verified,
		host_location, 
		COUNT(DISTINCT neighbourhood_cleansed) AS n_distinct_neighbourhoods,
		COUNT(*) AS total_listings_denver,
        SUM(CASE WHEN property_type LIKE 'Entire%' THEN 1 ELSE 0 END) AS entire_home_count,
		ROUND(
			SUM(CASE WHEN property_type LIKE 'Entire%' THEN 1 ELSE 0 END) 
			/ COUNT(*) * 100, 2
		) AS pct_entire_home,
		ROUND(AVG(price), 2) AS avg_price,
		ROUND(AVG(bedrooms), 2) AS avg_bedrooms,
		ROUND(AVG(availability_365), 2) AS avg_availability_365,
		SUM(availability_365) AS total_availability,
		ROUND(AVG(minimum_nights), 2) AS avg_min_nights,
		SUM(estimated_revenue_l365d) AS estimated_total_annual_revenue,
		SUM(estimated_occupancy_l365d) AS estimated_annual_occupancy,
		SUM(number_of_reviews) AS total_reviews,
		ROUND(AVG(review_scores_rating), 2) AS avg_rating
	FROM listings
	GROUP BY host_id, tenure_years, tenure_months, is_superhost, identity_verified, host_location;

-- Categorize hosts by number of listings and type of listings
RENAME TABLE hosts TO hosts_old;
CREATE TABLE hosts AS
	SELECT
		*,
		CASE 
			WHEN entire_home_count IS NULL THEN 'unknown'
			WHEN entire_home_count < 2 AND total_listings_denver <= 3 THEN 'hobbyist'
			WHEN entire_home_count < 5 AND total_listings_denver <= 9 THEN 'small business'
			ELSE 'commercial' 
		END AS host_type
	FROM hosts_old;
DROP TABLE hosts_old;

-- Summary of data aggregated by neighborhood
CREATE TABLE neighborhoods AS
	SELECT
		l.neighbourhood_cleansed AS neighborhood,
        COUNT(DISTINCT l.id) AS total_listings,
        ROUND(
			SUM(CASE WHEN l.property_type LIKE 'Entire%' THEN 1 ELSE 0 END) 
			/ COUNT(*) * 100, 2
		) AS pct_entire_home,
        ROUND(AVG(l.price), 2) AS avg_price,
		ROUND(AVG(l.bedrooms), 2) AS avg_bedrooms,
        ROUND(SUM(l.price)/SUM(l.bedrooms), 2) AS avg_price_per_bedroom,
        ROUND(AVG(l.estimated_revenue_l365d), 2) AS avg_estimated_annual_revenue,
        SUM(l.estimated_revenue_l365d) AS estimated_total_annual_revenue,
        COUNT(DISTINCT l.host_id) AS total_hosts,
		COUNT(DISTINCT CASE WHEN h.host_type = 'hobbyist' THEN l.host_id END) AS hobbyist_hosts,
		COUNT(DISTINCT CASE WHEN h.host_type = 'small business' THEN l.host_id END) AS small_business_hosts,
		COUNT(DISTINCT CASE WHEN h.host_type = 'commercial' THEN l.host_id END) AS commercial_hosts
	FROM listings AS l JOIN hosts AS h 
    ON l.host_id=h.host_id
    GROUP BY neighborhood;
    
-- After importing timeseries data of each neighborhood, use the date a listing was first reviewed as a proxy for when it was added to the market
ALTER TABLE neighborhood_gentrification_timeseries
ADD COLUMN listings_count INT;

CREATE TEMPORARY TABLE tmp_listings_count AS
WITH RECURSIVE year_range AS (
    SELECT 2011 AS yr
    UNION ALL
    SELECT yr + 1 FROM year_range WHERE yr < 2026
),
neighborhood_years AS (
    -- every neighborhood x every year, so gap years get a row too
    SELECT DISTINCT neighborhood, yr AS year
    FROM neighborhood_gentrification_timeseries
    CROSS JOIN year_range
),
new_listings_by_year AS (
    SELECT
        neighbourhood_cleansed AS neighborhood,
        YEAR(first_review) AS year,
        COUNT(*) AS new_listings
    FROM listings
    WHERE first_review IS NOT NULL
    GROUP BY neighbourhood_cleansed, YEAR(first_review)
)
SELECT
    ny.neighborhood,
    ny.year,
    SUM(COALESCE(nl.new_listings, 0)) OVER (
        PARTITION BY ny.neighborhood
        ORDER BY ny.year
    ) AS listings_count
FROM neighborhood_years ny
LEFT JOIN new_listings_by_year nl
    ON ny.neighborhood = nl.neighborhood AND ny.year = nl.year;
    
UPDATE neighborhood_gentrification_timeseries t
JOIN tmp_listings_count tmp
    ON t.neighborhood = tmp.neighborhood AND t.year = tmp.year
SET t.listings_count = tmp.listings_count;

DROP TEMPORARY TABLE tmp_listings_count;

DROP TABLE neighborhoods;

CREATE TABLE neighborhood_summary AS
SELECT 
	c.neighborhood,
	c.total_housing,
    c.total_occupied_housing,
    c.total_vacant_housing,
    c.owner_occupied_units,
    c.renter_occupied_units,
    c.vacant_homes_rented,
    c.vacant_homes_sold,
    c.vacant_homes_seasonal,
    c.population,
    c.median_gross_rent,
    c.median_home_value,
    c.median_household_income,
    c.geometry,
    c.total_listings,
    c.pct_entire_home,
    c.avg_price,
    c.avg_bedrooms,
    c.avg_price_per_bedroom,
    c.avg_estimated_annual_revenue,
    c.estimated_total_annual_revenue,
    c.total_hosts,
    c.hobbyist_hosts,
    c.small_business_hosts,
    c.commercial_hosts,
    s.NBHD_ID,
    s.rent_growth_pct,
    s.home_value_growth_pct,
    s.household_income_growth_pct,
    s.white_nonhispanic_growth_pct,
    s.rent_growth_pct_z,
    s.household_income_growth_pct_z,
    s.white_nonhispanic_growth_pct_z,
    s.gentrification_pressure_index
FROM neighborhoods_complete AS c JOIN denver_changes_summary  AS s ON c.neighborhood = s.neighborhood;

-- Spearman correlation matrix of gentrification and Airbnb data
CREATE TABLE matrix_data AS
SELECT
    n.neighborhood,
    n.rent_growth_pct_z,
    n.household_income_growth_pct_z,
    n.white_nonhispanic_growth_pct_z,

    COALESCE(gt.listings_count, 0) AS listings_count,

    -- STR density: listings per 1,000 housing units
    ROUND(COALESCE(gt.listings_count, 0) / n.total_housing * 1000, 2) AS str_density,

    ROUND(AVG(l.estimated_revenue_l365d), 2) AS avg_revenue,

    -- % of a neighborhood's hosts that are multi-listing (small business/commercial),
    -- bridged through listings since host_type lives on hosts but neighborhood
    -- lives on listings
    ROUND(
        COUNT(DISTINCT CASE WHEN h.host_type IN ('small business', 'commercial') THEN l.host_id END)
        / NULLIF(COUNT(DISTINCT l.host_id), 0) * 100, 2
    ) AS pct_multi_listing_hosts

-- Add gentrification data to neighborhood data
FROM neighborhood_summary AS n
LEFT JOIN neighborhood_gentrification_timeseries AS gt
    ON n.neighborhood = gt.neighborhood AND gt.year = 2022
LEFT JOIN listings AS l
    ON n.neighborhood = l.neighbourhood_cleansed
LEFT JOIN hosts AS h
    ON l.host_id = h.host_id
GROUP BY
    n.neighborhood, n.rent_growth_pct_z, n.household_income_growth_pct_z,
    n.white_nonhispanic_growth_pct_z, n.total_housing, gt.listings_count;

