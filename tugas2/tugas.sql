//1. Membuat Database Baru (dbpegawai)
MariaDB [(none)]> CREATE DATABASE dbpegawai;
Query OK, 1 row affected (0.001 sec)

//2. Membuka Database(dbpegawai)
MariaDB [(none)]> USE dbpegawai;
Database changed

//3 Membuat Tabel baru(divisi)
MariaDB [dbpegawai]> CREATE TABLE divisi(
    -> id int primary key auto_increment,
    -> nama varchar(30) not null unique);
Query OK, 0 rows affected (0.018 sec)

//4. Menampilkan Desk Tabel divisi
MariaDB [dbpegawai]> DESC divisi;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama  | varchar(30) | NO   | UNI | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
2 rows in set (0.015 sec)

//5. Membuat tabel Baru(jabatan)
MariaDB [dbpegawai]> CREATE TABLE jabatan(
    -> id int primary key auto_increment,
    -> nama varchar(30) not null unique);
Query OK, 0 rows affected (0.017 sec)


//6. Menampilkan Desk Tabel jabatan
MariaDB [dbpegawai]> DESC jabatan;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama  | varchar(30) | NO   | UNI | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
2 rows in set (0.011 sec)\

//7 Membuat tabel Baru(pegawai)
Sesuai Desk soal
MariaDB [dbpegawai]> CREATE TABLE pegawai(
    -> id int primary key auto_increment,
    -> nip char(5) NOT NULL UNIQUE,
    -> nama VARCHAR(30) NOT NULL,
    -> gender ENUM ('Laki-Laki','Perempuan') NOT NULL,
    -> tmp_lahir VARCHAR(30) NOT NULL,
    -> tgl_lahir DATE NOT NULL,
    -> iddivisi INT NOT NULL REFERENCES divisi(id),
    -> idjabatan INT NOT NULL REFERENCES jabatan(id),
    -> alamat TEXT);
Query OK, 0 rows affected (0.022 sec)

//8. Menampilkan Desk Tabel(pegawai)
MariaDB [dbpegawai]> DESC pegawai;
+-----------+-------------------------------+------+-----+---------+----------------+
| Field     | Type                          | Null | Key | Default | Extra          |
+-----------+-------------------------------+------+-----+---------+----------------+
| id        | int(11)                       | NO   | PRI | NULL    | auto_increment |
| nip       | char(5)                       | NO   | UNI | NULL    |                |
| nama      | varchar(30)                   | NO   |     | NULL    |                |
| gender    | enum('Laki-Laki','Perempuan') | NO   |     | NULL    |                |
| tmp_lahir | varchar(30)                   | NO   |     | NULL    |                |
| tgl_lahir | date                          | NO   |     | NULL    |                |
| iddivisi  | int(11)                       | NO   |     | NULL    |                |
| idjabatan | int(11)                       | NO   |     | NULL    |                |
| alamat    | text                          | YES  |     | NULL    |                |
+-----------+-------------------------------+------+-----+---------+----------------+
9 rows in set (0.006 sec)

//9. Menampilkan Tabel-tabel yang ada di dbpegawai
MariaDB [dbpegawai]> SHOW TABLES;
+---------------------+
| Tables_in_dbpegawai |
+---------------------+
| divisi              |
| jabatan             |
| pegawai             |
+---------------------+
3 rows in set (0.001 sec)


//10.Menginput data Divisi (SDM,Keuangan,Marketing)
MariaDB [dbpegawai]> INSERT INTO divisi VALUES
    -> ('','SDM'), ('','Keuangan'),('','Marketing'),('','IT');
Query OK, 4 rows affected, 4 warnings (0.012 sec)
Records: 4  Duplicates: 0  Warnings: 4

//11.Menampilkan seluruh data divisi
MariaDB [dbpegawai]> SELECT * FROM divisi;
+----+-----------+
| id | nama      |
+----+-----------+
|  4 | IT        |
|  2 | Keuangan  |
|  3 | Marketing |
|  1 | SDM       |
+----+-----------+
4 rows in set (0.001 sec)

//12.Menginput Data jabatan(Direktur,Manajer,Asisten Manajer, Staff)
MariaDB [dbpegawai]> INSERT INTO jabatan VALUES
    -> ('','Direktur'),('','Manajer'),('','Asisten Manajer'),('','Staff');
Query OK, 4 rows affected, 4 warnings (0.010 sec)
Records: 4  Duplicates: 0  Warnings: 4

//13.Menampilkan seluruh data jabatan
MariaDB [dbpegawai]> SELECT * FROM jabatan;
+----+-----------------+
| id | nama            |
+----+-----------------+
|  3 | Asisten Manajer |
|  1 | Direktur        |
|  2 | Manajer         |
|  4 | Staff           |
+----+-----------------+
4 rows in set (0.001 sec)

//14. Input 20 orang pegawai ( 1 divisi 5 orang, untuk gender dan jabatan diacak)
MariaDB [dbpegawai]> INSERT INTO pegawai(
    -> nip,nama,gender,tmp_lahir,tgl_lahir,iddivisi,idjabatan,alamat) VALUES
    -> ('11111','Muhammad Kasim','Laki-Laki','Depok','2004-03-01',4,1,'Bekasi'),
    -> ('11112','Aziz Santoso','Laki-Laki','Jakarta','1970-03-01',4,1,'Tangerang'),
    -> ('11113','Faras Susanti','Perempuan','Bali','1972-03-01',4,3,'Jakarta'),
    -> ('11114','Asep Saepulloh','Laki-Laki','Solo','1980-03-01',4,2,'Jakarta'),
    -> ('11115','Ussy Silalatahi','Perempuan','Tangeran','1981-04-11',4,4,'Depok'),
    -> ('11116','Siti Khorunnisa','Perempuan','Tangerang','1980-09-02',3,1,'Depok'),
    -> ('11117','Ummi Nur jannah','Perempuan','Jakarta','1973-09-02',3,2,'Jakarta'),
    -> ('11118','Barok Asep','Laki-Laki','Bandung','1974-09-02',3,2,'Depok'),
    -> ('11119','Muhammad Arief','Laki-Laki','Bekasi','1980-09-02',3,3,'Depok'),
    -> ('11120','Faris Sarah','Perempuan','Jakarta','1977-08-09',3,4,'Banten'),
    -> ('11121','Ruqoyyah Saedi','Perempuan','Bali','1971-03-01',2,1,'Bali'),
    -> ('11122','Bara Santoso','Laki-laki','Papua','1980-01-03',2,2,'Tangerang'),
    -> ('11123','Jajang Jaenudin','Laki-laki','Bogor','1975-11-09',2,3,'Depok'),
    -> ('11124','Alisa Natasya','Perempuan','Jakarta','1970-10-09',2,4,'Bekasi'),
    -> ('11125','Muhammad Umar','Laki-Laki','Yaman','1979-08-12',2,4,'Bekasi'),
    -> ('11126','Shelly Santoso','Perempuan','Medan','1979-09-11',1,1,'Bekasi'),
    -> ('11127','Asep Mubarok','Laki-Laki','Aceh','1988-09-04',1,2,'Malang'),
    -> ('11128','Siska Santoso','Perempuan','Bima','1988-09-04',1,2,'Malang'),
    -> ('11129','Muhammad Thoha','Laki-Laki','Jakarta','1986-04-04',1,3,'Malang'),
    -> ('11130','Aini Ainul Yaqin','Perempuan','Jakarta','1978-12-01',1,4,'Malang');
