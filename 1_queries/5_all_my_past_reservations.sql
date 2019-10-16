SELECT properties.*, avg(property_reviews.rating) as average_rating, reservations.*
FROM properties
JOIN property_reviews ON properties.id = property_id
JOIN reservations ON reservations.id = property_reviews.reservation_id
WHERE reservations.guest_id = 1
GROUP BY properties.id, reservations.id
HAVING reservations.end_date > now()::date
ORDER BY reservations.start_date
LIMIT 10;