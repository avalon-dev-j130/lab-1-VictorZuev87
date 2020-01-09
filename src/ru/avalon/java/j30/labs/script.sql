/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */
create table Roles {
    id int(10) not null unique
        generated always as
        identity(start with 1, increment by 1),
    name varchar(255)  not null primary key 
};

create table UseInfo {
    id int(10) not null primary key
        generated always as
        identity(start with 1, increment by 1),
    name varchar(255),
    surname varchar(255)
};

create table User {
    id int(10) not null unique
        generated always as
        identity(start with 1, increment by 1),
    email varchar(255)  not null primary key,
    info int(10) not null unique
        references UserInfo(id),
    role int(10) references Roles(id)
    
};

create table Order {
    id int(10) not null primary key
        generated always as
        identity(start with 1, increment by 1),
    user int(10) not null 
        references User(id),
    created timestamp(8) not null 
};

create table Supplier {
    id int(10) not null unique
        generated always as
        identity(start with 1, increment by 1),
    name varchar(255) not null primary key,
    address varchar(255),
    phone varchar(255) not null,
    representative varchar(255),
};

create table Product {
    id int(10) not null unique
        generated always as
        identity(start with 1, increment by 1),
    code varchar(255) not null primary key,
    title varchar(255),
    supplier int(10) not null 
        references Supplier(id),
    initial_price double(10) not null,
    retail_value double(10) not null
};

create table Order2Product {
    order int(10) not null 
        references Order(id),
    product int(10) not null
        references Product(id),
    foreign key (order, product)
};