Query OK, 20 rows affected (0.020 sec)

//15. Menampilkan seluruh Data pegawai
MariaDB [dbpegawai]> SELECt * FROM pegawai;
+----+-------+------------------+-----------+-----------+------------+----------+-----------+-----------+
| id | nip   | nama             | gender    | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat    |
+----+-------+------------------+-----------+-----------+------------+----------+-----------+-----------+
|  1 | 11111 | Muhammad Kasim   | Laki-Laki | Depok     | 2004-03-01 |        4 |         1 | Bekasi    |
|  2 | 11112 | Aziz Santoso     | Laki-Laki | Jakarta   | 1970-03-01 |        4 |         1 | Tangerang |
|  3 | 11113 | Faras Susanti    | Perempuan | Bali      | 1972-03-01 |        4 |         3 | Jakarta   |
|  4 | 11114 | Asep Saepulloh   | Laki-Laki | Solo      | 1980-03-01 |        4 |         2 | Jakarta   |
|  5 | 11115 | Ussy Silalatahi  | Perempuan | Tangeran  | 1981-04-11 |        4 |         4 | Depok     |
|  6 | 11116 | Siti Khorunnisa  | Perempuan | Tangerang | 1980-09-02 |        3 |         1 | Depok     |
|  7 | 11117 | Ummi Nur jannah  | Perempuan | Jakarta   | 1973-09-02 |        3 |         2 | Jakarta   |
|  8 | 11118 | Barok Asep       | Laki-Laki | Bandung   | 1974-09-02 |        3 |         2 | Depok     |
|  9 | 11119 | Muhammad Arief   | Laki-Laki | Bekasi    | 1980-09-02 |        3 |         3 | Depok     |
| 10 | 11120 | Faris Sarah      | Perempuan | Jakarta   | 1977-08-09 |        3 |         4 | Banten    |
| 11 | 11121 | Ruqoyyah Saedi   | Perempuan | Bali      | 1971-03-01 |        2 |         1 | Bali      |
| 12 | 11122 | Bara Santoso     | Laki-Laki | Papua     | 1980-01-03 |        2 |         2 | Tangerang |
| 13 | 11123 | Jajang Jaenudin  | Laki-Laki | Bogor     | 1975-11-09 |        2 |         3 | Depok     |
| 14 | 11124 | Alisa Natasya    | Perempuan | Jakarta   | 1970-10-09 |        2 |         4 | Bekasi    |
| 15 | 11125 | Muhammad Umar    | Laki-Laki | Yaman     | 1979-08-12 |        2 |         4 | Bekasi    |
| 16 | 11126 | Shelly Santoso   | Perempuan | Medan     | 1979-09-11 |        1 |         1 | Bekasi    |
| 17 | 11127 | Asep Mubarok     | Laki-Laki | Aceh      | 1988-09-04 |        1 |         2 | Malang    |
| 18 | 11128 | Siska Santoso    | Perempuan | Bima      | 1988-09-04 |        1 |         2 | Malang    |
| 19 | 11129 | Muhammad Thoha   | Laki-Laki | Jakarta   | 1986-04-04 |        1 |         3 | Malang    |
| 20 | 11130 | Aini Ainul Yaqin | Perempuan | Jakarta   | 1978-12-01 |        1 |         4 | Malang    |
+----+-------+------------------+-----------+-----------+------------+----------+-----------+-----------+
20 rows in set (0.001 sec)

//16. Ubah data 5 orang pegawai (dengan ketentuan ubah 3 kolom(bebas))
MariaDB [dbpegawai]> UPDATE pegawai
    -> SET tmp_lahir = 'Bali', idjabatan = 4, alamat = 'Depok'
    -> WHERE id IN (19,1,3,8,18);
Query OK, 5 rows affected (0.015 sec)
Rows matched: 5  Changed: 5  Warnings: 0

//17. Menghapus dua data paling akhir
MariaDB [dbpegawai]> DELETE FROM pegawai
    -> ORDER BY id DESC
    -> LIMIT 2;
Query OK, 2 rows affected (0.010 sec)

//18. Menambahkan Kolom Berat Badan sesuai deskripsi
MariaDB [dbpegawai]> ALTER TABLE pegawai
    -> ADD COLUMN IF NOT EXISTS
    -> berat_badan FLOAT NOT NULL;
Query OK, 0 rows affected (0.024 sec)
Records: 0  Duplicates: 0  Warnings: 0

//menginput data secara random
MariaDB [dbpegawai]> UPDATE pegawai
    ->      SET berat_badan = FLOOR(RAND() * 80) + 40;
Query OK, 18 rows affected (0.010 sec)
Rows matched: 18  Changed: 18  Warnings: 0

