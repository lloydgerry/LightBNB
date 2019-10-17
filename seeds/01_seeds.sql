INSERT INTO users (name, email, password) 
VALUES 
('Evan Stanley', 'Evan@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Sue Smith', 'SmithMe@Me.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Hue Color', 'ColorMe@hello.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Jane Austin', '567HASH342@ymail.org', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Secura T', 'MyEmail@faker.us', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Whoopi Cushin', 'Starz56@yahoo.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Jip Pan', '55842343@q.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Jade Stone', 'Jade@stone.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_sapces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_cost, active) 
VALUES 
(1, 'Best Place EVA', 'Description', 'https://3rxg9qea18zhtl6s2u8jammft-wpengine.netdna-ssl.com/wp-content/uploads/2019/04/Lyric-New-Orleans-3-Bed-3-Bath-Apartment.jpg', 'https://3rxg9qea18zhtl6s2u8jammft-wpengine.netdna-ssl.com/wp-content/uploads/2019/04/Lyric-New-Orleans-3-Bed-3-Bath-Apartment.jpg', 955, 1, 2, 2, 'Canada', '67 Chestnut', 'Port Renfrew', 'BC','V9F 7F7', true),
(2, 'Do you like Freedom?', 'Description', 'https://skift.com/wp-content/uploads/2018/10/london-airbnb-living-room-e1539104712815.jpg', 'https://skift.com/wp-content/uploads/2018/10/london-airbnb-living-room-e1539104712815.jpg', 455, 1, 1, 1, 'Meruica', '77 Freedom', 'Port FREEDOM', 'WA','98765', true),
(3, 'Cute and Funky', 'Description', 'https://media.cntraveler.com/photos/5acf774025b57f283485bf89/4:3/w_480,c_limit/paris%2520home%2520airbnb.jpg', 'https://media.cntraveler.com/photos/5acf774025b57f283485bf89/4:3/w_480,c_limit/paris%2520home%2520airbnb.jpg', 1340, 2, 2, 5, 'Canada', '6647 Faviour Ln', 'Hope', 'BC','V9F 7T7', true),
(1, 'Come and Pool', 'Description', 'https://miro.medium.com/max/11372/1*FcHnzcGdh8zLJldE1atFBA.jpeg', 'https://miro.medium.com/max/11372/1*FcHnzcGdh8zLJldE1atFBA.jpeg', 400, 1, 4, 3, 'Canada', '567 Cliff Edge', 'Lake of the Woods', 'ON','Y7U 8U8', true),
(7, 'Not Welcome', 'Description', 'https://miro.medium.com/max/11025/1*lH5QyWjJ8lLLl-G_POna-Q.jpeg', 'https://miro.medium.com/max/11025/1*lH5QyWjJ8lLLl-G_POna-Q.jpeg', 45000, 0, 1, 1, 'Canada', '8 Find Me Ave', 'Far Away', 'AB','Z9F 7F7', true);


INSERT INTO reservations (guest_id, property_id, start_date, end_date) 
VALUES 
(1, 1, '2018-09-11', '2018-09-26'),
(2, 2, '2019-01-04', '2019-02-01'),
(2, 2, '2019-05-04', '2019-05-05'),
(6, 5, '2019-01-04', '2019-03-01'),
(8, 3, '2021-10-01', '2021-10-14');


INSERT INTO property_reviews (guest_id, reservation_id, property_id, rating, message) 
VALUES 
(1, 1, 1, 4, 'message'),
(2, 2, 4, 5, 'We had fun!'),
(2, 321, 4, 5, 'MOR TEXT'),
(5, 2, 4, 5, 'We had fun! Message.'),
(7, 456, 3, 1, 'YOU WERE NOT THERE TO MEET US');

