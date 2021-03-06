-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: carshop
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `chi_muc_gio_hang`
--

DROP TABLE IF EXISTS `chi_muc_gio_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_muc_gio_hang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `so_luong` int NOT NULL,
  `ma_gio_hang` bigint DEFAULT NULL,
  `ma_san_pham` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsanpham_idx` (`ma_san_pham`),
  KEY `FKdonhang5_idx` (`ma_gio_hang`),
  CONSTRAINT `FKgionhang5` FOREIGN KEY (`ma_gio_hang`) REFERENCES `gio_hang` (`id`),
  CONSTRAINT `FKsanpham` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_muc_gio_hang`
--

LOCK TABLES `chi_muc_gio_hang` WRITE;
/*!40000 ALTER TABLE `chi_muc_gio_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_muc_gio_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_don_hang`
--

DROP TABLE IF EXISTS `chi_tiet_don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_don_hang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `don_gia` bigint NOT NULL,
  `so_luong` int NOT NULL DEFAULT '1',
  `ma_don_hang` bigint DEFAULT NULL,
  `ma_san_pham` bigint DEFAULT NULL,
  `so_luong_dat` int NOT NULL,
  `so_luong_nhan_hang` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsanpham1_idx` (`ma_san_pham`),
  KEY `FKdonhang4_idx` (`ma_don_hang`),
  CONSTRAINT `FKdonhang4` FOREIGN KEY (`ma_don_hang`) REFERENCES `don_hang` (`id`),
  CONSTRAINT `FKsanpham5` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_don_hang`
--

