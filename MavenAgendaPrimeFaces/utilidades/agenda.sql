-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 10-09-2015 a las 12:10:32
-- Versión del servidor: 5.0.45
-- Versión de PHP: 5.2.3
-- 
-- Cree la BD agenda primero antes de importar
-- 

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Base de datos: `agenda`
-- 

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `categoria`
-- 

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `codigo` int(11) NOT NULL auto_increment,
  `nombre` varchar(50) default NULL,
  `estado` binary(1) default '1',
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `categoria`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `nota`
-- 

DROP TABLE IF EXISTS `nota`;
CREATE TABLE IF NOT EXISTS `nota` (
  `codigo` int(11) NOT NULL auto_increment,
  `codigo.persona` int(11) NOT NULL,
  `codigo.categoria` int(11) NOT NULL,
  `encabezado` varchar(50) default NULL,
  `cuerpo` varchar(500) default NULL,
  `fecha` datetime default NULL,
  `comentarioAdmin` varchar(50) default NULL,
  `valorizacion` enum('1','2','3','4','5') default NULL,
  PRIMARY KEY  (`codigo`),
  KEY `codigo.categoria` (`codigo.categoria`),
  KEY `codigo.persona` (`codigo.persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `nota`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `persona`
-- 

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `codigo` int(11) NOT NULL auto_increment,
  `nombres` varchar(100) default NULL,
  `apellidos` varchar(100) default NULL,
  `sexo` enum('M','F') default NULL,
  `fechaNacimiento` date default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `persona`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `telefono`
-- 

DROP TABLE IF EXISTS `telefono`;
CREATE TABLE IF NOT EXISTS `telefono` (
  `codigo` int(11) NOT NULL auto_increment,
  `codigo.persona` int(11) NOT NULL,
  `telefono` char(9) default NULL,
  PRIMARY KEY  (`codigo`),
  KEY `codigo.persona` (`codigo.persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `telefono`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `usuario`
-- 

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `codigo` int(11) NOT NULL,
  `usuario` varchar(100) default NULL,
  `clave` varchar(100) default NULL,
  `tipo` enum('A','O') NOT NULL,
  `estado` tinyint(1) NOT NULL default '1',
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `usuario`
-- 


-- 
-- Filtros para las tablas descargadas (dump)
-- 

-- 
-- Filtros para la tabla `nota`
-- 
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_3` FOREIGN KEY (`codigo.persona`) REFERENCES `persona` (`codigo`),
  ADD CONSTRAINT `nota_ibfk_4` FOREIGN KEY (`codigo.categoria`) REFERENCES `categoria` (`codigo`);

-- 
-- Filtros para la tabla `telefono`
-- 
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`codigo.persona`) REFERENCES `persona` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

-- 
-- Filtros para la tabla `usuario`
-- 
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_codigo` FOREIGN KEY (`codigo`) REFERENCES `persona` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;