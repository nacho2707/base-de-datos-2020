-- Host: localhost    Database: manabu
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `certificado`
--

DROP TABLE IF EXISTS `certificado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificado` (
  `id` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `cargaHoraria` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificado`
--

LOCK TABLES `certificado` WRITE;
/*!40000 ALTER TABLE `certificado` DISABLE KEYS */;
INSERT INTO certificado VALUES ('12345','cer1',' 120  ') ;
INSERT INTO certificado VALUES ('12346','cer2', '125 ');
INSERT INTO certificado VALUES ('12347','cer3', '130  ' ) ;
INSERT INTO certificado VALUES ('12348','cer4', '100  ') ;
INSERT INTO certificado VALUES ('12349','cer5', '180  ') ;
INSERT INTO certificado VALUES ('12310','cer6', '120  ' ) ;
INSERT INTO certificado VALUES ('12311','cer7', '120  ' ) ;
INSERT INTO certificado VALUES ('12312','cer8', '120  ' ) ;
INSERT INTO certificado VALUES ('12313','cer9', '130  ') ;
INSERT INTO certificado VALUES ('12314','cer10', '125 ' ); 



/*!40000 ALTER TABLE `certificado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contenido` varchar(200) NOT NULL,
  `ci` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comentario_ibfk_1` (`ci`),
  CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `persona` (`ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id` int NOT NULL,
  `idMateria` int NOT NULL,
  `idGrado` int NOT NULL,
  `idCertificado` int NOT NULL,
  `precio` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `materia_curso_idx` (`idMateria`),
  KEY `grado_curso_idx` (`idGrado`),
  KEY `certificado_curso_idx` (`idCertificado`),
  CONSTRAINT `certificado_curso` FOREIGN KEY (`idCertificado`) REFERENCES `certificado` (`id`),
  CONSTRAINT `grado_curso` FOREIGN KEY (`idGrado`) REFERENCES `grado` (`id`),
  CONSTRAINT `materia_curso` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO curso VALUES ('11','1','1',' 12345' , '2400' ); 
INSERT INTO curso VALUES ('12','2','2', '12311 ', '2500 '); 
INSERT INTO curso VALUES ('13','3','3', '12310' , '2450 '); 
INSERT INTO curso VALUES ('14','4','5', '12347 ', '2500 '); 
INSERT INTO curso VALUES ('15','5','1', '12349' ,' 2400 '); 
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ci` varchar(8) DEFAULT NULL,
  `salario` int DEFAULT NULL,
  `idGrado` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_docente_idx` (`ci`),
  KEY `grado_docente_idx` (`idGrado`),
  CONSTRAINT `ci_docente` FOREIGN KEY (`ci`) REFERENCES `persona` (`ci`),
  CONSTRAINT `grado_docente` FOREIGN KEY (`idGrado`) REFERENCES `grado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO horario VALUES('123', '5969524','35000','4');
INSERT INTO horario VALUES('456', '6127572','45000','5');
INSERT INTO horario VALUES('789', '6162801','55000','5');
INSERT INTO horario VALUES('987', '6167004','35000','4');
INSERT INTO horario VALUES('654', '6174743','50000','5');

/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `matricula` int NOT NULL AUTO_INCREMENT,
  `ci` varchar(8) DEFAULT NULL,
  `idGrado` int DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  KEY `ci_estudiante_idx` (`ci`),
  KEY `grado_estudiante_idx` (`idGrado`),
  CONSTRAINT `ci_estudiante` FOREIGN KEY (`ci`) REFERENCES `persona` (`ci`),
  CONSTRAINT `grado_estudiante` FOREIGN KEY (`idGrado`) REFERENCES `grado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--
LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO horario VALUES('4567', '2058098','2');
INSERT INTO horario VALUES('8765', '3375658','1');
INSERT INTO horario VALUES('8907', '3666534','1');
INSERT INTO horario VALUES('5674', '4025565','1');
INSERT INTO horario VALUES('3456', '5962507','3');
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantecurso`
--

DROP TABLE IF EXISTS `estudiantecurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantecurso` (
  `matricula` int NOT NULL,
  `idCurso` int NOT NULL,
  `idInfoCurso` int NOT NULL,
  PRIMARY KEY (`matricula`,`idCurso`),
  KEY `info_estudianteCurso_idx` (`idInfoCurso`),
  KEY `curso_estudianteCurso_idx` (`idCurso`),
  CONSTRAINT `curso_estudianteCurso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`id`),
  CONSTRAINT `info_estudianteCurso` FOREIGN KEY (`idInfoCurso`) REFERENCES `infocurso` (`id`),
  CONSTRAINT `matricula_estudianteCurso` FOREIGN KEY (`matricula`) REFERENCES `estudiante` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantecurso`
--

LOCK TABLES `estudiantecurso` WRITE;
/*!40000 ALTER TABLE `estudiantecurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiantecurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grado`
--

DROP TABLE IF EXISTS `grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grado` (
  `id` int NOT NULL,
  `nombreGrado` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grado`
--

LOCK TABLES `grado` WRITE;
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
INSERT INTO horario VALUES('1', 'Bachillerato');
INSERT INTO horario VALUES('2', 'Tecnico');
INSERT INTO horario VALUES('3', 'Licenciatura');
INSERT INTO horario VALUES('4', 'Maestria');
INSERT INTO horario VALUES('5', 'Doctorado');

/*!40000 ALTER TABLE `grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `id` CHAR(1) NOT NULL,
  `horaInicio` time NOT NULL,
  `horarioFinal` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO horario VALUES('A', '7:45','9:45');
INSERT INTO horario VALUES('B', '9:55','11:55');
INSERT INTO horario VALUES('C', '12:00','2:00');
INSERT INTO horario VALUES('D', '14:05','16:05');
INSERT INTO horario VALUES('E', '16:10','18:10');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infocurso`
--

DROP TABLE IF EXISTS `infocurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infocurso` (
  `id` int NOT NULL,
  `idCurso` int NOT NULL,
  `idHorario` varchar(1) NOT NULL,
  `idDocente` int NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `capacidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `curso_info_idx` (`idCurso`),
  KEY `horario_info_idx` (`idHorario`),
  KEY `docente_info_idx` (`idDocente`),
  CONSTRAINT `curso_info` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`id`),
  CONSTRAINT `docente_info` FOREIGN KEY (`idDocente`) REFERENCES `docente` (`id`),
  CONSTRAINT `horario_info` FOREIGN KEY (`idHorario`) REFERENCES `horario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infocurso`
--

LOCK TABLES `infocurso` WRITE;
/*!40000 ALTER TABLE `infocurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `infocurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombreMateria` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES
(1,'Base de Datos'),
(2,'Estadistica I'),
(3,'Pensamiento Sistemico'),
(4,'Fotografia I'),
(5,'Marketing Digital');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `id` int NOT NULL,
  `idMateria` int NOT NULL,
  `parcial1` int NOT NULL,
  `parcial2` int NOT NULL,
  `parcial3` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `materia_notas_idx` (`idMateria`),
  CONSTRAINT `materia_notas` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES 
(1,1,85,56,70),
(2,2,65,70,60),
(3,3,30,80,70),
(4,4,40,70,20),
(5,5,90,60,50);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `ci` varchar(8) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `correoElectronico` varchar(45) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `numeroTarjeta` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO persona VALUES ('5962507','Ignacio Robles','roblesignacio7@gmail.com','1999-7-27','76583818','4074006021770862');
INSERT INTO persona VALUES ('6167004','André Ayala','alayala8@gmail.com','1997-5-18','77783123',null);
INSERT INTO persona VALUES ('5969524','Felipe Martinez','felipem@hotmail.com','1999-2-5','66258923',null);
INSERT INTO persona VALUES ('6174743','Maria Molina','mmoliona25@gmail.com','2000-8-25','76588036','4074889064823144');
INSERT INTO persona VALUES ('6127572','Maria Blanco','blancomaria@gmail.com','2000-7-7','76225987','1547965823148888');
INSERT INTO persona VALUES ('6162801','Laura Paredes','lsnparedes7@gmail.com','1997-11-13','66588896',null);
INSERT INTO persona VALUES ('2058098','Jorge Gonzales','jgonzales@man.edu.com','1975-3-30','78896555','4078798865552121');
INSERT INTO persona VALUES ('4025565','Jose Morales','moralesjosej@man.edu.com','1988-6-6','69658741','3620006895668877');
INSERT INTO persona VALUES ('3375658','Sandra Machicado','sandramach@man.edu.com','1982-6-18','77966541','3636987585002199');
INSERT INTO persona VALUES ('3666534','Jimena Suxo','jimenasuxom@ma.edu.com','1980-5-15','74522311','9600205897865523');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibo`
--

DROP TABLE IF EXISTS `recibo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recibo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `monto` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `recibocol` varchar(45) NOT NULL,
  `ci` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_idx` (`ci`),
  CONSTRAINT `ci` FOREIGN KEY (`ci`) REFERENCES `persona` (`ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibo`
--

LOCK TABLES `recibo` WRITE;
/*!40000 ALTER TABLE `recibo` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuesta` (
  `id` int NOT NULL,
  `idComentario` int NOT NULL,
  `contenido` varchar(200) NOT NULL,
  `ci` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comentario_respuesta_idx` (`idComentario`),
  KEY `ci_respuesta_idx` (`ci`),
  CONSTRAINT `ci_respuesta` FOREIGN KEY (`ci`) REFERENCES `persona` (`ci`),
  CONSTRAINT `comentario_respuesta` FOREIGN KEY (`idComentario`) REFERENCES `comentario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas`
--

DROP TABLE IF EXISTS `temas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temas` (
  `id` int NOT NULL,
  `idMateria` int NOT NULL,
  `titulo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `materia_temas_idx` (`idMateria`),
  CONSTRAINT `materia_temas` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='					';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas`
--

LOCK TABLES `temas` WRITE;
/*!40000 ALTER TABLE `temas` DISABLE KEYS */;
/*!40000 ALTER TABLE `temas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;