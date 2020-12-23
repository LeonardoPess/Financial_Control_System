-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2020 at 11:01 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projeto_01`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin.clientes`
--

CREATE TABLE `tb_admin.clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `cpf_cnpj` varchar(255) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin.clientes`
--

INSERT INTO `tb_admin.clientes` (`id`, `nome`, `email`, `tipo`, `cpf_cnpj`, `imagem`) VALUES
(28, 'Leonardo', 'leonardopss1cs@gmail.com', 'fisico', '424.242.424-24', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin.estoque`
--

CREATE TABLE `tb_admin.estoque` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `largura` int(11) NOT NULL,
  `altura` int(11) NOT NULL,
  `comprimento` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin.estoque`
--

INSERT INTO `tb_admin.estoque` (`id`, `nome`, `descricao`, `largura`, `altura`, `comprimento`, `peso`, `quantidade`) VALUES
(1, 'Shoes', 'ShoesShoesShoesShoesShoesShoesShoesShoesShoesShoesShoesShoesShoesShoesShoesShoesShoesShoesShoesShoesShoesShoesShoesShoes', 10, 20, 30, 40, 50);

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin.estoque_imagens`
--

CREATE TABLE `tb_admin.estoque_imagens` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin.estoque_imagens`
--

INSERT INTO `tb_admin.estoque_imagens` (`id`, `produto_id`, `imagem`) VALUES
(1, 1, '5fe3bc2567880.jpg'),
(2, 1, '5fe3bc2568056.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin.financeiro`
--

CREATE TABLE `tb_admin.financeiro` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `vencimento` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin.online`
--

CREATE TABLE `tb_admin.online` (
  `id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `ultima_acao` datetime NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin.online`
--

INSERT INTO `tb_admin.online` (`id`, `ip`, `ultima_acao`, `token`) VALUES
(44, '::1', '2020-12-23 18:59:07', '5fd7d2764c3e0');

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin.usuarios`
--

CREATE TABLE `tb_admin.usuarios` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin.usuarios`
--

INSERT INTO `tb_admin.usuarios` (`id`, `user`, `password`, `img`, `nome`, `cargo`) VALUES
(1, 'admin', 'admin', '5fd3f275bb27f.jpg', 'Leonardo Pessoa', 0),
(2, 'leo', 'leo', '7612528fd50281b2631d690953b96b61.jpg', 'Leo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin.visitas`
--

CREATE TABLE `tb_admin.visitas` (
  `id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `dia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin.visitas`
--

INSERT INTO `tb_admin.visitas` (`id`, `ip`, `dia`) VALUES
(1, '::1', '2020-10-19'),
(2, '192.168.0.2', '2020-10-18'),
(3, '::1', '2020-10-25'),
(4, '::1', '2020-11-02'),
(5, '::1', '2020-11-10'),
(6, '::1', '2020-11-17'),
(7, '::1', '2020-12-06'),
(8, '::1', '2020-12-14'),
(9, '::1', '2020-12-21'),
(10, '::1', '2020-12-21'),
(11, '::1', '2020-12-21');

-- --------------------------------------------------------

--
-- Table structure for table `tb_site.categorias`
--

CREATE TABLE `tb_site.categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_site.categorias`
--

INSERT INTO `tb_site.categorias` (`id`, `nome`, `slug`, `order_id`) VALUES
(15, 'Cotidiano', 'cotidiano', 18),
(16, 'Games', 'games', 15),
(17, 'Esporte', 'esporte', 16),
(19, 'Outros', 'outros', 19),
(21, 'teste', 'teste', 21);

-- --------------------------------------------------------

--
-- Table structure for table `tb_site.config`
--

CREATE TABLE `tb_site.config` (
  `titulo` varchar(255) NOT NULL,
  `nome_autor` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `icone1` varchar(255) NOT NULL,
  `descricao1` text NOT NULL,
  `icone2` varchar(255) NOT NULL,
  `descricao2` text NOT NULL,
  `icone3` varchar(255) NOT NULL,
  `descricao3` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_site.config`
--

INSERT INTO `tb_site.config` (`titulo`, `nome_autor`, `descricao`, `icone1`, `descricao1`, `icone2`, `descricao2`, `icone3`, `descricao3`) VALUES
('Projeto 01', 'Leonardo Pessoa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at nunc ornare, vehicula nisl eget, tristique arcu. Etiam porttitor mauris risus, at maximus tellus fermentum ut. Nullam commodo interdum lorem, a consequat est. Ut vel sollicitudin purus. Phasellus pretium elit ac purus feugiat ultricies. Aliquam massa lectus, scelerisque vel porta at, efficitur quis diam. Nam vitae lorem placerat, varius turpis in, tincidunt ante. Sed tincidunt posuere dui.\r\n\r\nPhasellus hendrerit, lacus eget efficitur mollis, diam erat faucibus sapien, ut tristique arcu enim tempor neque. Vestibulum at tellus ac turpis aliquam laoreet. Integer sit amet tempor ipsum, a consectetur massa. Vivamus suscipit tortor ut nisl iaculis aliquam. Aliquam vel odio at eros vestibulum malesuada vitae vitae enim. Suspendisse varius metus facilisis, ullamcorper ligula in, pellentesque lacus. Interdum et malesuada fames ac ante ipsum primis in faucibus.\r\n\r\n\r\nPhasellus hendrerit, lacus eget efficitur mollis, diam erat faucibus sapien, ut tristique arcu enim tempor neque. Vestibulum at tellus ac turpis aliquam laoreet. Integer sit amet tempor ipsum, a consectetur massa. Vivamus suscipit tortor ut nisl iaculis aliquam. Aliquam vel odio at eros vestibulum malesuada vitae vitae enim. Suspendisse varius metus facilisis, ullamcorper ligula in, pellentesque lacus. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 'fab fa-css3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at nunc ornare, vehicula nisl eget, tristique arcu. Etiam porttitor mauris risus, at maximus tellus fermentum ut. Nullam commodo interdum lorem, a consequat est. Ut vel sollicitudin purus. Phasellus pretium elit ac purus feugiat ultricies. Aliquam massa lectus.', 'fab fa-html5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at nunc ornare, vehicula nisl eget, tristique arcu. Etiam porttitor mauris risus, at maximus tellus fermentum ut. Nullam commodo interdum lorem, a consequat est. Ut vel sollicitudin purus. Phasellus pretium elit ac purus feugiat ultricies. Aliquam massa lectus.', 'fab fa-js-square', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at nunc ornare, vehicula nisl eget, tristique arcu. Etiam porttitor mauris risus, at maximus tellus fermentum ut. Nullam commodo interdum lorem, a consequat est. Ut vel sollicitudin purus. Phasellus pretium elit ac purus feugiat ultricies. Aliquam massa lectus.');

-- --------------------------------------------------------

--
-- Table structure for table `tb_site.depoimentos`
--

CREATE TABLE `tb_site.depoimentos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `depoimento` text NOT NULL,
  `data` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_site.depoimentos`
--

INSERT INTO `tb_site.depoimentos` (`id`, `nome`, `depoimento`, `data`, `order_id`) VALUES
(26, 'Leonardo', 'Funcionando!', '19/09/2020', 29),
(27, 'Paulo', 'Muito bom mesmo!!!', '19/09/2020', 27),
(28, 'Marcia', 'Gostei de mais!', '19/09/2020', 26),
(29, 'Ana', 'Otimo atendimento!', '20/03/2021', 28),
(30, 'Leonardo', 'TESTEEEEEEEEEEEEEEEE', '20/03/2021', 30),
(31, 'TomY', 'OUTRO TESTE', '20/03/2021', 31);

-- --------------------------------------------------------

--
-- Table structure for table `tb_site.noticias`
--

CREATE TABLE `tb_site.noticias` (
  `id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `conteudo` text NOT NULL,
  `capa` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_site.noticias`
--

INSERT INTO `tb_site.noticias` (`id`, `categoria_id`, `data`, `titulo`, `conteudo`, `capa`, `slug`, `order_id`) VALUES
(24, 16, '2020-12-11', 'Novo jogo do Mario', '<h3 style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\"><a title=\"link\" href=\"../noticias/general/novo-jogo-do-mario\"><span style=\"text-decoration: underline;\">Lorem ipsum dolor sit amet.</span></a></h3>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et magna turpis. In venenatis leo nec quam laoreet vestibulum. Nunc pharetra, elit id convallis rutrum, lectus dolor ullamcorper arcu, ac vulputate enim augue ac nisl. Vivamus ac libero eget turpis vehicula mattis at ut sem. Sed tempus tincidunt aliquet. Phasellus tincidunt suscipit purus sed iaculis. Sed vel feugiat augue, a porta mauris. Fusce elementum et elit non pretium. Suspendisse et vulputate est. Nunc <a title=\"link\" href=\"#\">rutrum</a> ipsum quis velit pretium vulputate. In molestie lorem et ultricies semper. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum erat tellus, hendrerit ut eros ut, ornare tincidunt leo. Fusce feugiat ipsum sed enim sagittis, eu feugiat diam placerat. Etiam tortor dolor, blandit a libero eu, condimentum feugiat sem.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; font-family: \'Open Sans\', Arial, sans-serif;\"><a title=\"Jogo do mario\" href=\"https://www.clickjogos.com.br/jogos-do-mario\" target=\"_blank\" rel=\"noopener\"><img style=\"float: left;\" src=\"https://cdn.vox-cdn.com/thumbor/Q6cr4ujTzXuv3NhRUIDkgZHxDdo=/0x0:2048x2048/920x613/filters:focal(861x861:1187x1187):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/65327601/mobile_MarioKartTour_screen_07_png_jpgcopy.0.jpg\" alt=\"Mario\" width=\"573\" height=\"430\" /></a></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\">Suspendisse et faucibus nisl. Duis ac est dignissim, fermentum dui at, iaculis risus. Cras maximus tempor lacus, at mattis leo bibendum eu. Fusce eleifend urna vitae tellus varius, non lacinia augue dictum. Aenean nec justo non odio ultrices elementum. Duis dignissim massa nec sodales rhoncus. In at lorem eu arcu tristique vestibulum non ac turpis. Vivamus nibh massa, fermentum et eros vel, dapibus feugiat arcu. Pellentesque malesuada, felis id varius fringilla, orci felis vulputate nisl, nec accumsan libero tellus sed risus. Donec non sem malesuada, aliquam enim nec, pharetra felis. Mauris ut nibh purus. In rutrum lorem sit amet justo dignissim blandit. Integer placerat, orci sed sollicitudin ullamcorper, arcu est placerat orci, sed sollicitudin sapien nisl nec ligula.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; font-family: \'Open Sans\', Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et magna turpis. In venenatis leo nec quam laoreet vestibulum. Nunc pharetra, elit id convallis rutrum, lectus dolor ullamcorper arcu, ac vulputate enim augue ac nisl. Vivamus ac libero eget turpis vehicula mattis at ut sem. Sed tempus tincidunt aliquet. Phasellus tincidunt suscipit purus sed iaculis. &nbsp;Sed vel feugiat augue, a porta mauris. Fusce elementum et elit non pretium. Suspendisse et vulputate est. Nunc rutrum ipsum quis velit pretium vulputate. In molestie lorem et ultricies semper. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum erat tellus, hendrerit ut eros ut, ornare tincidunt leo. Fusce feugiat ipsum sed enim sagittis, eu feugiat diam placerat. Etiam tortor dolor, blandit a libero eu, condimentum feugiat sem.</p>\r\n<p><img style=\"float: right;\" src=\"https://o.aolcdn.com/images/dims?quality=95&amp;image_uri=https%3A%2F%2Fs.yimg.com%2Fuu%2Fapi%2Fres%2F1.2%2FtNrD8vrdRCaa3mYROY.Trw--%7EB%2FaD0xMjAwO3c9MTgwMDthcHBpZD15dGFjaHlvbg--%2Fhttps%3A%2F%2Fo.aolcdn.com%2Fimages%2Fdims%3Fresize%3D2000%252C2000%252Cshrink%26image_uri%3Dhttps%253A%252F%252Fs.yimg.com%252Fos%252Fcreatr-uploaded-images%252F2019-09%252F1795b250-dfb2-11e9-bbfa-667345bbfd13%26client%3Da1acac3e1b3290917d92%26signature%3D5cecb2417060aade38045b69b6a2980310a00383&amp;client=amp-blogside-v2&amp;signature=ee46817cc99265d5b62cd946758a27a54c3d8be4\" alt=\"Mario Kart\" width=\"303\" height=\"202\" /></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\">Suspendisse et faucibus nisl. Duis ac est dignissim, fermentum dui at, iaculis risus. Cras maximus tempor lacus, at mattis leo bibendum eu. Fusce eleifend urna vitae tellus varius, non lacinia augue dictum. Aenean nec justo non odio ultrices elementum. Duis dignissim massa nec sodales rhoncus. In at lorem eu arcu tristique vestibulum non ac turpis. Vivamus nibh massa, fermentum et eros vel, dapibus feugiat arcu. Pellentesque malesuada, felis id varius fringilla, orci felis vulputate nisl, nec accumsan libero tellus sed risus. Donec non sem malesuada, aliquam enim nec, pharetra felis. Mauris ut nibh purus. In rutrum lorem sit amet justo dignissim blandit. Integer placerat, orci sed sollicitudin ullamcorper, arcu est placerat orci, sed sollicitudin sapien nisl nec ligula. In rutrum lorem sit amet justo dignissim blandit. Integer placerat, orci sed sollicitudin ullamcorper, arcu est placerat orci, sed sollicitudin sapien nisl nec ligula. In rutrum lorem sit amet justo dignissim blandit. Integer placerat, orci sed sollicitudin ullamcorper, arcu est placerat orci, suspendisse et faucibus nisl</p>\r\n<h2 style=\"margin: 0px 0px 15px; padding: 0px; font-family: \'Open Sans\', Arial, sans-serif; text-align: center;\">Jogue agora mesmo!!!</h2>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\">Duis blandit nisi sit amet arcu hendrerit, ac porttitor sem euismod. Donec sollicitudin dictum justo ac pretium. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi pretium volutpat quam id pulvinar. Donec quis ullamcorper dolor, eget tempor erat. Aenean non magna sit amet justo iaculis sagittis id eget libero. Integer justo libero, feugiat ac erat eu, consequat tempor nisl. Quisque viverra lacinia erat, ornare mollis elit posuere ac. Cras cursus bibendum lacinia. Aenean congue blandit eleifend.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; font-family: \'Open Sans\', Arial, sans-serif;\"><a title=\"jogo\" href=\"https://www.clickjogos.com.br/jogos-do-mario\" target=\"_blank\" rel=\"noopener\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://play-lh.googleusercontent.com/hiz-TueaN7iSVEvnaVswjlxx6sx8ReTQXVpOvMv4Ko6DFrOqAxDxomg2eWRXX9o55eQ\" alt=\"Mario Kart\" width=\"512\" height=\"250\" /></a></p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\">Quisque sed massa nec lorem auctor sodales. Ut et massa quis mi interdum volutpat. Fusce eget varius velit. Cras dapibus, velit sit amet volutpat venenatis, urna massa rutrum eros, vel dignissim purus ex ac lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam non velit convallis, ultricies nisi nec, molestie enim. Morbi in est vehicula, posuere ante non, lobortis diam. Donec velit tellus, congue vitae diam eget, tincidunt gravida libero. Donec commodo metus ut felis vulputate porta. Ut gravida ac elit eget ullamcorper. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;</p>\r\n<ul>\r\n<li style=\"text-align: center;\"><span style=\"font-family: \'Open Sans\', Arial, sans-serif; text-align: justify;\">Lorem ipsum dolor sit amet</span></li>\r\n<li style=\"text-align: center;\"><span style=\"font-family: \'Open Sans\', Arial, sans-serif; text-align: justify;\">Lorem ipsum dolor sit amet</span></li>\r\n<li style=\"text-align: center;\"><span style=\"font-family: \'Open Sans\', Arial, sans-serif; text-align: justify;\">Lorem ipsum dolor sit amet</span></li>\r\n<li style=\"text-align: center;\"><span style=\"font-family: \'Open Sans\', Arial, sans-serif; text-align: justify;\">Lorem ipsum dolor sit amet</span></li>\r\n</ul>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif;\">Integer est augue, imperdiet egestas magna nec, dignissim bibendum augue. Aenean dignissim, diam eget tincidunt semper, metus libero pulvinar purus, in dapibus sem eros commodo urna. Ut hendrerit suscipit dignissim. Nulla facilisi. Integer gravida sem sed massa ultrices vulputate. Vestibulum eu maximus quam. Donec dignissim arcu vel est cursus, ut maximus ipsum mollis. Proin quis augue eu leo scelerisque volutpat at eu leo. Donec ut fermentum ligula. Duis interdum urna id lacus mollis dapibus. Duis hendrerit sem aliquam posuere tristique. Curabitur suscipit venenatis dui vitae bibendum. Etiam malesuada pellentesque dolor, ac scelerisque ipsum condimentum ac. Nam pulvinar aliquet ipsum sit amet auctor.</p>', '5fd3f8244dd63.jpg', 'novo-jogo-do-mario', 24);

-- --------------------------------------------------------

--
-- Table structure for table `tb_site.servicos`
--

CREATE TABLE `tb_site.servicos` (
  `id` int(11) NOT NULL,
  `servico` text NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_site.servicos`
--

INSERT INTO `tb_site.servicos` (`id`, `servico`, `order_id`) VALUES
(5, 'My service of control panel with very functions', 5),
(6, 'My service of SEO for optimize your website EDITADOO', 4),
(7, 'My service of marketing for upgrade your sells', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tb_site.slides`
--

CREATE TABLE `tb_site.slides` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `slide` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_site.slides`
--

INSERT INTO `tb_site.slides` (`id`, `nome`, `slide`, `order_id`) VALUES
(16, 'Slider #1', '5fce9c604a8dc.jpg', 16);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin.clientes`
--
ALTER TABLE `tb_admin.clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_admin.estoque`
--
ALTER TABLE `tb_admin.estoque`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_admin.estoque_imagens`
--
ALTER TABLE `tb_admin.estoque_imagens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_admin.financeiro`
--
ALTER TABLE `tb_admin.financeiro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_admin.online`
--
ALTER TABLE `tb_admin.online`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_admin.usuarios`
--
ALTER TABLE `tb_admin.usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_admin.visitas`
--
ALTER TABLE `tb_admin.visitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_site.categorias`
--
ALTER TABLE `tb_site.categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_site.depoimentos`
--
ALTER TABLE `tb_site.depoimentos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_site.noticias`
--
ALTER TABLE `tb_site.noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_site.servicos`
--
ALTER TABLE `tb_site.servicos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_site.slides`
--
ALTER TABLE `tb_site.slides`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin.clientes`
--
ALTER TABLE `tb_admin.clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tb_admin.estoque`
--
ALTER TABLE `tb_admin.estoque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_admin.estoque_imagens`
--
ALTER TABLE `tb_admin.estoque_imagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_admin.financeiro`
--
ALTER TABLE `tb_admin.financeiro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tb_admin.online`
--
ALTER TABLE `tb_admin.online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tb_admin.usuarios`
--
ALTER TABLE `tb_admin.usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_admin.visitas`
--
ALTER TABLE `tb_admin.visitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_site.categorias`
--
ALTER TABLE `tb_site.categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tb_site.depoimentos`
--
ALTER TABLE `tb_site.depoimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tb_site.noticias`
--
ALTER TABLE `tb_site.noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tb_site.servicos`
--
ALTER TABLE `tb_site.servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tb_site.slides`
--
ALTER TABLE `tb_site.slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
