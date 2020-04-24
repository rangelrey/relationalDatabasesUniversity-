drop table loan;
drop table reservation;
drop table bookcopy;
drop table book;
drop table userlib;

/*Create the book table */
CREATE TABLE book (
isbn NUMBER NOT NULL,
author VARCHAR(255),
title VARCHAR(255),
publisher VARCHAR(255),
dateOfPublication DATE,
CONSTRAINT limitIsbnTo13 check (length(isbn)=13),
CONSTRAINT pk_book PRIMARY KEY (isbn));
/*Insert data into the book table */
INSERT ALL
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000001,'Mario Draghi'    ,'Complete Macroeconomics 1'       ,'publisher1', '01-Jan-02')
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000002,'Anthony Martinez','Complete Microeconomics 2'       ,'publisher1', '02-Jan-02')
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000003,'Anthony Blair'   ,'Introduction to Macroeconomics 3','publisher1', '03-Jan-02')
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000004,'Anthony Blair'   ,'Introduction to Microeconomics 4','publisher1', '04-Jan-02')
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000005,'Anthony Blair'   ,'Introduction to Econometrics 5'  ,'publisher2', '05-Jan-02')
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000006,'Anthony Martinez','Advanced Macroeconomics 6'       ,'publisher2', '06-Jan-02')
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000007,'Hal Varian'      ,'Advanced Microeconomics 7'       ,'publisher2', '07-Jan-02')
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000008,'Hal Varian'      ,'Advanced Econometrics 8'         ,'publisher2', '08-Jan-02')
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000009,'Milton Friedman' ,'Intermediate Macroeconomics 9'   ,'publisher3', '09-Jan-02')
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000010,'Mario Draghi'    ,'Intermediate Microeconomics 10'  ,'publisher3', '10-Jan-02')
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000011,'Milton Friedman' ,'Intermediate Econometrics 11'    ,'publisher3', '13-Jan-02')
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000012,'Mario Draghi'    ,'Applied Macroeconomics 12'       ,'publisher3', '13-Jan-02')
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000013,'Mario Draghi'    ,'Applied Microeconomics 13'       ,'publisher4', '13-Jan-02')
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000014,'Milton Friedman' ,'Applied Econometrics 14'         ,'publisher4', '13-Jan-02')
INTO book ( isbn, author, title, publisher, dateOfPublication) values (1000000000015,'Thomas Piketty'  ,'Theoretical Economics 15'        ,'publisher4', '13-Jan-02')
SELECT * FROM dual;

/*Create the user table */
CREATE TABLE userLib (
userId NUMBER NOT NULL,
name VARCHAR(255),
email VARCHAR(255),
telephone NUMBER,
CONSTRAINT limitIdTo8 check (length(userId)=8),
CONSTRAINT pk_user PRIMARY KEY (userId));
/*Insert data into the user table */
INSERT ALL
INTO userLib ( userId, name, email, telephone ) values (11111101,'Robert Garcia'  ,'robert.garcia@herts.co.uk',000123)
INTO userLib ( userId, name, email, telephone ) values (11111102,'Robert Emblem'  ,'robert.emblem@herts.co.uk',000223)
INTO userLib ( userId, name, email, telephone ) values (11111103,'Holly Garcia'   ,'holly.garcia@herts.co.uk',000323)
INTO userLib ( userId, name, email, telephone ) values (11111104,'Robert Xiang'   ,'robert.xiang@herts.co.uk',000423)
INTO userLib ( userId, name, email, telephone ) values (11111105,'Ilias Garcia'   ,'ilias.garcia@herts.co.uk',000523)
INTO userLib ( userId, name, email, telephone ) values (11111106,'Xin Lee'        ,'xin.lee@herts.co.uk',000623)
INTO userLib ( userId, name, email, telephone ) values (11111107,'Xi Garcia'      ,'xi.garcia@herts.co.uk',000723)
INTO userLib ( userId, name, email, telephone ) values (11111108,'Helen Emblem'   ,'helen.emblem@herts.co.uk',000823)
INTO userLib ( userId, name, email, telephone ) values (11111109,'Holly Wellon'   ,'holly.wellon@herts.co.uk',000923)
INTO userLib ( userId, name, email, telephone ) values (11111110,'Glen Iles'      ,'glen.iles@herts.co.uk',001023)
INTO userLib ( userId, name, email, telephone ) values (11111111,'Kieran Emblem'  ,'kieran.emblem@herts.co.uk',001123)
INTO userLib ( userId, name, email, telephone ) values (11111112,'Kieran Xiang'   ,'kieran.xiang@herts.co.uk',0001223)
INTO userLib ( userId, name, email, telephone ) values (11111113,'Glen Wellon'    ,'glen.wellon@herts.co.uk',001323)
INTO userLib ( userId, name, email, telephone ) values (11111114,'Andrew Betkaoui','andrew.betkaoui@herts.co.uk',001423)
INTO userLib ( userId, name, email, telephone ) values (11111115,'Juan Betkaoui'  ,'juan.betkaoui@herts.co.uk',001523)
SELECT * FROM dual;

/*Create the copy table */
CREATE TABLE bookCopy (
barcode NUMBER NOT NULL,
isbn NUMBER NOT NULL,
available NUMBER(1),

CONSTRAINT fk_bookCopy FOREIGN KEY (isbn) REFERENCES book(isbn),
CONSTRAINT pk_bookCopy PRIMARY KEY (barcode),
CONSTRAINT availableIsBoolean check (available in (1,0)),
CONSTRAINT limitIsbnTo13_bookCopy check (length(isbn)=13) ) ;