MariaDB [dbpegawai]> SELECT * FROM pegawai;
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat    | berat_badan | 
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+
|  1 | 11111 | Muhammad Kasim  | Laki-Laki     | Bali      | 2004-03-01 |        4 |         4 | Depok     |          82 |  
|  2 | 11112 | Aziz Santoso    | Laki-Laki     | Jakarta   | 1970-03-01 |        4 |         1 | Tangerang |          55 |   
|  3 | 11113 | Faras Susanti   | Perempuan     | Bali      | 1972-03-01 |        4 |         4 | Depok     |          72 |   
|  4 | 11114 | Asep Saepulloh  | Laki-Laki     | Solo      | 1980-03-01 |        4 |         2 | Jakarta   |          73 |   
|  5 | 11115 | Ussy Silalatahi | Perempuan     | Tangeran  | 1981-04-11 |        4 |         4 | Depok     |         111 |   
|  6 | 11116 | Siti Khorunnisa | Perempuan     | Tangerang | 1980-09-02 |        3 |         1 | Depok     |          58 |   
|  7 | 11117 | Ummi Nur jannah | Perempuan     | Jakarta   | 1973-09-02 |        3 |         2 | Jakarta   |          74 |   
|  8 | 11118 | Barok Asep      | Laki-Laki     | Bali      | 1974-09-02 |        3 |         4 | Depok     |          80 |   
|  9 | 11119 | Muhammad Arief  | Laki-Laki     | Bekasi    | 1980-09-02 |        3 |         3 | Depok     |          57 |   
| 10 | 11120 | Faris Sarah     | Perempuan     | Jakarta   | 1977-08-09 |        3 |         4 | Banten    |          85 |   
| 11 | 11121 | Ruqoyyah Saedi  | Perempuan     | Bali      | 1971-03-01 |        2 |         1 | Bali      |          57 |  
| 12 | 11122 | Bara Santoso    | Laki-Laki     | Papua     | 1980-01-03 |        2 |         2 | Tangerang |          69 |   
| 13 | 11123 | Jajang Jaenudin | Laki-Laki     | Bogor     | 1975-11-09 |        2 |         3 | Depok     |          55 |   
| 14 | 11124 | Alisa Natasya   | Perempuan     | Jakarta   | 1970-10-09 |        2 |         4 | Bekasi    |         110 |   
| 15 | 11125 | Muhammad Umar   | Laki-Laki     | Yaman     | 1979-08-12 |        2 |         4 | Bekasi    |         105 |  
| 16 | 11126 | Shelly Santoso  | Perempuan     | Medan     | 1979-09-11 |        1 |         1 | Bekasi    |          75 |  
| 17 | 11127 | Asep Mubarok    | Laki-Laki     | Aceh      | 1988-09-04 |        1 |         2 | Malang    |          99 |  
| 18 | 11128 | Siska Santoso   | Perempuan     | Bali      | 1988-09-04 |        1 |         4 | Depok     |          70 |  
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+
18 rows in set (0.001 sec)

//19. Gunakan alter tabel pada tabel pegawai untuk menambahkan kolom baru umur
MariaDB [dbpegawai]> ALTER TABLE pegawai
    -> ADD COLUMN IF NOT EXISTS
    -> umur INT NOT NULL;
Query OK, 0 rows affected (0.015 sec)
Records: 0  Duplicates: 0  Warnings: 0

//mengisi dengan umur random(querry dapet searching)
MariaDB [dbpegawai]> UPDATE pegawai
    -> SET umur = FLOOR(RAND() * 40) + 20;
Query OK, 18 rows affected (0.016 sec)
Rows matched: 18  Changed: 18  Warnings: 0

MariaDB [dbpegawai]> SELECT * FROM pegawai;
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat    | berat_badan | umur |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
|  1 | 11111 | Muhammad Kasim  | Laki-Laki     | Bali      | 2004-03-01 |        4 |         4 | Depok     |          82 |   42 |
|  2 | 11112 | Aziz Santoso    | Laki-Laki     | Jakarta   | 1970-03-01 |        4 |         1 | Tangerang |          55 |   40 |
|  3 | 11113 | Faras Susanti   | Perempuan     | Bali      | 1972-03-01 |        4 |         4 | Depok     |          72 |   56 |
|  4 | 11114 | Asep Saepulloh  | Laki-Laki     | Solo      | 1980-03-01 |        4 |         2 | Jakarta   |          73 |   21 |
|  5 | 11115 | Ussy Silalatahi | Perempuan     | Tangeran  | 1981-04-11 |        4 |         4 | Depok     |         111 |   36 |
|  6 | 11116 | Siti Khorunnisa | Perempuan     | Tangerang | 1980-09-02 |        3 |         1 | Depok     |          58 |   57 |
|  7 | 11117 | Ummi Nur jannah | Perempuan     | Jakarta   | 1973-09-02 |        3 |         2 | Jakarta   |          74 |   38 |
|  8 | 11118 | Barok Asep      | Laki-Laki     | Bali      | 1974-09-02 |        3 |         4 | Depok     |          80 |   40 |
|  9 | 11119 | Muhammad Arief  | Laki-Laki     | Bekasi    | 1980-09-02 |        3 |         3 | Depok     |          57 |   26 |
| 10 | 11120 | Faris Sarah     | Perempuan     | Jakarta   | 1977-08-09 |        3 |         4 | Banten    |          85 |   33 |
| 11 | 11121 | Ruqoyyah Saedi  | Perempuan     | Bali      | 1971-03-01 |        2 |         1 | Bali      |          57 |   24 |
| 12 | 11122 | Bara Santoso    | Laki-Laki     | Papua     | 1980-01-03 |        2 |         2 | Tangerang |          69 |   42 |
| 13 | 11123 | Jajang Jaenudin | Laki-Laki     | Bogor     | 1975-11-09 |        2 |         3 | Depok     |          55 |   37 |
| 14 | 11124 | Alisa Natasya   | Perempuan     | Jakarta   | 1970-10-09 |        2 |         4 | Bekasi    |         110 |   41 |
| 15 | 11125 | Muhammad Umar   | Laki-Laki     | Yaman     | 1979-08-12 |        2 |         4 | Bekasi    |         105 |   36 |
| 16 | 11126 | Shelly Santoso  | Perempuan     | Medan     | 1979-09-11 |        1 |         1 | Bekasi    |          75 |   37 |
| 17 | 11127 | Asep Mubarok    | Laki-Laki     | Aceh      | 1988-09-04 |        1 |         2 | Malang    |          99 |   58 |
| 18 | 11128 | Siska Santoso   | Perempuan     | Bali      | 1988-09-04 |        1 |         4 | Depok     |          70 |   39 |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
18 rows in set (0.001 sec)


//20.Mengubah kolom gender menjadi jenis_kelamin
MariaDB [dbpegawai]> ALTER TABLE pegawai
    -> CHANGE COLUMN gender jenis_kelamin ENUM('Laki-Laki','Perempuan') NOT NULL;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

