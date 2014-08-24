-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: sql102.byethost13.com
-- Generation Time: Aug 19, 2014 at 07:40 PM
-- Server version: 5.6.16-64.2-56
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `b13_13268400_honolulu`
--

-- --------------------------------------------------------

--
-- Table structure for table `Bebidas`
--

CREATE TABLE IF NOT EXISTS `Bebidas` (
  `idBebida` int(11) NOT NULL AUTO_INCREMENT,
  `nombreBebida` varchar(45) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBebida`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Bebidas`
--

INSERT INTO `Bebidas` (`idBebida`, `nombreBebida`, `precio`) VALUES
(1, 'Prueba de Bebida 1', 15000),
(2, 'Prueba de Bebida 2', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `Ingredientes`
--

CREATE TABLE IF NOT EXISTS `Ingredientes` (
  `idIngrediente` int(11) NOT NULL AUTO_INCREMENT,
  `nombreIngrediente` varchar(45) NOT NULL,
  PRIMARY KEY (`idIngrediente`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Ingredientes`
--

INSERT INTO `Ingredientes` (`idIngrediente`, `nombreIngrediente`) VALUES
(1, 'Ingrediente 1'),
(2, 'Ingrediente 2'),
(3, 'Ingrediente 3'),
(4, 'Ingrediente 4'),
(5, 'Ingrediente 5'),
(6, 'Ingrediente 6'),
(7, 'Ingrediente 7');

-- --------------------------------------------------------

--
-- Table structure for table `IngredientesExcluidos`
--

CREATE TABLE IF NOT EXISTS `IngredientesExcluidos` (
  `PedidosMenus_Pedidos_nroMesa` int(11) NOT NULL,
  `PedidosMenus_Menus_idMenu` int(11) NOT NULL,
  `Ingredientes_idIngrediente` int(11) NOT NULL,
  PRIMARY KEY (`PedidosMenus_Pedidos_nroMesa`,`PedidosMenus_Menus_idMenu`,`Ingredientes_idIngrediente`),
  KEY `fk_PedidosMenus_has_Ingredientes_Ingredientes1_idx` (`Ingredientes_idIngrediente`),
  KEY `fk_PedidosMenus_has_Ingredientes_PedidosMenus1_idx` (`PedidosMenus_Pedidos_nroMesa`,`PedidosMenus_Menus_idMenu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `IngredientesExcluidosPizzas`
--

CREATE TABLE IF NOT EXISTS `IngredientesExcluidosPizzas` (
  `Pedidos_has_Pizzas_Pedidos_nroMesa` int(11) NOT NULL,
  `Pedidos_has_Pizzas_Pizzas_idPizza` int(11) NOT NULL,
  `Ingredientes_idIngrediente` int(11) NOT NULL,
  PRIMARY KEY (`Pedidos_has_Pizzas_Pedidos_nroMesa`,`Pedidos_has_Pizzas_Pizzas_idPizza`,`Ingredientes_idIngrediente`),
  KEY `fk_Pedidos_has_Pizzas_has_Ingredientes_Ingredientes1_idx` (`Ingredientes_idIngrediente`),
  KEY `fk_Pedidos_has_Pizzas_has_Ingredientes_Pedidos_has_Pizzas1_idx` (`Pedidos_has_Pizzas_Pedidos_nroMesa`,`Pedidos_has_Pizzas_Pizzas_idPizza`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `IngredientesMenus`
--

CREATE TABLE IF NOT EXISTS `IngredientesMenus` (
  `Menus_idMenu` int(11) NOT NULL,
  `Ingredientes_idIngrediente` int(11) NOT NULL,
  PRIMARY KEY (`Menus_idMenu`,`Ingredientes_idIngrediente`),
  KEY `fk_Menus_has_Ingredientes_Ingredientes1_idx` (`Ingredientes_idIngrediente`),
  KEY `fk_Menus_has_Ingredientes_Menus1_idx` (`Menus_idMenu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `IngredientesMenus`
--

INSERT INTO `IngredientesMenus` (`Menus_idMenu`, `Ingredientes_idIngrediente`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 2),
(3, 7),
(4, 3),
(4, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `IngredientesPizzas`
--

CREATE TABLE IF NOT EXISTS `IngredientesPizzas` (
  `Pizzas_idPizza` int(11) NOT NULL,
  `Ingredientes_idIngrediente` int(11) NOT NULL,
  PRIMARY KEY (`Pizzas_idPizza`,`Ingredientes_idIngrediente`),
  KEY `fk_Pizzas_has_Ingredientes_Ingredientes1_idx` (`Ingredientes_idIngrediente`),
  KEY `fk_Pizzas_has_Ingredientes_Pizzas1_idx` (`Pizzas_idPizza`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `IngredientesPizzas`
--

INSERT INTO `IngredientesPizzas` (`Pizzas_idPizza`, `Ingredientes_idIngrediente`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Menus`
--

CREATE TABLE IF NOT EXISTS `Menus` (
  `idMenu` int(11) NOT NULL AUTO_INCREMENT,
  `nombreMenu` varchar(70) NOT NULL,
  `precio` float NOT NULL,
  `TiposMenus_idTipoMenu` int(11) NOT NULL,
  PRIMARY KEY (`idMenu`),
  KEY `fk_Menus_TiposMenus1_idx` (`TiposMenus_idTipoMenu`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Menus`
--

INSERT INTO `Menus` (`idMenu`, `nombreMenu`, `precio`, `TiposMenus_idTipoMenu`) VALUES
(1, 'Prueba Salads 1', 20000, 1),
(3, 'Prueba Appetizers 1', 15000, 2),
(4, 'Prueba Appetizers 2', 20000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Pedidos`
--

CREATE TABLE IF NOT EXISTS `Pedidos` (
  `nroMesa` int(11) NOT NULL,
  `monto` int(11) DEFAULT NULL,
  PRIMARY KEY (`nroMesa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pedidos`
--

INSERT INTO `Pedidos` (`nroMesa`, `monto`) VALUES
(1, 460000),
(3, 60000);

-- --------------------------------------------------------

--
-- Table structure for table `PedidosBebidas`
--

CREATE TABLE IF NOT EXISTS `PedidosBebidas` (
  `Pedidos_nroMesa` int(11) NOT NULL,
  `Bebidas_idBebida` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `entregado` int(11) DEFAULT '0',
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`Pedidos_nroMesa`,`Bebidas_idBebida`),
  KEY `fk_Pedidos_has_Bebidas_Bebidas1_idx` (`Bebidas_idBebida`),
  KEY `fk_Pedidos_has_Bebidas_Pedidos1_idx` (`Pedidos_nroMesa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PedidosBebidas`
--

INSERT INTO `PedidosBebidas` (`Pedidos_nroMesa`, `Bebidas_idBebida`, `cantidad`, `entregado`, `fecha`, `hora`) VALUES
(1, 2, 1, 2, '2014-06-04', '13:53:57'),
(1, 1, 1, 2, '2014-06-13', '10:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `PedidosMenus`
--

CREATE TABLE IF NOT EXISTS `PedidosMenus` (
  `Pedidos_nroMesa` int(11) NOT NULL,
  `Menus_idMenu` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `entregado` int(11) DEFAULT '0',
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`Pedidos_nroMesa`,`Menus_idMenu`),
  KEY `fk_Pedidos_has_Menus_Menus1_idx` (`Menus_idMenu`),
  KEY `fk_Pedidos_has_Menus_Pedidos_idx` (`Pedidos_nroMesa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PedidosMenus`
--

INSERT INTO `PedidosMenus` (`Pedidos_nroMesa`, `Menus_idMenu`, `cantidad`, `entregado`, `fecha`, `hora`) VALUES
(1, 1, 5, 5, '2014-06-06', '09:31:02'),
(3, 1, 3, 3, '2014-07-30', '17:43:16');

-- --------------------------------------------------------

--
-- Table structure for table `PedidosPizzas`
--

CREATE TABLE IF NOT EXISTS `PedidosPizzas` (
  `Pedidos_nroMesa` int(11) NOT NULL,
  `Pizzas_idPizza` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `entregado` int(11) DEFAULT '0',
  `idCombinado` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`Pedidos_nroMesa`,`Pizzas_idPizza`),
  KEY `fk_Pedidos_has_Pizzas_Pizzas1_idx` (`Pizzas_idPizza`),
  KEY `fk_Pedidos_has_Pizzas_Pedidos1_idx` (`Pedidos_nroMesa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PedidosPizzas`
--

INSERT INTO `PedidosPizzas` (`Pedidos_nroMesa`, `Pizzas_idPizza`, `cantidad`, `entregado`, `idCombinado`, `fecha`, `hora`) VALUES
(1, 1, 7, 7, NULL, '2014-07-30', '17:43:45'),
(1, 2, 3, 3, NULL, '2014-07-24', '08:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `Pizzas`
--

CREATE TABLE IF NOT EXISTS `Pizzas` (
  `idPizza` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePizza` varchar(45) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPizza`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Pizzas`
--

INSERT INTO `Pizzas` (`idPizza`, `nombrePizza`, `precio`) VALUES
(1, 'Pizza de prueba 1', 20000),
(2, 'Pizza de prueba 2', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `TiposMenus`
--

CREATE TABLE IF NOT EXISTS `TiposMenus` (
  `idTipoMenu` int(11) NOT NULL AUTO_INCREMENT,
  `tipoMenu` varchar(20) NOT NULL,
  PRIMARY KEY (`idTipoMenu`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `TiposMenus`
--

INSERT INTO `TiposMenus` (`idTipoMenu`, `tipoMenu`) VALUES
(1, 'Salads'),
(2, 'Appetizers');

-- --------------------------------------------------------

--
-- Table structure for table `TiposUsuarios`
--

CREATE TABLE IF NOT EXISTS `TiposUsuarios` (
  `idTipoUsuario` int(11) NOT NULL,
  `tipoUsuario` varchar(20) NOT NULL,
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TiposUsuarios`
--

INSERT INTO `TiposUsuarios` (`idTipoUsuario`, `tipoUsuario`) VALUES
(1, 'Mozo'),
(2, 'Cocina'),
(3, 'Barra'),
(4, 'Administrador');

-- --------------------------------------------------------

--
-- Table structure for table `Usuarios`
--

CREATE TABLE IF NOT EXISTS `Usuarios` (
  `user` varchar(15) NOT NULL,
  `nombreUsuario` varchar(30) DEFAULT NULL,
  `pass` varchar(16) NOT NULL,
  `TiposUsuarios_idTipoUsuario` int(11) NOT NULL,
  PRIMARY KEY (`user`,`TiposUsuarios_idTipoUsuario`),
  KEY `fk_Usuarios_TiposUsuarios1_idx` (`TiposUsuarios_idTipoUsuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Usuarios`
--

INSERT INTO `Usuarios` (`user`, `nombreUsuario`, `pass`, `TiposUsuarios_idTipoUsuario`) VALUES
('marce', 'Marcelo', 'mar12', 4),
('chori', 'Juan', 'short4', 1),
('carlitos', 'Carlos', 'litoscar', 2),
('jota', 'Jorge', 'atajo', 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
