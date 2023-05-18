CREATE DATABASE  IF NOT EXISTS `p81JuanDiegoMarinMorales`;
USE `p81JuanDiegoMarinMorales`;



DROP TABLE IF EXISTS `factura`;

CREATE TABLE `factura` (
  `pk` int(11) NOT NULL,
  `fecha_emision` date DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `totalImporte` decimal(6,2),
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