//21. Menampilkan Kolom(nip,nama,jenis_kelamin,alamat)
MariaDB [dbpegawai]> SELECT nip,nama,jenis_kelamin,alamat FROM pegawai;
+-------+-----------------+---------------+-----------+
| nip   | nama            | jenis_kelamin | alamat    |
+-------+-----------------+---------------+-----------+
| 11111 | Muhammad Kasim  | Laki-Laki     | Depok     |
| 11112 | Aziz Santoso    | Laki-Laki     | Tangerang |
| 11113 | Faras Susanti   | Perempuan     | Depok     |
| 11114 | Asep Saepulloh  | Laki-Laki     | Jakarta   |
| 11115 | Ussy Silalatahi | Perempuan     | Depok     |
| 11116 | Siti Khorunnisa | Perempuan     | Depok     |
| 11117 | Ummi Nur jannah | Perempuan     | Jakarta   |
| 11118 | Barok Asep      | Laki-Laki     | Depok     |
| 11119 | Muhammad Arief  | Laki-Laki     | Depok     |
| 11120 | Faris Sarah     | Perempuan     | Banten    |
| 11121 | Ruqoyyah Saedi  | Perempuan     | Bali      |
| 11122 | Bara Santoso    | Laki-Laki     | Tangerang |
| 11123 | Jajang Jaenudin | Laki-Laki     | Depok     |
| 11124 | Alisa Natasya   | Perempuan     | Bekasi    |
| 11125 | Muhammad Umar   | Laki-Laki     | Bekasi    |
| 11126 | Shelly Santoso  | Perempuan     | Bekasi    |
| 11127 | Asep Mubarok    | Laki-Laki     | Malang    |
| 11128 | Siska Santoso   | Perempuan     | Depok     |
+-------+-----------------+---------------+-----------+
18 rows in set (0.001 sec)

//22. Menampilkan baris dengan jenis_kelamin laki-laki
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> WHERE jenis_kelamin LIKE '%Laki-Laki';
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat    | berat_badan | umur |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
|  1 | 11111 | Muhammad Kasim  | Laki-Laki     | Bali      | 2004-03-01 |        4 |         4 | Depok     |          82 |   42 |
|  2 | 11112 | Aziz Santoso    | Laki-Laki     | Jakarta   | 1970-03-01 |        4 |         1 | Tangerang |          55 |   40 |
|  4 | 11114 | Asep Saepulloh  | Laki-Laki     | Solo      | 1980-03-01 |        4 |         2 | Jakarta   |          73 |   21 |
|  8 | 11118 | Barok Asep      | Laki-Laki     | Bali      | 1974-09-02 |        3 |         4 | Depok     |          80 |   40 |
|  9 | 11119 | Muhammad Arief  | Laki-Laki     | Bekasi    | 1980-09-02 |        3 |         3 | Depok     |          57 |   26 |
| 12 | 11122 | Bara Santoso    | Laki-Laki     | Papua     | 1980-01-03 |        2 |         2 | Tangerang |          69 |   42 |
| 13 | 11123 | Jajang Jaenudin | Laki-Laki     | Bogor     | 1975-11-09 |        2 |         3 | Depok     |          55 |   37 |
| 15 | 11125 | Muhammad Umar   | Laki-Laki     | Yaman     | 1979-08-12 |        2 |         4 | Bekasi    |         105 |   36 |
| 17 | 11127 | Asep Mubarok    | Laki-Laki     | Aceh      | 1988-09-04 |        1 |         2 | Malang    |          99 |   58 |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
9 rows in set (0.001 sec)

//bisa juga dengan querry lain

MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> WHERE jenis_kelamin = 'Laki-Laki';
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat    | berat_badan | umur |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
|  1 | 11111 | Muhammad Kasim  | Laki-Laki     | Bali      | 2004-03-01 |        4 |         4 | Depok     |          82 |   42 |
|  2 | 11112 | Aziz Santoso    | Laki-Laki     | Jakarta   | 1970-03-01 |        4 |         1 | Tangerang |          55 |   40 |
|  4 | 11114 | Asep Saepulloh  | Laki-Laki     | Solo      | 1980-03-01 |        4 |         2 | Jakarta   |          73 |   21 |
|  8 | 11118 | Barok Asep      | Laki-Laki     | Bali      | 1974-09-02 |        3 |         4 | Depok     |          80 |   40 |
|  9 | 11119 | Muhammad Arief  | Laki-Laki     | Bekasi    | 1980-09-02 |        3 |         3 | Depok     |          57 |   26 |
| 12 | 11122 | Bara Santoso    | Laki-Laki     | Papua     | 1980-01-03 |        2 |         2 | Tangerang |          69 |   42 |
| 13 | 11123 | Jajang Jaenudin | Laki-Laki     | Bogor     | 1975-11-09 |        2 |         3 | Depok     |          55 |   37 |
| 15 | 11125 | Muhammad Umar   | Laki-Laki     | Yaman     | 1979-08-12 |        2 |         4 | Bekasi    |         105 |   36 |
| 17 | 11127 | Asep Mubarok    | Laki-Laki     | Aceh      | 1988-09-04 |        1 |         2 | Malang    |          99 |   58 |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
9 rows in set (0.008 sec)

//23. Menampilkan iddivisi IT/4 gender/jenis_kelamin Perempuan
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> WHERE iddivisi = 4 AND jenis_kelamin = 'Perempuan';
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat | berat_badan | umur |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
|  3 | 11113 | Faras Susanti   | Perempuan     | Bali      | 1972-03-01 |        4 |         4 | Depok  |          72 |   56 |
|  5 | 11115 | Ussy Silalatahi | Perempuan     | Tangeran  | 1981-04-11 |        4 |         4 | Depok  |         111 |   36 |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
2 rows in set (0.011 sec)

//atau dengan querry
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> WHERE iddivisi = (SELECT id FROM divisi WHERE nama = 'IT')
    -> AND jenis_kelamin = 'Perempuan';
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat | berat_badan | umur |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
|  3 | 11113 | Faras Susanti   | Perempuan     | Bali      | 1972-03-01 |        4 |         4 | Depok  |          72 |   56 |
|  5 | 11115 | Ussy Silalatahi | Perempuan     | Tangeran  | 1981-04-11 |        4 |         4 | Depok  |         111 |   36 |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
2 rows in set (0.009 sec)

