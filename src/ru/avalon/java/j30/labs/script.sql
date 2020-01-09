/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */
create table Roles 
(
    id int not null unique
        generated always as
        identity(start with 1, increment by 1),
    name varchar(255)  not null primary key 
);

create table UserInfo 
(
    id int not null primary key
        generated always as
        identity(start with 1, increment by 1),
    name varchar(255),
    surname varchar(255)
);

create table Users 
(
    id int not null unique
        generated always as
        identity(start with 1, increment by 1),
    email varchar(255)  not null primary key,
    password varchar(255) not null,
    info int not null unique
        references UserInfo(id),
    roles int references Roles(id)
);

create table Orders 
(
    id int not null primary key
        generated always as
        identity(start with 1, increment by 1),
    users int not null 
        references Users(id),
    created timestamp not null 
);

create table Supplier 
(
    id int not null unique
        generated always as
        identity(start with 1, increment by 1),
    name varchar(255) not null primary key,
    address varchar(255),
    phone varchar(255) not null,
    representative varchar(255)
);

create table Product 
(
    id int not null unique
        generated always as
        identity(start with 1, increment by 1),
    code varchar(255) not null primary key,
    title varchar(255),
    supplier int not null 
        references Supplier(id),
    initial_price double not null,
    retail_value double not null
);

create table Order2Product 
(
    orders int not null 
        references Orders(id),
    product int not null
        references Product(id)
);

insert into Roles(name) 
       values('Alex');

insert into UserInfo(name, surname) 
       values('Alex', 'Smith');

insert into Users(email, password, info) 
       values('Alex@gmail.com', 'password', 1);

insert into Supplier(name, address, phone, representative) 
       values('Alex', 'Beverly Hills 1', '8-888-888888', 'Trump');

insert into Product(code, title, supplier, initial_price, retail_value) 
       values('333', 'Milk', 1, 4, 5);

insert into Orders(users, created) 
       values(1, '2020-01-09 20:55:00');

insert into Order2Product(orders, product) 
       values(1, 1);
