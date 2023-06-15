DECLARE
  table_count1 NUMBER;
  table_count2 NUMBER;
  table_count3 NUMBER;  
  table_count4 NUMBER;
BEGIN
  SELECT COUNT(*) INTO table_count1 FROM user_tables WHERE table_name = 'NHANVIEN';
  SELECT COUNT(*) INTO table_count2 FROM user_tables WHERE table_name = 'PHONGBAN';
  SELECT COUNT(*) INTO table_count3 FROM user_tables WHERE table_name = 'DEAN';
  SELECT COUNT(*) INTO table_count3 FROM user_tables WHERE table_name = 'PHANCONG';
  
  IF table_count1 > 0 THEN
    EXECUTE IMMEDIATE 'DROP TABLE NHANVIEN';
  END IF;
  
  IF table_count2 > 0 THEN
    EXECUTE IMMEDIATE 'DROP TABLE PHONGBAN';
  END IF;
  
  IF table_count3 > 0 THEN
    EXECUTE IMMEDIATE 'DROP TABLE DEAN';
  END IF;
  
  IF table_count4 > 0 THEN
    EXECUTE IMMEDIATE 'DROP TABLE PHANCONG';
  END IF;
END;
/


//TAO BANG NHAN VIEN
create table NHANVIEN(
    MANV VARCHAR(10) PRIMARY KEY,
    TENNV NVARCHAR2(30),
    PHAI VARCHAR(10),
    NGAYSINH DATE,
    DIACHI NVARCHAR2(30),
    SODT VARCHAR(10),
    LUONG FLOAT,
    PHUCAP FLOAT,
    VAITRO NVARCHAR2(30),
    MANQL VARCHAR(10),
    PHG VARCHAR(10),
    FOREIGN KEY (MANQL) REFERENCES NHANVIEN (MANV),
    FOREIGN KEY(PHG) REFERENCES PHONGBAN(MAPB)
);

//TAO BANG PHONG BAN
CREATE TABLE PHONGBAN(
    MAPB VARCHAR(10) PRIMARY KEY,
    TENPB NVARCHAR2(30),
    TRPHG VARCHAR(10),
    FOREIGN KEY (TRPHG) REFERENCES NHANVIEN(MANV)
);

//TAO BANG DE AN
CREATE TABLE DEAN(
    MADA VARCHAR(10) PRIMARY KEY,
    TENDA NVARCHAR2(30),
    NGAYBD DATE,
    PHONG VARCHAR(10),
    FOREIGN KEY (PHONG) REFERENCES PHONGBAN(MAPB)
);

//TAO BANG PHAN CONG
CREATE TABLE PHANCONG(
    MANV VARCHAR(10),
    MADA VARCHAR(10),
    THOIGIAN DATE,
    PRIMARY KEY(MANV, MADA),
    FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV),
    FOREIGN KEY(MADA) REFERENCES DEAN(MADA),
);