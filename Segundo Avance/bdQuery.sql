CREATE DATABASE `proyectopapw` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `proyectopapw`;

CREATE TABLE `articulo` (
  `id_articulo` smallint(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `descipcion` text,
  `unidades` smallint(6) DEFAULT NULL,
  `imagen1` mediumblob,
  `imagen2` mediumblob,
  `imagen3` mediumblob,
  `video` longblob,
  `publicado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `categart` (
  `id_articulo` smallint(6) NOT NULL,
  `id_categoria` smallint(6) NOT NULL,
  PRIMARY KEY (`id_articulo`,`id_categoria`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `categart_ibfk_1` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`),
  CONSTRAINT `categart_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `carrito` (
  `id_carrito` smallint(6) NOT NULL AUTO_INCREMENT,
  `id_usuario` smallint(6) NOT NULL,
  `id_articulo` smallint(6) NOT NULL,
  `precio` float DEFAULT NULL,
  `unidades` float DEFAULT NULL,
  PRIMARY KEY (`id_carrito`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `categoria` (
  `id_categoria` smallint(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `comentario` (
  `id_usuario` smallint(6) NOT NULL,
  `id_articulo` smallint(6) NOT NULL,
  `comentario` text,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id_articulo`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `compra` (
  `id_compra` smallint(6) NOT NULL AUTO_INCREMENT,
  `id_usuario` smallint(6) NOT NULL,
  `id_articulo` smallint(6) NOT NULL,
  `id_pago` smallint(6) NOT NULL,
  `precio` float DEFAULT NULL,
  `unidades` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_articulo` (`id_articulo`),
  KEY `id_pago` (`id_pago`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`),
  CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `solicitud` (
  `id_solicitud` smallint(6) NOT NULL AUTO_INCREMENT,
  `id_usuario` smallint(6) NOT NULL,
  `id_articulo` smallint(6) NOT NULL,
  `precio` float DEFAULT NULL,
  `unidades` float DEFAULT NULL,
  `enviada` tinyint(1) DEFAULT NULL,
  `autorizada` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `solicitud_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `pago` (
  `id_pago` smallint(6) NOT NULL AUTO_INCREMENT,
  `id_usuario` smallint(6) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `numero` varchar(16) DEFAULT NULL,
  `mes` varchar(2) DEFAULT NULL,
  `anio` varchar(2) DEFAULT NULL,
  `num_seg` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `usuario` (
  `id_usuario` smallint(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `correo` varchar(40) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `calle` varchar(30) DEFAULT NULL,
  `colonia` varchar(30) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `imagen` mediumblob,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `valoracion` (
  `id_usuario` smallint(6) NOT NULL,
  `id_articulo` smallint(6) NOT NULL,
  `calificacion` float DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id_articulo`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `valoracion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `valoracion_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