//24. Menampilkan baris tertentu(umur > 30 dan tmp_lahir = jakarta)
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> WHERE umur > 30 AND tmp_lahir = 'Jakarta';
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat    | berat_badan | umur |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
|  2 | 11112 | Aziz Santoso    | Laki-Laki     | Jakarta   | 1970-03-01 |        4 |         1 | Tangerang |          55 |   40 |
|  7 | 11117 | Ummi Nur jannah | Perempuan     | Jakarta   | 1973-09-02 |        3 |         2 | Jakarta   |          74 |   38 |
| 10 | 11120 | Faris Sarah     | Perempuan     | Jakarta   | 1977-08-09 |        3 |         4 | Banten    |          85 |   33 |
| 14 | 11124 | Alisa Natasya   | Perempuan     | Jakarta   | 1970-10-09 |        2 |         4 | Bekasi    |         110 |   41 |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
4 rows in set (0.008 sec)

//25. Menampilkan baris(iddivsi = 3/marketing, umur > 30, jenis-kelamin perempuan)
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> WHERE iddivisi = 3 AND umur > 30 AND jenis_kelamin = 'Perempuan';
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+---------+-------------+------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat  | berat_badan | umur |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+---------+-------------+------+
|  6 | 11116 | Siti Khorunnisa | Perempuan     | Tangerang | 1980-09-02 |        3 |         1 | Depok   |          58 |   57 |
|  7 | 11117 | Ummi Nur jannah | Perempuan     | Jakarta   | 1973-09-02 |        3 |         2 | Jakarta |          74 |   38 |
| 10 | 11120 | Faris Sarah     | Perempuan     | Jakarta   | 1977-08-09 |        3 |         4 | Banten  |          85 |   33 |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+---------+-------------+------+
3 rows in set (0.001 sec)

//26.Menampilkan nip(klausa key)
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> WHERE nip = '11111';
+----+-------+----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
| id | nip   | nama           | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat | berat_badan | umur |
+----+-------+----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
|  1 | 11111 | Muhammad Kasim | Laki-Laki     | Bali      | 2004-03-01 |        4 |         4 | Depok  |          82 |   42 |
+----+-------+----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
1 row in set (0.001 sec)

//27. Menampilkan jenis_kelamin(klausa non key)
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> WHERE jenis_kelamin = 'Laki-Laki';
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat    | berat_badan | umur |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
|  1 | 11111 | Muhammad Kasim  | Laki-Laki     | Bali      | 2004-03-01 |        4 |         4 | Depok     |          82 |   42 |
|  2 | 11112 | Aziz Santoso    | Laki-Laki     | Jakarta   | 1970-03-01 |        4 |         1 | Tangerang |          55 |   40 |
|  4 | 11114 | Asep Saepulloh  | Laki-Laki     | Solo      | 1980-03-01 |        4 |         2 | Jakarta   |          73 |   21 |
|  8 | 11118 | Barok Asep      | Laki-Laki     | Bali      | 1974-09-02 |        3 |         4 | Depok     |          80 |   40 |
|  9 | 11119 | Muhammad Arief  | Laki-Laki     | Bekasi    | 1980-09-02 |        3 |         3 | Depok     |          57 |   26 |
| 12 | 11122 | Bara Santoso    | Laki-Laki     | Papua     | 1980-01-03 |        2 |         2 | Tangerang |          69 |   42 |
| 13 | 11123 | Jajang Jaenudin | Laki-Laki     | Bogor     | 1975-11-09 |        2 |         3 | Depok     |          55 |   37 |
| 15 | 11125 | Muhammad Umar   | Laki-Laki     | Yaman     | 1979-08-12 |        2 |         4 | Bekasi    |         105 |   36 |
| 17 | 11127 | Asep Mubarok    | Laki-Laki     | Aceh      | 1988-09-04 |        1 |         2 | Malang    |          99 |   58 |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
9 rows in set (0.000 sec)

//28.Menampilkan beberapa NIP(klausa IN)
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> WHERE nip IN('11111','11112','11113');
+----+-------+----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
| id | nip   | nama           | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat    | berat_badan | umur |
+----+-------+----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
|  1 | 11111 | Muhammad Kasim | Laki-Laki     | Bali      | 2004-03-01 |        4 |         4 | Depok     |          82 |   42 |
|  2 | 11112 | Aziz Santoso   | Laki-Laki     | Jakarta   | 1970-03-01 |        4 |         1 | Tangerang |          55 |   40 |
|  3 | 11113 | Faras Susanti  | Perempuan     | Bali      | 1972-03-01 |        4 |         4 | Depok     |          72 |   56 |
+----+-------+----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
3 rows in set (0.008 sec)

//29. Menampilkan beberapa tempat lahir(NOT IN)
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> WHERE tmp_lahir NOT IN('Jakarta','Depok','Bali');
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat    | berat_badan | umur |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
|  4 | 11114 | Asep Saepulloh  | Laki-Laki     | Solo      | 1980-03-01 |        4 |         2 | Jakarta   |          73 |   21 |
|  5 | 11115 | Ussy Silalatahi | Perempuan     | Tangeran  | 1981-04-11 |        4 |         4 | Depok     |         111 |   36 |
|  6 | 11116 | Siti Khorunnisa | Perempuan     | Tangerang | 1980-09-02 |        3 |         1 | Depok     |          58 |   57 |
|  9 | 11119 | Muhammad Arief  | Laki-Laki     | Bekasi    | 1980-09-02 |        3 |         3 | Depok     |          57 |   26 |
| 12 | 11122 | Bara Santoso    | Laki-Laki     | Papua     | 1980-01-03 |        2 |         2 | Tangerang |          69 |   42 |
| 13 | 11123 | Jajang Jaenudin | Laki-Laki     | Bogor     | 1975-11-09 |        2 |         3 | Depok     |          55 |   37 |
| 15 | 11125 | Muhammad Umar   | Laki-Laki     | Yaman     | 1979-08-12 |        2 |         4 | Bekasi    |         105 |   36 |
| 16 | 11126 | Shelly Santoso  | Perempuan     | Medan     | 1979-09-11 |        1 |         1 | Bekasi    |          75 |   37 |
| 17 | 11127 | Asep Mubarok    | Laki-Laki     | Aceh      | 1988-09-04 |        1 |         2 | Malang    |          99 |   58 |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
9 rows in set (0.001 sec)

