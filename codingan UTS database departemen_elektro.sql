CREATE DATABASE departemen_elektro

-- Membuat Tabel Dosen
CREATE TABLE Dosen (
Id_dosen INT AUTO_INCREMENT,
Nama_dosen VARCHAR (100) NOT NULL,
Email_dosen VARCHAR (100) UNIQUE NOT NULL,
PRIMARY KEY (Id_dosen) 
);

INSERT INTO dosen ( Nama_dosen, Email_dosen)
VALUES
('Dr.Andi Wijaya','andi@departemenelektro.ac.id'),
('Dr.Agus Setiawan','agus@departemenelektro.ac.id'),
('Dr.Rina Kartika','rina@departemenelektro.ac.id');

SELECT * FROM dosen 

-- Membuat tabel Matakuliah
CREATE TABLE Mata_Kuliah (
Id_mk INT AUTO_INCREMENT,
Nama_mk VARCHAR (100) NOT NULL,
Sks INT NOT NULL,
PRIMARY KEY (Id_mk)
);

INSERT INTO Mata_Kuliah (Nama_mk, Sks)
VALUES 
('Basis Data','4'),
('Pemrograman','3'),
('Matematika Diskrit','2');

SELECT * FROM Mata_Kuliah

DROP TABLE mengajar
-- Membuat Tabel Mengajar
CREATE TABLE Mengajar (
Id_mengajar INT AUTO_INCREMENT,
Id_dosen INT NOT NULL,
Id_mk INT NOT NULL,
Semester VARCHAR (10) NOT NULL,
PRIMARY KEY (Id_mengajar),
FOREIGN KEY (Id_dosen) REFERENCES dosen (Id_dosen) ON DELETE CASCADE,
FOREIGN KEY (Id_mk) REFERENCES Mata_Kuliah (Id_mk) ON DELETE CASCADE
);

INSERT INTO Mengajar ( Id_dosen, Id_mk, Semester)
VALUES 
('1','1','Ganjil'),
('1','2','Genap'),
('2','1','Ganjil'),
('3','3','Genap'),
('3','1','Ganjil');

SELECT * FROM Mengajar


-- SOAl UTS

-- Soal D
UPDATE dosen
SET Nama_dosen = 'Dr. Andi Purnawan',
    Email_dosen = 'andiP@departemenelektro.ac.id'
WHERE Id_dosen = 2;

SELECT * FROM Dosen WHERE Id_dosen = 2

SELECT * FROM Dosen

-- Soal E
DELETE FROM Mengajar
WHERE semester = 'Genap';

SELECT * FROM mengajar 

-- Soal F
SELECT Dosen.Nama_dosen
FROM Dosen 
JOIN Mengajar ON Dosen.Id_dosen = Mengajar.Id_dosen 
JOIN Mata_Kuliah ON Mata_Kuliah.Id_mk = Mengajar.Id_mk
WHERE Mata_Kuliah.sks > 3;

-- Soal G
SELECT Mata_Kuliah.Nama_mk, COUNT(Mengajar.Id_dosen) AS Jumlah_Dosen
FROM Mata_Kuliah
JOIN Mengajar ON Mata_Kuliah.Id_mk = Mengajar.Id_mk
GROUP BY Mata_Kuliah.Nama_mk;

SELECT Dosen.Nama_dosen, mata_kuliah.Nama_mk
FROM dosen
JOIN mengajar ON dosen.Id_dosen = mengajar.id_dosen
JOIN mata_kuliah ON mengajar.id_mk = mata_kuliah.id_mk
WHERE semester = 'Ganjil';

