CREATE DATABASE book_database;



CREATE TABLE book (
  book_id int NOT NULL,
  title varchar(255) NOT NULL,
  price float DEFAULT NULL,
  pub_id int(11) DEFAULT NULL,
  category_id int(11) DEFAULT NULL
)


CREATE TABLE borrowing_book (
  member_id int(11) NOT NULL,
  book_id int(11) NOT NULL,
  borrow_date date NOT NULL,
  due_date date DEFAULT NULL,
  return_date date DEFAULT NULL
  PRIMARY KEY (member_id,book_id,borrow_date);
) 


CREATE TABLE category (
  category_id int(11)  NOT NULL,
  name varchar(255) DEFAULT NULL
) 

CREATE TABLE member (
  member_id int(11) NOT NULL,
  name varchar(255) DEFAULT NULL,
  address varchar(255) DEFAULT NULL,
  join_date date DEFAULT NULL
) 
CREATE TABLE publisher (
  pub_id int(11) NOT NULL,
  name varchar(255) DEFAULT NULL,
  address varchar(255) DEFAULT NULL
) 


ALTER TABLE book
  ADD PRIMARY KEY (book_id);
 



ALTER TABLE category
  ADD PRIMARY KEY (category_id);

ALTER TABLE member
  ADD PRIMARY KEY (member_id);


ALTER TABLE publisher
  ADD PRIMARY KEY (pub_id);


ALTER TABLE book
  ADD  FOREIGN KEY (category_id) REFERENCES category (category_id);
ALTER TABLE book
  ADD FOREIGN KEY (pub_id) REFERENCES publisher (pub_id);


ALTER TABLE borrowing_book 
  ADD FOREIGN KEY (member_id) REFERENCES member(member_id);

ALTER TABLE borrowing_book 
  ADD FOREIGN KEY (book_id) REFERENCES book(book_id);