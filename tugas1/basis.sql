Setting environment for using XAMPP for Windows.
ThinkPad@DESKTOP-QL4AOG5 c:\xammp
# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 9
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| dbkuliah           |
| dbti08             |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
7 rows in set (0.002 sec)

MariaDB [(none)]> USE dbkuliah
Database changed
MariaDB [dbkuliah]> DESC mahasiswa;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| id        | int(11)      | NO   | PRI | NULL    | auto_increment |
| nim       | int(11)      | NO   |     | NULL    |                |
| nama      | varchar(200) | NO   |     | NULL    |                |
| alamat    | varchar(500) | NO   |     | NULL    |                |
| idjurusan | int(11)      | YES  |     | NULL    |                |
| foto      | varchar(30)  | YES  |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
6 rows in set (0.031 sec)

MariaDB [dbkuliah]> INSERT INTO jurusan (nama) VALUES
    -> ('Teknik Informatika'),('Sistem Informasi'),('Bisnis Digital'),('Teknik Sipil'),('Teknik Elektro');
Query OK, 5 rows affected (0.054 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [dbkuliah]> SELECT * FROM jurusan;
+----+--------------------+
| id | nama               |
+----+--------------------+
|  3 | Bisnis Digital     |
|  2 | Sistem Informasi   |
|  5 | Teknik Elektro     |
|  1 | Teknik Informatika |
|  4 | Teknik Sipil       |
+----+--------------------+
5 rows in set (0.000 sec)

MariaDB [dbkuliah]>  INSERT INTO mahasiswa(nim,nama,alamat,idjurusan,foto) VALUES
    -> (0110223233,'M Shafwan','Depok',1,'dwiki.jpg');
Query OK, 1 row affected (0.007 sec)

MariaDB [dbkuliah]> SELECT * FROM mahasiswa;
+----+-----------+-----------+--------+-----------+-----------+
| id | nim       | nama      | alamat | idjurusan | foto      |
+----+-----------+-----------+--------+-----------+-----------+
|  1 | 110223233 | M Shafwan | Depok  |         1 | dwiki.jpg |
+----+-----------+-----------+--------+-----------+-----------+
1 row in set (0.001 sec)

MariaDB [dbkuliah]>  INSERT INTO mahasiswa(nim,nama,alamat,idjurusan,foto) VALUES
    -> (0110223233,'adi kurniawan','Depok',1,'adi.jpg');
Query OK, 1 row affected (0.007 sec)

MariaDB [dbkuliah]>  INSERT INTO mahasiswa(nim,nama,alamat,idjurusan,foto) VALUES
    -> (0110223233,'adi kurniawan','Depok',1,'adi.jpg')
    -> -> (0110223236,'Syahrul Mubaroq','Cikarang',2,'syahrul.jpg')
    ->     -> (0110223240,'Ilham Arifin','Medan',3,'ilham.jpg')
    ->     -> (0110223237,'Rizqy Fadilah','Bekasi',4,'rizqy.jpg')
    ->
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '-> (0110223236,'Syahrul Mubaroq','Cikarang',2,'syahrul.jpg')
    -> (01102232...' at line 3
MariaDB [dbkuliah]>  INSERT INTO mahasiswa(nim,nama,alamat,idjurusan,foto) VALUES
    -> (0110223233,'adi kurniawan','Depok',1,'adi.jpg')
    -> (0110223240,'Ilham Arifin','Medan',3,'ilham.jpg')
    -> (0110223237,'Rizqy Fadilah','Bekasi',4,'rizqy.jpg')
    -> (0110223250,'Ijab','Pasar Minggu',5,'ijab.jpg');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(0110223240,'Ilham Arifin','Medan',3,'ilham.jpg')
(0110223237,'Rizqy Fadilah'...' at line 3
MariaDB [dbkuliah]>  INSERT INTO mahasiswa(nim,nama,alamat,idjurusan,foto) VALUES
    -> (0110223233,'adi kurniawan','Depok',1,'adi.jpg')
    -> ;
Query OK, 1 row affected (0.004 sec)

MariaDB [dbkuliah]>  INSERT INTO mahasiswa(nim,nama,alamat,idjurusan,foto) VALUES
    -> (0110223233,'adi kurniawan','Depok',1,'adi.jpg'),
    -> (0110223250,'Ijab','Pasar Minggu',5,'ijab.jpg'),
    -> (0110223237,'Rizqy Fadilah','Bekasi',4,'rizqy.jpg');
Query OK, 3 rows affected (0.006 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [dbkuliah]> SELECT * FROM mahasiswa;
+----+-----------+---------------+--------------+-----------+-----------+
| id | nim       | nama          | alamat       | idjurusan | foto      |
+----+-----------+---------------+--------------+-----------+-----------+
|  1 | 110223233 | M Shafwan     | Depok        |         1 | dwiki.jpg |
|  2 | 110223233 | adi kurniawan | Depok        |         1 | adi.jpg   |
|  3 | 110223233 | adi kurniawan | Depok        |         1 | adi.jpg   |
|  4 | 110223233 | adi kurniawan | Depok        |         1 | adi.jpg   |
|  5 | 110223250 | Ijab          | Pasar Minggu |         5 | ijab.jpg  |
|  6 | 110223237 | Rizqy Fadilah | Bekasi       |         4 | rizqy.jpg |
+----+-----------+---------------+--------------+-----------+-----------+
6 rows in set (0.001 sec)

MariaDB [dbkuliah]> SELECT * FROM jurusan;
+----+--------------------+
| id | nama               |
+----+--------------------+
|  3 | Bisnis Digital     |
|  2 | Sistem Informasi   |
|  5 | Teknik Elektro     |
|  1 | Teknik Informatika |
|  4 | Teknik Sipil       |
+----+--------------------+
5 rows in set (0.001 sec)

MariaDB [dbkuliah]> (0110223250,'Ijab','Pasar Minggu',5,'ijab.jpg');

