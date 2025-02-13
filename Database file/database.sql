

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";



DELIMITER $$

CREATE DEFINER=`Harry`@`localhost` PROCEDURE `GetFlightStatistics`(IN `j_date` DATE)
BEGIN
select MACHUYENBAY,NGAYBAY,IFNULL(SOLUONGHANHKHACH, 0) as SOLUONGHANHKHACH,TONGCHONGOI from (
select f.MACHUYENBAY,f.NGAYBAY,sum(t.SOLUONGHANHKHACH) as SOLUONGHANHKHACH,j.TONGCHONGOI 
from CHUYENBAY f left join CHITIETHOADON t 
on t.TRANGTHAI='DA THANH TOAN' 
and t.MACHUYENBAY=f.MACHUYENBAY 
and f.NGAYBAY=t.NGAYBAY 
inner join CHITIETMAYBAY j on j.MAMAYBAY=f.MAMAYBAY
group by MACHUYENBAY,NGAYBAY) k where NGAYBAY=j_date;
END$$

DELIMITER ;


CREATE TABLE IF NOT EXISTS `NHANVIEN` (
  `MANHANVIEN` varchar(20) NOT NULL,
  `PWD` varchar(30) DEFAULT NULL,
  `HOTEN` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `NHANVIEN` (`MANHANVIEN`, `PWD`, `HOTEN`, `EMAIL`) VALUES
('NHANVIEN', 'NHANVIEN', 'Phu Vinh', 'nguyenphuvinh01@gmail.com');



CREATE TABLE IF NOT EXISTS `KHACHHANG` (
  `MAKHACHHANG` varchar(20) NOT NULL,
  `PWD` varchar(20) DEFAULT NULL,
  `HOTEN` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(35) DEFAULT NULL,
  `SDT` varchar(15) DEFAULT NULL,
  `DIACHI` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `CHUYENBAY` (
  `MACHUYENBAY` varchar(10) NOT NULL,
  `NOIBAY` varchar(20) DEFAULT NULL,
  `NOIDEN` varchar(20) DEFAULT NULL,
  `NGAYBAY` date NOT NULL,
  `NGAYDEN` date DEFAULT NULL,
  `GIOBAY` time DEFAULT NULL,
  `GIODEN` time DEFAULT NULL,
  `SOGHEL1` int(5) DEFAULT NULL,
  `SOGHEL2` int(5) DEFAULT NULL,
  `GIAVEL1` int(10) DEFAULT NULL,
  `GIAVEL2` int(10) DEFAULT NULL,
  `MAMAYBAY` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `HANHKHACH` (
  `MAHANHKHACH` int(10) NOT NULL,
  `pnr` varchar(15) NOT NULL,
  `HOTEN` varchar(20) DEFAULT NULL,
  `TUOI` int(3) DEFAULT NULL,
  `GIOITINH` varchar(8) DEFAULT NULL,
  `THUCAN` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `HOADON` (
  `MAHOADON` varchar(20) NOT NULL,
  `pnr` varchar(15) DEFAULT NULL,
  `NGAYTHANHTOAN` date DEFAULT NULL,
  `SOTIEN` int(6) DEFAULT NULL,
  `PHUONGTHUC` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DELIMITER //
CREATE TRIGGER `update_ticket_after_payment` AFTER INSERT ON `HOADON`
 FOR EACH ROW UPDATE CHITIETHOADON
     SET TRANGTHAI='DA THANH TOAN', MAHOADON= NEW.MAHOADON
   WHERE pnr = NEW.pnr
//
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `check_slghe` BEFORE INSERT ON `chuyenbay`
FOR EACH ROW BEGIN
IF NEW.SOGHEL1 + NEW.SOGHEL2 >  (SELECT TONGCHONGOI FROM chitietmaybay)
THEN
SIGNAL sqlstate '45001';
END IF;
END $$
DELIMITER ;


CREATE TABLE IF NOT EXISTS `CHITIETMAYBAY` (
  `MAMAYBAY` varchar(10) NOT NULL,
  `LOAIMAYBAY` varchar(20) DEFAULT NULL,
  `TONGCHONGOI` int(5) DEFAULT NULL,
  `TRANGTHAI` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `CHITIETHOADON` (
  `pnr` varchar(15) NOT NULL,
  `NGAYDATVE` date DEFAULT NULL,
  `MACHUYENBAY` varchar(10) DEFAULT NULL,
  `NGAYBAY` date DEFAULT NULL,
  `LOAIGHE` varchar(10) DEFAULT NULL,
  `TRANGTHAI` varchar(20) DEFAULT NULL,
  `SOLUONGHANHKHACH` int(5) DEFAULT NULL,
  `PHONGCHO` varchar(5) DEFAULT NULL,
  `UUTIEN` varchar(5) DEFAULT NULL,
  `BAOHIEM` varchar(5) DEFAULT NULL,
  `MAHOADON` varchar(20) DEFAULT NULL,
  `MAKHACHHANG` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `NHANVIEN`
 ADD PRIMARY KEY (`MANHANVIEN`);


ALTER TABLE `KHACHHANG`
 ADD PRIMARY KEY (`MAKHACHHANG`);


ALTER TABLE `CHUYENBAY`
 ADD PRIMARY KEY (`MACHUYENBAY`,`NGAYBAY`), ADD KEY `MAMAYBAY` (`MAMAYBAY`);



ALTER TABLE `CHITIETMAYBAY`
 ADD PRIMARY KEY (`MAMAYBAY`);


ALTER TABLE `HANHKHACH`
 ADD PRIMARY KEY (`MAHANHKHACH`,`pnr`), ADD KEY `pnr` (`pnr`);

ALTER TABLE `HOADON`
 ADD PRIMARY KEY (`MAHOADON`), ADD KEY `pnr` (`pnr`);


ALTER TABLE `CHITIETHOADON`
 ADD PRIMARY KEY (`pnr`), ADD KEY `MAKHACHHANG` (`MAKHACHHANG`), ADD KEY `NGAYBAY` (`NGAYBAY`), ADD KEY `MACHUYENBAY` (`MACHUYENBAY`), ADD KEY `MACHUYENBAY_2` (`MACHUYENBAY`,`NGAYBAY`);


ALTER TABLE `CHUYENBAY`
ADD CONSTRAINT `CHUYENBAY_ibfk_1` FOREIGN KEY (`MAMAYBAY`) REFERENCES `CHITIETMAYBAY` (`MAMAYBAY`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `HANHKHACH`
ADD CONSTRAINT `HANHKHACH_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `CHITIETHOADON` (`pnr`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `HOADON`
ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `CHITIETHOADON` (`pnr`) ON UPDATE CASCADE;

ALTER TABLE `CHITIETHOADON`
ADD CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`MAKHACHHANG`) REFERENCES `KHACHHANG` (`MAKHACHHANG`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `ticket_details_ibfk_3` FOREIGN KEY (`MACHUYENBAY`, `NGAYBAY`) REFERENCES `CHUYENBAY` (`MACHUYENBAY`, `NGAYBAY`) ON DELETE SET NULL ON UPDATE CASCADE;

