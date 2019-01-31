CREATE TABLE member
(
    member_id number UNIQUE NOT NULL,
    last_name VARCHAR2(25),
    first_name VARCHAR2(25) NOT NULL,
    adress VARCHAR2(100),
    city VARCHAR2(30),
    phone VARCHAR2(15), 
    join_date DATE NOT NULL DEFAULT SYSDATE,
    CONSTRAINT member_id PRIMARY KEY(member_id)
);

CREATE TABLE title
(
    title_id number(10) not NULL PRIMARY KEY UNIQUE,
    title VARCHAR2(60) not  NULL,
    desription VARCHAR2(400) not NULL,
    raiting VARCHAR2(4) CHECK
    (
        raiting = 'G' OR
        raiting = 'PG' OR 
        raiting = 'R' OR 
        raiting = 'NC17' OR 
        raiting = 'NR'
    ),
    category VARCHAR2(2) CHECK 
    (
        category = 'DRAMA' OR
        category = 'COMEDY' OR
        category = 'ACTION' OR
        category = 'CHILD' OR
        category = 'SCIFI' OR
        category = 'DOCUMENTARY'
    ),
    relase_date DATE
)

CREATE TABLE title_copy
(
    copy_id number(10) NOT NULL UNIQUE PRIMARY KEY,
    title_id number(10) NOT NULL UNIQUE PRIMARY KEY,
    status VARCHAR2(15) NOT NULL CHECK
    (
        status = 'AVALIABLE' OR
        status = 'DESTROYED' OR
        status = 'RENTED' OR 
        status = 'RESERVED'
    )
    FOREIGN KEY (title_id) REFERENCES title(title_id),
)

CREATE TABLE reservation
(
    res_date DATE not NULL PRIMARY KEY UNIQUE,
    member_id number(10) not  NULL PRIMARY KEY UNIQUE,
    title_id number(10) not NULL PRIMARY KEY,
    CONSTRAINT FK1 FOREIGN KEY(member_id) REFERENCES member(member_id),
    CONSTRAINT FK2 FOREIGN KEY(title_id) REFERENCES title(title_id)
)

