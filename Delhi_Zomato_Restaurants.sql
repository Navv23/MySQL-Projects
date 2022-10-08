use kaggledata;
SELECT 
    *
FROM
    delhi_zomato_hotels;
    
#GETTING TO KNOW THE DATA
#1 Number of Restaurants, Localities and Categories
SELECT 
    COUNT(DISTINCT restaurant_name) AS No_of_Restaurants,
    COUNT(DISTINCT category) AS Different_Categories,
    COUNT(DISTINCT locality) AS No_of_Localities
FROM
    delhi_zomato_hotels;				
    
#2 Finding Average Price For Two, Dining Rating, Delivery Rating
SELECT 
    ROUND(AVG(Pricing_for_two), 1) AS Avg_Price_For_Two,
    ROUND(AVG(Dining_Rating), 1) AS Avg_Rating,
    ROUND(AVG(Delivery_Rating), 1) AS Avg_Delivery_Rating
FROM
    delhi_zomato_hotels;				
    
#3 Checking Highest & Lowest Rating (Delivery and Dining)
SELECT 
    MAX(Dining_Rating) AS Max_dining_Rating,
    MAX(Delivery_Rating) AS Max_Delivery_Rating,
    MIN(Dining_Rating) AS Min_dining_Rating,
    MIN(Delivery_Rating) AS Min_Delivery_Rating
FROM
    delhi_zomato_hotels;
    
#4 Checking Number of Locations with Above 4 and Less Than 4 Dining Rating
SELECT 
    COUNT(dining_rating) AS Equal_to_or_more_than_4_count
FROM
    delhi_zomato_hotels
WHERE
    dining_rating >= 4
ORDER BY dining_rating;

#less than 4 Dining Rating
SELECT 
    COUNT(dining_rating) AS less_than_4_count
FROM
    delhi_zomato_hotels
WHERE
    dining_rating < 4
ORDER BY dining_rating;

#4 Checking Number of Locations with Above 4 and Less Than 4 Delivery Rating
SELECT 
    COUNT(delivery_rating) AS Equal_to_or_more_than_4_count
FROM
    delhi_zomato_hotels
WHERE
    delivery_rating >= 4
ORDER BY delivery_rating;

#less than 4 Delivery Rating
SELECT 
    COUNT(delivery_rating) AS less_than_4_count
FROM
    delhi_zomato_hotels
WHERE
    delivery_rating < 4
ORDER BY dining_rating;

#5 Selecting Top 10 Restaurants With Highest and Lowest Pricing For Two
SELECT 
    locality, pricing_for_two
FROM
    delhi_zomato_hotels
ORDER BY pricing_for_two DESC
LIMIT 10;

#lowest
SELECT 
    locality, pricing_for_two
FROM
    delhi_zomato_hotels
ORDER BY pricing_for_two ASC
LIMIT 10;

#6 Top 10 Locations with Highest and Lowest Dining/Delivery Rating
SELECT 
    locality, dining_rating
FROM
    delhi_zomato_hotels
ORDER BY dining_rating DESC
LIMIT 10;

#top 10 lowest dining rating
SELECT 
    locality, dining_rating
FROM
    delhi_zomato_hotels
ORDER BY dining_rating ASC
LIMIT 10;

SELECT 
    locality, delivery_rating
FROM
    delhi_zomato_hotels
ORDER BY delivery_rating DESC
LIMIT 10;

#top 10 lowest dining rating
SELECT 
    locality, delivery_rating
FROM
    delhi_zomato_hotels
ORDER BY delivery_rating ASC
LIMIT 10;

#7 Locations with Highest Number of Review Count of Dining
SELECT 
    locality, SUM(dining_review_count) AS Dining_Review_Count
FROM
    delhi_zomato_hotels
GROUP BY locality
ORDER BY Dining_Review_count DESC
LIMIT 10;

#8 Locations with Highest Number of Rating Count of Delivery
SELECT 
    locality,
    SUM(delivery_rating_count) AS Delivery_Rating_Count
FROM
    delhi_zomato_hotels
GROUP BY locality
ORDER BY Delivery_Rating_count DESC
LIMIT 10;

#9 Category vs Delivery_Rating_Count
SELECT 
    Category, Delivery_Rating_Count
FROM
    delhi_zomato_hotels
GROUP BY category
ORDER BY Delivery_Rating_Count DESC
LIMIT 20;

#10 Localion vs Category vs Avg Pricing For Two
SELECT 
    Locality, Category, pricing_for_two
FROM
    delhi_zomato_hotels
ORDER BY pricing_for_two DESC
LIMIT 20;

#11 Exploring Rating Variation B/W Dining and Delivery
SELECT 
    locality,
    ROUND(dining_rating - delivery_rating, 1) AS Rating_Difference
FROM
    delhi_zomato_hotels
ORDER BY Rating_Difference DESC;

#12 Checking Count of Famous Categories in Localities (North Indian, Chinese, Italian)
#North Indian
SELECT 
    Locality, COUNT(category) North_Indian_Category_Count
FROM
    delhi_zomato_hotels
WHERE
    Category LIKE '%north indian%'
GROUP BY locality
ORDER BY North_Indian_Category_Count DESC;

#Chinese
SELECT 
    Locality, COUNT(category) Chinese_Category_Count
FROM
    delhi_zomato_hotels
WHERE
    Category LIKE '%Chinese%'
GROUP BY locality
ORDER BY Chinese_Category_Count DESC;

#Italian
SELECT 
    Locality, COUNT(category) Italian_Category_Count
FROM
    delhi_zomato_hotels
WHERE
    Category LIKE '%Ital%'
GROUP BY locality
ORDER BY Italian_Category_Count DESC;

#13 Finding Avg Rating Between The North Indian, Chinese, Italian
#north indian (for Chinese and Italian, same code with change of Like Operation can be done)
SELECT 
    COUNT(category) AS Count_of_North_Indian_Hotels,
    ROUND(AVG(dining_rating), 1) AS Avg_dining_rating,
    ROUND(AVG(delivery_rating), 1) AS Avg_delivery_rating
FROM
    delhi_zomato_hotels
WHERE
    category LIKE '%north indian%';
    
#14 Delivery Rating Count vs Dining Review Count VS Avg_pricing_for_2 w.r.t Location 
SELECT 
    locality,
    SUM(delivery_rating_count) AS Delivery_Rating_Count,
    SUM(dining_review_count) AS Dining_review_Count,
    ROUND(AVG(pricing_for_two), 1) AS Avg_Pricing_For_Two
FROM
    delhi_zomato_Hotels
GROUP BY locality
ORDER BY delivery_rating_count DESC
LIMIT 20;

















