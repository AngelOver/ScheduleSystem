/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.7.18 : Database - guns_flowable
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`guns_flowable` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `guns_flowable`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'C:\\Users\\www\\Desktop\\æ¯•ä¸šè®¾è®¡\\ä¸ªäººè®¾è®¡\\git\\ScheduleSystem\\guns-admin\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n             xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\"\r\n             xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\"\r\n             typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\"\r\n             targetNamespace=\"http://www.flowable.org/processdef\">\r\n  <process id=\"Expense\" name=\"ExpenseProcess\" isExecutable=\"true\">\r\n    <documentation>æŠ¥é”€æµç¨‹</documentation>\r\n    <startEvent id=\"start\" name=\"å¼€å§‹\r\n\"></startEvent>\r\n    <userTask id=\"fillTask\" name=\"å‡ºå·®æŠ¥é”€\" flowable:assignee=\"${taskUser}\">\r\n      <extensionElements>\r\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\r\n      </extensionElements>\r\n    </userTask>\r\n    <exclusiveGateway id=\"judgeTask\"></exclusiveGateway>\r\n    <userTask id=\"directorTak\" name=\"ç»ç†å®¡æ‰¹\">\r\n      <extensionElements>\r\n        <flowable:taskListener event=\"create\" class=\"com.stylefeng.guns.modular.flowable.handler.ManagerTaskHandler\"></flowable:taskListener>\r\n      </extensionElements>\r\n    </userTask>\r\n    <userTask id=\"bossTask\" name=\"è€æ¿å®¡æ‰¹\">\r\n      <extensionElements>\r\n        <flowable:taskListener event=\"create\" class=\"com.stylefeng.guns.modular.flowable.handler.BossTaskHandler\"></flowable:taskListener>\r\n      </extensionElements>\r\n    </userTask>\r\n    <endEvent id=\"end\" name=\"ç»“æŸ\"></endEvent>\r\n    <sequenceFlow id=\"directorNotPassFlow\" name=\"é©³å›\" sourceRef=\"directorTak\" targetRef=\"fillTask\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é©³å›\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"bossNotPassFlow\" name=\"é©³å›\" sourceRef=\"bossTask\" targetRef=\"fillTask\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é©³å›\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"fillTask\"></sequenceFlow>\r\n    <sequenceFlow id=\"flow2\" sourceRef=\"fillTask\" targetRef=\"judgeTask\"></sequenceFlow>\r\n    <sequenceFlow id=\"judgeMore\" name=\"å¤§äº500å…ƒ\" sourceRef=\"judgeTask\" targetRef=\"bossTask\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money > 500}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"bossPassFlow\" name=\"é€šè¿‡\" sourceRef=\"bossTask\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é€šè¿‡\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"directorPassFlow\" name=\"é€šè¿‡\" sourceRef=\"directorTak\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é€šè¿‡\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"judgeLess\" name=\"å°äº500å…ƒ\" sourceRef=\"judgeTask\" targetRef=\"directorTak\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money <= 500}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_Expense\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"Expense\" id=\"BPMNPlane_Expense\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"285.0\" y=\"135.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"fillTask\" id=\"BPMNShape_fillTask\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"405.0\" y=\"110.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"judgeTask\" id=\"BPMNShape_judgeTask\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"585.0\" y=\"130.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"directorTak\" id=\"BPMNShape_directorTak\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"735.0\" y=\"110.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"bossTask\" id=\"BPMNShape_bossTask\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"555.0\" y=\"255.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"771.0\" y=\"281.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\r\n        <omgdi:waypoint x=\"315.0\" y=\"150.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"405.0\" y=\"150.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\r\n        <omgdi:waypoint x=\"505.0\" y=\"150.16611295681062\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"585.4333333333333\" y=\"150.43333333333334\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"judgeLess\" id=\"BPMNEdge_judgeLess\">\r\n        <omgdi:waypoint x=\"624.5530726256983\" y=\"150.44692737430168\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"735.0\" y=\"150.1392757660167\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"directorNotPassFlow\" id=\"BPMNEdge_directorNotPassFlow\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"110.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"785.0\" y=\"37.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"455.0\" y=\"37.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"455.0\" y=\"110.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"bossPassFlow\" id=\"BPMNEdge_bossPassFlow\">\r\n        <omgdi:waypoint x=\"655.0\" y=\"295.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"771.0\" y=\"295.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"judgeMore\" id=\"BPMNEdge_judgeMore\">\r\n        <omgdi:waypoint x=\"605.4340277777778\" y=\"169.56597222222223\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"605.1384083044983\" y=\"255.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"directorPassFlow\" id=\"BPMNEdge_directorPassFlow\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"190.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"785.0\" y=\"281.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"bossNotPassFlow\" id=\"BPMNEdge_bossNotPassFlow\">\r\n        <omgdi:waypoint x=\"555.0\" y=\"295.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"455.0\" y=\"295.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"455.0\" y=\"190.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),('3',1,'C:\\Users\\www\\Desktop\\æ¯•ä¸šè®¾è®¡\\ä¸ªäººè®¾è®¡\\git\\ScheduleSystem\\guns-admin\\target\\classes\\processes\\ExpenseProcess.Expense.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0M\0\0Y\0\0\0DÛÄˆ\0\0/MIDATxÚíİ\r\\e™/ğ¹,º¬e­ZJ±”Z¨—òR^ÊµV(´X4×r]ÖŠhv˜L$cà&|„Lw€‹€‘A–ÚH2İ	\ZEdù”ldA2İM …Ù(J I$„…„\r&á#9÷<9c§§\'ÉL¾f¦¿ª·¦§ûÌGÎœ<ıüû}Ïé–\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 ¹œrÊ)‰a†±óáÙ\0š<4ÙGùBåÓ1rÅÊIs*cÏS:\"î?óš%ïÈu—fgÛSèùP¾PúL¶}íè,”/Ÿ<oÁ[ìMÔI\0@3À¨“›µøğøØY¬œvNá?ş2ÂRg¡4µ³Xº¹6¥ÁhZ<Ş0xKgØ“¨“\0€f€Q)_¨\\Ö9»ç°\\wåâø|Zwù£¹Bùä˜UÊË…¾pU,ÏÛ¾}ù“}³SévÛï+Í´\'Q\'\0Í\0£R„¥®®®ƒÒ0té´îÊÑù«KïÎ‹%yµÛÅÇÎBéªøØÕuÛ›s…Rîì9=ïì,VZíIÔI\0@3À¨!©³»|u¾X>+Î_Š¥z³ËÇÅcÙT_h*”çTƒRºİöó˜*tËŸó Òíµ7Q\'\0Í\0£Nœ¿”·”/”¯ˆ§4}¥\Z¦Š•Ó²íòs+Gæ\n¥¶Xº#î‹pU\rY…ò´ø:{u\0Ğ0ªTO\ZŒ\"ÅLQ,Ï«†¡b¥5W¬\\²Ã¶ÅÊIùBÏ	¾OÌHÙ›¨“\0€f€Q)›!Š:T/\01«ò‘¸r^úù5Óç.zoMhº$ß]9±ÑåÆsÅò{u\0Ğ0:CÓu•Cªç2Ê×Oïîù?³{>÷Ç¥Ås…Ò÷ó³z>Ÿg³P¤aj¢=‰:	\0h\0ÔI\0@3\0 N\0š\0u\0Ğ\0¨“\0€f\0@\04\0ê$\0 \0P\'ÕI\0ĞØ\0ê$\0 \0P\'\0Í\0€:	\0h\0ÔI\0@3\0 N\0š\0u\0Ğ\0¨“\0€f\0@\04\0ê$\0 \0@\04\0ê$\0 \0P\'\0Í\0€:	\0h\0ÔI\0@3\0 N\0š\0u\0Ğ\0¨“\0€f\0@\04\0ê¤½\0\0š\0ÔI\0@3\0 N\0š\0u\0Ğ\0¨“\0€f\0@\04\0ê$\0 \0P\'\0Í\0€:	\0h\0ÔI\0@3\0€:	\0h\0ÔI\0@3\0 N\0š\0u\0Ğ\0¨“\0€f\0@\04\0ê$\0 \0P\'\0Í\0€:	\0h\0ÔI\0@3\0€:	\0h\0ÔI\0@3\0°w<ÿüó_*\nIZ+ßgo\0€Ğ@$Iyé¥—Ö§’É“\'ÿÌ\0¡	€\Z«V­úqÒëşûï_ÓÖÖv’½\0B\0©W^yå¯·nİº-©qùå—¯êèèx»½\0B@Ó[»víÊ¤Î†\rÖ¶··wÛ;\0 44µgŸ}vF2€ùóç¯Mëæ1ö\0ŒŞ€´ BÒ.ÆÃöĞ¬Ò\\ôW[¶lym Ğ´mÛ¶Wóùü²1cÆloÀèMÇ¤ãõ…¦ÖÖÖ±öĞ¬V¯^ı@²+W®\\ÕÖÖ–³·\0`ô§»wšğê)ĞÌ–.]º«Ì”lŞ¼ù¾¨™‡Øc\00:CÓ1…&—Óšİ7¾ñ³w¶</2ÓE]t«™&\0ıÁ©Ñ¹M›ehi¹å–[~7PbzòÉ\'¿kV\0š#4õ;·É¹L\0Û7îÈ4mnpˆåíííË]=\0šD\Z’æ›ehìÊ+¯,¦!ikmhºöÚkÖÎYö\04OhúXÍ¹L\'Ú#\0/$İsÏ=ëjŞØö¦´^®èèèx»½\0M$;·É,@S§NıÔúõë·¤#™<yr‹å\0@s†¦ê•ôì	€ÆæÍ›ww¡Pˆó>çÛ\00HI’¼råÊÛ|ğÁ­¥R)Y¸páˆšFêïŞÓÓ“,^¼ø¿Ò1Á	êä¾wİuWµNŞqÇê$\0V4K–,IÖ­[—¼úê«Æ\Z/¼ğB²hÑ¢—ÓÆàËJP\'÷ÅX³f:	\0C¯œ\nLÃ¦!xuáÂ…;*A4ÔI\0†‘Xjâ‰xøŒ´xİQ	ê¤¡N0ŒÄZqOÂÃªpAP\'\ru€‘Ø¼²á¹dåÃ×%¿îùfuÄí¸Ï¸f\0ÔIuR é›ë×$Ë>#ùÕ]çï0â¾xÌ“¸f\0ÔIuR ©›U¿ş÷~@6Vÿz\'qÍ\0¨“ê¤:	@s7W¾5`3y×€:©Nª“\04u3°|a×€Í@<æI\\3\0ê¤:©N Ğh@T\'ÕI\04G\\j f ó$®\0uRT\'hêf`ÅÒ96ñ˜\'qÍ\0¨“ê¤:	@S7/®Y–,¿÷’şKNÒûâ1OâšP\'ÕIu€¦nb<ıÈ\rıš¸Ï¸f\0ÔIuR@3°eK²âşïô_r’Şy×€:©Nª“\04m3ïdÿÄÒâ€kõã1ïv¯\0uRT\'h¾f`Ë–ä¹åä?ï¹hÀF ±MlëÕTÍ\0¨“ê¤:	@S4»zÕÔ«©šP\'ÕIu€¦nvçUÓ½šêI]30Š¼İ.@T\'Ğô{B\Zj#\rOêšQâÄt$½Q\'ÕIu\0Í€¡ Æ§Ó±>³z?µKÔIC@3`hØ10eA)fš^œÔIC@3`hè˜vu?ê¤¡N 04MãÄ]£ìqç8©“†:	0xI’²lÙ²)×_ı¢™3g¾<mÚ´×;::’SN9%™0aÂ¶3Ï<óÕ‹/¾xå·¾õ­Óñ¿ì1Í€¡¦iWÈŒ“:i¨“\0ƒKwÜqÇ\r—]vÙë¹\\.™7o^òàƒ&kÖ¬I6oŞœ„ø¸nİºä—¿üe’†ª¤³³s[>ŸÿıäÉ“O·5†f`øtËàf»=ê¤¡NÍ*\rG“şùŸÿyËùçŸ_\rDo¼ñF²»{ì±äk_ûÚS¦Ly|Ü¸qGÚ›šC3p€ÓØ!|İFÁI4ÔI€†ÒÌsğwŞY>ãŒ3’*,Õ»ç{’I“&m2ë¤04#(0í­¯G4ÔI`´¦ûî»ï¡sÎ9\'yâ‰\'’½á÷¿ÿ}’°M§Ÿ~úÙö°f@3 ØOvuÑ‡ıı}P\'\ru-b†)Sœ£´7Å÷›<yòÆ¶¶¶	ö²f@3À~\nL{ki\'uÒP\'¶‹s˜bIŞŞšaj4ãtê©§®OƒÓQö¶f@3À>R‡ÿ‘‰½£şë\\B4ÔI ÙÅUò¾ùÍo¾\Zç0íKwİu×¦öööìqÍ€f€}˜ÆÖŸD‰ëı¸»Ái ¯œÔICšÙüùóÿ5®’÷Úk¯%ûÚYgµÖ2=Í€f€}˜ÂÄŞà“\"8Õ¦lœZó¸sœÔICšQÌ2Åû0ÅeÅ÷‡_ıêW¯šmÒhØ‹\n2ĞÎ‚S£í¯m°½sœÔICšÍ²eË¦ÄÅöäÒâƒ5iÒ¤µ§œrÊûìı¡kkk[˜¿ÕhšéxŞI`:qA¨QpÚİÀTœ,ÕS\'\ruh×_ı¢k¯½6ÙŸfÍšõX\ZšÎ³÷‡.İIŒh\nZ[[?¦Ğ4Ãñ<Äà²«à4ØÀTûó_h1ã¤N\Zê$0úÍœ9óå|p¿†¦ûï¿ÿ÷éÙ{Ï›šqw£WT5šÑt<7L»X\nN\r10eœã¤N\Zê$Ğ¦M›öúsÏ=·_CÓÚµk×¥O^«ìı½Úô½¢ZÛh4£éxb`ÚYpúİ¦=ı}P\'\ru):::’Í›7ï×Ğ?/}âÚlïïıf öÕX¢ĞŒ¦ã¹eÏgv\Z§=	LõÁÉ9Nê¤¡N£õIå@Ø\'3c/ÍÀğ\ZÉ¡“O>97³ö°ìÔ`†éw½÷ï‰YşNê¤!4£ÔÄ‰·íï™¦M›6­5Ó´Ï^A}¸µµuì˜1cít3pÔQG%ó7³ËíŞô¦7%§Ÿ~zßçK—.­6³«W¯î·íwÜ‘|øÃ®Ş¾÷Ş{“	&TÇwŞYıš^xa‡íã¾ï}ï{;Üwë­·&üà«·ÿğ‡?hFÈñÜ²ë«åíÉLÓ`Ş\0×LS¯|wéÇ]]]\rg¾ĞsB¾Pùô£43îß[?¿svÏ‡ûÿŒò¥ñq¸ÖÉ¨[qÌıñŒ7}ON=õÔjıúÇüÇ$VìÍŸ?çª«®Úå6çw^_mŒ »ÿÆoš\0Â9çœóêş>§)mRçœ¦½ŞdÖ7—-*4Õ†Ã;,ùÔ§>Õ÷ùòåËwØö±ÇK¾øÅ/ö3Î8£ïöí·ß^\r;õá)Sšâ±Ú&#>¿é¦›\Z†¦øøw÷wÕ\'äØ&¾ü>q©TÒŒ€ã¹& llÙ7ç4\r%85í9M]]·½9\r\'—\rüøö05}NÏóİ•‰CWù\'¹B9IÇg^³äçš†¥éx)W,_}jp_íï0ÒêdkW_}u54e%»ÿÂ/ìû|íÚµÕú51ÂËÇ?şñê¿#>Ï‚Ö\r7ÜüÅ_üEß×,Z´h‡Ç?üğä„N¨Ş/:½ÿıïï÷ûÄUt³Ûñ=³Û¢„&€ÔŒ3Vìï«çıüç?ÿWÏÛkMæmmm\'\rĞ\\ĞO´sçÎ­Ş>âˆ#’O|â;<öÃş°ïóÚ†aWOÒ¿ùÍoúš€—\\rIõçd\'¾W|}4Ù×<ğÀÉ’%Kú>&%¶‰°MÑl¼üòËšr<7*»;³3ĞeÅ]=o0Á©)¯!fúÜEïÍÍéùx\ZvNÏw¶}l“†¦†«éİåÏÖ~ŞY¬ü[:ZóÅÒW;»Ëÿ:Ğ}gÍ­¼µÿSïHV„¹áX\'çÏŸß·0·.¸ ïv¼€T¿}V³bFª¶†ÆÇF¦ŞûŞ÷XCãóË.»l‡Yı,˜=ıôÓ}/RE°·ûÛßö}í²eËª»»»ÕI ¹]yå•×îï÷iJ›İ»¼OÓ7™;{%ş€‡¦ìI»QhŠ°R»}íò”xüK_úRõv4-5³LYÀj4Ó”=±?¾ßï³J¤\"(ÅÇ˜uŠ¦!‚W4şç®!Çó\0ÁiWeWïÃ´»o€[ï˜–&}Ÿ¦4¸\\½=0UÚÏ)ô|¨ºD®&Më®]bÒĞôƒGY ‰¯íò³z>>6\'[:g—;wNéˆ\\±ô›êÏ˜Sa©Ñ}ÙÏÉf²rÅò¼¸Kÿj—\n·:™Õ©¨C-5³Jqûî»ï®ÖÍ¸]©TúÕ±¨‰Ùíl†<j[ÌìÇíU«VUß¸qcõ…¤lf)›4iRõv„²¨µjvíLS¬È–Æ¬TÌ^™išŞ×¿şõÿ9uêÔ­o¼ñÆ~»x^ÚØ>•>™½ÏŞß÷öwhÊ^ó˜âIúïxG58Õ>?úè£;|M†²†â™gÙéÏˆĞ\'şm1ÓOêÓ§O¯~ÿC=´:»ÛÅ«¥ñJjÖd\rÁqÇ×÷ûdMJl§‘v5Ó³»o\\;Øà”-<©Ùvx¾Pşd®X©ş»#ğôİß]úq„¥Ú0“©İ®Ö´îòGc–ª\ZœŠåB®PjKÇuÛ¿¦Òa«Ñ}õß\'ûş…ÒUÃ¹N®_¿¾Zç¢FEŒğó¶·½­¯fÅˆúÇ_¼h³àYİŒPS,û^xj`¦©şÅ©ÚÀu0~^£Ğ/n=òÈ#ÕÛÙï·ãgZĞ+m8Ÿüå/¹¿–æİ˜¦%öúèM±„.ì³ÏÍ4e&\Z‚XkŸ­·Ç=öØÖãgËPzè¡dÅŠÕWfãóÏ}îsÕïñ®w½«Ú|dA¬¥f=~¼[ÛpÄr¾¸¿cöû¼øâ‹Õûö×~ÒìÍ8ín`\ZlpÊ~^Ó¦˜õ©]NW{>SÌ ¥áåšF_—Í,\r$\rEßï,VNËKgd(‚Rï’¼~÷íğ½çTÆf¿S®»4»ï÷¹ºôîáX\'#(E]Šú!%.z“½ˆ#f¾³YŸlæ(Å˜ùÉj\\6»3MñxÔÆútüñÇ÷›iŠ›¾ğ…/ì0ó€h©¹XN}àrN@ÓN;mÜ¹çûú~˜mZ?~üøGÛÚÚ&Øë£34õ>Ùõ\'Ô(4ıÃ?üC¿Y¦8á9{µ3LÙò¼6YÀ‰æ ĞkŸÔc)JÌhE°ª‚Ïf¾²û[Ì4V1ãT¿TnbËàß‡©Qp:µîç4íÙ[¬Uv²Û]]•ƒ#TÕMÜŸ/”¯h–Ê?ˆïËïòs+GÆLR\\¢ºl¯X~*.òĞè¾?}ïx|{ ªŞ.–gl¿İuP„©áX\'³ã*ÎµŒú5jW¥¥f¶(ÂS†b–éïÿşïû-¹ÛİĞu÷©§ê·ü¯¶¾f+\0\Z]ÉTšÒ”)S–-X°`Ÿ&¦8*f™yŞ#(4E€‰\'ØÍ4Õ?ÁgÁ&{¢•ã¼¦~F£sš²5ş³gÏnØpÄUúb†©¥æ„j3M£28Õ^¢6\0\rækú:o`[Vf-><×]¾«íâòâÅÒ¸Fw*¤¡çµ,ìÄÕóÒÏ›UqÎÔ@÷…Éó¼%.-]„¢zaŠB¹Ò{ÔÏbYßp­“Ù,Oí•EwšâE¡˜Qs‹²¤Z\Z\\)4Ùl~}àŠ%Ëµ3íÓ¿[¶T/^PŠÚ\\ÑuhZqÑ¤I“6=ñÄû$0¥EøÎôg<×ÖÖv”½=zCS6;4uêÔÏiš1cÆ¯t¶Ô¬¡ßUhŠ\'îh,j_	÷hŠĞ” –º™£ì¾ìñÚF#;ç)–ÈhF…ú¥zxNmüeÄë¿nOßjT‰‹?¤ÁdaçìÃv¶]œ³”n·äì9=ïÜ›??f´:‹åÏôşPÃµNfç+}èCªÖ.‚·# e³@ñr±$/BVv	òì¨ìvíUCš¥ª±´/[ş÷£ıh‡z™]4[Ö\\{)tuhzióÙ>eÊ”?®[·n¯¦Õ«WÿbüøñÏX–7úCS<ÑîlGí“o¦¸p¼ªKFbdkú£©¨]¢—…šh2âó+®¸¢ïûÕ†°,ÕÏ~EcP¿ô$kHşéŸşI30ºƒÓj´ôur¯ÔË]m“Õ®İİ~0¡){³ğ–º‹?Ô¾ˆu †:	Œííí“&O¼qoÍ8ÅS¦ÖÖÖ¯Ù»ÍÓìíÆa´ÍÀˆNMûÆµê¤¡NìB\ZpN™0aÂË?ıéO_Ùƒ‹C¬ÿö·¿}],ÉKG‡½ª04ûÙ.©³$O4ÔI€‹sœÆ_š2eÊÚG}tÓ`Ş‡éŞ{ï½9\r]ÇEœÃ¤04Ã 8\rv¦ÈEÔICTxúr„§u3gÎüõ/~ñ‹gÖ¬Yó\\,©\n›6mZû‡?üáw===?ëêêº»½½}e„¥˜]r•<Í€¡»ÄÎ’<uÒP\'†&\rCïikkË¥aèöt<ÍqïÇUéXób†ÊŞÒš\ZœIÇÆ–&|ãZuR}R\'ĞšNì\rD\'îäñ&uÒP\'Ğšf6ĞŒ“%yê¤¡N 04&uR}R\'ĞxÖ0@pš%0¡Nª“\0h<	khìÄ¸˜M‹ËŠ«“ê¤:	€fÀ“°f€ÆzCê¤ú¤N ğ$¬@hBT\'@3 @hBT\'@3 @hBT\'@3 @hBT\'@3 @hB4ÔI\04†f@hB4ÔI\04†f@hB4ÔI\04†f@hB4ÔI\04†f@hB4ÔI\04†f\0¡	uR\0Í€f\0¡	uR\0Í€f\0¡	uR\0Í€f\0¡	uR\0Í€f\0¡	uÒP\'Ğh4Bê¤¡N0¬”J%OÂÃglN›×•Bê¤¡N0Œ,^¼ø¹uëÖy\"cÍš5·¤ÍÀãJ¡	uÒP\'FÊåòî»ï¾\rÏ?ÿü&OÈî•ÓhzzzIÇ—•Bêä>\nê$\0Uú4váÂ…Ç’‡X+>ÒÆÍ7ßœDs;÷Şûıq€Ğ„:¹¯ÆC=”\n…dşüùê$\04ic» šÛ1cÆlo 4Á’$9ä¥—^ZŸJ&Oü3{\0šLkkëÇÒÆöõhnÛÚÚN´Gš`G«V­úqÒëşûï_“ÖÊ“ì\0h®Ğ4?\ZÛŞñ°=‚ĞòÊ+¯üõÖ­[·%5.¿üòUo·w\0 9\ZÚc²Y¦l¤!j¬=ƒĞÛ­]»veRgÃ†\rkÛÛÛ»í\0h†vAm`Êf›œÛ„Ğ--Ï>ûìŒd\0óçÏ_/<ÙK\00º›Ù~³LÙ°^¡‰f—æ¢¿Ú²eËk…¦mÛ¶½šÏç—y‘	\0Fw3{w£ÀÔ;°‡šhf«W¯~ Ù…•+W®jkkËÙ[\00:Ùg™œÛ„Ğ--K—.İUfJ6oŞ|_ã‡Øc\00ú\ZÙ;L®¤‡ĞD³ûÆ7¾qöÎ–çEfºè¢‹n5Ó\0š[p\\Ñ´n¹å–ß\r”˜|òÉïÆRfç4€æW4­qãÆ™†£Í\r.±¼½½}¹«ç€æW4½+¯¼²˜†¤­µ¡éÚk¯ıAkkë,{\04·à¸¢éÅò»{î¹g]ÍÛŞ”×+:::Şnï\0€æWš:uê§Ö¯_¿%ÉäÉ“{¼—\0hnÁquæÍ›ww¡Pˆ·c˜oo\0€æWP\'–ãÅñ‡°7\0@s+p<\0šWàx\048®Àñ\0hp\\ã\0Ğà¸Ç3\0 Àqg\0@3@“WgÏéyg¾X>k ¯ÉzNÈ*ŸŞq”fÆı{ë÷êœİóáş?£|i|ôWC\04Ğãjzwù³1úš®®®ƒªÛÍéù`¾»2±a°ê.ÿ$W(\'éxãÌk–¼ãœÂâCÓĞ³4/åŠåãc›F÷ıégÜöfÔI\0@3À°8®r³^7£sE®PjË>ïì._§şkÓ@tr\ZšNlô}ëCWg±òoéhÍK_M¿ß¿tßYs+oí?ÃÔ;ÒŸ•~¼Ì_\ru\0Ğ°_«læ¨&]__˜Ö]9º6Ä¤Ûı ÂQh\"\\ÅvùY=H›“-³ËÇ;§tD®XúM5(Í©Œ°Ôè¾ìçd?;W,Ï‹Û±ô¯Ñïê$\0 `¿W“ç-xKg¡tU„úm„«9¾ç´îòGcfª\ZœŠåBÌZ¥ãºí_Si°Õè¾úï“}ÿø}ü¥P\'\0Í\0Ãâ¸JƒL.f:‹•ÓvõµÙÌÒ@Òïõıø>ùbéŒ,\0EPê]’×ï¾¾÷œÊØl‰_®»4;»?uéİşj¨“\0€f€r\\åfU>’…¥˜ı‰åx}]WWåà8÷©qX*ÿàÜbå¨X~—Ÿ[92¾W\\¢ºl¯X~*.òĞè¾?}ïx|{ ªŞ.–gl¿İuP„)5ÔI\0@3À~?®Ò\0ôÉX2WûXg±ts:ÆÕ/Ë‹ —Ç\Z}ÏÎBå‚4ô¼–…¸z^úùoÓ±*7§çãİby`\\Z<»ğÄô¹‹Ş›nSé=Gêgõ¿#¨“\0€f€}jÂW§$€\"œÔ?Öu]å\\wåâúÇâœ¥4À,‰÷sÚ›¿ËöeåÏ»èê$\0 Àqg\0@3€ã\nÏ\0€f\0Ç8\0Í\0+p<\0šWàx\04à¸Âñ\0hÀq…ã\0Ğ€ã\nÏ\0€f\0Ç8\0Í\0+p<\0šWàx\048®Àñ\0hp\\ã\0Ğà¸Ç3\0 Àqå¸bÏ¹Y•t]W9¤««ë |¡òéGùÒlûüÜÊ‘gÍ­¼µşûtÊ—Û›\0 ¹Ç£öxŞ]şl®PÊÅí®®ÛŞœ+–ïœİsX:íêªœmæ5KŞ‘>6¯_hê._mo€æWŒÚãùœÂâC§Ïéù`çìòq1»”ë®\\œ+”¯¯Ş.VNÚ! Kãò…ò\'³™¨ø<fšrİ¥óâûØ«\0 ¹Åqå¸bTÏÓºË`4­»rt®Pú~¶$¯³Xi­†¢BijlKøbF*_(}&ÂQ¶L/\rW\'GØ²7@s+FåñËïòİ•‰“ç-xKÌõÎ İVıX,ŸA)¶íbV)ÂS|Ş¾¹\ZšŠåq.”½	\0š[p\\1jç4øâc¾P¾¢úyïùMéÇ¶8)Û>\rR—e)f¦ªáÉE \0@s+FûñœŸiùY=ˆ¥vÕ°Ô]¾°zSïlR&W¬\\Rÿ=„&\0ĞÜ‚ãŠQ«­m|Kóâ¼¥sç”¨¼ö¾|¡ç„¸@DvßÙszŞ™/”fÆ ìI\0ĞÜ‚ãŠQiâY$¹Y‹Û¹B¥=f˜r…Òu½WÎ»-./¿ºôîíç9•>ÛUÏk*”ré6×ä»Ë?‰mcy_í2>\0@sKóCâ8ÚÅxØB\044ë1tL:^ßYhjmmkO¡N\0ššù8º{\'¡é1cÆl/¡N\0ššù8:f ĞÔÖÖv’=„:	\0hp,5>·éa³L¨“\0€f\0Z\ZŸÛä\\&ÔI\0@3\05Ò4ß,ê$\0 €CÓÇjÎe:ÑA\04Ğÿ˜ªÛd–	u\0Ğ@ãcêÇê$\0 `ŸH’äà•+WŞşàƒn-•JÉÂ…ı<zzz’Å‹ÿW:&8\"Q\'\0ÍÀ0iÉ’%Éºuë’W_}Õ8@ã…^H-Zôr\Z ¾ì¨D\0Í€f`‰&iØ§W.\\ø¸£u\04ša$–ä	,Ãg¤¡éuG%ê$\0h4ÃHœS#¬«Ğäÿê$\0h4#14½²á¹dåÃ×%¿îùfuÄí¸OĞšP\'\0Í@Ó‡¦ë×$Ë>#ùÕ]çï0â¾xLØšP\'\0Í@S‡¦U¿ş÷~)«½@ØšP\'\0Í@s‡¦Ç+ß\Z04ÅcÂĞ„:	\0hš:4-_Ø5`hŠÇ„¡	u\0ĞMB“Ğ„:	\0h„¦Æ#®–7PhŠÇ„¡	u\0Ğ4uhZ±tÎ€¡)v„&ÔI\0@3ĞÔ¡éÅ5Ë’å÷^Òi^z_<&ìM¨“\0€f ©CSŒ§¹¡_hŠû¡	u\0ĞM[¶$+îÿNÿ¥yé}ñ˜°#4¡N\0š¦\rM×¯IXZğœ¦x,¶x„&†\\D]ÜÅxØ\0¡‰áš¶lI[QNşó‹LÙˆmb[³NBCª‰Ç¤ãõ…¦ÖÖÖ±ö\0M£Ğ´«Ù%³NB{½.Ş½“ĞôÀ˜1c¶—\0@hb…¦İ™]ÚÙ¬“ğ#41èºxÌ@¡©­­í${\0„&†Yh\Zj`Ê†ğ#41¤ÚØèÜ¦‡Í2€ĞÄ0M†ĞÄ©ıÎmr.\0MM†ĞD4$Í7Ë\0MB“!41phúXÍ¹L\'Ú#\0 4!4BıkdõÜ&³L\0 4!4B©ööö÷´¶¶NMkãíéX‘?öÎ6mNÇÓ½KöÎ‹íì-\0šš„&¡©iÄ¥ÄÓ±0¯îìmëF%İ~‚½\0BB“ĞÄh®ïKƒÏ=ƒJÆ’qãÆio€Ğ„Ğ$41ª´¶¶2~üø—jP{{{ò/ÿò/I¹\\N}öÙä¿ÿû¿“ğÇ?ş1Y³fM²téÒdÖ¬YÉW¾ò•úà´Ñ¬\0MMB£)0MCÎµaéÆoLÖ­[—ìõë×W·¯«\rOé÷<İŞ\0¡	¡Ihb¤¦SjÓôéÓ«³JC_wşùç×\'3N\0 4!4	MŒØš÷¾Ú%y—\\rIß¼¡Š¥{—_~yıR½£ìm\0šš„&Fœ40õÔÎ0íi`ª\rNu3NKìm\0šš„&F”¸¬xí9LC]’·³¥zµç8Y¦\0BC0fÌ˜ƒ…¦Ñšvõ÷dØ…¦…Y ‰‹8ì7ß|³Ù&\0šŠ´—ú«Õ«W?—+şú×¿~î@Í¶Ğ42BÓîş=Ùa(»³mÚÛÛß“]ü!fƒ^|ñÅ}šâªzu—#Ÿ¿\0MìÂ³Ï>;cóæÍ¯gMÕ–-[^»å–[Vœ}öÙÿ[h\Zy¡i0Oö_ë]·°µµõc¶IïŸšmwÅW$ûR¼SMh:Ï_\0„&ğÊ+¯üõóÏ?ÿû\Z«§Ÿ~zóÌ™3¿ÛÑÑqˆĞ4üCÓPşìßĞT3î®ŸyJï»={ü¾ûîÛ§¡)f k~—şB\00JBS¾PùtŒ\\±rRçœÊØsç”ˆûÏ¼fÉ;rİ¥ÙÙöçz>”/”>“m_;:åË\'Ï[ğ–fß§iÏtÈªU«~¼uëÖm»j®¶mÛ¶õ{îù¯|>ÿ9¡ix†¦=ù{rÀBSßÌSÒÏWd÷ïí@Ô[³fMíï±Ê_\0FIhÊÍZ|x|ì,VN;§ğa©³PšÚY,İ\\„Ò`4-oô½òÅÒÍ¾?Ÿşù/mØ°áå!œ±å;ßùNiÁ‚ÂÊ0\Z=ôP²\'Ï´a—*sàBSíÌS:6eŸï­ËŒïìòã5?{³¿\0Œ’fãÿş¿o\'ã¿òÕäôó®¨~>á´©IÇÙ&Ï8/™|Q±¯˜|ñÜêÇS\'ç«Åˆíªßã‚«“İh^Fõ(\nÕÁ‡ròx|m|x•Z`9ğ#ş{ãïi¿±?Ôş<Ï4\00Jäº+wuu”/”/Ö]9:uéİÙc±$¯v»øØY(]»ºn{s®PÊ=§çÅJk³ïÇ¸B×äÉ“vÿı÷?·mÛ¶7v§¹Ú°aÃMS¦L©´¶¶ÎOĞ ş’ï}ï{}ŸßtÓM\r·™1cÆ÷mŞ¼9¹ûî»«íl¶,¿êª«vù;œwŞyÕÛ·Şzkõ{g÷Çe¢÷çşøéOšìÉßs¤]9-7«ò‘®ë*‡l¯õKpË—fÛåçV<knå­õ_Ktä‹?\rÆÃéßal\\İ0½½ÑL\00d’:»ËWç‹å³âü¥Xª×9»|\\µ9*T.ëœİsX_SU(Ï©¥t»íç1U.è,–?çA¥Ûkono¢yé¥—®Z¿~ıºœÿ²|Ş¼yßs-bûøºqNS©TJ&MšÔz®½öÚêÕÅ.¹ä’êçqR{}¨ÉÂKÜîîî®~<õÔS«ÛFÃ˜m»hÑ¢äÎ;ï¬>?üğä„N¨ŞqÇw$ïÿûû}ÿø²Û7ÜpCßíQâBCı{4Ó»ËŸAú^)–ÿÿñ»««ÒwYõê¹Åò¼~¡)­#Ã$4õ…¥šmœÓ\0]4@ÙyKùBùŠx•9\rE_©†©bå´l»xu9m¨Ú¦u—?\Z£Ú$¥áª\Z²\nåiñuöæŸŒ7î­íííİi0X·uëÖM5=Õæ\'Ÿ|ò»écËÓÆnVGGÇÛ³¯9¡)–’eA\'‚Éc=–¬^½ºzû‡?üaßvO?ıt5èÄısçÎM¾ûİïVoÿæ7¿Ùé¬QmĞ‰Ï/»ì²¾Ïßô¦7%^xa¿ïÿ‰O|¢\Z–âöoûÛ¾¯]¶lY_PÛßWÏÊßs¤9§°øĞész>ÿ¯«†é®\\œ+”¯Ï.³C@*–Æ¥õâ“}‚I?™¦´vœßç\0…¦\"°6zß,WÏ\0†¬\ZxÒ`!(^MÎ–àÄR»´Iºd‡mÓ¦)_è9¡Ñ÷‰){sÀ†î˜|>¿låÊ•k6mÚ´è¢‹.º5š»¸¿~Ûıš^xá…$m.«#›	jéå‰Ç{lß}1U|ŠÅbßíã?¾ïë#-Y²¤oÛ7Vg²²™¥Ø>fµâö¿øÅê×5\nZµ3M‡vXrï½÷VoÇ¬TÌ^È÷i\ZÌßs$‰\ZÿÇãÅ’\\¡ôılI^Ô‚í³Ê¥©ÛkFå#1#WÑŒp”-ÓKÃÕÉÙõø?Öof©÷i\0öH6CMOµqJ›¢hÒÏ¯™>wÑ{kBÓ%ùîÊ‰.7+–gØ“‹f®­­-×{äÜ@Íİşiª]J—©–šsŠ\Z­x<FÌÅÇ3Î8£aà©½ïöÛoï»)nG{ÛÛŞÖ04ÅLÓ#<R½ıÀôk24\ræï9²ê@åàôÿ÷Ä˜u£ŞÿÛ·U?ËgEPÊ¶‹Y¥¨Û_`)İ¼½>”gçÙæ8ß0ı{½³ôvòâ‹/î“À3·&LØVšŞ§ÀhM×U©ËT(_?½»çÿtÎîùpÜ—¯¾â<«çñyí‰àõ¢Ù²\'w/<íìñù>Mq†&13”…”úó™\"´´ô.á»à‚ú–ğÅº+Vì°œ®6ÅlTıLSœßô…/|¡o»Xza­¥æbõë@Ó4Ô¿çH“ŸBïÿõ+¶¿²ıü¦X–Ëxûş¿*—e)f¦ªáé\0]b0â}›²0çåí7ß|sí,ÓU\0`/;¡)fâjxJâ\\¦D-½KáâóÚ+äeK÷²ó˜ZzÏ3Š0³FÏ<óLÃ™£İ	Mk×®Mzê©f£êCSvNSíïu CÓhç&Æ‹$1ë\\\rKİå«ç8õÎ&ı)\\í¸tw…¦“²@³M{û‚ñıÆ¿­æÍu\'¨j\0\0#84Eğ¸ë®»’w½ë]Õ%EF>úèê}Ù6>úhßíÚ ÁjùòåÕÛñµqq‡¸]¼vÔŸ•¢˜‘jt‰–ºsš\"(eKõbI`„¨F?Gh\Zº¸R^ÌÇ²Üsç”¨¼ö¾8¯1.‘İo7/”fÆ FÂ¿5\r3•,ÔLŸ>}¯]~<–º{î¹oÔÎ2¶™H\0€¦MÂJıû e—û®ß.1ññÏşìÏ’U«VUÃVKÍÌĞ@?#Mõ#.\Z#¶ùÑ~Ô·}ÆâcvôìŠ{BÓŞo…‰Û¹B¥=f˜r…Òu½WÎ»-./ïİ¶ı<§Òg¶Mi\\,ß‹sóİåŸÄ¶±¼¯vß0\rMïKÇY¸‰cjOƒS¦Ë/¿¼ö<¦mmmG©h\0\0£04µô^ØáĞC­~lé]NW¿]¼	o4‡õoTmˆÇãı—šbÄ×µÔ]ü!»} F³-Ïk­­­§d…Èfœ†ºT/¾®n†É²<\0€Ñ\Zš¡©™¤á¦£68Å9N1Ó\ZËMw÷*yqÑ‡Ús˜b¤ìkö.\0€Ğ$41*ÄŒS:Ö×†Oñ>Nñ¸1‹”-İ‹%xkÖ¬©^Q²P($\'NÜZûu±$/‚˜½\n\0 4	MŒ*qSí¥È‡8–8‡	\0@hšíáéË½áéõÁ„¥˜]r•<\0\0¡Ih¢i´··¿\'\rO¹4İ§Ó±¹7 ÅÇUéXób†ÊŞ\0š„&¡	\0\0„&Ch\0\0¡Éš\0\0@h2„&\0\0š¡	\0\0„&Ch\0\0„&¡	\0\0š„&\0\0@hš\0\0\0¡Ih\0\0„&Ch\0\0¡Éš\0\0@h2„&\0\0š¡	\0\0„&Ch\0\0„&¡	\0\0š„&\0\0@hš\0\0\0¡Ih\0\0„&¡ÉQ	\0\0B“!4\0ÀÈP*•„•á36§¡éuG%\0\0#‹/~nİºuË0kÖ¬¹%\rM;*\0`)—Ë_¸ï¾û6<ÿüó›—7Ã©§§ç™t|ÙQ	\0\0ÃLÚ¨]¸páÃ±4,Î©1öûˆış¸À\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04ÿg[IÜí\0\0\0\0IEND®B`‚',1);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('cfg.execution-related-entities-count','false',1),('cfg.task-related-entities-count','false',1),('common.schema.version','6.2.0.0',1),('identitylink.schema.version','6.2.0.0',1),('job.schema.version','6.2.0.0',1),('next.dbid','2501',2),('schema.history','create(6.2.0.0)',1),('schema.version','6.2.0.0',1),('task.schema.version','6.2.0.0',1),('variable.schema.version','6.2.0.0',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_id_bytearray` */

DROP TABLE IF EXISTS `act_id_bytearray`;

CREATE TABLE `act_id_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_bytearray` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_priv` */

DROP TABLE IF EXISTS `act_id_priv`;

CREATE TABLE `act_id_priv` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_priv` */

/*Table structure for table `act_id_priv_mapping` */

DROP TABLE IF EXISTS `act_id_priv_mapping`;

CREATE TABLE `act_id_priv_mapping` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_PRIV_MAPPING` (`PRIV_ID_`),
  KEY `ACT_IDX_PRIV_USER` (`USER_ID_`),
  KEY `ACT_IDX_PRIV_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_priv_mapping` */

/*Table structure for table `act_id_property` */

DROP TABLE IF EXISTS `act_id_property`;

CREATE TABLE `act_id_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_property` */

insert  into `act_id_property`(`NAME_`,`VALUE_`,`REV_`) values ('schema.version','6.2.0.0',1);

/*Table structure for table `act_id_token` */

DROP TABLE IF EXISTS `act_id_token`;

CREATE TABLE `act_id_token` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `IP_ADDRESS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_AGENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_token` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`ENGINE_VERSION_`) values ('1','SpringAutoDeployment',NULL,NULL,'','2018-04-23 16:38:42.612',NULL);

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`) values ('Expense:1:4',1,'http://www.flowable.org/processdef','ExpenseProcess','Expense',1,'1','C:\\Users\\www\\Desktop\\æ¯•ä¸šè®¾è®¡\\ä¸ªäººè®¾è®¡\\git\\ScheduleSystem\\guns-admin\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml','C:\\Users\\www\\Desktop\\æ¯•ä¸šè®¾è®¡\\ä¸ªäººè®¾è®¡\\git\\ScheduleSystem\\guns-admin\\target\\classes\\processes\\ExpenseProcess.Expense.png','æŠ¥é”€æµç¨‹',0,1,1,'',NULL);

/*Table structure for table `act_ru_deadletter_job` */

DROP TABLE IF EXISTS `act_ru_deadletter_job`;

CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_deadletter_job` */

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_history_job` */

DROP TABLE IF EXISTS `act_ru_history_job`;

CREATE TABLE `act_ru_history_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_history_job` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_suspended_job` */

DROP TABLE IF EXISTS `act_ru_suspended_job`;

CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_suspended_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_timer_job` */

DROP TABLE IF EXISTS `act_ru_timer_job`;

CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_timer_job` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
