-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 02 Ara 2020, 10:31:44
-- Sunucu sürümü: 10.4.14-MariaDB
-- PHP Sürümü: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `sahinyilmaz_06`
--
CREATE DATABASE IF NOT EXISTS `sahinyilmaz_06` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `sahinyilmaz_06`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitap`
--

CREATE TABLE `kitap` (
  `kitapKayitNo` smallint(6) NOT NULL COMMENT 'Kitap tablosunun ana anahtarı',
  `kitapKayitTarih` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Kitabın veri tabanına kayıt tarihi',
  `kitapAdi` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabın tam adı',
  `kitapISBN` varchar(13) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabın ISBN numarası',
  `kitapBasimTarih` year(4) NOT NULL COMMENT 'Kitabın basım tarihi',
  `kitapBasimYeri` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabın basım yeri',
  `kitapDil` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Kitabın hangi dilde olduğu',
  `kitapSayfaSayisi` int(10) DEFAULT NULL COMMENT 'Kitabın kaç sayfadan oluştuğu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Kitap Tablosu';

--
-- Tablo döküm verisi `kitap`
--

INSERT INTO `kitap` (`kitapKayitNo`, `kitapKayitTarih`, `kitapAdi`, `kitapISBN`, `kitapBasimTarih`, `kitapBasimYeri`, `kitapDil`, `kitapSayfaSayisi`) VALUES
(1, '2020-11-03 19:29:59', 'Körlük', ' 978605298081', 2017, 'İstanbul', 'Türkçe', NULL),
(2, '2020-11-03 19:42:21', 'Fareler ve İnsanlar', '9789755705859', 2012, 'İstanbul', 'Türkçe', 111),
(3, '2020-11-03 19:42:21', 'Son Sığınak', '9786257231022', 2020, 'İstanbul', '', 0),
(4, '2020-11-03 19:42:21', 'Cesur Yeni Dünya', '9789756902165', 2003, 'İstanbul', 'Türkçe', 272),
(5, '2020-11-03 19:42:21', 'Ben Kirke', '9786053759584', 2019, 'İstanbul', 'Türkçe', 408),
(6, '2020-11-03 19:42:21', 'Sineklerin Tanrısı', '9789754582901', 2006, 'İstanbul', 'Türkçe', 262),
(7, '2020-11-03 19:42:21', 'Yabancı', '9789750741272', 1996, 'İstanbul', 'Türkçe', NULL),
(8, '2020-11-03 19:42:21', 'Yüzyıllık Yalnızlık', '9789750719363', 2016, 'İstanbul', NULL, NULL),
(9, '2020-11-03 19:42:21', 'Kırmızı Pazartesi', '9789750721571', 2000, 'İstanbul', 'Türkçe', NULL),
(10, '2020-11-03 19:42:21', 'Sana Tek Bir Şey Söyleyebilecek Olsaydım', '9786053112839', 2017, 'İstanbul', NULL, 0);

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `sahin`
-- (Asıl görünüm için aşağıya bakın)
--
CREATE TABLE `sahin` (
`kitapBasimTarih` year(4)
,`kitapKayitNo` smallint(6)
,`kitapSayfaSayisi` int(10)
,`yayineviKayitTarih` timestamp
,`yayineviURL` varchar(100)
,`yazarURL` varchar(50)
);

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `tablo`
-- (Asıl görünüm için aşağıya bakın)
--
CREATE TABLE `tablo` (
`kitapAdi` varchar(200)
,`kitapISBN` varchar(13)
,`kitapBasimYeri` varchar(50)
,`kitapSayfaSayisi` int(10)
,`yayineviAdi` varchar(50)
,`yayineviKayitTarih` timestamp
,`yazarAdi` varchar(20)
);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yayınevi`
--

