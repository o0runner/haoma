-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 04 月 14 日 19:24
-- 服务器版本: 5.5.29-0ubuntu0.12.10.1
-- PHP 版本: 5.4.6-1ubuntu1.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `zz10086`
--

-- --------------------------------------------------------

--
-- 表的结构 `zz_category`
--

CREATE TABLE IF NOT EXISTS `zz_category` (
  `cateid` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `catename` varchar(32) NOT NULL COMMENT '分类名称',
  `rank` smallint(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`cateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zz_catemap`
--

CREATE TABLE IF NOT EXISTS `zz_catemap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `nid` mediumint(8) unsigned NOT NULL COMMENT '号码id',
  `cateid` smallint(6) unsigned NOT NULL COMMENT '分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类映射表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zz_number`
--

CREATE TABLE IF NOT EXISTS `zz_number` (
  `nid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `number` int(11) unsigned NOT NULL COMMENT '号码',
  `huafei` float unsigned NOT NULL COMMENT '话费',
  `kafei` float unsigned NOT NULL COMMENT '卡费',
  `operator` tinyint(1) unsigned NOT NULL COMMENT '运营商',
  `taocan` tinyint(1) unsigned NOT NULL COMMENT '套餐',
  `offer` tinyint(1) unsigned NOT NULL COMMENT '合约',
  `cateid` mediumint(8) unsigned NOT NULL COMMENT '所属分类id',
  `pubtime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `enable` tinyint(1) unsigned NOT NULL COMMENT '是否推荐',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '所属用户id',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='号码表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zz_offer`
--

CREATE TABLE IF NOT EXISTS `zz_offer` (
  `oid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(32) NOT NULL COMMENT '昵称',
  `sex` tinyint(1) unsigned NOT NULL COMMENT '性别',
  `mobile` int(11) unsigned NOT NULL COMMENT '联系电话',
  `qq` int(13) unsigned NOT NULL COMMENT 'QQ',
  `adress` varchar(200) NOT NULL COMMENT '送货地址',
  `note` varchar(200) NOT NULL COMMENT '备注',
  `jytype` tinyint(1) unsigned NOT NULL COMMENT '交易方式',
  `realname` varchar(32) NOT NULL COMMENT '真实姓名',
  `idcard` int(18) unsigned NOT NULL COMMENT '身份证号',
  `zftype` tinyint(1) unsigned NOT NULL COMMENT '支付方式',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zz_users`
--

CREATE TABLE IF NOT EXISTS `zz_users` (
  `uid` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zz_users`
--

INSERT INTO `zz_users` (`uid`, `username`, `password`, `email`, `addtime`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@domain.com', 1364458838);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
