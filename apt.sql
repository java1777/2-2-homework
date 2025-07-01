create database if not exists N23;
use N23;

create table if not exists students(
    id int auto_increment primary key,
    name VARCHAR(20),
    age int,
    group_name VARCHAR(25)
);

insert into students(id, name, age, group_name)
     Values(1, 'Javohir', 27, 'node_js'),
     (2, 'Komol', 27, 'node_js'),
     (3, 'Jamshid', 30, 'node_js'),
     (4, 'Ogabek', 19, 'node_js'),
     (5, 'Javohir', 18, 'node_js'),
     (6, 'Adham', 20, 'node_js'),
     (7, 'Dinmuhammad', 17, 'node_js'),
     (8, 'Suxrob', 15, 'node_js'),
     (9, 'Fazliddin', 28, 'node_js'),
     (10,'Mirzohid', 21, 'foundation'),
     (11, 'Ronaldo', 40, 'flater'),
     (12, 'Messi', 38, 'designer'),
     (13, 'Holland', 24, 'fotballer'),
     (14, 'Husanov', 21, 'footballer'),
     (15, 'Torres', 25, 'footbal'),
     (16, 'Spider_Man', 100, 'hero'),
     (17, 'Batman', 100, 'hero'),
     (18, 'Wonder_Woman', 18, 'hero'),
     (19, 'Iron_Man', 100, 'hero'),
     (20, 'Hulk', 100, 'hero');

     SELECT id as 'Id', name as 'Name', age as 'Age', group_name as 'Group_name' FROM students

     SELECT name as 'Name', age as 'Age', group_name as 'Group_name' FROM students

     SELECT name as 'Name', age as 'Age', group_name as 'Group_name' FROM students
     where age = 27

      SELECT name as 'Name', age as 'Age', group_name as 'Group_name' FROM students
      where Group_name = 'hero'

       SELECT name as 'Name', age as 'Age', group_name as 'Group_name' FROM students
       where age > 27
    
     SELECT name as 'Name', age as 'Age', group_name as 'Group_name' FROM students
     where 'Group_name' = 'node_js'