//30. Menampilkan nama (asc)
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> ORDER BY nama ASC;
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat    | berat_badan | umur |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
| 14 | 11124 | Alisa Natasya   | Perempuan     | Jakarta   | 1970-10-09 |        2 |         4 | Bekasi    |         110 |   41 |
| 17 | 11127 | Asep Mubarok    | Laki-Laki     | Aceh      | 1988-09-04 |        1 |         2 | Malang    |          99 |   58 |
|  4 | 11114 | Asep Saepulloh  | Laki-Laki     | Solo      | 1980-03-01 |        4 |         2 | Jakarta   |          73 |   21 |
|  2 | 11112 | Aziz Santoso    | Laki-Laki     | Jakarta   | 1970-03-01 |        4 |         1 | Tangerang |          55 |   40 |
| 12 | 11122 | Bara Santoso    | Laki-Laki     | Papua     | 1980-01-03 |        2 |         2 | Tangerang |          69 |   42 |
|  8 | 11118 | Barok Asep      | Laki-Laki     | Bali      | 1974-09-02 |        3 |         4 | Depok     |          80 |   40 |
|  3 | 11113 | Faras Susanti   | Perempuan     | Bali      | 1972-03-01 |        4 |         4 | Depok     |          72 |   56 |
| 10 | 11120 | Faris Sarah     | Perempuan     | Jakarta   | 1977-08-09 |        3 |         4 | Banten    |          85 |   33 |
| 13 | 11123 | Jajang Jaenudin | Laki-Laki     | Bogor     | 1975-11-09 |        2 |         3 | Depok     |          55 |   37 |
|  9 | 11119 | Muhammad Arief  | Laki-Laki     | Bekasi    | 1980-09-02 |        3 |         3 | Depok     |          57 |   26 |
|  1 | 11111 | Muhammad Kasim  | Laki-Laki     | Bali      | 2004-03-01 |        4 |         4 | Depok     |          82 |   42 |
| 15 | 11125 | Muhammad Umar   | Laki-Laki     | Yaman     | 1979-08-12 |        2 |         4 | Bekasi    |         105 |   36 |
| 11 | 11121 | Ruqoyyah Saedi  | Perempuan     | Bali      | 1971-03-01 |        2 |         1 | Bali      |          57 |   24 |
| 16 | 11126 | Shelly Santoso  | Perempuan     | Medan     | 1979-09-11 |        1 |         1 | Bekasi    |          75 |   37 |
| 18 | 11128 | Siska Santoso   | Perempuan     | Bali      | 1988-09-04 |        1 |         4 | Depok     |          70 |   39 |
|  6 | 11116 | Siti Khorunnisa | Perempuan     | Tangerang | 1980-09-02 |        3 |         1 | Depok     |          58 |   57 |
|  7 | 11117 | Ummi Nur jannah | Perempuan     | Jakarta   | 1973-09-02 |        3 |         2 | Jakarta   |          74 |   38 |
|  5 | 11115 | Ussy Silalatahi | Perempuan     | Tangeran  | 1981-04-11 |        4 |         4 | Depok     |         111 |   36 |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
18 rows in set (0.001 sec)

//31. Menampilkan pegawai dari yang terberat ke yang teringan
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> ORDER BY berat_badan DESC;
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat    | berat_badan | umur |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
|  5 | 11115 | Ussy Silalatahi | Perempuan     | Tangeran  | 1981-04-11 |        4 |         4 | Depok     |         111 |   36 |
| 14 | 11124 | Alisa Natasya   | Perempuan     | Jakarta   | 1970-10-09 |        2 |         4 | Bekasi    |         110 |   41 |
| 15 | 11125 | Muhammad Umar   | Laki-Laki     | Yaman     | 1979-08-12 |        2 |         4 | Bekasi    |         105 |   36 |
| 17 | 11127 | Asep Mubarok    | Laki-Laki     | Aceh      | 1988-09-04 |        1 |         2 | Malang    |          99 |   58 |
| 10 | 11120 | Faris Sarah     | Perempuan     | Jakarta   | 1977-08-09 |        3 |         4 | Banten    |          85 |   33 |
|  1 | 11111 | Muhammad Kasim  | Laki-Laki     | Bali      | 2004-03-01 |        4 |         4 | Depok     |          82 |   42 |
|  8 | 11118 | Barok Asep      | Laki-Laki     | Bali      | 1974-09-02 |        3 |         4 | Depok     |          80 |   40 |
| 16 | 11126 | Shelly Santoso  | Perempuan     | Medan     | 1979-09-11 |        1 |         1 | Bekasi    |          75 |   37 |
|  7 | 11117 | Ummi Nur jannah | Perempuan     | Jakarta   | 1973-09-02 |        3 |         2 | Jakarta   |          74 |   38 |
|  4 | 11114 | Asep Saepulloh  | Laki-Laki     | Solo      | 1980-03-01 |        4 |         2 | Jakarta   |          73 |   21 |
|  3 | 11113 | Faras Susanti   | Perempuan     | Bali      | 1972-03-01 |        4 |         4 | Depok     |          72 |   56 |
| 18 | 11128 | Siska Santoso   | Perempuan     | Bali      | 1988-09-04 |        1 |         4 | Depok     |          70 |   39 |
| 12 | 11122 | Bara Santoso    | Laki-Laki     | Papua     | 1980-01-03 |        2 |         2 | Tangerang |          69 |   42 |
|  6 | 11116 | Siti Khorunnisa | Perempuan     | Tangerang | 1980-09-02 |        3 |         1 | Depok     |          58 |   57 |
|  9 | 11119 | Muhammad Arief  | Laki-Laki     | Bekasi    | 1980-09-02 |        3 |         3 | Depok     |          57 |   26 |
| 11 | 11121 | Ruqoyyah Saedi  | Perempuan     | Bali      | 1971-03-01 |        2 |         1 | Bali      |          57 |   24 |
|  2 | 11112 | Aziz Santoso    | Laki-Laki     | Jakarta   | 1970-03-01 |        4 |         1 | Tangerang |          55 |   40 |
| 13 | 11123 | Jajang Jaenudin | Laki-Laki     | Bogor     | 1975-11-09 |        2 |         3 | Depok     |          55 |   37 |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
18 rows in set (0.001 sec)

