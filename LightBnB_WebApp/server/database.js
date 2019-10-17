const properties = require('./json/properties.json');
const users = require('./json/users.json');
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  host: 'localhost',
  database: 'lightbnb',
  password: '123',
});


/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */

const getUserWithEmail = function(email) {
  return pool.query(`
  SELECT * FROM users
  WHERE email = $1
  `, [email])
  .then(res => {
  return res.rows[0]
  });
}

exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
// const getUserWithId = function(id) {
//   return Promise.resolve(users[id]);
// }

const getUserWithId = function(id) {
  return pool.query(`
  SELECT * FROM users
  WHERE id = $1
  `, [id])
  .then(res => {
  return res.rows[0]
  });
}

exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */

const addUser = function(user) {
  console.log(user)
  let name = users.name;
  let email = users.email;
  let password = users.password;

  return pool.query(`
  INSERT INTO users
  (name, email, password)
  VALUES ($1, $2, $3)
  `, [name, email, password]
  );
}

exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
// const getAllReservations = function(guest_id, limit = 10) {
//   return getAllProperties(null, 2);
// }

const getAllReservations = function(guest_id, limit = 10) {
  let now = now();
  return pool.query(`
  SELECT * FROM reservations
  WHERE guest_id = $1 AND start_date IS NOT ${now}
  LIMIT $2
  `, [guest_id, limit])
  .then(res => res.rows);
}


exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */

 /* EXAMPLE
const getAllProperties = function(options, limit = 10) {
  return pool.query(`
  SELECT * FROM properties
  LIMIT $1
  `, [limit])
  .then(res => res.rows);
}
*/

const getAllProperties = function(options, limit = 10) {
  const queryParams = [];
  let prev = false;
  console.log("options object: ", options)

  let queryString = `
  SELECT properties.*, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  `;

  if (options.city) {
    queryParams.push(`%${options.city}%`);
    queryString += `WHERE city LIKE $${queryParams.length} `
    prev = true;
  }
  console.log("Prev after city: ", prev);

  if (options.owner_id) {
    queryParams.push(`${options.owner_id}`);
    queryString += (prev ? `AND ` : `WHERE `) + `owner_id = $${queryParams.length} `
    prev = true;
  }

  console.log("Prev after owner_id: ", prev);

  if (options.minimum_price_per_night) {
    queryParams.push(`${options.minimum_price_per_night}`);
    queryString += (prev ? `AND ` : `WHERE `) + `properties.cost_per_night > $${queryParams.length} `
    prev = true;
  }

  console.log("Prev after min_price: ", prev);

  if (options.maximum_price_per_night) {
    queryParams.push(`${options.maximum_price_per_night}`);
    queryString += (prev ? `AND ` : `WHERE `) + `properties.cost_per_night < $${queryParams.length} `
    prev = true;
  }

  console.log("Prev after max_price: ", prev);

  if (options.minimum_rating) {
    queryParams.push(`${options.minimum_rating}`);
    queryString += (prev ? `AND ` : `WHERE `) + `average_rating > $${queryParams.length} `
    prev = true;
  }


  queryParams.push(limit);
  queryString += `
  GROUP BY properties.id
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};
  `;

  // Check output
  console.log(queryString, queryParams);

  return pool.query(queryString, queryParams)
  .then(res => res.rows);
}

  // city,
  // owner_id,
  // minimum_price_per_night,
  // maximum_price_per_night,
  // minimum_rating


exports.getAllProperties = getAllProperties;


// /**
//  * Add a property to the database
//  * @param {{}} property An object containing all of the property details.
//  * @return {Promise<{}>} A promise to the property.
//  */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;
