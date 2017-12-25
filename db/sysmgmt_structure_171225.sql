-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: appmgmt
-- ------------------------------------------------------
-- Server version	5.7.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `com_audit_trail`
--

DROP TABLE IF EXISTS `com_audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_audit_trail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AUD_USER` varchar(100) DEFAULT NULL,
  `AUD_CLIENT_IP` varchar(15) DEFAULT NULL,
  `AUD_SERVER_IP` varchar(15) DEFAULT NULL,
  `AUD_RESOURCE` varchar(100) DEFAULT NULL,
  `AUD_ACTION` varchar(100) DEFAULT NULL,
  `APPLIC_CD` varchar(5) DEFAULT NULL,
  `AUD_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_app`
--

DROP TABLE IF EXISTS `tb_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tc_code` varchar(45) DEFAULT NULL,
  `tc_name` varchar(45) DEFAULT NULL,
  `tc_url` varchar(200) DEFAULT NULL,
  `tc_status` varchar(1) DEFAULT NULL,
  `tc_order` varchar(10) DEFAULT NULL,
  `tc_permit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_menu`
--

DROP TABLE IF EXISTS `tb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL,
  `tc_permit_id` bigint(20) DEFAULT NULL,
  `tc_app_id` bigint(20) DEFAULT NULL,
  `tc_code` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_order` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `tc_level` varchar(1) CHARACTER SET utf8 DEFAULT '1' COMMENT '级别：0->根节点；1->一级节点；2->次级节点',
  PRIMARY KEY (`id`),
  KEY `fk_permit` (`tc_permit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_permit`
--

DROP TABLE IF EXISTS `tb_permit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_permit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT '0',
  `tc_app_id` bigint(20) DEFAULT NULL,
  `tc_code` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_type` int(11) DEFAULT NULL COMMENT '1:菜单权限\n2:按钮权限',
  `tc_url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_order` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tc_code` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_role_permit_rs`
--

DROP TABLE IF EXISTS `tb_role_permit_rs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role_permit_rs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tc_role_id` bigint(20) NOT NULL,
  `tc_permit_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permit` (`tc_permit_id`),
  KEY `fk_role` (`tc_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1834 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tc_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_add_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_user1`
--

DROP TABLE IF EXISTS `tb_user1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tc_code` varchar(100) DEFAULT NULL,
  `tc_password` varchar(100) DEFAULT NULL,
  `tc_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_user_role_rs`
--

DROP TABLE IF EXISTS `tb_user_role_rs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_role_rs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tc_user_id` bigint(20) NOT NULL,
  `tc_role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role` (`tc_role_id`),
  KEY `fk_user` (`tc_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'appmgmt'
--
/*!50003 DROP FUNCTION IF EXISTS `f_get_child_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_get_child_list`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET utf8 COLLATE utf8_unicode_ci
begin
	declare sChildList varchar(1000); 
	declare sChildTemp varchar(1000);
	set sChildTemp =cast(rootId as char);
    
    
WHILE sChildTemp is not null DO

	IF (sChildList is not null) THEN 
		SET sChildList = concat(sChildList,',',sChildTemp); 
	ELSE 
		SET sChildList = concat(sChildTemp); 
	END IF;

	SELECT group_concat(id) INTO sChildTemp FROM appmgmt.tb_menu where FIND_IN_SET(pid,sChildTemp)>0;
END WHILE;
RETURN sChildList;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_get_parent_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_get_parent_list`(rootId varchar(1000)) RETURNS varchar(1000) CHARSET utf8 COLLATE utf8_unicode_ci
begin
	declare sParentList varchar(1000); 
	declare sParentTemp varchar(1000);
	set sParentTemp =cast(rootId as char);
    
    
WHILE sParentTemp is not null DO

	IF (sParentList is not null) THEN 
		SET sParentList = concat(sParentTemp,',',sParentList); 
	ELSE 
		SET sParentList = concat(sParentTemp); 
	END IF;

	SELECT group_concat(pid) INTO sParentTemp FROM appmgmt.tb_menu where FIND_IN_SET(id,sParentTemp)>0;
END WHILE;
RETURN sParentList;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_menu_get_by_userId_and_menuName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_menu_get_by_userId_and_menuName`(i_userId   INT,
																				i_menuName VARCHAR(100))
BEGIN
	DECLARE v_menuId_set VARCHAR(1000);
    -- 获取被搜索的菜单id集合
	SELECT group_concat(t.id)
	  INTO v_menuId_set 
	  FROM tb_menu t
	 INNER JOIN tb_role_permit_mapping t1 ON t.tc_permit_id = t1.tc_permit_id
	 INNER JOIN tb_user_role_mapping t2 ON t1.tc_role_id = t2.tc_role_id
			AND t2.tc_user_id = i_userId
	 WHERE t.tc_name LIKE CONCAT('%', i_menuName, '%');
	-- 返回结果集
    SELECT t.* FROM
    (
		SELECT t.*
		  FROM tb_menu t
		 WHERE FIND_IN_SET(t.id, F_GET_PARENT_LIST(v_menuId_set)) 
		UNION 
		SELECT t.*
		  FROM tb_menu t
		 WHERE FIND_IN_SET(t.id, F_GET_CHILD_LIST(v_menuId_set))
	)t
	ORDER BY t.tc_order;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-25 13:42:36
