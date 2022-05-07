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
INSERT INTO `danh_muc` VALUES (6,'Gia dụng'),(7,'Điện tử'),(8,'Thời trang'),(9,'Sức khoẻ'),(10,'Sắc đẹp');
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
INSERT INTO `don_hang` VALUES (16,'Gò Vấp','Ghi chú shipper: \nOk<br> Ghi chú admin:\nok','Lê An Thịnh Phát','2022-05-07 11:14:16','2022-05-07 11:46:26','2022-05-07 11:47:08','03966666669','Hoàn thành',11,11,3000),(17,'Gò Vấp',NULL,'Le An Thinh Phat','2022-05-07 11:14:45','2022-05-07 11:41:15',NULL,'0396940373','Đã bị hủy',11,8,12000),(18,'Gò Vấp','Ghi chú shipper: \nOk','Le An Thinh Phat','2022-05-07 11:48:27','2022-05-07 11:49:53','2022-05-07 11:50:02','0396940373','Chờ duyệt',11,11,175000),(19,'Gò Vấp','Ghi chú shipper: \nNhận','Tonaf','2022-05-07 11:55:28','2022-05-07 11:55:44','2022-05-07 11:57:26','0396940373','Chờ duyệt',14,13,40000),(20,'Gò VFC','Ghi chú shipper: \nOk<br> Ghi chú admin:\nOk','Toàn','2022-05-07 12:00:23','2022-05-07 12:00:56','2022-05-07 12:02:30','ádsada','Hoàn thành',14,13,130000);
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
INSERT INTO `hang_san_xuat` VALUES (5,'Không');
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
INSERT INTO `lien_he` VALUES (1,'yokinguyen2000@gmail.com','2021-09-30 20:35:34','2021-09-30 20:58:48','Hello','hello','Đã trả lời',NULL),(2,'yokinguyen2000@gmail.com','2021-11-08 02:52:28','2021-11-08 03:01:35','hello','hello','Đã trả lời',NULL),(3,'NguyenVanHieu.Official@gmail.com','2021-11-08 03:29:34','2021-11-08 03:30:17','Xin chào shop','xin chào bạn','Đã trả lời',NULL),(4,'NguyenVanHieu.Official@gmail.com','2021-11-08 03:39:25','2021-11-08 03:40:00','hellooooooo','hi!!!!!!!!!','Đã trả lời',NULL),(5,'leanthinhphat7@gmail.com','2022-05-07 06:52:59',NULL,'đasadasdasdasdasdsad',NULL,'Đang chờ trả lời',NULL),(6,'tongsynguyen22@gmail.com','2022-05-07 08:15:03',NULL,'sdasdsadasd',NULL,'Đang chờ trả lời',NULL),(7,'tongsynguyen22@gmail.com','2022-05-07 08:17:57',NULL,'231233213',NULL,'Đang chờ trả lời',NULL);
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
INSERT INTO `nguoi_dung` VALUES (8,'TPHCM','shippervip@gmail.com','Shipper ','$2a$10$ZlDEVOUi6uJ9m1mSVmtVSuzwaGGTuHRSIiXofKMF41H9.tj58qj3G','12324'),(11,'Gò Vấp','leanthinhphat7@gmail.com','Lê An Thịnh Phát','$2a$10$P6547subU50rccpqkcZfKu.IUQ8bleeuF77mot3MZqK7cLwxvZP/O','03966666669'),(13,'417/16 Le Van Tho, phuong 9','nguyen@gmail.com','Tong Nguyen Khung','$2a$10$P6547subU50rccpqkcZfKu.IUQ8bleeuF77mot3MZqK7cLwxvZP/O','0396940373'),(14,'Gò Vấp','toan@gmail.com','Toàn','$2a$10$WcHu0C5XwVeWkebY5Bw8ReHO8JshdQfGXwLv4s/SeUXACv0EvN3Aq','0123456789'),(15,NULL,'admin@gmail.com','Nguyễn Văn Hiếu','$2a$10$fKfMFLl9CIm9kl5eBpI7CeMemuWXLf5Ajk0SltcMeks0SEp1EVBQq','123456789'),(16,NULL,'member@gmail.com',NULL,'$2a$10$PXiu4SmBDx5pz4a.UHjtVej28BX7/eeJe28sV2eoPpvJc5J02nwSK',NULL),(17,NULL,'shipper@gmail.com',NULL,'$2a$10$JBwTcBAvKXtc6dg7Mx47Zeo1vcVRLm4PwZDOdHzVM./KeBOOHgQKS',NULL),(18,'Gò Vấp','phat@gmail.com','Phát','$2a$10$JFFNG/Tbq4bGsTO6p7v2SOqSohr9K1ifwPFlpR3UYdhsO0ksIuppO','00000000000');
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
INSERT INTO `san_pham` VALUES (17,'Ghế Lười Tatami - Ghế Tựa Lưng Ngồi Bệt Nhật Bản - Rẻ Vô Địch',270000,0,20,'Nhật Bản','Bảo hành đổi mới nếu SF lỗi hoặc sai sản phẩm','Ghế Lười Tatami - Ghế Tựa Lưng Ngồi Bệt Nhật Bản',6,5),(18,'Android Tivi Box Tx3 Mini Plus 2022 Android 11',620000,0,30,'Trung Quốc','Đơn vị sản xuất và lắp ráp: Jangjun Technology Co., Ltd','SMART NEW là đơn vị phân phối chính TX3 mini 2022 tại thị trường Việt Nam và rất nhiều các thương hiệu khác.\r\nNếu có bất kỳ vấn đề gì về sản phẩm vui lòng liên hệ hoặc nhắn tin cho SMART NEW để được hỗ trợ chúng tôi sẽ cố gắng trả lời bạn sớm nhất.',7,5),(19,'ÁO GIÓ 2 MẶT 2 LỚP - THOÁNG MÁT THÍCH HỢP CHO NAM NỮ',160000,0,10,'Trung Quốc','Bảo hành đổi mới nếu SF lỗi hoặc sai sản phẩm','- Áo Gió 2 Mặt Uniplus với chất liệu Dù 2 lớp giữ ấm có cơ thể khi trời lạnh, vừa lại giúp bạn có thể chống nắng, chống bụi, chống gió, chống tia UV cực tốt và chống mưa (nhẹ), rất tiện lợi nhé!!!',8,5),(20,'Máy đo huyết áp và nhịp tim bắp tay Omron HEM - 8712 BH 5 năm chính hãng',800000,0,10,'Nhật Bản','Bảo hành đổi mới nếu SF lỗi hoặc sai sản phẩm','Giới thiệu sản phẩm Máy đo huyết áp bắp tay Omron HEM-8712 Nhật Lắp ráp Việt Nam\r\n',9,5),(21,'Miếng Dán Tóc Trang Điểm - Miếng dán tóc mái rửa mặt',2000,0,100,'Trung Quốc','Bảo hành đổi mới nếu SF lỗi hoặc sai sản phẩm','Miếng Dán Tóc Trang Điểm/Rửa Mặt \r\n* Rất tiện lợi và nhanh chóng khi sử dụng vì bạn chỉ cần vén tóc và đính miếng dán lên tóc. Đặc biệt là sản phẩm có thời gian sử dụng trong một thời gian dài mà không lo hư hỏng hay thay thế.',10,5),(22,' 1 miếng dán mua thêm - thay thế - dự phòng dùng cho kệ góc , kệ chữ nhật dán tường',3000,1,29,'Trung Quốc','Bảo hành đổi mới nếu SF lỗi hoặc sai sản phẩm','Sản phẩm bạn đang xem được áp dụng chính sách BẢO HÀNH 1 đổi 1 KHÔNG MẤT PHÍ với bất kỳ lỗi nào đến từ sản phẩm của shop sau khi nhận',6,5),(23,'Đồng hồ LED 3D treo tường, để bàn thông minh TN828 Smart Clock',130000,1,19,'Trung Quốc','Bảo hành đổi mới nếu SF lỗi hoặc sai sản phẩm','Đồng hồ LED Treo Tường 3D, Đồng Hồ Led Để Bàn Cao Cấp\r\nNgoài khả năng hiển thị giờ nó còn tô điểm cho không gian sống của bạn thêm sang trọng',6,5),(24,'10 mét dây gai decor, dây đay trang trí vintage size 1,5 và 3,5mm',10000,0,20,'Việt Nam','Bảo hành đổi mới nếu SF lỗi hoặc sai sản phẩm','Sản phẩm dây thừng, dây gai hay còn gọi là dây đay trang trí màu nâu Vintage',6,5),(25,'Gương soi di động toàn thân giá rẻ freeship ở sài gòn bao bể vỡ',200000,0,111,'','Bảo hành đổi mới nếu SF lỗi hoặc sai sản phẩm','Gương soi di động toàn thân giá rẻ freeship ở sài gòn bao bể vỡ',6,5),(26,'Gối ôm cotton 100% dài 95cm khóa kéo, gối ôm hình thú cho bé',135000,0,33,'','Bảo hành đổi mới nếu SF lỗi hoặc sai sản phẩm','Gối ôm cotton 100% dài 95cm khóa kéo, gối ôm hình thú cho bé ôm ngủ dài đẹp Dreamhomebedding',6,5),(27,'Muỗng gỗ Nhật, thìa gỗ ăn cơm cán dài miệng to phong cách tự nhiên',40000,0,33,'Trung Quốc','Bảo hành đổi mới nếu SF lỗi hoặc sai sản phẩm','Muỗng gỗ Nhật, thìa gỗ ăn cơm cán dài miệng to phong cách tự nhiên',6,5),(28,'móc quần áo , móc áo nhựa vai nữ to dài 40 cm mắc áo vai nữ',5000,0,100,'Trung Quốc','Bảo hành đổi mới nếu SF lỗi hoặc sai sản phẩm','móc quần áo , móc áo nhựa vai nữ to dài 40 cm mắc áo vai nữ chuyên dùng cho shop thời trang gia đình treo quần áo giá rẻ',6,5);
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
