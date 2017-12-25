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
-- Dumping data for table `com_audit_trail`
--

LOCK TABLES `com_audit_trail` WRITE;
/*!40000 ALTER TABLE `com_audit_trail` DISABLE KEYS */;
INSERT INTO `com_audit_trail` VALUES (2093,'audit:unknown','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1','[event=success,timestamp=Mon Dec 25 11:32:36 CST 2017,source=RankedAuthenticationProviderWebflowEven','AUTHENTICATION_EVENT_TRIGGERED','CAS','2017-12-25 03:32:36'),(2094,'root','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1','Supplied credentials: [root]','AUTHENTICATION_SUCCESS','CAS','2017-12-25 03:33:07'),(2095,'root','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1','TGT-1-zNPQWEFfwEUj6TNVo2qCL7UbaZcAy6wRMFjrrmWteAcfBWYnNo-mac373','TICKET_GRANTING_TICKET_CREATED','CAS','2017-12-25 03:33:07'),(2096,'root','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1','ST-1-3BRormh4asjtbKEWVmTU-mac373 for https://localhost:6443/sys/admin/home/query.action','SERVICE_TICKET_CREATED','CAS','2017-12-25 03:33:07'),(2097,'root','127.0.0.1','127.0.0.1','ST-1-3BRormh4asjtbKEWVmTU-mac373','SERVICE_TICKET_VALIDATED','CAS','2017-12-25 03:33:16'),(2098,'audit:unknown','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1','[event=success,timestamp=Mon Dec 25 13:29:29 CST 2017,source=InitialAuthenticationAttemptWebflowEven','AUTHENTICATION_EVENT_TRIGGERED','CAS','2017-12-25 05:29:29'),(2099,'root','0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1','ST-2-xHWc9u1xaz2eTRZHVl31-mac373 for https://localhost:7443/origami/admin/home/query.action','SERVICE_TICKET_CREATED','CAS','2017-12-25 05:29:29'),(2100,'root','127.0.0.1','127.0.0.1','ST-2-xHWc9u1xaz2eTRZHVl31-mac373','SERVICE_TICKET_VALIDATED','CAS','2017-12-25 05:29:30');
/*!40000 ALTER TABLE `com_audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tb_app`
--

LOCK TABLES `tb_app` WRITE;
/*!40000 ALTER TABLE `tb_app` DISABLE KEYS */;
INSERT INTO `tb_app` VALUES (1,'appmgmt','统一应用管理平台','http://localhost:8686/appmgmt','1','1',83),(3,'origami','折纸','http://localhost:8787/origami','1','2',84),(5,'testapp','testapp','','0','3',88);
/*!40000 ALTER TABLE `tb_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (1,0,27,3,'Category management','分类管理','2-1','1'),(2,0,2,3,'Model management','模型管理','2-2','1'),(3,0,3,1,'System management','系统管理','1-1','1'),(4,3,4,1,'Menu management','菜单管理','1-1-3','2'),(5,3,5,1,'Permit management','权限管理','1-1-2','2'),(6,3,6,1,'Role management','角色管理','1-1-4','2'),(7,3,7,1,'User management','用户管理','1-1-5','2'),(8,0,61,1,'test','test','1-2','1'),(9,8,62,1,'test-c','test-c','1-2-1','2'),(10,9,67,1,'test-c-c1','test-c-c1','1-2-1-1','2'),(12,3,75,1,'App management','应用管理','1-1-1','2'),(13,9,68,1,'test-c-c2','test-c-c2','1-2-1-2','2'),(14,0,18,3,'Image management','图片管理','2-3','1');
/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tb_permit`
--

LOCK TABLES `tb_permit` WRITE;
/*!40000 ALTER TABLE `tb_permit` DISABLE KEYS */;
INSERT INTO `tb_permit` VALUES (2,84,3,'Model management','模型管理',1,'/admin/model/query.action','2-2'),(3,83,1,'System management','系统管理',1,'','1-1'),(4,3,1,'Menu management','菜单管理',1,'/admin/menu/query.action','1-1-3'),(5,3,1,'Permit management','权限管理',1,'/admin/permit/query.action','1-1-2'),(6,3,1,'Role management','角色管理',1,'/admin/role/query.action','1-1-4'),(7,3,1,'User management','用户管理',1,'/admin/user/query.action','1-1-5'),(13,2,3,'pbtn_add','添加',2,'/admin/model/add.action','2-2-1'),(14,2,3,'pbtn_del','删除',2,'/admin/model/del.action','2-2-3'),(15,2,3,'pbtn_upd','修改',2,'/admin/model/upd.action','2-2-4'),(16,2,3,'pbtn_query2','查询',2,'/admin/model/query2.action','2-2-6'),(17,2,3,'pbtn_get','明细',2,'/admin/model/get.action','2-2-7'),(18,84,3,'Image management','图片管理',1,'/admin/image/query.action','2-3'),(27,84,3,'Category management','分类管理',1,'/admin/category/query.action','2-1'),(28,27,3,'pbtn_add','添加',2,'/admin/category/add.action','2-1-1'),(29,27,3,'pbtn_del','删除',2,'/admin/category/del.action','2-1-3'),(30,27,3,'pbtn_upd','修改',2,'/admin/category/upd.action','2-1-4'),(31,27,3,'pbtn_query2','查询',2,'/admin/category/query2.action','2-1-6'),(32,27,3,'pbtn_get','明细',2,'/admin/category/get.action','2-1-7'),(33,5,1,'pbtn_add','添加',2,'/admin/permit/add.action','2-1-1-1-1'),(34,5,1,'pbtn_del','删除',2,'/admin/permit/del.action','2-1-1-1-3'),(35,5,1,'pbtn_upd','修改',2,'/admin/permit/upd.action','2-1-1-1-4'),(36,5,1,'pbtn_query2','查询',2,'/admin/permit/query2.action','2-1-1-1-6'),(37,5,1,'pbtn_get','明细',2,'/admin/permit/get.action','2-1-1-1-7'),(38,4,1,'pbtn_add','添加',2,'/admin/menu/add.action','3-1-1-1-1'),(39,4,1,'pbtn_del','删除',2,'/admin/menu/del.action','3-1-1-1-3'),(40,4,1,'pbtn_upd','修改',2,'/admin/menu/upd.action','3-1-1-1-4'),(41,4,1,'pbtn_query2','查询',2,'/admin/menu/query2.action','3-1-1-1-6'),(42,4,1,'pbtn_get','明细',2,'/admin/menu/get.action','3-1-1-1-7'),(43,6,1,'pbtn_add','添加',2,'/admin/role/add.action','4-1-1-1-1'),(44,6,1,'pbtn_del','删除',2,'/admin/role/del.action','4-1-1-1-3'),(45,6,1,'pbtn_upd','修改',2,'/admin/role/upd.action','4-1-1-1-4'),(46,6,1,'pbtn_query2','查询',2,'/admin/role/query2.action','4-1-1-1-6'),(47,6,1,'pbtn_get','明细',2,'/admin/role/get.action','4-1-1-1-7'),(48,7,1,'pbtn_add','添加',2,'/admin/user/add.action','5-1-1-1-1'),(49,7,1,'pbtn_del','删除',2,'/admin/user/del.action','5-1-1-1-3'),(50,7,1,'pbtn_upd','修改',2,'/admin/user/upd.action','5-1-1-1-4'),(51,7,1,'pbtn_query2','查询',2,'/admin/user/query2.action','5-1-1-1-6'),(52,7,1,'pbtn_get','明细',2,'/admin/user/get.action','5-1-1-1-7'),(58,6,1,'act_getPermitTreeNodesByRoleId','角色已关联权限',3,'/admin/role/getPermitTreeNodesByRoleId.action','4-1-1-1-7'),(59,83,1,'dict_getRoleTreeNodes','字典-角色',3,'/dict/getRoleTreeNodes.action','9003'),(60,7,1,'act_getRoleTreeNodesByUserId','用户已关联角色',3,'/admin/user/getRoleTreeNodesByUserId.action','5-1-1-1-7'),(61,83,1,'test','test',1,'','2-1'),(62,61,1,'test-c','test-c',1,'','2-1-1'),(67,62,1,'test-c-c1','test-c-c1',1,'','2-1-1-1'),(68,62,1,'test-c-c2','test-c-c2',1,'','2-1-1-2'),(69,27,3,'pbtn_add2','添加2',2,'/admin/category/add2.action','2-1-2'),(70,27,3,'pbtn_upd2','修改2',2,'/admin/category/upd2.action','2-1-5'),(71,5,1,'pbtn_add2','添加2',2,'/admin/permit/add2.action','2-1-1-1-2'),(72,5,1,'pbtn_upd2','修改2',2,'/admin/permit/upd2.action','2-1-1-1-5'),(73,4,1,'pbtn_upd2','修改2',2,'/admin/menu/upd2.action','3-1-1-1-5'),(74,4,1,'pbtn_add2','添加2',2,'/admin/menu/add2.action','3-1-1-1-2'),(75,3,1,'app management','应用管理',1,'/admin/app/query.action','1-1-1'),(76,75,1,'pbtn_add','添加',2,'/admin/app/add.action','1-1-1-1-1'),(77,75,1,'pbtn_add2','添加2',2,'/admin/app/add2.action','1-1-1-1-2'),(78,75,1,'pbtn_del','删除',2,'/admin/app/del.action','1-1-1-1-3'),(79,75,1,'pbtn_upd','修改',2,'/admin/app/upd.action','1-1-1-1-4'),(80,75,1,'pbtn_upd2','修改2',2,'/admin/app/upd2.action','1-1-1-1-5'),(81,75,1,'pbtn_query2','查询',2,'/admin/app/query2.action','1-1-1-1-6'),(82,75,1,'pbtn_get','明细',2,'/admin/app/get.action','1-1-1-1-7'),(83,0,1,'appmgmt','统一应用管理平台',0,'http://localhost:8686/appmgmt','1'),(84,0,3,'origami','折纸',0,'http://localhost:8787/origami','2'),(85,83,1,'dict_getAppTreeNodes','字典-应用',3,'/dict/getAppTreeNodes.action','9000'),(86,83,1,'dict_getMenuTreeNodes','字典-菜单',3,'/dict/getMenuTreeNodes.action','9002'),(87,83,1,'dict_getPermitTreeNodes','字典-权限',3,'/dict/getPermitTreeNodes.action','9001'),(88,0,NULL,'testapp','testapp',0,'','3'),(89,6,1,'pbtn_add2','添加2',2,'/admin/role/add2.action','4-1-1-1-2'),(90,6,1,'pbtn_upd2','修改2',2,'/admin/role/upd2.action','4-1-1-1-5'),(91,2,3,'pbtn_upd2','修改2',2,'/admin/model/upd2.action','2-2-5'),(92,7,1,'pbtn_add2','添加2',2,'/admin/user/add2.action','5-1-1-1-2'),(93,7,1,'pbtn_upd2','修改2',2,'/admin/user/upd2.action','5-1-1-1-5'),(94,18,3,'pbtn_add','添加',2,'/admin/image/add.action','2-3-1'),(95,18,3,'pbtn_del','删除',2,'/admin/image/del.action','2-3-3'),(96,18,3,'pbtn_query2','查询',2,'/admin/image/query2.action','2-3-5'),(97,18,3,'pbtn_get','明细',2,'/admin/image/get.action','2-3-6'),(98,2,3,'pbtn_add2','添加2',2,'/admin/model/add2.action','2-2-2'),(99,18,3,'pbtn_upd2','修改2',2,'/admin/image/upd2.action','2-3-4'),(100,18,3,'pbtn_add2','添加2',2,'/admin/image/add2.action','2-3-2');
/*!40000 ALTER TABLE `tb_permit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (28,'sys_admin','系统管理员'),(34,'user','普通用户'),(35,'super_admin','超级管理员');
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tb_role_permit_rs`
--

LOCK TABLES `tb_role_permit_rs` WRITE;
/*!40000 ALTER TABLE `tb_role_permit_rs` DISABLE KEYS */;
INSERT INTO `tb_role_permit_rs` VALUES (1476,34,83),(1477,34,3),(1478,34,75),(1479,34,81),(1480,34,82),(1481,34,5),(1482,34,36),(1483,34,37),(1484,34,4),(1485,34,41),(1486,34,42),(1487,34,6),(1488,34,46),(1489,34,47),(1490,34,58),(1491,34,7),(1492,34,51),(1493,34,52),(1494,34,60),(1495,34,84),(1496,34,27),(1497,34,31),(1498,34,32),(1499,34,2),(1500,34,16),(1501,34,17),(1724,35,83),(1725,35,3),(1726,35,75),(1727,35,76),(1728,35,77),(1729,35,78),(1730,35,79),(1731,35,80),(1732,35,81),(1733,35,82),(1734,35,5),(1735,35,33),(1736,35,71),(1737,35,34),(1738,35,35),(1739,35,72),(1740,35,36),(1741,35,37),(1742,35,4),(1743,35,38),(1744,35,74),(1745,35,39),(1746,35,40),(1747,35,73),(1748,35,41),(1749,35,42),(1750,35,6),(1751,35,43),(1752,35,89),(1753,35,44),(1754,35,45),(1755,35,90),(1756,35,46),(1757,35,47),(1758,35,58),(1759,35,7),(1760,35,48),(1761,35,92),(1762,35,49),(1763,35,50),(1764,35,93),(1765,35,51),(1766,35,52),(1767,35,60),(1768,35,61),(1769,35,62),(1770,35,67),(1771,35,68),(1772,35,85),(1773,35,87),(1774,35,86),(1775,35,59),(1776,35,84),(1777,35,27),(1778,35,28),(1779,35,69),(1780,35,29),(1781,35,30),(1782,35,70),(1783,35,31),(1784,35,32),(1785,35,2),(1786,35,13),(1787,35,98),(1788,35,14),(1789,35,15),(1790,35,91),(1791,35,16),(1792,35,17),(1793,35,18),(1794,35,94),(1795,35,100),(1796,35,95),(1797,35,99),(1798,35,96),(1799,35,97),(1800,35,88),(1801,28,83),(1802,28,3),(1803,28,5),(1804,28,35),(1805,28,72),(1806,28,36),(1807,28,37),(1808,28,4),(1809,28,38),(1810,28,39),(1811,28,40),(1812,28,41),(1813,28,42),(1814,28,7),(1815,28,51),(1816,28,52),(1817,28,60),(1818,28,59),(1819,28,84),(1820,28,27),(1821,28,28),(1822,28,69),(1823,28,29),(1824,28,30),(1825,28,70),(1826,28,31),(1827,28,32),(1828,28,2),(1829,28,16),(1830,28,17),(1831,28,18),(1832,28,96),(1833,28,97);
/*!40000 ALTER TABLE `tb_role_permit_rs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (2,'u1','u1','u1@qq.com','E10ADC3949BA59ABBE56E057F20F883E','2016-10-31 05:09:24'),(3,'u2','u2','u2@qq.com','E10ADC3949BA59ABBE56E057F20F883E','2016-11-02 03:33:30'),(4,'u3','u3','u3@qq.com','E10ADC3949BA59ABBE56E057F20F883E','2016-11-02 03:37:02'),(5,'root','root','','63a9f0ea7bb98050796b649e85481845',NULL),(7,'sysadmin1','系统管理员1','','E3CEB5881A0A1FDAAD01296D7554868D','2016-11-07 03:29:47'),(8,'u4','u4','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:24'),(9,'u5','u5','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:34'),(10,'u6','u6','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:42'),(11,'u7','u7','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:48'),(12,'u8','u8','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:30:55'),(13,'u9','u9','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:04'),(14,'u10','u10','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:20'),(15,'u11','u11','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:28'),(16,'u12','u12','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:35'),(17,'u13','u13','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:42'),(18,'u14','u14','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:51'),(19,'u15','u15','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:31:57'),(20,'u16','u16','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:07'),(21,'u17','u17','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:14'),(22,'u18','u18','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:22'),(23,'u19','u19','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:30'),(24,'u20','u20','','E10ADC3949BA59ABBE56E057F20F883E','2017-1-18 09:32:38');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tb_user1`
--

LOCK TABLES `tb_user1` WRITE;
/*!40000 ALTER TABLE `tb_user1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tb_user_role_rs`
--

LOCK TABLES `tb_user_role_rs` WRITE;
/*!40000 ALTER TABLE `tb_user_role_rs` DISABLE KEYS */;
INSERT INTO `tb_user_role_rs` VALUES (43,7,28),(47,3,34),(50,9,34),(51,10,34),(52,11,34),(53,12,34),(54,13,34),(55,14,34),(56,15,34),(57,16,34),(58,17,34),(59,18,34),(60,19,34),(61,20,34),(62,21,34),(63,22,34),(64,23,34),(65,24,34),(71,4,34),(72,8,34),(76,5,35),(79,2,34);
/*!40000 ALTER TABLE `tb_user_role_rs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-25 13:43:22
