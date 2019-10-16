SELECT properties.city AS city, COUNT(reservations.property_id) AS total_reservations
FROM properties
INNER JOIN reservations ON reservations.property_id = properties.id
GROUP by city
ORDER BY total_reservations DESC;