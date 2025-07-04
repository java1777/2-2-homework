CREATE DATABASE IF NOT EXISTS town;
USE town;

CREATE TABLE IF NOT EXISTS city(
    id INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR (20) UNIQUE
);

CREATE TABLE IF NOT EXISTS user(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) UNIQUE,
    age INT,
    CHEK (age<100),
    city_id INT,
    FOREIGN KEY(city_id) REFERENCES city(id)
);

INSERT INTO city (city_name) VALUES
('Qashqadaryo'),
('Fargana'),
('Tashkent'),
('Samarkand'),
('Bukhara'),
('Andijan'),
('Namangan');

INSERT INTO user (name, age, city_id) VALUES
('William Smith',34,6),
('John Johnson',34,7),
('John Smith', 65, 1),
('Michael Johnson', 75, 2),
('William Brown', 80, 4),
('Ali Karimov', 25, 1),
('Vali Toshpulatov', 30, 2),
('Said Usmonov', 40, 3),
('Botir Yuldashev', 35, 4),
('Nodir Rahimov', 50, 5),
('Jasur Aliyev', 28, 1),
('Olim Sobirov', 60, 2),
('Salim Mamatov', 45, 3),
('Dilshod Hakimov', 55, 4),
('Sherzod Ibragimov', 70, 5);

SELECT u.id,u.name,c.city_name FROM user u LEFT JOIN city c ON u.city_id=c.id ORDER BY c.city_name ASC

SELECT u.id,u.name,c.city_name FROM user u INNER JOIN city c ON u.city_id =c.id ORDER BY id ASC

SELECT c.id,c.city_name,u.name FROM city c INNER JOIN user u  ON u.city_id =c.id ORDER BY c.id ASC

SELECT c.id,c.city_name,COUNT(u.id) as user_count FROM city c INNER JOIN user u  
ON u.city_id =c.id GROUP BY c.id ORDER BY c.id ASC

SELECT c.id,c.city_name,AVG(u.age) as avg_year FROM city c LEFT JOIN user u 
ON u.city_id =c.id GROUP BY c.id

SELECT u.id,u.name,c.city_name FROM user u LEFT JOIN city c on u.city_id=c.id  ORDER BY city_name ASC

SELECT u.id,u.name,c.city_name FROM user u LEFT JOIN city c on u.city_id=c.id HAVING city_name='Tashkent'

SELECT c.id,c.city_name,SUM(u.age) as total_year FROM city c LEFT JOIN user u 
ON u.city_id =c.id GROUP BY c.id

SELECT c.id,c.city_name,COUNT(u.id) as user_count FROM city c INNER JOIN user u  
ON u.city_id =c.id GROUP BY c.id HAVING user_count>1 ORDER BY c.id ASC

SELECT u.id,u.name,c.city_name,u.age FROM user u LEFT JOIN city c ON u.city_id=c.id HAVING age=25 ORDER BY u.id ASC 

SELECT c.id,u.name,c.city_name FROM user u LEFT JOIN city c ON u.city_id=c.id HAVING c.id=1 ORDER BY u.id ASC 

SELECT c.id,u.name,c.city_name FROM user u LEFT JOIN city c ON u.city_id=c.id HAVING c.id=1 OR c.id=2 ORDER BY c.id ASC 

SELECT c.id,u.name,c.city_name FROM user u LEFT JOIN city c ON u.city_id=c.id WHERE NOT c.id=3 ORDER BY c.id ASC 

SELECT c.id,u.name,c.city_name,u.age FROM user u LEFT JOIN city c ON u.city_id=c.id HAVING  age>=20 AND age<=30 ORDER BY c.id ASC