CREATE TABLE "users" (
    "id" uuid PRIMARY KEY,
    "first_name" varchar,
    "last_name" varchar,
    "email" varchar,
    "password" varchar,
    "age" int8,
    "genre" varchar,
    "country_id" uuid,
    "role_id" uuid
);

CREATE TABLE "countries" (
    "id" uuid PRIMARY KEY,
    "country" char(3)
);

CREATE TABLE "roles" ("id" uuid PRIMARY KEY, "name" varchar);

CREATE TABLE "courses" (
    "id" uuid PRIMARY KEY,
    "title" varchar,
    "description" varchar(250),
    "level_id" uuid,
    "teacher_id" uuid,
    "category_id" uuid
);

CREATE TABLE "levels" ("id" uuid PRIMARY KEY, "name" varchar);

CREATE TABLE "courses_videos" (
    "id" uuid PRIMARY KEY,
    "title" varchar,
    "url" varchar,
    "category_id" uuid
);

CREATE TABLE "categories" ("id" uuid PRIMARY KEY, "name" varchar);

ALTER TABLE
    "users"
ADD
    FOREIGN KEY ("country_id") REFERENCES "countries" ("id");

ALTER TABLE
    "users"
ADD
    FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE
    "courses"
ADD
    FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE
    "courses"
ADD
    FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE
    "courses_videos"
ADD
    FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE
    "courses"
ADD
    FOREIGN KEY ("teacher_id") REFERENCES "users" ("id");

INSERT INTO
    countries (id, country)
VALUES
('2db4003d-9231-4a80-b83f-bc9650f484ad', 'ARG');

INSERT INTO
    countries (id, country)
VALUES
('1b57ce93-7db5-4b95-8669-1af64e9a42f2', 'BRA');

insert into
    roles (id, name)
VALUES
(
        'dceb4fb3-97af-40ad-a2b7-495e97a5e4cd',
        'student'
    );

insert into
    roles (id, name)
VALUES
(
        '873a0ec8-e4f7-49b7-8507-d7ff8ba7d9da',
        'teacher'
    );

insert into
    levels (id, name)
VALUES
(
        '743dc547-16ff-4209-b128-0a8adb513513',
        'beginner'
    );

insert into
    levels (id, name)
VALUES
(
        '128368aa-a912-4096-a701-b9a35d8a874f',
        'advanced'
    );

insert into
    categories (id, name)
VALUES
('4b5bb786-ce51-4d16-8015-9227dcc1dbe0', 'basic');

insert into
    categories (id, name)
VALUES
(
        'a4491556-e341-4e52-b075-519b42cca2f9',
        'premium'
    );

insert into
    courses_videos (id, title, url, category_id)
VALUES
(
        '2d06c058-1200-4f09-8a38-28892a08d6b2',
        'test1',
        'url',
        '4b5bb786-ce51-4d16-8015-9227dcc1dbe0'
    );

insert into
    courses_videos (id, title, url, category_id)
VALUES
(
        'd466281a-4541-4635-a4bc-451843b750c2',
        'test2',
        'url',
        'a4491556-e341-4e52-b075-519b42cca2f9'
    );

insert into
    users (
        id,
        first_name,
        last_name,
        email,
        "password",
        age,
        genre,
        country_id,
        role_id
    )
VALUES
    (
        'b80619e8-2abd-4b40-9aad-44b6e7807042',
        'damian',
        'pinones',
        'damianpino@email.com',
        '12345',
        '25',
        'male',
        '2db4003d-9231-4a80-b83f-bc9650f484ad',
        'dceb4fb3-97af-40ad-a2b7-495e97a5e4cd'
    );

insert into
    users (
        id,
        first_name,
        last_name,
        email,
        "password",
        age,
        genre,
        country_id,
        role_id
    )
VALUES
    (
        '2d106dbf-3e29-4bdc-86e3-c6c1ef71c170',
        'leonardo',
        'benitez',
        'leobe@email.com',
        '2612',
        '30',
        'famale',
        '1b57ce93-7db5-4b95-8669-1af64e9a42f2',
        '873a0ec8-e4f7-49b7-8507-d7ff8ba7d9da'
    );

insert into
    courses (
        id,
        title,
        description,
        level_id,
        teacher_id,
        category_id
    )
VALUES
    (
        '743dc547-16ff-4209-b128-0a8adb513513',
        'mathematics1',
        'fundamental themes',
        '743dc547-16ff-4209-b128-0a8adb513513',
        '2d106dbf-3e29-4bdc-86e3-c6c1ef71c170',
        'a4491556-e341-4e52-b075-519b42cca2f9'
    );

insert into
    courses (
        id,
        title,
        description,
        level_id,
        teacher_id,
        category_id
    )
VALUES
    (
        '86aa5d69-8d77-48a9-afa1-28ba0e34ea2e',
        'chemistry',
        'chemistry of life',
        '743dc547-16ff-4209-b128-0a8adb513513',
        '2d106dbf-3e29-4bdc-86e3-c6c1ef71c170',
        '4b5bb786-ce51-4d16-8015-9227dcc1dbe0'
    );


-- Reto opcional!
select
    *
from
    courses c
    inner join levels l on c.level_id = l.id
    inner join users u on c.teacher_id = u.id
    inner join categories c2 on c.category_id = c2.id