//32. Menampilkan 5 pegawai teratas dengan LIMIT dan OFFSET
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> LIMIT 5 OFFSET 0;
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat    | berat_badan | umur |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
|  1 | 11111 | Muhammad Kasim  | Laki-Laki     | Bali      | 2004-03-01 |        4 |         4 | Depok     |          82 |   42 |
|  2 | 11112 | Aziz Santoso    | Laki-Laki     | Jakarta   | 1970-03-01 |        4 |         1 | Tangerang |          55 |   40 |
|  3 | 11113 | Faras Susanti   | Perempuan     | Bali      | 1972-03-01 |        4 |         4 | Depok     |          72 |   56 |
|  4 | 11114 | Asep Saepulloh  | Laki-Laki     | Solo      | 1980-03-01 |        4 |         2 | Jakarta   |          73 |   21 |
|  5 | 11115 | Ussy Silalatahi | Perempuan     | Tangeran  | 1981-04-11 |        4 |         4 | Depok     |         111 |   36 |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
5 rows in set (0.001 sec)

//misal soalnya berksenambungan dengan soal sebelumnya(berat badan)
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> ORDER BY berat_badan DESC
    -> LIMIT 5 OFFSET 0;
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat | berat_badan | umur |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
|  5 | 11115 | Ussy Silalatahi | Perempuan     | Tangeran  | 1981-04-11 |        4 |         4 | Depok  |         111 |   36 |
| 14 | 11124 | Alisa Natasya   | Perempuan     | Jakarta   | 1970-10-09 |        2 |         4 | Bekasi |         110 |   41 |
| 15 | 11125 | Muhammad Umar   | Laki-Laki     | Yaman     | 1979-08-12 |        2 |         4 | Bekasi |         105 |   36 |
| 17 | 11127 | Asep Mubarok    | Laki-Laki     | Aceh      | 1988-09-04 |        1 |         2 | Malang |          99 |   58 |
| 10 | 11120 | Faris Sarah     | Perempuan     | Jakarta   | 1977-08-09 |        3 |         4 | Banten |          85 |   33 |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
5 rows in set (0.000 sec)

//33. Menampilkan 5 pegawai terbawah dengan LIMIT dan OFFSET
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> LIMIT 5 OFFSET 13;
+----+-------+----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
| id | nip   | nama           | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat | berat_badan | umur |
+----+-------+----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
| 14 | 11124 | Alisa Natasya  | Perempuan     | Jakarta   | 1970-10-09 |        2 |         4 | Bekasi |         110 |   41 |
| 15 | 11125 | Muhammad Umar  | Laki-Laki     | Yaman     | 1979-08-12 |        2 |         4 | Bekasi |         105 |   36 |
| 16 | 11126 | Shelly Santoso | Perempuan     | Medan     | 1979-09-11 |        1 |         1 | Bekasi |          75 |   37 |
| 17 | 11127 | Asep Mubarok   | Laki-Laki     | Aceh      | 1988-09-04 |        1 |         2 | Malang |          99 |   58 |
| 18 | 11128 | Siska Santoso  | Perempuan     | Bali      | 1988-09-04 |        1 |         4 | Depok  |          70 |   39 |
+----+-------+----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+

//misal soalnya berksenambungan dengan soal sebelumnya(berat badan)
MariaDB [dbpegawai]> SELECT * FROM pegawai
    -> ORDER BY berat_badan DESC
    -> LIMIT 5 OFFSET 13;
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
| id | nip   | nama            | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat    | berat_badan | umur |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
|  6 | 11116 | Siti Khorunnisa | Perempuan     | Tangerang | 1980-09-02 |        3 |         1 | Depok     |          58 |   57 |
|  9 | 11119 | Muhammad Arief  | Laki-Laki     | Bekasi    | 1980-09-02 |        3 |         3 | Depok     |          57 |   26 |
| 11 | 11121 | Ruqoyyah Saedi  | Perempuan     | Bali      | 1971-03-01 |        2 |         1 | Bali      |          57 |   24 |
|  2 | 11112 | Aziz Santoso    | Laki-Laki     | Jakarta   | 1970-03-01 |        4 |         1 | Tangerang |          55 |   40 |
| 13 | 11123 | Jajang Jaenudin | Laki-Laki     | Bogor     | 1975-11-09 |        2 |         3 | Depok     |          55 |   37 |
+----+-------+-----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
5 rows in set (0.000 sec)

//34. Menampilkan jumlah pegawai(aggeragat count)

MariaDB [dbpegawai]> SELECT COUNT(*) AS jumlah_pegawai FROM pegawai;
+----------------+
| jumlah_pegawai |
+----------------+
|             18 |
+----------------+
1 row in set (0.009 sec)

//35. Menampilkan nip,nama pegawai, umur yg paling tua gunakan fungsi aggregrat max (kombinasi
dengan sub query)
MariaDB [dbpegawai]> SELECT nip,nama,umur FROM pegawai WHERE umur =(SELECT MAX(umur) FROM pegawai);
+-------+--------------+------+
| nip   | nama         | umur |
+-------+--------------+------+
| 11127 | Asep Mubarok |   58 |
+-------+--------------+------+
1 row in set (0.001 sec)

//36. menampilkan nip,nama pegawai, berat_badan yg paling kurus gunakan fungsi aggregrat min
(kombinasi dengan sub query) 
MariaDB [dbpegawai]> SELECT nip,nama,berat_badan FROM pegawai WHERE berat_badan =(SELECT MIN(berat_badan) FROM pegawai);
+-------+-----------------+-------------+
| nip   | nama            | berat_badan |
+-------+-----------------+-------------+
| 11112 | Aziz Santoso    |          55 |
| 11123 | Jajang Jaenudin |          55 |
+-------+-----------------+-------------+
2 rows in set (0.001 sec)

//37. Menampilkan Umur rata-rata pegawai
MariaDB [dbpegawai]> SELECT AVG(umur) AS umur_rata2 FROM pegawai;
+------------+
| umur_rata2 |
+------------+
|    39.0556 |
+------------+
1 row in set (0.008 sec)

//38.Menampilkan jumlah data pegawai yang laki2 dan berumur lebih dari 40 tahun dan berjabatan
Manajer, gunakan fungsi aggregrat count dan klausa AND 
MariaDB [dbpegawai]> SELECT COUNT(*) AS jml_manajer FROM pegawai
    -> WHERE jenis_kelamin = 'Laki-Laki' AND umur > 40  AND idjabatan = 3;
+-------------+
| jml_manajer |
+-------------+
|           0 |
+-------------+
1 row in set (0.001 sec)