LOCK TABLES `chi_tiet_don_hang` WRITE;
/*!40000 ALTER TABLE `chi_tiet_don_hang` DISABLE KEYS */;
INSERT INTO `chi_tiet_don_hang` VALUES (18,3000,1,16,22,1,1),(19,10000,1,17,24,1,0),(20,2000,1,17,21,1,0),(21,130000,1,18,23,1,1),(22,5000,1,18,28,1,1),(23,40000,1,18,27,1,1),(24,40000,1,19,27,1,1),(25,130000,1,20,23,1,1);
/*!40000 ALTER TABLE `chi_tiet_don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danh_muc`
--

DROP TABLE IF EXISTS `danh_muc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danh_muc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten_danh_muc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danh_muc`
--

LOCK TABLES `danh_muc` WRITE;
/*!40000 ALTER TABLE `danh_muc` DISABLE KEYS */;
INSERT INTO `danh_muc` VALUES (6,'Gia d???ng'),(7,'??i???n t???'),(8,'Th???i trang'),(9,'S???c kho???'),(10,'S???c ?????p');
/*!40000 ALTER TABLE `danh_muc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_hang`
--

DROP TABLE IF EXISTS `don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `don_hang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dia_chi_nhan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ghi_chu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ho_ten_nguoi_nhan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ngay_dat_hang` datetime DEFAULT NULL,
  `ngay_giao_hang` datetime DEFAULT NULL,
  `ngay_nhan_hang` datetime DEFAULT NULL,
  `sdt_nhan_hang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `trang_thai_don_hang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ma_nguoi_dat` bigint DEFAULT NULL,
  `ma_shipper` bigint DEFAULT NULL,
  `tong_gia_tri` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnguoidung_idx` (`ma_shipper`),
  KEY `FKnguoidung1_idx` (`ma_nguoi_dat`),
  CONSTRAINT `FKnguoidung` FOREIGN KEY (`ma_shipper`) REFERENCES `nguoi_dung` (`id`),
  CONSTRAINT `FKnguoidung1` FOREIGN KEY (`ma_nguoi_dat`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_hang`
--

LOCK TABLES `don_hang` WRITE;
/*!40000 ALTER TABLE `don_hang` DISABLE KEYS */;
INSERT INTO `don_hang` VALUES (16,'G?? V???p','Ghi ch?? shipper: \nOk<br> Ghi ch?? admin:\nok','L?? An Th???nh Ph??t','2022-05-07 11:14:16','2022-05-07 11:46:26','2022-05-07 11:47:08','03966666669','Ho??n th??nh',11,11,3000),(17,'G?? V???p',NULL,'Le An Thinh Phat','2022-05-07 11:14:45','2022-05-07 11:41:15',NULL,'0396940373','???? b??? h???y',11,8,12000),(18,'G?? V???p','Ghi ch?? shipper: \nOk','Le An Thinh Phat','2022-05-07 11:48:27','2022-05-07 11:49:53','2022-05-07 11:50:02','0396940373','Ch??? duy???t',11,11,175000),(19,'G?? V???p','Ghi ch?? shipper: \nNh???n','Tonaf','2022-05-07 11:55:28','2022-05-07 11:55:44','2022-05-07 11:57:26','0396940373','Ch??? duy???t',14,13,40000),(20,'G?? VFC','Ghi ch?? shipper: \nOk<br> Ghi ch?? admin:\nOk','To??n','2022-05-07 12:00:23','2022-05-07 12:00:56','2022-05-07 12:02:30','??dsada','Ho??n th??nh',14,13,130000);
/*!40000 ALTER TABLE `don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gio_hang`
--

DROP TABLE IF EXISTS `gio_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gio_hang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tong_tien` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ma_nguoi_dung` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnguoidung6_idx` (`ma_nguoi_dung`),
  CONSTRAINT `FKnguoidung6` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gio_hang`
--

LOCK TABLES `gio_hang` WRITE;
/*!40000 ALTER TABLE `gio_hang` DISABLE KEYS */;
INSERT INTO `gio_hang` VALUES (4,NULL,11),(5,NULL,14);
/*!40000 ALTER TABLE `gio_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hang_san_xuat`
--

DROP TABLE IF EXISTS `hang_san_xuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hang_san_xuat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten_hang_san_xuat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hang_san_xuat`
--

LOCK TABLES `hang_san_xuat` WRITE;
/*!40000 ALTER TABLE `hang_san_xuat` DISABLE KEYS */;
INSERT INTO `hang_san_xuat` VALUES (5,'Kh??ng');
/*!40000 ALTER TABLE `hang_san_xuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lien_he`
--

DROP TABLE IF EXISTS `lien_he`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lien_he` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email_lien_he` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ngay_lien_he` datetime DEFAULT NULL,
  `ngay_tra_loi` datetime DEFAULT NULL,
  `noi_dung_lien_he` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `noi_dung_tra_loi` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `trang_thai` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ma_nguoi_tra_loi` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnguoidung5_idx` (`ma_nguoi_tra_loi`),
  CONSTRAINT `FKnguoidung5` FOREIGN KEY (`ma_nguoi_tra_loi`) REFERENCES `nguoi_dung` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lien_he`
--

LOCK TABLES `lien_he` WRITE;
/*!40000 ALTER TABLE `lien_he` DISABLE KEYS */;
INSERT INTO `lien_he` VALUES (1,'yokinguyen2000@gmail.com','2021-09-30 20:35:34','2021-09-30 20:58:48','Hello','hello','???? tr??? l???i',NULL),(2,'yokinguyen2000@gmail.com','2021-11-08 02:52:28','2021-11-08 03:01:35','hello','hello','???? tr??? l???i',NULL),(3,'NguyenVanHieu.Official@gmail.com','2021-11-08 03:29:34','2021-11-08 03:30:17','Xin ch??o shop','xin ch??o b???n','???? tr??? l???i',NULL),(4,'NguyenVanHieu.Official@gmail.com','2021-11-08 03:39:25','2021-11-08 03:40:00','hellooooooo','hi!!!!!!!!!','???? tr??? l???i',NULL),(5,'leanthinhphat7@gmail.com','2022-05-07 06:52:59',NULL,'??asadasdasdasdasdsad',NULL,'??ang ch??? tr??? l???i',NULL),(6,'tongsynguyen22@gmail.com','2022-05-07 08:15:03',NULL,'sdasdsadasd',NULL,'??ang ch??? tr??? l???i',NULL),(7,'tongsynguyen22@gmail.com','2022-05-07 08:17:57',NULL,'231233213',NULL,'??ang ch??? tr??? l???i',NULL);
/*!40000 ALTER TABLE `lien_he` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_dung`
--

DROP TABLE IF EXISTS `nguoi_dung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoi_dung` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dia_chi` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ho_ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `so_dien_thoai` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_dung`
--

LOCK TABLES `nguoi_dung` WRITE;
/*!40000 ALTER TABLE `nguoi_dung` DISABLE KEYS */;
INSERT INTO `nguoi_dung` VALUES (8,'TPHCM','shippervip@gmail.com','Shipper ','$2a$10$ZlDEVOUi6uJ9m1mSVmtVSuzwaGGTuHRSIiXofKMF41H9.tj58qj3G','12324'),(11,'G?? V???p','leanthinhphat7@gmail.com','L?? An Th???nh Ph??t','$2a$10$P6547subU50rccpqkcZfKu.IUQ8bleeuF77mot3MZqK7cLwxvZP/O','03966666669'),(13,'417/16 Le Van Tho, phuong 9','nguyen@gmail.com','Tong Nguyen Khung','$2a$10$P6547subU50rccpqkcZfKu.IUQ8bleeuF77mot3MZqK7cLwxvZP/O','0396940373'),(14,'G?? V???p','toan@gmail.com','To??n','$2a$10$WcHu0C5XwVeWkebY5Bw8ReHO8JshdQfGXwLv4s/SeUXACv0EvN3Aq','0123456789'),(15,NULL,'admin@gmail.com','Nguy???n V??n Hi???u','$2a$10$fKfMFLl9CIm9kl5eBpI7CeMemuWXLf5Ajk0SltcMeks0SEp1EVBQq','123456789'),(16,NULL,'member@gmail.com',NULL,'$2a$10$PXiu4SmBDx5pz4a.UHjtVej28BX7/eeJe28sV2eoPpvJc5J02nwSK',NULL),(17,NULL,'shipper@gmail.com',NULL,'$2a$10$JBwTcBAvKXtc6dg7Mx47Zeo1vcVRLm4PwZDOdHzVM./KeBOOHgQKS',NULL),(18,'G?? V???p','phat@gmail.com','Ph??t','$2a$10$JFFNG/Tbq4bGsTO6p7v2SOqSohr9K1ifwPFlpR3UYdhsO0ksIuppO','00000000000');
/*!40000 ALTER TABLE `nguoi_dung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoidung_vaitro`
--

DROP TABLE IF EXISTS `nguoidung_vaitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoidung_vaitro` (
  `ma_nguoi_dung` bigint NOT NULL,
  `ma_vai_tro` bigint NOT NULL,
  PRIMARY KEY (`ma_nguoi_dung`,`ma_vai_tro`),
  KEY `FKig6jxd861mqv02a8pn68r43fr` (`ma_vai_tro`),
  CONSTRAINT `FKig6jxd861mqv02a8pn68r43fr` FOREIGN KEY (`ma_vai_tro`) REFERENCES `vai_tro` (`id`),
  CONSTRAINT `FKocavcnspu1wcvp2w0s4usfgbf` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoidung_vaitro`
--

LOCK TABLES `nguoidung_vaitro` WRITE;
/*!40000 ALTER TABLE `nguoidung_vaitro` DISABLE KEYS */;
INSERT INTO `nguoidung_vaitro` VALUES (11,1),(15,1),(11,2),(14,2),(15,2),(16,2),(18,2),(8,3),(11,3),(13,3),(17,3);
/*!40000 ALTER TABLE `nguoidung_vaitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_pham`
--

DROP TABLE IF EXISTS `san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `san_pham` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten_san_pham` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `don_gia` bigint NOT NULL,
  `don_vi_ban` int NOT NULL DEFAULT '0',
  `don_vi_kho` int NOT NULL DEFAULT '0',
  `xuat_su` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `thong_tin_bao_hanh` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `thong_tin_chung` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ma_danh_muc` bigint DEFAULT NULL,
  `ma_hang_sx` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdanhmuc1_idx` (`ma_danh_muc`),
  KEY `FKhangsanxuat4_idx` (`ma_hang_sx`),
  CONSTRAINT `FKdanhmuc1` FOREIGN KEY (`ma_danh_muc`) REFERENCES `danh_muc` (`id`),
  CONSTRAINT `FKhangsanxuat4` FOREIGN KEY (`ma_hang_sx`) REFERENCES `hang_san_xuat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_pham`
--

LOCK TABLES `san_pham` WRITE;
/*!40000 ALTER TABLE `san_pham` DISABLE KEYS */;
INSERT INTO `san_pham` VALUES (17,'Gh??? L?????i Tatami - Gh??? T???a L??ng Ng???i B???t Nh???t B???n - R??? V?? ?????ch',270000,0,20,'Nh???t B???n','B???o h??nh ?????i m???i n???u SF l???i ho???c sai s???n ph???m','Gh??? L?????i Tatami - Gh??? T???a L??ng Ng???i B???t Nh???t B???n',6,5),(18,'Android Tivi Box Tx3 Mini Plus 2022 Android 11',620000,0,30,'Trung Qu???c','????n v??? s???n xu???t v?? l???p r??p: Jangjun Technology Co., Ltd','SMART NEW l?? ????n v??? ph??n ph???i ch??nh TX3 mini 2022 t???i th??? tr?????ng Vi???t Nam v?? r???t nhi???u c??c th????ng hi???u kh??c.\r\nN???u c?? b???t k??? v???n ????? g?? v??? s???n ph???m vui l??ng li??n h??? ho???c nh???n tin cho SMART NEW ????? ???????c h??? tr??? ch??ng t??i s??? c??? g???ng tr??? l???i b???n s???m nh???t.',7,5),(19,'??O GI?? 2 M???T 2 L???P - THO??NG M??T TH??CH H???P CHO NAM N???',160000,0,10,'Trung Qu???c','B???o h??nh ?????i m???i n???u SF l???i ho???c sai s???n ph???m','- ??o Gi?? 2 M???t Uniplus v???i ch???t li???u D?? 2 l???p gi??? ???m c?? c?? th??? khi tr???i l???nh, v???a l???i gi??p b???n c?? th??? ch???ng n???ng, ch???ng b???i, ch???ng gi??, ch???ng tia UV c???c t???t v?? ch???ng m??a (nh???), r???t ti???n l???i nh??!!!',8,5),(20,'M??y ??o huy???t ??p v?? nh???p tim b???p tay Omron HEM - 8712 BH 5 n??m ch??nh h??ng',800000,0,10,'Nh???t B???n','B???o h??nh ?????i m???i n???u SF l???i ho???c sai s???n ph???m','Gi???i thi???u s???n ph???m M??y ??o huy???t ??p b???p tay Omron HEM-8712 Nh???t L???p r??p Vi???t Nam\r\n',9,5),(21,'Mi???ng D??n T??c Trang ??i???m - Mi???ng d??n t??c m??i r???a m???t',2000,0,100,'Trung Qu???c','B???o h??nh ?????i m???i n???u SF l???i ho???c sai s???n ph???m','Mi???ng D??n T??c Trang ??i???m/R???a M???t \r\n* R???t ti???n l???i v?? nhanh ch??ng khi s??? d???ng v?? b???n ch??? c???n v??n t??c v?? ????nh mi???ng d??n l??n t??c. ?????c bi???t l?? s???n ph???m c?? th???i gian s??? d???ng trong m???t th???i gian d??i m?? kh??ng lo h?? h???ng hay thay th???.',10,5),(22,' 1 mi???ng d??n mua th??m - thay th??? - d??? ph??ng d??ng cho k??? g??c , k??? ch??? nh???t d??n t?????ng',3000,1,29,'Trung Qu???c','B???o h??nh ?????i m???i n???u SF l???i ho???c sai s???n ph???m','S???n ph???m b???n ??ang xem ???????c ??p d???ng ch??nh s??ch B???O H??NH 1 ?????i 1 KH??NG M???T PH?? v???i b???t k??? l???i n??o ?????n t??? s???n ph???m c???a shop sau khi nh???n',6,5),(23,'?????ng h??? LED 3D treo t?????ng, ????? b??n th??ng minh TN828 Smart Clock',130000,1,19,'Trung Qu???c','B???o h??nh ?????i m???i n???u SF l???i ho???c sai s???n ph???m','?????ng h??? LED Treo T?????ng 3D, ?????ng H??? Led ????? B??n Cao C???p\r\nNgo??i kh??? n??ng hi???n th??? gi??? n?? c??n t?? ??i???m cho kh??ng gian s???ng c???a b???n th??m sang tr???ng',6,5),(24,'10 m??t d??y gai decor, d??y ??ay trang tr?? vintage size 1,5 v?? 3,5mm',10000,0,20,'Vi???t Nam','B???o h??nh ?????i m???i n???u SF l???i ho???c sai s???n ph???m','S???n ph???m d??y th???ng, d??y gai hay c??n g???i l?? d??y ??ay trang tr?? m??u n??u Vintage',6,5),(25,'G????ng soi di ?????ng to??n th??n gi?? r??? freeship ??? s??i g??n bao b??? v???',200000,0,111,'','B???o h??nh ?????i m???i n???u SF l???i ho???c sai s???n ph???m','G????ng soi di ?????ng to??n th??n gi?? r??? freeship ??? s??i g??n bao b??? v???',6,5),(26,'G???i ??m cotton 100% d??i 95cm kh??a k??o, g???i ??m h??nh th?? cho b??',135000,0,33,'','B???o h??nh ?????i m???i n???u SF l???i ho???c sai s???n ph???m','G???i ??m cotton 100% d??i 95cm kh??a k??o, g???i ??m h??nh th?? cho b?? ??m ng??? d??i ?????p Dreamhomebedding',6,5),(27,'Mu???ng g??? Nh???t, th??a g??? ??n c??m c??n d??i mi???ng to phong c??ch t??? nhi??n',40000,0,33,'Trung Qu???c','B???o h??nh ?????i m???i n???u SF l???i ho???c sai s???n ph???m','Mu???ng g??? Nh???t, th??a g??? ??n c??m c??n d??i mi???ng to phong c??ch t??? nhi??n',6,5),(28,'m??c qu???n ??o , m??c ??o nh???a vai n??? to d??i 40 cm m???c ??o vai n???',5000,0,100,'Trung Qu???c','B???o h??nh ?????i m???i n???u SF l???i ho???c sai s???n ph???m','m??c qu???n ??o , m??c ??o nh???a vai n??? to d??i 40 cm m???c ??o vai n??? chuy??n d??ng cho shop th???i trang gia ????nh treo qu???n ??o gi?? r???',6,5);
/*!40000 ALTER TABLE `san_pham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vai_tro`
--

DROP TABLE IF EXISTS `vai_tro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vai_tro` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten_vai_tro` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vai_tro`
--

LOCK TABLES `vai_tro` WRITE;
/*!40000 ALTER TABLE `vai_tro` DISABLE KEYS */;
INSERT INTO `vai_tro` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_MEMBER'),(3,'ROLE_SHIPPER');
/*!40000 ALTER TABLE `vai_tro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-07 19:39:55
