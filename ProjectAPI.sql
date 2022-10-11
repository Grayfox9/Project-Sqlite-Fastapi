CREATE DATABASE PI1;
DROP DATABASE PI1;
USE PI1;

DROP TABLE IF EXISTS `Circuits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Circuits` (
  `CircuitId` INTEGER(80) COLLATE utf8mb4_spanish_ci NOT NULL,
  `CircuitRef` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Name` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Location` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Country` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Lat` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Lng` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Alt` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `url` Varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`CircuitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Datasets limpios\\circuits.csv'
INTO TABLE Circuits 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS `Constructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Constructors` (
  `ConstructorId` INTEGER(80) COLLATE utf8mb4_spanish_ci NOT NULL,
  `CircuitRef` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Name` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Nationality` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `url` Varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ConstructorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Datasets limpios\\constructors.csv'
INTO TABLE Constructors 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS `Drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Drivers` (
  `DriverId` INTEGER(80) COLLATE utf8mb4_spanish_ci NOT NULL,
  `DriverRef` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Number` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Code` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `dob` DATE NOT NULL,
  `Nationality` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `URL` Varchar(90) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Name/Forename` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Name/Surname` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`DriverId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Datasets limpios\\drivers.csv'
INTO TABLE Drivers 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS `Races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Races` (
  `RaceId` INTEGER(80) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Year` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Round` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CircuitId` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Name` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Date` DATE NOT NULL,
  `Time` VARCHAR(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `URL` Varchar(90) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`RaceId`),
  FOREIGN KEY(`CircuitId`) REFERENCES Circuits(`CircuitId`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Datasets limpios\\races.csv'
INTO TABLE Races
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

SELECT * FROM Races;


DROP TABLE IF EXISTS `PitStops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PitStops` (
  `RaceId` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DriverId` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Stop` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Lap` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Time` TIME COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Duration` VARCHAR(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Miliseconds` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  FOREIGN KEY(`RaceId`) REFERENCES Races(`RaceId`),
  FOREIGN KEY(`DriverId`) REFERENCES Drivers(`DriverId`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Datasets limpios\\pitstops.csv'
INTO TABLE PitStops
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;





DROP TABLE IF EXISTS `Results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Results` (
  `ResultId` INTEGER(80) COLLATE utf8mb4_spanish_ci NOT NULL,
  `RaceId` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DriverId` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ConstructorId` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Number` VARCHAR(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Grid` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Position` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PositionText` VARCHAR(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PositionOrder` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Points` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Laps` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Time` VARCHAR(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Miliseconds` VARCHAR(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FastedtLap` VARCHAR(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Rank` VARCHAR(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FastestLapTime` VARCHAR(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FastestLapSpeed` VARCHAR(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `StatusId` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ResultId`),
  FOREIGN KEY(`RaceId`) REFERENCES Races(`RaceId`),
  FOREIGN KEY(`DriverId`) REFERENCES Drivers(`DriverId`),
  FOREIGN KEY(`ConstructorId`) REFERENCES Constructors(`ConstructorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Datasets limpios\\results.csv'
INTO TABLE Results 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;



DROP TABLE IF EXISTS `LapTimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LapTimes` (
  `RaceId` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DriverId` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Lap` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Position` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Time` TIME COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Miliseconds` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  FOREIGN KEY(`RaceId`) REFERENCES Races(`RaceId`),
  FOREIGN KEY(`DriverId`) REFERENCES Drivers(`DriverId`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Datasets limpios\\LapTimes.csv'
INTO TABLE LapTimes
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS `Qualifying`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Qualifying` (
  `QualifyId` INTEGER(80) COLLATE utf8mb4_spanish_ci NOT NULL,
  `RaceId` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DriverId` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ConstructorId` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Number` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Position` INTEGER(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q1` VARCHAR(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q2` VARCHAR(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Q3` VARCHAR(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`QualifyId`),
  FOREIGN KEY(`RaceId`) REFERENCES Races(`RaceId`),
  FOREIGN KEY(`DriverId`) REFERENCES Drivers(`DriverId`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Datasets limpios\\Qualifying.csv'
INTO TABLE Qualifying
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;





ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';

/* Limpieza de datos */

SELECT 