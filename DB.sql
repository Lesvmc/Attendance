CREATE TABLE Semesters (
    idSemester SERIAL PRIMARY KEY,
    Start DATE,
    "End" DATE
);

CREATE TABLE SubjectType (
    idType SERIAL PRIMARY KEY,
    Type VARCHAR(50)
);

CREATE TABLE Subjects (
    idSubject SERIAL PRIMARY KEY,
    Name VARCHAR(50),
    idType INTEGER REFERENCES SubjectType(idType),
    idSemester INTEGER REFERENCES Semesters(idSemester)
);

CREATE TABLE Positions (
    idPosition SERIAL PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Degrees (
    idDegree SERIAL PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Departments (
    idDepartment SERIAL PRIMARY KEY,
    Name VARCHAR(50),
    idFaculty INTEGER REFERENCES Faculties(idFaculty)
);

CREATE TABLE Faculties (
    idFaculty SERIAL PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Deans (
    idDean SERIAL PRIMARY KEY,
    Surname VARCHAR(50),
    Name VARCHAR(50)
);

CREATE TABLE Teachers (
    idTeacher SERIAL PRIMARY KEY,
    Surname VARCHAR(50),
    Name VARCHAR(50),
    Phone VARCHAR(20),
    idPosition INTEGER REFERENCES Positions(idPosition),
    idDegree INTEGER REFERENCES Degrees(idDegree)
);

CREATE TABLE Students (
    idStudents SERIAL PRIMARY KEY,
    Surname VARCHAR(50),
    Name VARCHAR(50),
    Phone VARCHAR(20),
    idSpecialty INTEGER REFERENCES Specialties(idSpecialty),
    idForm INTEGER REFERENCES FormsOfStudy(idForm),
    idDepartment INTEGER REFERENCES Departments(idDepartment),
    idGroup INTEGER REFERENCES Groups(idGroup),
    idSex INTEGER REFERENCES Sex(idSex)
);

CREATE TABLE Specialties (
    idSpecialty SERIAL PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Groups (
    idGroup SERIAL PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Classrooms (
    idClassroom SERIAL PRIMARY KEY,
    Number VARCHAR(10),
    Capacity INTEGER
);

CREATE TABLE FormsOfStudy (
    idForm SERIAL PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE AttendanceLog (
    id SERIAL PRIMARY KEY,
    idTeacher INTEGER REFERENCES Teachers(idTeacher),
    idSubject INTEGER REFERENCES Subjects(idSubject),
    idStudents INTEGER REFERENCES Students(idStudents),
    AttendanceDate DATE,
    idClassroom INTEGER REFERENCES Classrooms(idClassroom)
);

CREATE TABLE ExplanatoryNote (
    idNote SERIAL PRIMARY KEY,
    Description TEXT,
    Date DATE,
    idStudents INTEGER REFERENCES Students(idStudents),
    idSubject INTEGER REFERENCES Subjects(idSubject)
);

CREATE TABLE ReasonsForAbsence (
    idReasons SERIAL PRIMARY KEY,
    Reasons TEXT,
    idStudents INTEGER REFERENCES Students(idStudents),
    Date DATE
);

CREATE TABLE CertificateOfExpulsion (
    idCertificate SERIAL PRIMARY KEY,
    Date DATE,
    Hours_Of_Absences INTEGER,
    idStudents INTEGER REFERENCES Students(idStudents)
);


CREATE TABLE Sex (
    idSex SERIAL PRIMARY KEY,
    Name VARCHAR(20)
);





INSERT INTO Semesters (idSemester, "Start", "End") VALUES
(1, '2023-09-01', '2023-12-31'),
(2, '2024-01-15', '2024-05-31'),
(3, '2024-09-01', '2024-12-31'),
(4, '2025-01-15', '2025-05-31'),
(5, '2025-09-01', '2025-12-31'),
(6, '2026-01-15', '2026-05-31'),
(7, '2026-09-01', '2026-12-31'),
(8, '2027-01-15', '2027-05-31'),
(9, '2027-09-01', '2027-12-31'),
(10, '2028-01-15', '2028-05-31');



INSERT INTO Sex (idSex, Name) VALUES
(1, 'Мужской'),
(2, 'Женский'),


INSERT INTO SubjectType (idType, Type) VALUES
(1, 'Общеобразовательный'),
(2, 'Специальный'),
(3, 'Факультативный'),
(4, 'Практический'),
(5, 'Теоретический'),
(6, 'Междисциплинарный'),
(7, 'Общеобразовательный'),
(8, 'Специальный'),
(9, 'Факультативный'),
(10, 'Практический');



INSERT INTO Subjects (idSubject, Name, idType, idSemester) VALUES
(1, 'Русский язык', 1, 1),
(2, 'Математика', 1, 1),
(3, 'Физика', 2, 1),
(4, 'Информатика', 2, 1),
(5, 'Физическая культура', 3, 1),
(6, 'Экономика', 2, 2),
(7, 'Английский язык', 1, 2),
(8, 'Биология', 1, 2),
(9, 'Химия', 2, 2),
(10, 'Философия', 3, 2);


INSERT INTO Positions (idPosition, Name) VALUES
(1, 'Профессор'),
(2, 'Доцент'),
(3, 'Старший преподаватель'),
(4, 'Преподаватель'),
(5, 'Ассистент'),


INSERT INTO Degrees (idDegree, Name) VALUES
(1, 'Доктор наук'),
(2, 'Кандидат наук'),
(3, 'Магистр'),


INSERT INTO Departments (idDepartment, Name, idFaculty) VALUES
(1, 'Кафедра математики', 1),
(2, 'Кафедра физики', 1),
(3, 'Кафедра информатики', 1),
(4, 'Кафедра русского языка', 2),
(5, 'Кафедра экономики', 2),
(6, 'Кафедра иностранных языков', 2),
(7, 'Кафедра биологии', 3),
(8, 'Кафедра химии', 3),
(9, 'Кафедра философии', 3),
(10, 'Кафедра физической культуры', 3);


INSERT INTO Faculties (idFaculty, Name, idDean) VALUES
(1, 'Физико-математический', 1),
(2, 'Гуманитарный', 2),
(3, 'Естественно-научный', 3),
(4, 'Педагогический', 4),
(5, 'Экономический', 5),
(6, 'Юридический', 6),
(7, 'Медицинский', 7),
(8, 'Технический', 8),
(9, 'Сельскохозяйственный', 9),
(10, 'Архитектурный', 10);


INSERT INTO Teachers (idTeacher, Surname, Name, Phone, idPosition, idDegree) VALUES
(1, 'Иванов', 'Иван', '+7 (123) 456-78-90', 1, 1),
(2, 'Петров', 'Петр', '+7 (987) 654-32-10', 2, 2),
(3, 'Сидоров', 'Сергей', '+7 (456) 789-01-23', 3, 3),
(4, 'Смирнова', 'Анна', '+7 (321) 654-98-76', 4, 4),
(5, 'Кузнецов', 'Михаил', '+7 (789) 012-34-56', 5, 5),
(6, 'Соколова', 'Екатерина', '+7 (654) 321-98-76', 6, 6),
(7, 'Лебедев', 'Алексей', '+7 (234) 567-89-01', 7, 7),
(8, 'Орлова', 'Мария', '+7 (567) 890-12-34', 8, 8),
(9, 'Яковлев', 'Дмитрий', '+7 (890) 123-45-67', 9, 9),
(10, 'Павлова', 'Ольга', '+7 (456) 789-01-23', 10, 10);


INSERT INTO Deans (idDean, Surname, Name) VALUES
(1, 'Новиков', 'Максим'),
(2, 'Морозова', 'Татьяна'),
(3, 'Попов', 'Александр'),
(4, 'Семенова', 'Наталья'),
(5, 'Волков', 'Андрей'),
(6, 'Киселева', 'Юлия'),
(7, 'Власов', 'Сергей'),
(8, 'Ершова', 'Елена'),
(9, 'Зайцев', 'Дмитрий'),
(10, 'Михайлова', 'Ирина');


INSERT INTO Specialties (idSpecialty, Name) VALUES
(1, 'Математика'),
(2, 'Физика'),
(3, 'Информатика'),
(4, 'Русский язык и литература'),
(5, 'Экономика'),
(6, 'Английский язык'),
(7, 'Биология'),
(8, 'Химия'),
(9, 'Философия'),
(10, 'Физическая культура');


INSERT INTO Groups (idGroup, Name) VALUES
(1, 'М-101'),
(2, 'Ф-201'),
(3, 'И-301'),
(4, 'Р-401'),
(5, 'Э-501'),
(6, 'А-601'),
(7, 'Б-701'),
(8, 'Х-801'),
(9, 'Ф-901'),
(10, 'Ф-1001');


INSERT INTO Classrooms (idClassroom, Number, Capacity) VALUES
(1, '101', 30),
(2, '102', 35),
(3, '103', 25),
(4, '104', 40),
(5, '201', 45),
(6, '202', 50),
(7, '203', 28),
(8, '204', 32),
(9, '301', 38),
(10, '302', 42);


INSERT INTO FormsOfStudy (idForm, Name) VALUES
(1, 'Очная'),
(2, 'Заочная'),
(3, 'Вечерняя'),
(4, 'Дистанционная'),
(5, 'Очно-заочная'),
(6, 'Очная'),
(7, 'Заочная'),
(8, 'Вечерняя'),
(9, 'Дистанционная'),
(10, 'Очно-заочная');


INSERT INTO Students (idStudents, Surname, Name, Phone, idSpecialty, idForm, idDepartment, idGroup, idSex) VALUES
(1, 'Иванов', 'Андрей', '+7 (123) 456-78-90', 1, 1, 1, 1, 1),
(2, 'Петрова', 'Екатерина', '+7 (987) 654-32-10', 2, 2, 2, 2, 2),
(3, 'Сидоров', 'Максим', '+7 (456) 789-01-23', 3, 3, 3, 3, 1),
(4, 'Смирнова', 'Анна', '+7 (321) 654-98-76', 4, 4, 4, 4, 2),
(5, 'Кузнецов', 'Дмитрий', '+7 (789) 012-34-56', 5, 5, 5, 5, 1),
(6, 'Соколова', 'Мария', '+7 (654) 321-98-76', 6, 6, 6, 6, 2),
(7, 'Лебедев', 'Артем', '+7 (234) 567-89-01', 7, 7, 7, 7, 1),
(8, 'Орлова', 'Ольга', '+7 (567) 890-12-34', 8, 8, 8, 8, 2),
(9, 'Яковлев', 'Павел', '+7 (890) 123-45-67', 9, 9, 9, 9, 1),
(10, 'Павлова', 'Софья', '+7 (456) 789-01-23', 10, 10, 10, 10, 2);


INSERT INTO AttendanceLog (id, idTeacher, idSubject, idStudents, AttendanceDate, idClassroom) VALUES
(1, 1, 1, 1, '2023-09-15', 1),
(2, 2, 2, 2, '2023-09-16', 2),
(3, 3, 3, 3, '2023-09-17', 3),
(4, 4, 4, 4, '2023-09-18', 4),
(5, 5, 5, 5, '2023-09-19', 5),
(6, 6, 6, 6, '2023-09-20', 6),
(7, 7, 7, 7, '2023-09-21', 7),
(8, 8, 8, 8, '2023-09-22', 8),
(9, 9, 9, 9, '2023-09-23', 9),
(10, 10, 10, 10, '2023-09-24', 10);


INSERT INTO ExplanatoryNote (idNote, Description, Date, idStudents, idSubject) VALUES
(1, 'Пропустил занятие по болезни', '2023-09-16', 1, 1),
(2, 'Задерживался из-за семейных обстоятельств', '2023-09-17', 2, 2),
(3, 'Участвовал в научной конференции', '2023-09-18', 3, 3),
(4, 'Плохое самочувствие', '2023-09-19', 4, 4),
(5, 'Посещал спортивные соревнования', '2023-09-20', 5, 5),
(6, 'Семейные обстоятельства', '2023-09-21', 6, 6),
(7, 'Участвовал в олимпиаде', '2023-09-22', 7, 7),
(8, 'Болезнь', '2023-09-23', 8, 8),
(9, 'Командировка', '2023-09-24', 9, 9),
(10, 'Прохождение медкомиссии', '2023-09-25', 10, 10);


INSERT INTO ReasonsForAbsence (idReasons, Reasons, idStudents, Date) VALUES
(1, 'Болезнь', 1, '2023-09-16'),
(2, 'Семейные обстоятельства', 2, '2023-09-17'),
(3, 'Участие в конференции', 3, '2023-09-18'),
(4, 'Плохое самочувствие', 4, '2023-09-19'),
(5, 'Спортивные соревнования', 5, '2023-09-20'),
(6, 'Семейные обстоятельства', 6, '2023-09-21'),
(7, 'Участие в олимпиаде', 7, '2023-09-22'),
(8, 'Болезнь', 8, '2023-09-23'),
(9, 'Командировка', 9, '2023-09-24'),