//39. Menampilkan jumlah data pegawai yang perempuan dan berumur kurang dari 40 tahun dan
berjabatan Staff, gunakan fungsi aggregrat count dan klausa AND 
MariaDB [dbpegawai]> SELECT COUNT(*) AS jml_staff_perempuan FROM pegawai
    -> WHERE jenis_kelamin = 'Perempuan' AND umur < 40  AND idjabatan = 4;
+---------------------+
| jml_staff_perempuan |
+---------------------+
|                   3 |
+---------------------+
1 row in set (0.001 sec)

//40. Menampilkan jumlah data pegawai yang perempuan gunakan fungsi aggregrat count
MariaDB [dbpegawai]> SELECT COUNT(*) AS jml_karyawan_perempuan FROM pegawai
    -> WHERE jenis_kelamin = 'Perempuan';
+------------------------+
| jml_karyawan_perempuan |
+------------------------+
|                      9 |
+------------------------+
1 row in set (0.001 sec)

//41. Menampilkan jumlah pegawai yang bekerja di divisi SDM dengan fungsi aggregrat sum dan klausa
WHERE
MariaDB [dbpegawai]> SELECT SUM(iddivisi) FROM pegawai WHERE iddivisi = 1;
+---------------+
| SUM(iddivisi) |
+---------------+
|             3 |
+---------------+
1 row in set (0.001 sec)

//bisa juga dengan querry CASE WHEN
MariaDB [dbpegawai]> SELECT SUM(CASE WHEN iddivisi = (SELECT iddivisi = 1) THEN 1 ELSE 0 END) AS jumlah_pegawai_SDM
    -> FROM pegawai;
+--------------------+
| jumlah_pegawai_SDM |
+--------------------+
|                  3 |
+--------------------+
1 row in set (0.001 sec)

//42. Tampilkan jumlah pegawai berdasarkan divisi masing2 menggunakan fungsi aggregrat count
dan klausa group by
MariaDB [dbpegawai]> SELECT iddivisi, COUNT(*) AS jumlah_pegawai
    -> FROM pegawai
    -> GROUP BY iddivisi;
+----------+----------------+
| iddivisi | jumlah_pegawai |
+----------+----------------+
|        1 |              3 |
|        2 |              5 |
|        3 |              5 |
|        4 |              5 |
+----------+----------------+
4 rows in set (0.010 sec)

//43. Menampilkan data jumlah pegawai berdasarkan gender, yg jumlah minimal 10 orang (gunakan
group by dan having) 
MariaDB [dbpegawai]> SELECT jenis_kelamin, COUNT(*) AS jumlah_pegawai
    -> FROM pegawai
    -> GROUP BY jenis_kelamin
    -> HAVING COUNT(*) >= 10;
Empty set (0.001 sec)

//44. Mencari data dengan nama depan muhammad 
MariaDB [dbpegawai]> SELECT *
    -> FROM pegawai
    -> WHERE nama LIKE 'Muhammad%';
+----+-------+----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
| id | nip   | nama           | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat | berat_badan | umur |
+----+-------+----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
|  1 | 11111 | Muhammad Kasim | Laki-Laki     | Bali      | 2004-03-01 |        4 |         4 | Depok  |          82 |   42 |
|  9 | 11119 | Muhammad Arief | Laki-Laki     | Bekasi    | 1980-09-02 |        3 |         3 | Depok  |          57 |   26 |
| 15 | 11125 | Muhammad Umar  | Laki-Laki     | Yaman     | 1979-08-12 |        2 |         4 | Bekasi |         105 |   36 |
+----+-------+----------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
3 rows in set (0.001 sec)

//45. Mencari data dengan akhir Santoso
MariaDB [dbpegawai]> SELECT *
    -> FROM pegawai
    -> WHERE nama LIKE '%Santoso';
+----+-------+----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
| id | nip   | nama           | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat    | berat_badan | umur |
+----+-------+----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
|  2 | 11112 | Aziz Santoso   | Laki-Laki     | Jakarta   | 1970-03-01 |        4 |         1 | Tangerang |          55 |   40 |
| 12 | 11122 | Bara Santoso   | Laki-Laki     | Papua     | 1980-01-03 |        2 |         2 | Tangerang |          69 |   42 |
| 16 | 11126 | Shelly Santoso | Perempuan     | Medan     | 1979-09-11 |        1 |         1 | Bekasi    |          75 |   37 |
| 18 | 11128 | Siska Santoso  | Perempuan     | Bali      | 1988-09-04 |        1 |         4 | Depok     |          70 |   39 |
+----+-------+----------------+---------------+-----------+------------+----------+-----------+-----------+-------------+------+
4 rows in set (0.001 sec)

//46. mencari data yang mengandung nama Asep
MariaDB [dbpegawai]> SELECT *
    -> FROM pegawai
    -> WHERE nama LIKE '%ASEP%';
+----+-------+----------------+---------------+-----------+------------+----------+-----------+---------+-------------+------+
| id | nip   | nama           | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat  | berat_badan | umur |
+----+-------+----------------+---------------+-----------+------------+----------+-----------+---------+-------------+------+
|  4 | 11114 | Asep Saepulloh | Laki-Laki     | Solo      | 1980-03-01 |        4 |         2 | Jakarta |          73 |   21 |
|  8 | 11118 | Barok Asep     | Laki-Laki     | Bali      | 1974-09-02 |        3 |         4 | Depok   |          80 |   40 |
| 17 | 11127 | Asep Mubarok   | Laki-Laki     | Aceh      | 1988-09-04 |        1 |         2 | Malang  |          99 |   58 |
+----+-------+----------------+---------------+-----------+------------+----------+-----------+---------+-------------+------+
3 rows in set (0.001 sec)

//47. Mencari data nama dengan huruf kelima S
MariaDB [dbpegawai]> SELECT *
    -> FROM pegawai
    -> WHERE nama LIKE '__S%';
+----+-------+---------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
| id | nip   | nama          | jenis_kelamin | tmp_lahir | tgl_lahir  | iddivisi | idjabatan | alamat | berat_badan | umur |
+----+-------+---------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
|  3 | 11113 | Faras Susanti | Perempuan     | Bali      | 1972-03-01 |        4 |         4 | Depok  |          72 |   56 |
| 10 | 11120 | Faris Sarah   | Perempuan     | Jakarta   | 1977-08-09 |        3 |         4 | Banten |          85 |   33 |
+----+-------+---------------+---------------+-----------+------------+----------+-----------+--------+-------------+------+
2 rows in set (0.001 sec)