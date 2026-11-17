-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2026 a las 13:43:19
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `benitez_stock`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(3, 'Aceites'),
(2, 'Almacén'),
(1, 'Harinas'),
(4, 'Infusiones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo` enum('entrada','salida','transferencia') NOT NULL,
  `producto_id` int(10) UNSIGNED NOT NULL,
  `sucursal_origen_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `sucursal_destino_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL,
  `observacion` varchar(200) NOT NULL DEFAULT '',
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id`, `tipo`, `producto_id`, `sucursal_origen_id`, `sucursal_destino_id`, `cantidad`, `observacion`, `usuario_id`, `fecha`) VALUES
(32, 'entrada', 1, NULL, 1, 41, 'Stock Inicial', NULL, '2026-09-01 11:00:00'),
(33, 'entrada', 1, NULL, 2, 31, 'Stock Inicial', NULL, '2026-09-01 11:00:00'),
(34, 'entrada', 2, NULL, 1, 14, 'Stock Inicial', NULL, '2026-09-01 11:00:00'),
(35, 'entrada', 2, NULL, 2, 16, 'Stock Inicial', NULL, '2026-09-01 11:00:00'),
(36, 'entrada', 3, NULL, 2, 5, 'Stock Inicial', NULL, '2026-09-01 11:00:00'),
(37, 'entrada', 4, NULL, 1, 59, 'Stock Inicial', NULL, '2026-09-01 11:00:00'),
(38, 'entrada', 4, NULL, 2, 7, 'Stock Inicial', NULL, '2026-09-01 11:00:00'),
(39, 'entrada', 5, NULL, 2, 43, 'Stock Inicial', NULL, '2026-09-01 11:00:00'),
(40, 'entrada', 6, NULL, 1, 36, 'Stock Inicial', NULL, '2026-09-01 11:00:00'),
(41, 'entrada', 6, NULL, 2, 10, 'Stock Inicial', NULL, '2026-09-01 11:00:00'),
(42, 'entrada', 7, NULL, 2, 10, 'Stock Inicial', NULL, '2026-09-01 11:00:00'),
(43, 'entrada', 8, NULL, 1, 38, 'Stock Inicial', NULL, '2026-09-01 11:00:00'),
(44, 'salida', 5, 2, NULL, 2, 'Entrega a Almacén Don José', 2, '2026-09-03 21:15:30'),
(45, 'entrada', 3, NULL, 1, 40, 'Remito 0001-00001097 - Mayorista Del Norte', 2, '2026-09-04 12:30:39'),
(46, 'salida', 4, 1, NULL, 7, 'Entrega pedido de Panadería La Espiga', 2, '2026-09-04 15:05:06'),
(47, 'salida', 6, 1, NULL, 2, 'Entrega pedido de Panadería La Espiga', 1, '2026-09-05 12:40:42'),
(48, 'entrada', 2, NULL, 1, 40, 'Remito 0001-00001085 - Distribuidora Molinos SA', 1, '2026-09-10 14:35:32'),
(49, 'salida', 6, 1, NULL, 4, 'Entrega a Almacén Don José', 1, '2026-09-10 16:20:13'),
(50, 'transferencia', 2, 1, 2, 10, 'Reposición de la Sucursal 2', 1, '2026-09-11 14:25:29'),
(51, 'salida', 2, 2, NULL, 4, 'Entrega a Kiosco El Sol', 2, '2026-09-12 17:50:10'),
(52, 'salida', 1, 1, NULL, 6, 'Venta mayorista', 1, '2026-09-13 19:40:18'),
(53, 'salida', 2, 1, NULL, 8, 'Venta mostrador', 2, '2026-09-14 14:55:54'),
(54, 'entrada', 1, NULL, 1, 50, 'Remito 0001-00001066 - Distribuidora Molinos SA', 1, '2026-09-15 11:15:57'),
(55, 'salida', 4, 2, NULL, 6, 'Entrega a Comedor San Martín', 2, '2026-09-17 21:25:55'),
(56, 'salida', 6, 1, NULL, 3, 'Venta mostrador', 1, '2026-09-18 12:25:31'),
(57, 'salida', 1, 1, NULL, 6, 'Venta mostrador', 1, '2026-09-20 21:55:45'),
(58, 'transferencia', 1, 1, 2, 10, 'Reposición de la Sucursal 2', 1, '2026-09-21 14:05:28'),
(59, 'entrada', 9, NULL, 1, 100, 'Remito 0001-00001279 - Mayorista Del Norte', 2, '2026-09-22 12:30:41'),
(60, 'salida', 9, 1, NULL, 6, 'Entrega pedido de Panadería La Espiga', 1, '2026-09-22 13:34:41'),
(61, 'transferencia', 9, 1, 2, 40, 'Reposición de la Sucursal 2', 2, '2026-09-22 17:36:41'),
(62, 'salida', 9, 1, NULL, 3, 'Entrega a Comedor San Martín', 2, '2026-09-22 17:58:41'),
(63, 'transferencia', 9, 1, 2, 40, 'Reposición de la Sucursal 2', 1, '2026-09-22 17:59:41'),
(64, 'salida', 9, 2, NULL, 4, 'Venta mostrador', 2, '2026-09-22 23:06:41'),
(65, 'transferencia', 6, 1, 2, 20, 'Reposición de la Sucursal 2', 2, '2026-09-24 15:15:47'),
(66, 'salida', 3, 1, NULL, 8, 'Venta mostrador', 1, '2026-09-25 17:20:27'),
(67, 'salida', 5, 2, NULL, 4, 'Venta mayorista', 1, '2026-09-26 13:50:26'),
(68, 'salida', 3, 1, NULL, 2, 'Venta mostrador', 2, '2026-09-26 18:55:43'),
(69, 'salida', 2, 1, NULL, 2, 'Entrega a Kiosco El Sol', 1, '2026-09-27 14:05:39'),
(70, 'transferencia', 4, 1, 2, 10, 'Reposición de la Sucursal 2', 2, '2026-09-27 14:20:04'),
(71, 'salida', 4, 2, NULL, 3, 'Venta mostrador', 1, '2026-09-27 19:00:46'),
(72, 'salida', 9, 2, NULL, 8, 'Entrega a Comedor San Martín', 2, '2026-09-29 16:10:34'),
(73, 'salida', 8, 1, NULL, 8, 'Venta mostrador', 2, '2026-09-29 20:00:52'),
(74, 'salida', 7, 2, NULL, 6, 'Entrega pedido de Panadería La Espiga', 2, '2026-09-30 21:05:42'),
(75, 'salida', 5, 2, NULL, 5, 'Entrega pedido de Panadería La Espiga', 1, '2026-10-01 19:20:21'),
(76, 'transferencia', 3, 1, 2, 10, 'Reposición de la Sucursal 2', 1, '2026-10-02 13:00:41'),
(77, 'salida', 3, 2, NULL, 9, 'Entrega pedido de Panadería La Espiga', 1, '2026-10-02 18:13:41'),
(78, 'salida', 4, 1, NULL, 3, 'Entrega a Almacén Don José', 1, '2026-10-04 17:00:03'),
(79, 'salida', 9, 1, NULL, 10, 'Venta mayorista', 2, '2026-10-04 21:30:12'),
(80, 'transferencia', 3, 1, 2, 10, 'Reposición de la Sucursal 2', 2, '2026-10-06 12:40:25'),
(81, 'salida', 7, 2, NULL, 4, 'Entrega pedido de Panadería La Espiga', 2, '2026-10-06 19:55:16'),
(82, 'salida', 4, 2, NULL, 3, 'Entrega a Kiosco El Sol', 2, '2026-10-08 22:25:18'),
(83, 'salida', 9, 2, NULL, 12, 'Venta mayorista', 2, '2026-10-09 11:05:37'),
(84, 'transferencia', 8, 1, 2, 20, 'Reposición de la Sucursal 2', 2, '2026-10-09 15:25:53'),
(85, 'salida', 8, 2, NULL, 7, 'Venta mayorista', 2, '2026-10-09 19:33:53'),
(86, 'salida', 8, 2, NULL, 5, 'Entrega a Comedor San Martín', 2, '2026-10-09 21:08:53'),
(87, 'transferencia', 4, 1, 2, 20, 'Reposición de la Sucursal 2', 1, '2026-10-12 12:20:59'),
(88, 'salida', 4, 2, NULL, 8, 'Venta mostrador', 2, '2026-10-12 17:27:59'),
(89, 'salida', 4, 1, NULL, 9, 'Entrega a Comedor San Martín', 1, '2026-10-12 20:15:38'),
(90, 'salida', 8, 2, NULL, 4, 'Venta mostrador', 2, '2026-10-12 21:25:23'),
(91, 'salida', 6, 2, NULL, 7, 'Entrega pedido de Panadería La Espiga', 2, '2026-10-13 17:40:35'),
(92, 'salida', 3, 1, NULL, 2, 'Venta mayorista', 2, '2026-10-13 19:50:36'),
(93, 'salida', 1, 1, NULL, 3, 'Entrega pedido de Panadería La Espiga', 2, '2026-10-16 16:30:47'),
(94, 'salida', 2, 2, NULL, 9, 'Venta mostrador', 1, '2026-10-17 13:00:20'),
(95, 'salida', 5, 2, NULL, 9, 'Entrega a Kiosco El Sol', 2, '2026-10-17 18:50:29'),
(96, 'salida', 1, 1, NULL, 3, 'Entrega a Comedor San Martín', 1, '2026-10-19 16:35:27'),
(97, 'salida', 2, 2, NULL, 3, 'Venta mostrador', 1, '2026-10-20 11:05:24'),
(98, 'entrada', 9, NULL, 1, 60, 'Remito 0001-00001265 - Mayorista Del Norte', 1, '2026-10-20 12:10:44'),
(99, 'salida', 9, 1, NULL, 2, 'Venta mayorista', 2, '2026-10-20 14:11:44'),
(100, 'salida', 9, 1, NULL, 12, 'Venta mayorista', 1, '2026-10-20 14:30:44'),
(101, 'salida', 6, 1, NULL, 3, 'Entrega pedido de Panadería La Espiga', 1, '2026-10-20 15:45:19'),
(102, 'salida', 9, 1, NULL, 14, 'Venta mayorista', 1, '2026-10-20 17:11:44'),
(103, 'salida', 9, 1, NULL, 4, 'Venta mayorista', 2, '2026-10-20 17:45:40'),
(104, 'salida', 3, 1, NULL, 4, 'Entrega a Kiosco El Sol', 1, '2026-10-21 15:10:22'),
(105, 'salida', 9, 1, NULL, 8, 'Venta mayorista', 1, '2026-10-21 19:35:56'),
(106, 'salida', 8, 2, NULL, 1, 'Venta mayorista', 2, '2026-10-23 14:20:49'),
(107, 'salida', 3, 2, NULL, 2, 'Entrega pedido de Panadería La Espiga', 2, '2026-10-24 19:50:11'),
(108, 'salida', 4, 2, NULL, 2, 'Entrega pedido de Panadería La Espiga', 1, '2026-10-25 16:45:57'),
(109, 'salida', 9, 2, NULL, 13, 'Venta mayorista', 1, '2026-10-25 19:40:06'),
(110, 'salida', 1, 2, NULL, 5, 'Venta mostrador', 1, '2026-10-26 18:10:30'),
(111, 'salida', 9, 2, NULL, 5, 'Venta mayorista', 2, '2026-10-27 14:10:15'),
(112, 'entrada', 7, NULL, 1, 48, 'Remito 0001-00001195 - Mayorista Del Norte', 1, '2026-10-28 12:30:17'),
(113, 'transferencia', 7, 1, 2, 12, 'Reposición de la Sucursal 2', 2, '2026-10-28 13:36:17'),
(114, 'salida', 7, 1, NULL, 8, 'Venta mostrador', 1, '2026-10-28 14:51:17'),
(115, 'salida', 7, 1, NULL, 8, 'Entrega a Comedor San Martín', 2, '2026-10-28 15:04:17'),
(116, 'salida', 7, 1, NULL, 5, 'Entrega a Comedor San Martín', 2, '2026-10-28 15:35:17'),
(117, 'salida', 7, 2, NULL, 2, 'Venta mostrador', 2, '2026-10-28 16:05:17'),
(118, 'salida', 7, 1, NULL, 8, 'Entrega pedido de Panadería La Espiga', 1, '2026-10-28 16:09:17'),
(119, 'salida', 7, 1, NULL, 3, 'Entrega a Kiosco El Sol', 1, '2026-10-28 18:14:17'),
(120, 'salida', 2, 1, NULL, 9, 'Venta mostrador', 1, '2026-10-29 11:05:00'),
(121, 'salida', 9, 2, NULL, 6, 'Venta mayorista', 1, '2026-10-30 16:55:13'),
(122, 'salida', 6, 2, NULL, 3, 'Venta mostrador', 2, '2026-10-30 20:25:05'),
(123, 'salida', 4, 1, NULL, 2, 'Entrega a Comedor San Martín', 1, '2026-10-30 20:50:41'),
(124, 'salida', 1, 2, NULL, 6, 'Entrega a Comedor San Martín', 2, '2026-10-30 21:35:45'),
(125, 'salida', 8, 1, NULL, 8, 'Entrega a Kiosco El Sol', 2, '2026-10-31 14:25:17'),
(126, 'salida', 2, 1, NULL, 9, 'Entrega pedido de Panadería La Espiga', 1, '2026-11-02 12:50:17'),
(127, 'transferencia', 2, 1, 2, 10, 'Reposición de la Sucursal 2', 2, '2026-11-02 14:35:59'),
(128, 'entrada', 5, NULL, 1, 50, 'Remito 0001-00001151 - Mayorista Del Norte', 2, '2026-11-03 12:10:11'),
(129, 'salida', 9, 2, NULL, 12, 'Venta mayorista', 2, '2026-11-03 12:35:29'),
(130, 'salida', 5, 1, NULL, 8, 'Venta mayorista', 2, '2026-11-03 13:11:11'),
(131, 'salida', 5, 1, NULL, 6, 'Entrega pedido de Panadería La Espiga', 2, '2026-11-03 15:18:11'),
(132, 'salida', 5, 1, NULL, 4, 'Venta mostrador', 1, '2026-11-03 15:44:11'),
(133, 'transferencia', 5, 1, 2, 10, 'Reposición de la Sucursal 2', 1, '2026-11-03 17:23:11'),
(134, 'salida', 5, 1, NULL, 7, 'Venta mayorista', 1, '2026-11-03 17:29:11'),
(135, 'salida', 1, 1, NULL, 8, 'Entrega a Kiosco El Sol', 2, '2026-11-03 21:25:13'),
(136, 'salida', 6, 2, NULL, 5, 'Entrega pedido de Panadería La Espiga', 1, '2026-11-04 12:40:33'),
(137, 'salida', 6, 2, NULL, 5, 'Venta mostrador', 1, '2026-11-04 15:20:48'),
(138, 'salida', 3, 2, NULL, 4, 'Entrega pedido de Panadería La Espiga', 1, '2026-11-04 17:20:29'),
(139, 'salida', 9, 2, NULL, 8, 'Venta mayorista', 1, '2026-11-04 21:40:20'),
(140, 'entrada', 4, NULL, 1, 30, 'Remito 0001-00001122 - Distribuidora Molinos SA', 1, '2026-11-05 12:50:40'),
(141, 'salida', 2, 2, NULL, 4, 'Entrega a Almacén Don José', 1, '2026-11-05 17:30:51'),
(142, 'salida', 5, 2, NULL, 8, 'Entrega pedido de Panadería La Espiga', 1, '2026-11-06 13:55:57'),
(143, 'salida', 5, 1, NULL, 7, 'Venta mostrador', 2, '2026-11-06 15:25:40'),
(144, 'salida', 6, 1, NULL, 4, 'Venta mostrador', 1, '2026-11-07 11:10:20'),
(145, 'entrada', 6, NULL, 1, 80, 'Remito 0001-00001164 - Distribuidora Molinos SA', 1, '2026-11-07 13:20:34'),
(146, 'transferencia', 6, 1, 2, 20, 'Reposición de la Sucursal 2', 2, '2026-11-07 15:25:51'),
(147, 'salida', 3, 2, NULL, 6, 'Venta mostrador', 2, '2026-11-07 18:35:07'),
(148, 'salida', 3, 1, NULL, 4, 'Venta mostrador', 2, '2026-11-08 14:40:57'),
(149, 'transferencia', 1, 1, 2, 10, 'Reposición de la Sucursal 2', 2, '2026-11-08 15:15:00'),
(150, 'salida', 1, 2, NULL, 9, 'Venta mostrador', 1, '2026-11-08 15:30:36'),
(151, 'salida', 7, 1, NULL, 1, 'Venta mayorista', 2, '2026-11-09 14:35:32'),
(152, 'entrada', 8, NULL, 1, 50, 'Remito 0001-00001233 - Distribuidora Molinos SA', 1, '2026-11-10 12:35:42'),
(153, 'salida', 9, 1, NULL, 9, 'Venta mayorista', 1, '2026-11-10 13:40:14'),
(154, 'salida', 2, 2, NULL, 4, 'Entrega a Kiosco El Sol', 1, '2026-11-10 14:35:37'),
(155, 'transferencia', 8, 1, 2, 20, 'Reposición de la Sucursal 2', 1, '2026-11-10 15:58:42'),
(156, 'salida', 8, 1, NULL, 7, 'Entrega a Kiosco El Sol', 2, '2026-11-10 17:09:42'),
(157, 'salida', 8, 2, NULL, 6, 'Venta mayorista', 2, '2026-11-10 21:44:42'),
(158, 'salida', 1, 2, NULL, 9, 'Entrega a Comedor San Martín', 1, '2026-11-11 18:05:27'),
(159, 'salida', 8, 2, NULL, 8, 'Venta mostrador', 1, '2026-11-12 13:20:55'),
(160, 'salida', 9, 2, NULL, 5, 'Entrega a Almacén Don José', 2, '2026-11-12 20:35:05'),
(161, 'salida', 9, 1, NULL, 12, 'Venta mayorista', 1, '2026-11-13 16:35:08'),
(162, 'salida', 1, 2, NULL, 2, 'Venta mostrador', 1, '2026-11-14 14:10:52'),
(163, 'entrada', 10, NULL, 1, 15, 'California', 1, '2026-11-15 19:59:56'),
(164, 'entrada', 10, NULL, 2, 15, 'California', 1, '2026-11-15 20:00:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `categoria_id` smallint(5) UNSIGNED NOT NULL,
  `presentacion` varchar(50) NOT NULL DEFAULT '',
  `caracteristica` varchar(100) NOT NULL DEFAULT '',
  `precio` decimal(12,2) NOT NULL DEFAULT 0.00,
  `proveedor` varchar(120) NOT NULL DEFAULT '',
  `vencimiento` date DEFAULT NULL,
  `lote` varchar(40) NOT NULL DEFAULT '',
  `medidas` varchar(60) NOT NULL DEFAULT '',
  `almacenamiento` varchar(120) NOT NULL DEFAULT '',
  `imagen` varchar(255) DEFAULT NULL,
  `stock_minimo` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `version` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp(),
  `actualizado_en` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `categoria_id`, `presentacion`, `caracteristica`, `precio`, `proveedor`, `vencimiento`, `lote`, `medidas`, `almacenamiento`, `imagen`, `stock_minimo`, `activo`, `version`, `creado_en`, `actualizado_en`) VALUES
(1, 'HAR-000-001', 'Harina Morixe 000', 1, '1 kg', 'Paquete de papel rojo', 1250.50, 'Distribuidora Molinos SA', '2027-03-15', 'L2609-A', '10 x 6 x 19 cm', 'Lugar seco y fresco', 'imgstock/harinamorixe.png', 10, 1, 1, '2026-11-15 19:13:13', '2026-11-15 19:13:13'),
(2, 'HAR-0000-002', 'Harina Morixe 0000', 1, '1 kg', 'Paquete de papel azul', 1380.00, 'Distribuidora Molinos SA', '2027-03-20', 'L2609-B', '10 x 6 x 19 cm', 'Lugar seco y fresco', 'imgstock/harinamorixecuatroceros.png', 10, 1, 1, '2026-11-15 19:13:13', '2026-11-15 19:13:13'),
(3, 'HAR-000-003', 'Harina Morixe 000 (lote 2)', 1, '1 kg', 'Paquete de papel rojo', 1240.00, 'Mayorista Del Norte', '2027-01-10', 'L2608-C', '10 x 6 x 19 cm', 'Lugar seco, lejos de la humedad', 'imgstock/harinamorixetresceros.png', 10, 0, 2, '2026-11-15 19:13:13', '2026-11-15 19:14:38'),
(4, 'AZU-REF-004', 'Azúcar Blanca Refinada', 2, '1 kg', 'Paquete blanco y azul', 980.00, 'Distribuidora Molinos SA', '2028-05-01', 'L2611-A', '9 x 6 x 18 cm', 'Lugar seco, lejos de olores fuertes', 'imgstock/azucar.png', 10, 1, 1, '2026-11-15 19:13:13', '2026-11-15 19:13:13'),
(5, 'ARR-LFN-005', 'Arroz Largo Fino', 2, '1 kg', 'Paquete amarillo', 1450.00, 'Mayorista Del Norte', '2027-10-15', 'L2610-B', '10 x 6 x 19 cm', 'Lugar seco y fresco', 'imgstock/arroz.png', 10, 1, 1, '2026-11-15 19:13:13', '2026-11-15 19:13:13'),
(6, 'FID-TIR-006', 'Fideos Tirabuzón', 2, '500 g', 'Paquete rojo y amarillo', 890.75, 'Distribuidora Molinos SA', '2028-02-20', 'L2611-C', '14 x 5 x 23 cm', 'Lugar seco y ventilado', 'imgstock/fideos.png', 15, 1, 1, '2026-11-15 19:13:13', '2026-11-15 19:13:13'),
(7, 'ACE-GIR-007', 'Aceite de Girasol', 3, '900 ml', 'Botella plástica amarilla', 2300.00, 'Mayorista Del Norte', '2027-08-30', 'L2610-D', '8 x 8 x 26 cm', 'Lejos de la luz solar y del calor', 'imgstock/aceite.png', 8, 1, 1, '2026-11-15 19:13:13', '2026-11-15 19:13:13'),
(8, 'YER-MAT-008', 'Yerba Mate con Palo', 4, '1 kg', 'Paquete verde', 4100.00, 'Distribuidora Molinos SA', '2027-11-10', 'L2611-E', '12 x 7 x 25 cm', 'Lugar seco, bien cerrado después de abrir', 'imgstock/yerba.png', 10, 1, 1, '2026-11-15 19:13:13', '2026-11-15 19:13:13'),
(9, 'SAL-FIN-009', 'Sal Fina de Mesa', 2, '500 g', 'Paquete azul', 650.00, 'Mayorista Del Norte', '2029-10-20', 'L2610-F', '8 x 5 x 14 cm', 'Lugar seco, lejos de la humedad', 'imgstock/sal.png', 5, 1, 1, '2026-11-15 19:13:13', '2026-11-15 19:13:13'),
(10, 'HAR-000-010', 'Harina Chacabuco Dos Ceros', 1, '1 kg', 'Rojo y Verde', 2000.00, 'California', '2027-04-23', 'L2610-B', '10 x 6 x 19 cm', '30', 'uploads/0720b58f3004e4c5b820e5ecee6f0c61.jpg', 10, 1, 2, '2026-11-15 19:59:17', '2026-11-15 20:01:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `producto_id` int(10) UNSIGNED NOT NULL,
  `sucursal_id` tinyint(3) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ubicacion` varchar(100) NOT NULL DEFAULT ''
) ;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`producto_id`, `sucursal_id`, `cantidad`, `ubicacion`) VALUES
(1, 1, 45, 'Depósito A - Estante 1'),
(1, 2, 20, 'Depósito - Estante 1'),
(2, 1, 6, 'Depósito A - Estante 1'),
(2, 2, 12, 'Depósito - Estante 1'),
(3, 1, 0, 'Depósito B - Estante 2'),
(3, 2, 4, 'Depósito - Estante 2'),
(4, 1, 38, 'Depósito A - Estante 2'),
(4, 2, 15, 'Depósito - Estante 3'),
(5, 1, 8, 'Depósito A - Estante 3'),
(5, 2, 25, 'Depósito - Estante 3'),
(6, 1, 60, 'Depósito B - Estante 1'),
(6, 2, 30, 'Depósito - Estante 4'),
(7, 1, 3, 'Depósito B - Estante 3'),
(7, 2, 10, 'Depósito - Estante 5'),
(8, 1, 25, 'Depósito A - Estante 4'),
(8, 2, 9, 'Depósito - Estante 6'),
(9, 1, 0, 'Depósito B - Estante 2'),
(9, 2, 7, 'Depósito - Estante 2'),
(10, 1, 15, 'Ubicación: Depósito A - Estante 4'),
(10, 2, 15, 'Ubicación: Depósito B - Estante 4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id`, `nombre`) VALUES
(1, 'Sucursal 1'),
(2, 'Sucursal 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('administrador','empleado') NOT NULL DEFAULT 'empleado',
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol`, `activo`, `creado_en`) VALUES
(1, 'Lopez Bruno', 'brunodaniellopez24@gmail.com', '$2y$12$uBm/1Tvsp.LQv/AMzQmcVe8xpz0a0sisDhrLOqqzEOWe0oaNRNhy.', 'administrador', 1, '2026-10-21 21:35:52'),
(2, 'Matias Nicolas Benitez', 'mnbenitez2020@gmail.com', '$2y$12$uIZHpY/TyTJACdYq0hicv.KvQJEw747pDyyBkiXYzOxWhb8UTHPgm', 'administrador', 1, '2026-11-03 01:03:00'),
(3, 'Facundo', 'snigerxd@gmail.com', '$2y$12$TjWC4HNvGgt/SRjiew7Qce7gfbzHAeqPnB3ZPz2p19KFKV95eGX5i', 'empleado', 1, '2026-11-13 18:01:54');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_categorias_nombre` (`nombre`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_movimientos_producto` (`producto_id`),
  ADD KEY `idx_movimientos_fecha` (`fecha`),
  ADD KEY `fk_mov_origen` (`sucursal_origen_id`),
  ADD KEY `fk_mov_destino` (`sucursal_destino_id`),
  ADD KEY `fk_mov_usuario` (`usuario_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_productos_codigo` (`codigo`),
  ADD KEY `idx_productos_nombre` (`nombre`),
  ADD KEY `idx_productos_vencimiento` (`vencimiento`),
  ADD KEY `fk_productos_categoria` (`categoria_id`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`producto_id`,`sucursal_id`),
  ADD KEY `fk_stock_sucursal` (`sucursal_id`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_sucursales_nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_usuarios_email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `fk_mov_destino` FOREIGN KEY (`sucursal_destino_id`) REFERENCES `sucursales` (`id`),
  ADD CONSTRAINT `fk_mov_origen` FOREIGN KEY (`sucursal_origen_id`) REFERENCES `sucursales` (`id`),
  ADD CONSTRAINT `fk_mov_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `fk_mov_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_stock_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `fk_stock_sucursal` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