CREATE TABLE `yayınevi` (
  `yayineviKayitNo` int(11) NOT NULL COMMENT 'Yayınevi tablosunun anahtar alanı',
  `yayineviKayitTarih` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Yayınevi VT giriş tarihi',
  `yayineviAdi` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yayınevi tam adı',
  `yayineviURL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Yayınevi adres bilgisi',
  `yayineviEposta` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Yayınevinin e-posta adresi bilgisi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Yayınevi Tablosu';

--
-- Tablo döküm verisi `yayınevi`
--

INSERT INTO `yayınevi` (`yayineviKayitNo`, `yayineviKayitTarih`, `yayineviAdi`, `yayineviURL`, `yayineviEposta`) VALUES
(1, '2020-11-03 20:42:38', 'Can Yayınları', 'https://canyayinlari.com/', NULL),
(2, '2020-11-03 20:42:38', 'Sel Yayıncılık', 'https://www.selyayincilik.com/', NULL),
(3, '2020-11-03 20:42:38', 'Turkuvaz', 'http://www.turkuvazkitap.com.tr/', NULL),
(4, '2020-11-03 20:42:38', 'İthaki Yayınları', 'http://www.ithaki.com.tr/', 'info@ithaki.com.tr'),
(5, '2020-11-03 20:42:38', 'İşbank Kültür Yayınları', 'https://www.iskultur.com.tr/', NULL),
(6, '2020-11-03 20:42:38', 'Notos', 'http://notoskitap.com/', 'info@notos.com.tr'),
(7, '2020-11-03 20:42:38', 'Can Yayınları', 'https://canyayinlari.com/', NULL),
(8, '2020-11-03 20:42:38', 'Beyaz Baykuş Yayınları', 'https://beyazbaykus.com/', 'info@beyazbaykus.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazar`
--

CREATE TABLE `yazar` (
  `yazarKayitNo` smallint(6) NOT NULL COMMENT 'Yazar tablosunun anahtar alanı',
  `yazarKayitTarih` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Yazar kayıt tarihi',
  `yazarAdi` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yazar tam adı',
  `yazarSoyadi` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yazar tam soyadı',
  `yazarURL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Yazar ek bilgi adresi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Yazar Tablosu';

--
-- Tablo döküm verisi `yazar`
--

INSERT INTO `yazar` (`yazarKayitNo`, `yazarKayitTarih`, `yazarAdi`, `yazarSoyadi`, `yazarURL`) VALUES
(1, '2020-11-03 21:13:24', 'Jose', 'Saramago', NULL),
(2, '2020-11-03 21:13:24', 'John ', 'Steinbeck', 'https://www.steinbeck.org/'),
(3, '2020-11-03 21:13:24', 'Hasan', 'Nuhanoviç', NULL),
(4, '2020-11-03 21:13:24', 'Aldous', 'Huxley', 'https://www.huxley.net/'),
(5, '2020-11-03 21:13:24', 'Madeline', 'Miller', NULL),
(6, '2020-11-03 21:13:24', 'William', 'Golding', 'https://www.william-golding.co.uk/'),
(7, '2020-11-03 21:13:24', 'Colin', 'Wilson', 'https://colinwilsononline.com/'),
(8, '2020-11-03 21:13:24', 'Gabriel', 'Garcia', NULL),
(9, '2020-11-03 21:13:24', 'Richard', 'Reed', NULL);

-- --------------------------------------------------------

--
-- Görünüm yapısı `sahin`
--
DROP TABLE IF EXISTS `sahin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sahin`  AS SELECT `a`.`kitapBasimTarih` AS `kitapBasimTarih`, `a`.`kitapKayitNo` AS `kitapKayitNo`, `a`.`kitapSayfaSayisi` AS `kitapSayfaSayisi`, `b`.`yayineviKayitTarih` AS `yayineviKayitTarih`, `b`.`yayineviURL` AS `yayineviURL`, `c`.`yazarURL` AS `yazarURL` FROM ((`kitap` `a` join `yayınevi` `b`) join `yazar` `c`) WHERE `a`.`kitapKayitNo` = `b`.`yayineviKayitNo` AND `a`.`kitapKayitNo` = `c`.`yazarKayitNo` ;

-- --------------------------------------------------------

--
-- Görünüm yapısı `tablo`
--
DROP TABLE IF EXISTS `tablo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tablo`  AS SELECT `a`.`kitapAdi` AS `kitapAdi`, `a`.`kitapISBN` AS `kitapISBN`, `a`.`kitapBasimYeri` AS `kitapBasimYeri`, `a`.`kitapSayfaSayisi` AS `kitapSayfaSayisi`, `b`.`yayineviAdi` AS `yayineviAdi`, `b`.`yayineviKayitTarih` AS `yayineviKayitTarih`, `c`.`yazarAdi` AS `yazarAdi` FROM ((`kitap` `a` join `yayınevi` `b`) join `yazar` `c`) WHERE `a`.`kitapKayitNo` = `b`.`yayineviKayitNo` AND `a`.`kitapKayitNo` = `c`.`yazarKayitNo` ;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kitap`
--
ALTER TABLE `kitap`
  ADD PRIMARY KEY (`kitapKayitNo`);

--
-- Tablo için indeksler `yayınevi`
--
ALTER TABLE `yayınevi`
  ADD PRIMARY KEY (`yayineviKayitNo`);

--
-- Tablo için indeksler `yazar`
--
ALTER TABLE `yazar`
  ADD PRIMARY KEY (`yazarKayitNo`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kitap`
--
ALTER TABLE `kitap`
  MODIFY `kitapKayitNo` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Kitap tablosunun ana anahtarı', AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `yayınevi`
--
ALTER TABLE `yayınevi`
  MODIFY `yayineviKayitNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Yayınevi tablosunun anahtar alanı', AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `yazar`
--
ALTER TABLE `yazar`
  MODIFY `yazarKayitNo` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Yazar tablosunun anahtar alanı', AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