/*Insert data into the user table */
INSERT ALL
INTO bookCopy  values (1101 ,1000000000001, 1)
INTO bookCopy  values (1201 ,1000000000001, 1)
INTO bookCopy  values (1301 ,1000000000001, 1)
INTO bookCopy  values (1401 ,1000000000001, 0)

INTO bookCopy  values (1102 ,1000000000002, 1)
INTO bookCopy  values (1202 ,1000000000002, 0)
INTO bookCopy  values (1302 ,1000000000002, 0)

INTO bookCopy  values (1103 ,1000000000003, 1)
INTO bookCopy  values (1203 ,1000000000003, 1)
INTO bookCopy  values (1303 ,1000000000003, 1)

INTO bookCopy  values (1104 ,1000000000004, 1)
INTO bookCopy  values (1204 ,1000000000004, 1)
INTO bookCopy  values (1304 ,1000000000004, 1)

INTO bookCopy  values (1105 ,1000000000005, 0)
INTO bookCopy  values (1205 ,1000000000005, 0)
INTO bookCopy  values (1305 ,1000000000005, 0)

INTO bookCopy  values (1106 ,1000000000006, 1)

INTO bookCopy  values (1207 ,1000000000007, 1)

INTO bookCopy  values (1108 ,1000000000008, 1)

INTO bookCopy  values (1109 ,1000000000009, 1)

INTO bookCopy  values (1110 ,1000000000010, 1)

INTO bookCopy  values (1111 ,1000000000011, 1)

INTO bookCopy  values (1112 ,1000000000012, 1)

INTO bookCopy  values (1113 ,1000000000013, 1)

INTO bookCopy  values (1114 ,1000000000014, 1)

INTO bookCopy  values (1115 ,1000000000015, 1)


SELECT * FROM dual;



CREATE TABLE loan (
barCode NUMBER NOT NULL,
issueDate DATE NOT NULL,
overdueDate DATE,
userId NUMBER NOT NULL,
                                              
CONSTRAINT fk_barCode_loan FOREIGN KEY (barCode) REFERENCES bookCopy(barCode),
CONSTRAINT fk_userId_loan FOREIGN KEY (userId) REFERENCES userLib(userId),
CONSTRAINT pk_loan PRIMARY KEY (barCode));
/*Insert data into the user table */
INSERT ALL
INTO loan  values ( 1401, '01-Feb-2007', '02-Feb-2007', 11111101)
INTO loan  values ( 1202, '01-Feb-2007', '02-Feb-2007', 11111101)
INTO loan  values ( 1302, '01-Feb-2007', '02-Feb-2007', 11111103)
INTO loan  values ( 1105, '01-Feb-2007', '02-Feb-2007', 11111104)
INTO loan  values ( 1205, '01-Feb-2007', '02-Feb-2007', 11111105)
INTO loan  values ( 1305, '01-Feb-2007', '02-Feb-2007', 11111106)

SELECT * FROM dual;


/*create reservation table */

CREATE TABLE reservation (
isbn NUMBER NOT NULL,
reservationDate DATE NOT NULL,
userId NUMBER NOT NULL,
CONSTRAINT fk_barCode_reservation FOREIGN KEY (isbn) REFERENCES book(isbn),
CONSTRAINT fk_userId_reservation FOREIGN KEY (userId) REFERENCES userLib(userId),
CONSTRAINT pk_reservation PRIMARY KEY (isbn, userId));
/*Insert data into the reservation table */

INSERT ALL
INTO reservation  values (1000000000001, '03-Feb-2007', 11111106)
INTO reservation  values (1000000000002, '04-Feb-2007',  11111107)
INTO reservation  values (1000000000005, '06-Feb-2007', 11111109)
INTO reservation  values (1000000000005, '07-Feb-2007', 11111110)
SELECT * FROM dual;


/*TASK 4 - Queries */
/* Search for a book by key words in book title and display all details of the book.
You should allow two key words in the query */
SELECT *
from book
where title LIKE '%Introduction%' OR title LIKE '%Advanced%';

/* Search for a book by author and display all details of the book. You should allow
partial matching of authors’ names */
SELECT * 
from book
where author LIKE '%Anthony%' OR title LIKE '%M%';

/* Search for a book by ISBN and display if it is available for loan */

SELECT bc.isbn, b.title
from bookcopy bc
left join book b
on bc.isbn = b.isbn
where bc.isbn = 1000000000002 and bc.available = 1;

/*Make a reservation for a book (i.e., to record which book is being reserved by
which user on a given date). */

INSERT INTO reservation
values(1401,'16-Apr-2020',11111110);

/* Produce a list of loans to users: display user name, user ID, book title and bar
codes for those books on loan */

SELECT u.name, u.userId, b.title, l.barCode
from loan l
left join userLib u on (l.userId = u.userId)
left join bookCopy bc on (bc.barCode = l.barCode)
left join book b on (bc.isbn = b.isbn)
where bc.available = 0;




select b.isbn, count(*)
from book b
left outer join bookcopy bc on (b.isbn = bc.isbn)
left outer join loan l on (bc.barcode = l.barcode)
group by b.isbn;


select *
from loan;

select *
from bookcopy;















