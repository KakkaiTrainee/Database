DROP database IF EXISTS `kakkai_project` ;
-- test
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema kakkai_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema kakkai_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kakkai_project` DEFAULT CHARACTER SET utf8 ;
USE `kakkai_project` ;

-- -----------------------------------------------------
-- Table `kakkai_project`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kakkai_project`.`region` (
  `regionID` INT NOT NULL AUTO_INCREMENT,
  `regionName` VARCHAR(255) NOT NULL,
  `regionPicture` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`regionID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `kakkai_project`.`province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kakkai_project`.`province` (
  `provinceID` INT NOT NULL AUTO_INCREMENT,
  `provinceName` VARCHAR(255) NOT NULL,
  `provincePicture` VARCHAR(255) NOT NULL,
  `provinceTravel` VARCHAR(255) NOT NULL,
  `provinceRegion` INT NOT NULL,
  PRIMARY KEY (`provinceID`, `provinceRegion`),
  INDEX `fk_province_region1_idx` (`provinceRegion` ASC) VISIBLE,
  CONSTRAINT `fk_province_region1`
    FOREIGN KEY (`provinceRegion`)
    REFERENCES `kakkai_project`.`region` (`regionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kakkai_project`.`tub`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kakkai_project`.`tub` (
  `tubID` INT NOT NULL AUTO_INCREMENT,
  `tubName` VARCHAR(255) NOT NULL,
  `tubPicture` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`tubID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kakkai_project`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kakkai_project`.`hotel` (
  `hotelID` INT NOT NULL AUTO_INCREMENT,
  `hotelName` VARCHAR(255) NOT NULL,
  `hotelPicture` VARCHAR(255) NOT NULL,
  `hotelLocation` VARCHAR(255) NOT NULL,
  `hotelReview` VARCHAR(45) NOT NULL,
  `hotelFacilities` VARCHAR(255) NOT NULL,
  `hotelAmountPeople` VARCHAR(45) NOT NULL,
  `hotelPrice` VARCHAR(45) NULL,
  `hotelPhone` VARCHAR(45) NOT NULL,
  `hotelLink` VARCHAR(255) NOT NULL,
  `hotelProvince` INT NOT NULL,
  `hotelTub` INT NOT NULL,
  PRIMARY KEY (`hotelID`),
  INDEX `fk_hotel_province1_idx` (`hotelProvince` ASC) VISIBLE,
  INDEX `fk_hotel_tub1_idx` (`hotelTub` ASC) VISIBLE,
  CONSTRAINT `fk_hotel_province1`
    FOREIGN KEY (`hotelProvince`)
    REFERENCES `kakkai_project`.`province` (`provinceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_tub1`
    FOREIGN KEY (`hotelTub`)
    REFERENCES `kakkai_project`.`tub` (`tubID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kakkai_project`.`tub`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kakkai_project`.`tub` (
  `tubID` INT NOT NULL AUTO_INCREMENT,
  `tubName` VARCHAR(255) NOT NULL,
  `tubPicture` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`tubID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
use kakkai_project;
INSERT INTO region (regionName,regionPicture)  VALUES 
('Northern','C:\\Users\\User\\Downloads\\linusKung.png'),
('Northeastern','C:\\Users\\User\\Downloads\\linusKung.png'),
('Western','C:\\Users\\User\\Downloads\\linusKung.png'),
('Central','C:\\Users\\User\\Downloads\\linusKung.png'),
('Eastern','C:\\Users\\User\\Downloads\\linusKung.png'),
('Southern','C:\\Users\\User\\Downloads\\linusKung.png');

--   ('Bangkok', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\C_Bangkok.jpg', 'Y', 4),

INSERT INTO province (provinceName, provincePicture, provinceTravel, provinceRegion)
VALUES
  ('Bangkok', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\C_Bangkok.jpg', 'Y', 4),
  ('Phra Nakhon Si Ayutthaya', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Ang Thong', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Ayutthaya', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Lopburi', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\C_Lopburi.jpg', 'N', 4),
  ('Sing Buri', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Chai Nat', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Saraburi', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Nakhon Nayok', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\C_Nakhonnayok.jpg', 'N', 4),
  ('Prachin Buri', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\E_Prachinburi.jpg', 'N', 4),
  ('Chachoengsao', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Pathum Thani', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Nonthaburi', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\C_Nonthaburi.jpg', 'N', 4),
  ('Samut Prakan', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Samut Sakhon', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Samut Songkhram', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Suphan Buri', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Ratchaburi', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\W_Ratchaburi.jpg', 'N', 4),
  ('Kanchanaburi', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\W_Kanchanaburi.jpg', 'N', 4),
  ('Phetchaburi', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\W_Phetchaburi.jpg', 'N', 4),
  ('Prachuap Khiri Khan', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\W_PrachuapKhiriKhan.jpg', 'N', 6),
  ('Chumphon', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 6),
  ('Ranong', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 6),
  ('Surat Thani', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\S_Suratthani.jpg', 'N', 6),
  ('Phang Nga', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 6),
  ('Phuket', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\S_Phuket.jpg', 'N', 6),
  ('Krabi', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\S_Krabi.jpg', 'N', 6),
  ('Nakhon Si Thammarat', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 6),
  ('Trang', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\S_Trang.jpg', 'N', 6),
  ('Phatthalung', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 6),
  ('Satun', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\S_Satun.jpg', 'N', 6),
  ('Songkhla', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\S_Songkhla.jpg', 'N', 6),
  ('Pattani', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 6),
  ('Yala', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 6),
  ('Narathiwat', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 6),
  ('Chiang Mai', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\N_ChiangMai.jpg', 'N', 1),
  ('Chiang Rai', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\N_ChiangRai.jpg', 'N', 1),
  ('Kamphaeng Phet', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Lampang', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\N_Lampang.jpg', 'N', 1),
  ('Lamphun', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 1),
  ('Mae Hong Son', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\N_MaeHongSon.jpg', 'N', 1),
  ('Nakhon Sawan', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\C_NakhonSawan.jpg', 'N', 4),
  ('Nan', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\N_Nan.jpg', 'N', 1),
  ('Phayao', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 1),
  ('Phichit', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 1),
  ('Phitsanulok', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 1),
  ('Phrae', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 1),
  ('Sukhothai', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 1),
  ('Tak', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\W_Tak.jpg', 'N', 1),
  ('Uthai Thani', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Uttaradit', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 1),
  ('Amnat Charoen', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 2),
  ('Bueng Kan', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\NE_BuengKan.jpg', 'N', 2),
  ('Buri Ram', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 2),
  ('Chaiyaphum', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 2),
  ('Kalasin', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 2),
  ('Khon Kaen', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\NE_KhonKaen.jpg', 'N', 2),
  ('Loei', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\NE_Loei.jpg', 'N', 2),
  ('Maha Sarakham', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 2),
  ('Mukdahan', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 2),
  ('Nakhon Phanom', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 2),
  ('Nakhon Ratchasima', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\NE_NakhonRatchasima.jpg', 'N', 2),
  ('Nong Bua Lam Phu', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 2),
  ('Nong Khai', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 2),
  ('Roi Et', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 2),
  ('Sakon Nakhon', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 2),
  ('Si Sa Ket', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 2),
  ('Surin', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 2),
  ('Ubon Ratchathani', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\NE_UbonRatchathani.jpg', 'N', 2),
  ('Udon Thani', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\NE_UdonThani.jpg', 'N', 2),
  ('Yasothon', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 2),
  ('Nakhon Pathom', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Chonburi', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\E_Chonburi.jpg', 'N', 5),
  ('Rayong', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\E_Rayong.jpg', 'N', 5),
  ('Sa Kaeo', 'C:\\Users\\User\\Downloads\\linusKung.png', 'N', 4),
  ('Trat', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\E_Trat.jpg', 'N', 5),
  ('Chanthaburi', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\E_Chanthaburi.jpg', 'N', 5),
  ('Prachinburi', 'C:\\Users\\User\\Downloads\\KakkaiPic\\Province\\E_Prachinburi.jpg', 'N', 4);

INSERT INTO tub (tubName,tubPicture)
VALUES 
('Outdoor Bathtub','C:\\Users\\User\\Downloads\\KakkaiPic\\TypeTub\\Outdoor.jpg'),
('Indoor Bathtub','C:\\Users\\User\\Downloads\\KakkaiPic\\TypeTub\\Indoor.jpg'),
('Public Onsen','C:\\Users\\User\\Downloads\\KakkaiPic\\TypeTub\\PublicOnsen.jpg'),
('Private Onsen','C:\\Users\\User\\Downloads\\KakkaiPic\\TypeTub\\PrivateOnsen.jpg');
		
INSERT INTO hotel (hotelName,hotelPicture,hotelLocation,hotelReview,hotelFacilities,hotelAmountPeople,hotelPrice,hotelPhone,hotelLink,hotelProvince,hotelTub)
VALUES 
('Hua Chang Heritage Hotel','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\HuaChang.jpg','https://goo.gl/maps/t7YdWzg2YxoKQyhDA','4.3','Free-Wifi,Parking,Tub,Breakfast','2','3450','+66 2217 0777','https://www.huachangheritagehotel.com/','1','2');
INSERT INTO hotel (hotelName,hotelPicture,hotelLocation,hotelReview,hotelFacilities,hotelAmountPeople,hotelPrice,hotelPhone,hotelLink,hotelProvince,hotelTub)
VALUES 
('GLOW Sukhumvit 71','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Glow.jpg','https://goo.gl/maps/KgafyviHpbvL6Xbi6','4.1','Free-Wifi,Parking,Tub,Swimming Pool','2','1672','02 381 3171','https://home.glowhotels.com/?fbclid=IwAR1dnYB3SmJpFeU9p-m2g0XJxsoth9aLvLLrwIRKfEyX6t_h8c94NUXzQTQ','1','1'),
('Amdaeng Bangkok Riverside Hotel','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Amdaeng.jpg','https://goo.gl/maps/fBmnjNpDc9AZPRBLA','4.3','Free-Wifi,Parking,Tub','3','2270','+66 2 162 0138','http://www.amdaeng.com/','1','2'),
('Hotel Once Bangkok','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\OnceHotel.jpg','https://goo.gl/maps/JhDp61wnGq9LW1Z87','4.4','Free-Wifi,Parking,Tub','2','1999','+66-2688-2596','https://www.hotelonce.com/accommodations.php','1','2'),
('Millennium Hilton Bangkok','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Millennium.jpg','https://goo.gl/maps/rXrGmXndrDbZcZLp8','4.5','Free-Wifi,Parking,Tub','4','6150','+66 2 442 2000','https://www.hilton.com/en/hotels/bkkhitw-millennium-hilton-bangkok/?WT.mc_id=zLADA0TH1HI2PSH3GGL4INTBPP5dkt6BKKHITW7en_&epid!_&ebuy!&&&gclid=Cj0KCQjwnrmlBhDHARIsADJ5b_me7h-2ZKb84_AAtvhxmVsQ2g6KqrHxafn1SjAmgYS69pP5o2eDsUMaAiDJEALw_wcB&gclsrc=aw.ds','1','2'),
('Jasmine Resort Hotel Bangkok','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Jasmine.jpg','https://goo.gl/maps/JCkNcaRq7b13mEwB7','4.3','Free-Wifi,Parking,Tub','3','2794','+66 2 335 5000','https://www.jasmineresortbangkok.com/en/','1','2'),
('Riva Arun Bangkok','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\RivaArun.jpg','https://goo.gl/maps/qSabSzDJPXUCs1Sa6','4.6','Free-Wifi,Tub,Swimming Pool','3','4500','+66 02 2211188','https://www.rivaarunbangkok.com/en/','1','1'),
('Siripanna Villa Resort & Spa Chiangmai','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Siripanna.jpg','https://goo.gl/maps/4jJ7wUgr64A8KMMc6','4.3','Free-Wifi,Parking,Tub','2','1800','+66 5329 4665','https://www.siripanna.com/','36','2'),
('The Chaya Resort And Spa','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\TheChaya.jpg','https://goo.gl/maps/bbTTfHVfpsBQs4eG8','4.1','Free-Wifi,Parking,Tub','2','850','+66 053-245995','https://www.thechayaresort.com/th/','36','2'),
('Conrad Bangkok','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Conard.jpg','https://goo.gl/maps/efyZygRL9MR8GBo3A','4.5','Free-Wifi,Parking,Tub,Swimming Pool','4','4849','+66 2 690 9999','https://www.hilton.com/en/hotels/bkkcici-conrad-bangkok/?WT.mc_id=zLADA0TH1CH2PSH3GGL4INTBPP5dkt6BKKCICI7en_&epid!_&ebuy!&&&gclid=Cj0KCQjwnrmlBhDHARIsADJ5b_kjO_YnBvBM3p1JO7zQoxB530JSQBjMiFhdSvhl-GZG7OhIfLUvs6kaAjmKEALw_wcB&gclsrc=aw.ds','1','2');
INSERT INTO hotel (hotelName,hotelPicture,hotelLocation,hotelReview,hotelFacilities,hotelAmountPeople,hotelPrice,hotelPhone,hotelLink,hotelProvince,hotelTub)
VALUES 
('Glory Boutique Suites','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Glory.jpg','https://goo.gl/maps/gpZ3ZJu2q6ZE4Us8A','4.3','Free-Wifi,Parking,Tub,Swimming Pool','2','1440','052 000 514','https://www.gloryworldthailand.com/en/','36','2'),
('Palmyra Patong Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Palmyra.jpg','https://goo.gl/maps/PBkNEFYXaEqbWNt7A','4.2','Free-Wifi,Parking,Tub,Swimming Pool','3','1450','+66 76 346033-4','http://www.palmyrapatong.com/enquiry-contact-resort.php','26','2');
INSERT INTO hotel (hotelName,hotelPicture,hotelLocation,hotelReview,hotelFacilities,hotelAmountPeople,hotelPrice,hotelPhone,hotelLink,hotelProvince,hotelTub)
VALUES 
('Onsen @ Moncham','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Onsen@Moncham.jpg','https://goo.gl/maps/5LyimTsnPEm9TSsN9','4.6','Parking,Tub','2','5450','+66 53 111 606','https://www.onsenmoncham.com/','36','4'),
('The Tubkaak Krabi Boutique Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Tubkaak.jpg','https://goo.gl/maps/TzzeuohgxSRfsGdN9','4.6','Parking,Swimming Pool','3','5920','+66 (0) 7562 8456','https://www.tubkaakresort.com/','27','1'),
('J.Park Hotel','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\JPark.jpg','https://goo.gl/maps/su83MbFPLRDD6PPP9','4.3','Free-Wifi,Parking,Swimming Pool','2','803','+66 86 302 7626','https://www.jparkhotel.com/','73','3'),
('Kundala Beach Resort Hua Hin','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Kundala.jpg','https://goo.gl/maps/vK14HbAyY4FFo9iR7','4.5','Free-Wifi,Parking,Swimming Pool,Tub','3','4500','+66 32 536 800','https://www.kundalabeachresort.com/index.php?page=home&lang=en','21','1'),
('Raya Buri Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\RayaBuri.jpg','https://goo.gl/maps/iyYatD6Jbnub4opCA','4.1','Free-Wifi,Parking,Tub','3','1650','+66 3-469-6165','https://www.rayaburiresort.com/','19','1');
INSERT INTO hotel (hotelName,hotelPicture,hotelLocation,hotelReview,hotelFacilities,hotelAmountPeople,hotelPrice,hotelPhone,hotelLink,hotelProvince,hotelTub)
VALUES 
('Serenity Hotel & Spa Onsen','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Onsen Kabinburi.jpg','https://goo.gl/maps/cAy1pBooHp9ERjZv5','4.5','Free-Wifi,Parking,Breakfast,Swimming Pool','2','1350','+66 37 625 444','https://serenityhotelonsen.com/','78','4'),
('Haikin Ryokan','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Haikin.jpg','https://goo.gl/maps/mytqzpG1LbZRBaiE9','4.2','Free-Wifi,Parking,Tub,Breakfast','2','1160','+66 917 844 130','https://www.facebook.com/HaikinRyokan/','36','3'),
('Kantary Bay Hotel & Serviced Apartments Sriracha','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Kantary.jpg','https://goo.gl/maps/mNspDEpAzsxorpsRA','4.5','Free-Wifi,Parking,Breakfast,Swimming Pool','2','2900','+66 53 222 111','https://www.kantaryhills-chiangmai.com/','73','1'),
('Thames Valley Khao Yai','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Thames.jpg','https://goo.gl/maps/pDvxnuPqmcyoiR3Q8','4.6','Free-Wifi,Parking,Tub,Breakfast','3','3768','+66 (0) 44 009 999','https://www.thamesvalleykhaoyai.com/','62','2'),
('Villa Moreeda','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Moreeda.jpg','https://goo.gl/maps/kZ4Jtwum3rWq94Kz5','4.5','Free-Wifi,Parking,Tub,Breakfast,Swimming Pool','2','2958','084 639 6999','https://villamoreeda.com/','18','2');
INSERT INTO hotel (hotelName,hotelPicture,hotelLocation,hotelReview,hotelFacilities,hotelAmountPeople,hotelPrice,hotelPhone,hotelLink,hotelProvince,hotelTub)
VALUES 
('SYLVAN Koh Chang','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Sylvan.jpg','https://goo.gl/maps/mzTPUzHxDvc7NbjC6','4.5','Fre-Wifi,Parking,Tub,Breakfast,Swimming pool','2','2250','+66 (0) 39 552 888','https://sylvankohchang.com/','76','2'),
('Bibury Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Bibury.jpg','https://goo.gl/maps/Vuhrxchr23Jxn1wW6','4.8','Free-Wifi,Parking,Breakfast,Tub','2','1125','081-1990193','http://biburyresort.com/','18','2'),
('Radda Sea House','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Radda.jpg','https://goo.gl/maps/8TAGSYc2oRPe5Bqx8','3.6','Breakfast,Tub','2','3600','087 587 1789','https://www.facebook.com/Radda-Sea-House-102796138424414','73','1');
INSERT INTO hotel (hotelName,hotelPicture,hotelLocation,hotelReview,hotelFacilities,hotelAmountPeople,hotelPrice,hotelPhone,hotelLink,hotelProvince,hotelTub)
VALUES 
('Botanica khaoyai','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Botanica.jpg','https://goo.gl/maps/Lw6ovRar77tZ1K6A6','4.1','Fre-Wifi,Parking,Tub,Breakfast,Swimming pool','2','2450','+66 (0) 22 603 888','https://botanicakhaoyai.com/th/','62','1'),
('500 rai Floating Resort Chiewlarn Lake Khaosok','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\500rai.jpg','https://goo.gl/maps/3j3DAWtrHo7vNqmr8','4.3','Breakfast,Tub,Swimming Pool','3','10400','+66 7795 3013','https://www.500rai.com/','24','1'),
('Phu Chaisai Mountain Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\PhuChaisai.jpg','https://goo.gl/maps/NYUxWiAeNiZtzQ9JA','4.5','Free-Wifi,Parking,Breakfast,Swimming Pool,Tub','2','3290','+66 53 180 099','https://www.phu-chaisai.com/en/','37','1'),
('Samed Grand View Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Samed.jpg','https://goo.gl/maps/oHWBkqLbm7kqPvKQ6','3.9','Free-Wifi,Parking,Breakfast,Tub','2','7600','0819961539','http://www.grandviewgroupresort.com/hat-sai-kaew/en/?fbclid=IwAR2P5ypd_nIzCpXMpRyngkWzqkw43fvbFsO_FlVTaluvHMJIRSP_5BB5qo0','74','1'),
('Thawsi Lake Hill','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Thawsi.jpg','https://goo.gl/maps/E9kYGnC279xNRAxG6','4.6','Fre-Wifi,Parking,Tub,Breakfast,Swimming Pool','2','6000','0929277889','https://www.thawsilakehill.com/','19','1'),
('Boklua River Hills','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Boklua.jpg','https://goo.gl/maps/rdrvzmQXLqXo2SRM8','4.3','Fre-Wifi,Parking,Tub,Breakfast','2','7850','0611963665','https://www.facebook.com/profile.php?id=100064575347262','43','1'),
('Cher Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Cher.jpg','https://goo.gl/maps/Xp8Ff9Ycyucue5Nd8','4.4','Fre-Wifi,Parking,Tub,Breakfast,Swimming Pool','2','3738','+66(0) 3 2508 508-9','http://www.cherresort.com/index.html','20','1'),
('Tolani Resort & Spa Koh Samui','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Tolani.jpg','https://goo.gl/maps/Dr34XkjsW4PuKZTZ9','4.5','Fre-Wifi,Parking,Tub,Swimming Pool','2','2350','+66 77 332 789','https://www.tolanihotels.com/tolani-resort-spa-koh-samui','24','2'),
('Ruan Rong Rong Resort & Spa','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Ruan-rong-rong.jpg','https://goo.gl/maps/8Q4jaY645bGaaCcm7','3.7','Free-Wifi,Parking,Tub','2','2650','029218131','https://www.facebook.com/RuanrongrongResort/','13','2'),
('Kachong Hills Tented Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Kachong.jpg','https://goo.gl/maps/mQ6T8k5MDFc4wLBs9','4.4','Eree-Wifi,Parking,Breakfast,Tub','2','6500','075573513','https://www.facebook.com/KachonghillsTentedResortTrang/','29','1'),
('Aonang Fiore Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Aonang.jpg','https://goo.gl/maps/wR6fnHYYkENc6TJNA','4.3','Free-Wifi,Parking,Breakfast,Swimming Pool,Tub','2','2454','+66 75-695522-3','https://www.aonangfiore.com/','27','1'),
('Tohsang Heritage Khongjiam','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Tohsang.jpg','https://goo.gl/maps/4RnjmtBdDRiU1L5D6','4.4','Free-Wifi,Parking,Breakfast,Swimming Pool','1','8258','+66 45 351 174-6','https://tohsang.com/khongchiam/','69','1'),
('The Signature Hotel Airport','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\TheSignature.jpg','https://goo.gl/maps/NcLVi5tVy8eSvLUc9','4.5','Free-Wifi,Parking,Breakfast,Swimming Pool,Tub','2','2450','+66 (0) 74 255 565-6','https://www.thesignaturehotelairport.com/','32','2'),
('Nadee 10 Resort & Hotel','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Nadee.jpg','https://goo.gl/maps/NrpQ9NXbjDL8Jahk9','4.5','Free-Wifi,Parking,Breakfast,Swimming Pool,Tub','2','2099','06-1759-8333','https://www.nadee10.com/','57','2'),
('Mercure Rayong Lomtalay Villas & Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Mercure.jpg','https://goo.gl/maps/sUJzbwYALwyRytU28','4.3','Free-Wifi,Parking,Breakfast,Swimming Pool,Tub','4','5327','+66 38 648 999','https://www.mercurerayonglomtalay.com/','74','2');
INSERT INTO hotel (hotelName,hotelPicture,hotelLocation,hotelReview,hotelFacilities,hotelAmountPeople,hotelPrice,hotelPhone,hotelLink,hotelProvince,hotelTub)
VALUES 
('Lan Na Wild','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Lanna.jpg','https://goo.gl/maps/svg9JdSZ3D9YEEXf7','4.3','Free-Wifi,Parking,Breakfast,Tub','4','5999','0891439225','http://lannawildresort.com/','36','4'),
('Mayu Bangkok Hotel','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Mayu.jpg','https://goo.gl/maps/GfX9ChGTr1rGVD5B6','4.4','Free-Wifi,Parking,Tub,Swimming Pool','2','5500','062 991 4666','https://www.facebook.com/people/Mayubkkhotel/100064383561976/','1','4'),
('Ma-Du-El Zen Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Ma-Du-Elzen.jpg','https://goo.gl/maps/gADJzU97XqcDTDXe7','4.8','Free-Wifi,Breakfast','2','2250','063 163 6366','https://www.facebook.com/Maduelzenresort/','73','3');
INSERT INTO hotel (hotelName,hotelPicture,hotelLocation,hotelReview,hotelFacilities,hotelAmountPeople,hotelPrice,hotelPhone,hotelLink,hotelProvince,hotelTub)
VALUES 
('De Pincess Hotel','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\DePincessHotel.jpg','https://goo.gl/maps/cKkshiWDMsAWiaHWA','4.6','Free-Wifi,Parking,Breakfast,Tub,Swimmng Pool','2','2125','(+66 ) 42 204444','https://www.deprincesshotel.com/','70','2'),
('Amman Unique Hotel Udon Thani','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Amman.jpg','https://goo.gl/maps/Qwf9Gm8dp8Rik6Yy5','4.7','Free-Wifi,Parking,Breakfast,Tub','2','1550','+66 042 219 199','https://www.ammanuniquehotel.com/th/','70','2'),
('Tree Tara','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\TreeTara.jpg','https://goo.gl/maps/UN9GVcT277Hwf7gGA','4.2','Free-Wifi,Parking,Breakfast,Tub','2','1125','099 132 2256','https://www.treetarahotel.com/','39','4'),
('Sang Poy Cottage','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Sangpoy.jpg','https://goo.gl/maps/npgs3fa46TxXtNgs8','4.8','Free-Wifi,Parking,Tub','2','2546','0616369333','https://sang-poy-cottage.business.site/?utm_source=gmb&utm_medium=referral','41','1'),
('Ngamta Hotel','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Ngamta.jpg','https://goo.gl/maps/hANzWizgKBP3hrWRA','3.6','Free-Wifi,Breakfast,Tub','3','1200',' 053-612793-4','https://www.facebook.com/ngamtahotel','41','2'),
('Phuruakeeree Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Phuruakeeree.jpg','https://goo.gl/maps/GzV6FtB9Wu9sgcAH7','4.6','Free-Wifi,Parking,Breakfast,Tub','2','1854','(+66) 93 298 9661','https://www.phuruakeereeresort.com/','58','2'),
('Phurua Sanctuary Resort & Spa','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\PhuruaSanctuary.jpg','https://goo.gl/maps/vJjL1MPRyvAVteB69','4.4','Free-Wifi,Parking,Breakfast,Swimming Pool,Tub','2','1699','042810890','http://www.phuruasanctuary.com/','58','2'),
('Villa Panalai','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\VillaPanalai.jpg','https://goo.gl/maps/BDMq2NFNujFWQuFU8','4.5','Free-Wifi,Parking,Breakfast,Tub','2','2635','-','https://pongsantayanon.wixsite.com/villapanalai','9','2'),
('Rabiangprai Valley','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Rabiangprai.jpg','https://goo.gl/maps/uM9yoxND9rYcnqyg9','4.3','Free-Wifi,Parking,Breakfast,Swimming Pool,Tub','2','1985','037349908','https://www.rabiangprai.com/','9','1'),
('Tamsabai Hotel','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Tamsabai.jpg','https://goo.gl/maps/U9K43xQYUVPUE3Pd7','4.1','Free-Wifi,Parking,Breakfast,Tub','4','3545','0987790393','https://www.facebook.com/TamsabaiHotel/','42','2'),
('Sand Dunes Chaolao Beach Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\SandDunes.jpg','https://goo.gl/maps/E6vcxwgHXBz1ePZq8','4.3','Free-Wifi,Parking,Breakfast,Swimming Pool,Tub','2','2215','0954587888','https://sandduneschaolao.com/','77','2'),
('Blu Monkey Hub and Hotel Chanthaburi','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\BluMonkey.jpg','https://goo.gl/maps/3QSQr3ujmyKL1He3A','4.4','Free-Wifi,Parking,Breakfast,Swimming Pool,Tub','2','1429','+66 (0) 92-2576156','http://www.blumonkeychanthaburi.com/','77','1'),
('The Motifs Eco Hotel','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\TheMotifs.jpg','https://goo.gl/maps/msh5845wyWL72wwW6','4.6','Free-Wifi,Parking,Breakfast,Tub','2','1999','0934655353','https://www.facebook.com/themotifsecohotel','77','2'),
('Lopburi Inn Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\LopburiInn.jpg','https://goo.gl/maps/qNexfPUJTeRhqWj56','Free-Wifi,Parking,Breakfast,Swimming Pool,Tub','2','1225','036420777','https://lopburiinnresort.th-thailand.com/th/','5','2'),
('Paklop Resort','C:\\Users\\User\\Downloads\\KakkaiPic\\Hotel\\Paklop.jpg','https://goo.gl/maps/sq981sP8h95YVhKF7','4.1','Free-Wifi,Parking,Breakfast,Swimming Pool,Tub','2','1000','0864242492','https://paklop-resort.business.site/','5','2');

