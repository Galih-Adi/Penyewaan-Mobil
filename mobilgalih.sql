/*
 Navicat Premium Data Transfer

 Source Server         : GBAdi
 Source Server Type    : MySQL
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : dbsewakendaraanmadiun0663

 Target Server Type    : MySQL
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 08/12/2023 11:40:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `idcustomer` int NOT NULL,
  `customer` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nomortelepon` int NOT NULL,
  PRIMARY KEY (`idcustomer`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1111, 'Dudung', 'Jl.Pesanggahan II', 812696969);
INSERT INTO `customer` VALUES (2222, 'Martin', 'Jl.Kebon Bawang II', 812909090);
INSERT INTO `customer` VALUES (3333, 'Doel', 'Jl.Rorotan II', 812101010);

-- ----------------------------
-- Table structure for nomorpolisi
-- ----------------------------
DROP TABLE IF EXISTS `nomorpolisi`;
CREATE TABLE `nomorpolisi`  (
  `nomorpolisi` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `armada` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sewakendaraan` int NOT NULL,
  `bbm` int NULL DEFAULT NULL,
  `supir` int NULL DEFAULT NULL,
  `overtime` int NULL DEFAULT NULL,
  `total` int NOT NULL,
  PRIMARY KEY (`nomorpolisi`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nomorpolisi
-- ----------------------------
INSERT INTO `nomorpolisi` VALUES ('AE 2323 RS', 'Camry', 150000, NULL, NULL, NULL, 1500000);
INSERT INTO `nomorpolisi` VALUES ('AE 6969 RS', 'Avanza', 100000, NULL, NULL, NULL, 1000000);
INSERT INTO `nomorpolisi` VALUES ('AE 8989 RS', 'Pajero', 200000, NULL, NULL, NULL, 2000000);

-- ----------------------------
-- Table structure for nomortransaksi
-- ----------------------------
DROP TABLE IF EXISTS `nomortransaksi`;
CREATE TABLE `nomortransaksi`  (
  `nomortransaksi` int NOT NULL,
  `idcustomer` int NOT NULL,
  `nomorpolisi` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `biaya` int NOT NULL,
  `tujuan` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kotaberangkat` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggalberangkat` date NOT NULL,
  `kotakembali` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggalkembali` date NOT NULL,
  `keterangan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lainlain` int NULL DEFAULT NULL,
  `petugas` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`nomortransaksi`) USING BTREE,
  INDEX `fk_nomortransaksi_customer_1`(`idcustomer` ASC) USING BTREE,
  INDEX `fk_nomortransaksi_nomorpolisi_1`(`nomorpolisi` ASC) USING BTREE,
  CONSTRAINT `fk_nomortransaksi_customer_1` FOREIGN KEY (`idcustomer`) REFERENCES `customer` (`idcustomer`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_nomortransaksi_nomorpolisi_1` FOREIGN KEY (`nomorpolisi`) REFERENCES `nomorpolisi` (`nomorpolisi`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nomortransaksi
-- ----------------------------
INSERT INTO `nomortransaksi` VALUES (11111111, 1111, 'AE 6969 RS', 1000000, 'Ponorogo', 'Madiun', '2021-11-01', 'Ponorogo', '2021-11-11', 'Jalan-jalan', NULL, 'Cecep');
INSERT INTO `nomortransaksi` VALUES (22222222, 2222, 'AE 8989 RS', 2010000, 'Ngawi', 'Madiun', '2021-11-01', 'Ngawi', '2021-11-11', 'Jalan-jalan', 10000, 'Madun');
INSERT INTO `nomortransaksi` VALUES (33333333, 3333, 'AE 2323 RS', 1500000, 'Mejayan', 'Madiun', '2021-11-01', 'Mejayan', '2021-11-11', 'Jalan-jalan', NULL, 'Udin');

SET FOREIGN_KEY_CHECKS = 1;
