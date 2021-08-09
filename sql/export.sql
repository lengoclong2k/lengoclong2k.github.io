-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lap_trinh_huong_doi_tuong
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hoa_don_mua`
--

DROP TABLE IF EXISTS `hoa_don_mua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoa_don_mua` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngay_tao` varchar(45) NOT NULL,
  `nhan_vien_id` int NOT NULL,
  `tong_tien` double DEFAULT NULL,
  `phi_van_chuyen` float DEFAULT NULL,
  `khach_hang_id` int NOT NULL,
  `ghi_chu` varchar(45) NOT NULL,
  `tinh_trang` bit(1) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`,`nhan_vien_id`,`khach_hang_id`),
  KEY `fk_hoa_don_mua_nhan_vien1_idx` (`nhan_vien_id`),
  KEY `fk_hoa_don_mua_khach_hang1_idx` (`khach_hang_id`),
  CONSTRAINT `fk_hoa_don_mua_khach_hang1` FOREIGN KEY (`khach_hang_id`) REFERENCES `khach_hang` (`id`),
  CONSTRAINT `fk_hoa_don_mua_nhan_vien1` FOREIGN KEY (`nhan_vien_id`) REFERENCES `nhan_vien` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_don_mua`
--

LOCK TABLES `hoa_don_mua` WRITE;
/*!40000 ALTER TABLE `hoa_don_mua` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoa_don_mua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khach_hang`
--

DROP TABLE IF EXISTS `khach_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khach_hang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_khac_hang` varchar(45) NOT NULL,
  `so_dien_thoai` varchar(45) NOT NULL,
  `dia_chi` varchar(145) NOT NULL,
  `email` varchar(145) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach_hang`
--

LOCK TABLES `khach_hang` WRITE;
/*!40000 ALTER TABLE `khach_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `khach_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhan_vien`
--

DROP TABLE IF EXISTS `nhan_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhan_vien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `tuoi` int NOT NULL,
  `dia_chi` varchar(45) NOT NULL,
  `so_dien_thoai` varchar(45) NOT NULL,
  `tai_khoan` varchar(145) NOT NULL,
  `mat_khau` mediumtext NOT NULL,
  `deleted` bit(1) NOT NULL,
  `admin` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhan_vien`
--

LOCK TABLES `nhan_vien` WRITE;
/*!40000 ALTER TABLE `nhan_vien` DISABLE KEYS */;
INSERT INTO `nhan_vien` VALUES (8,'hieu ',12,'ha noi','098736251','hieupc@gmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',_binary '',_binary ''),(9,'nhan vien hieu',14,'ha noi','0938271212','nvhieufdfd@gmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',_binary '\0',_binary '\0'),(10,'dcmm ẻtweter',12,'kdks','0882497264','anh1@gmail.com','123456',_binary '\0',_binary '\0'),(11,'sdfsdfdsf',1212,'kdks','0967840437','nvhieufdfd@gmail.com','123456',_binary '\0',_binary '\0'),(12,'ưerwerwe',122,'kdks','0967840437','nvhieufsdfsfdfd@gmail.com','1234466',_binary '\0',_binary '\0'),(13,'dcmm hieu',12,'dfsf','0967840437','lsdfjks@gmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',_binary '\0',_binary '\0'),(14,'sdfsdfdsf hieu 12h',123,'kdks','0967840437','nvhieufdfd123456@gmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `nhan_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhom_san_pham`
--

DROP TABLE IF EXISTS `nhom_san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhom_san_pham` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhom_san_pham`
--

LOCK TABLES `nhom_san_pham` WRITE;
/*!40000 ALTER TABLE `nhom_san_pham` DISABLE KEYS */;
INSERT INTO `nhom_san_pham` VALUES (1,'Hoa quả',_binary '\0'),(10,'giasutinhoc.vn',_binary '\0'),(11,'giasutinhoc.vn',_binary '\0'),(12,'giasutinhoc.vn',_binary '\0'),(13,'giasutinhoc.vn',_binary '\0'),(14,'giasutinhoc.vn',_binary '\0'),(15,'giasutinhoc.vn',_binary '\0'),(16,'giasutinhoc.vnv dfgdfgf dsfdsf',_binary '\0'),(17,'dfasdfasdsd dcmmm',_binary '\0'),(18,'dfwer',_binary '\0'),(19,'ádfasd',_binary '\0'),(20,'giasutinhoc.vn',_binary '\0'),(21,'dfds',_binary '\0'),(22,'giasutinhoc.vn',_binary '\0'),(23,'giasutinhoc.vn',_binary '\0'),(24,'giasutinhoc.vn',_binary '\0'),(25,'giasutinhoc.vn',_binary '\0'),(26,'giasutinhoc.vn',_binary '\0'),(27,'giasutinhoc.vn',_binary '\0'),(28,'giasutinhoc.vn',_binary '\0');
/*!40000 ALTER TABLE `nhom_san_pham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_pham`
--

DROP TABLE IF EXISTS `san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `san_pham` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) NOT NULL,
  `gia_ban_le` float NOT NULL,
  `gia_nhap` float NOT NULL,
  `so_luong_nhap` int NOT NULL,
  `da_ban` int NOT NULL,
  `xuat_xu` varchar(105) NOT NULL,
  `thanh_phan` varchar(255) NOT NULL,
  `cach_su_dung` varchar(255) NOT NULL,
  `khoi_luong` int NOT NULL,
  `thong_tin_chi_tiet` mediumtext NOT NULL,
  `phan_tram_giam_gia` int NOT NULL COMMENT 'theo phan tram',
  `thuong_hieu_id` int NOT NULL,
  `nhom_san_pham_id` int NOT NULL,
  `anh_san_pham` varchar(45) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`,`thuong_hieu_id`,`nhom_san_pham_id`),
  KEY `fk_san_pham_thuong_hieu1_idx` (`thuong_hieu_id`),
  KEY `fk_san_pham_nhom_san_pham1_idx` (`nhom_san_pham_id`),
  CONSTRAINT `fk_san_pham_nhom_san_pham1` FOREIGN KEY (`nhom_san_pham_id`) REFERENCES `nhom_san_pham` (`id`),
  CONSTRAINT `fk_san_pham_thuong_hieu1` FOREIGN KEY (`thuong_hieu_id`) REFERENCES `thuong_hieu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_pham`
--

LOCK TABLES `san_pham` WRITE;
/*!40000 ALTER TABLE `san_pham` DISABLE KEYS */;
INSERT INTO `san_pham` VALUES (1,'Đào',123456,1234,123,32,'Hà nội','Hoa Quả','Ngày ăn 1 quả',111,'Đây là quả đào',10,3,1,'abc',_binary '\0'),(3,'r sđsfsdfsdf sdfdsf',1234,324,223,23,'Hà nội','Hoa quả','Ngày ăn 10 quả',101,'Đây là quả đào',50,4,1,'abc',_binary ''),(4,'fsdfsdf',212,233,232,2323,'dsafasdf','sdfasdf','123123',2322,'éadf',50,4,14,'sdfsdf',_binary '\0'),(5,'dsfsadfsd',123123,12123,121,123,'sdfasdfsa','ádfasdf','dsfasdfds',1212,'fasdfasd',30,4,11,'ádfds',_binary '\0'),(6,'rdcmmmm',1234,324,223,23,'Hà nội','Hoa quả','Ngày ăn 10 quả',10,'Đây là quả đào',20,4,1,'abc',_binary '\0'),(7,'rdfsdfsd',1234,324,223,23,'Hà nội','Hoa quả','Ngày ăn 10 quả',10,'Đây là quả đào',20,4,1,'abc',_binary '\0'),(8,'r hieu',1234,324,223,23,'Hà nội','Hoa quả','Ngày ăn 10 quả',10,'Đây là quả đào',20,4,1,'abc',_binary ''),(9,'gsdfgdfsgdsfsdf hieu',223232,2323,2323,2323,'ấdfd','ádfasdf','1212123 ăn luôn',121212,'sdfsdf',0,1,1,'sdfsdf',_binary '');
/*!40000 ALTER TABLE `san_pham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham_has_hoadon`
--

DROP TABLE IF EXISTS `sanpham_has_hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham_has_hoadon` (
  `san_pham_id` int NOT NULL,
  `hoa_don_mua_id` int NOT NULL,
  `so_luong` int NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`san_pham_id`,`hoa_don_mua_id`),
  KEY `fk_sanpham_has_hoadon_hoa_don_mua1_idx` (`hoa_don_mua_id`),
  CONSTRAINT `fk_sanpham_has_hoadon_hoa_don_mua1` FOREIGN KEY (`hoa_don_mua_id`) REFERENCES `hoa_don_mua` (`id`),
  CONSTRAINT `fk_sanpham_has_hoadon_san_pham` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham_has_hoadon`
--

LOCK TABLES `sanpham_has_hoadon` WRITE;
/*!40000 ALTER TABLE `sanpham_has_hoadon` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanpham_has_hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuong_hieu`
--

DROP TABLE IF EXISTS `thuong_hieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuong_hieu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuong_hieu`
--

LOCK TABLES `thuong_hieu` WRITE;
/*!40000 ALTER TABLE `thuong_hieu` DISABLE KEYS */;
INSERT INTO `thuong_hieu` VALUES (1,'Việt nam chất lượng cao',_binary '\0'),(2,'Iphone',_binary '\0'),(3,'Apple',_binary '\0'),(4,'Samsung',_binary '\0'),(5,'Xiaomi',_binary '\0'),(6,'Acecook',_binary '\0'),(7,'Vinamik',_binary '\0'),(8,'TH True Milk',_binary '\0'),(9,'Anphal Grow',_binary '\0'),(10,'hieuueue',_binary '\0'),(11,'hieuueue',_binary '\0'),(12,'hdhdhd',_binary '\0');
/*!40000 ALTER TABLE `thuong_hieu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-14 20:58:43
