-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 08, 2013 at 03:20 PM
-- Server version: 5.5.32
-- PHP Version: 5.3.10-1ubuntu3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `conapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE IF NOT EXISTS `agenda` (
  `id` int(11) NOT NULL,
  `agenda` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agenda`
--

INSERT INTO `agenda` (`id`, `agenda`) VALUES
(0, 'var baseagenda = {\r\nsessions: [\r\n    {\r\n        id: "reg1",\r\n        type: "break",\r\n        title: "Registration",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,08,30),\r\n        end: new Date(2013,10,30,09,00),\r\n        location: "lobby",\r\n        track: 0\r\n    },\r\n    {\r\n        id: "opening",\r\n        type: "break",\r\n        title: "Opening",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,09,00),\r\n        end: new Date(2013,10,30,09,15),\r\n        location: "main",\r\n        track: 0\r\n    },\r\n    {\r\n        id: "keynote1",\r\n        type: "break",\r\n        title: "WSO2 Keynote",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,09,15),\r\n        end: new Date(2013,10,30,09,45),\r\n        location: "TT1",\r\n        track: 0\r\n    },\r\n    {\r\n        id: "t1t01a",\r\n        type: "session",\r\n        title: "TBA",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,09,45),\r\n        end: new Date(2013,10,30,10,30),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n     {\r\n        id: "break1",\r\n        type: "break",\r\n        title: "Break",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,10,30),\r\n        end: new Date(2013,10,30,11,00),\r\n        location: "lobby",\r\n        track: 0\r\n    },\r\n    {\r\n        id: "t1t02a",\r\n        type: "session",\r\n        title: "Re-design Enterprise IT with WSO2 App Factory and WSO2 Cloud",\r\n        speaker: ["B6cvdMAB"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,11,00),\r\n        end: new Date(2013,10,30,11,30),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t01a",\r\n        type: "session",\r\n        title: "The New ESB – RESTy, Connected, Collaborative, and Optimized",\r\n        speaker: ["2cnXVMAY"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,11,00),\r\n        end: new Date(2013,10,30,11,30),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n     {\r\n        id: "t1t03a",\r\n        type: "session",\r\n        title: "Deploying and Extending Apache Stratos (Incubating) an Open PaaS",\r\n        speaker: ["HTcHWMA1"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,11,30),\r\n        end: new Date(2013,10,30,12,00),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t02a",\r\n        type: "session",\r\n        title: "Using the Carbon Architecture To Build a Fit-for-Purpose Platform",\r\n        speaker: ["2e9BgMAI"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,11,30),\r\n        end: new Date(2013,10,30,12,00),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "t1t04a",\r\n        type: "session",\r\n        title: "The Integration Game Changer: WSO2 Integration Cloud",\r\n        speaker: ["HTcHWMA1"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,12,00),\r\n        end: new Date(2013,10,30,12,30),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t03a",\r\n        type: "session",\r\n        title: "Using WSO2 ESB to integrate Salesforce.com and SAP ERP",\r\n        speaker: ["2e9BgMAI"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,12,00),\r\n        end: new Date(2013,10,30,12,30),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "break2",\r\n        type: "break",\r\n        title: "Lunch",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,12,30),\r\n        end: new Date(2013,10,30,13,30),\r\n        location: "lobby",\r\n        track: 0\r\n    },\r\n    {\r\n        id: "t1t05a",\r\n        type: "session",\r\n        title: "Mentor Graphics Cloud Services Platform – WSO2 implementation",\r\n        speaker: ["IZUAZMA6"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,13,30),\r\n        end: new Date(2013,10,30,14,00),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t04a",\r\n        type: "session",\r\n        title: "Weapons Free: Open Source Solutions to Programmatic and Operational Challenges Faced by the Defense and Intelligence Communities in the Age of Sequestration",\r\n        speaker: ["IVjWQMA1"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,13,30),\r\n        end: new Date(2013,10,30,14,00),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "t1t06a",\r\n        type: "session",\r\n        title: "Building an Enterprise PaaS framework using Opensource components",\r\n        speaker: ["IZUAZMA7"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,14,00),\r\n        end: new Date(2013,10,30,14,30),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t05a",\r\n        type: "session",\r\n        title: "A Case Study Using WSO2 Middleware in an Enterprise SOA Infrastructure in Support of a US Military Weapon System",\r\n        speaker: ["IZUAZMA8"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,14,00),\r\n        end: new Date(2013,10,30,14,30),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "t1t07a",\r\n        type: "session",\r\n        title: "West Connect powered by WSO2",\r\n        speaker: ["IZUAZMA9"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,14,30),\r\n        end: new Date(2013,10,30,15,00),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t06a",\r\n        type: "session",\r\n        title: "Why Deploy An Enterprise App Store?",\r\n        speaker: ["FbagaMAB"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,14,30),\r\n        end: new Date(2013,10,30,15,00),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "break3",\r\n        type: "break",\r\n        title: "Break",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,15,00),\r\n        end: new Date(2013,10,30,15,30),\r\n        location: "lobby",\r\n        track: 0\r\n    },\r\n    {\r\n        id: "t1t08a",\r\n        type: "session",\r\n        title: "Advanced API Management Tactics",\r\n        speaker: ["GDTEtMAP"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,15,30),\r\n        end: new Date(2013,10,30,16,00),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t07a",\r\n        type: "session",\r\n        title: "Identity Management Best Practices with WSO2 Identity Server",\r\n        speaker: ["IZUAZMA10"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,15,30),\r\n        end: new Date(2013,10,30,16,00),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "t1t09a",\r\n        type: "session",\r\n        title: "Thinking of you. Customizing the store of the WSO2 API Manager for the non programmer",\r\n        speaker: ["CGenYMAT1"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,16,00),\r\n        end: new Date(2013,10,30,16,30),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t08a",\r\n        type: "session",\r\n        title: "Securing Cloud and Mobile: Pragmatic Enterprise Security Architecture",\r\n        speaker: ["2dAxTMAU"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,16,00),\r\n        end: new Date(2013,10,30,16,30),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n     {\r\n        id: "t1t10a",\r\n        type: "session",\r\n        title: "Powering an enterprise with messaging and APIs",\r\n        speaker: ["IZUAZMA11"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,16,30),\r\n        end: new Date(2013,10,30,17,00),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t09a",\r\n        type: "session",\r\n        title: "Re-Thinking Enterprise SOA & IT Governance",\r\n        speaker: ["2e9JWMAY"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,16,30),\r\n        end: new Date(2013,10,30,17,00),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "t1t11a",\r\n        type: "session",\r\n        title: "Creating the API Centric Enterprise: Towards a Connected Business",\r\n        speaker: ["IZUAZMA12"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,17,00),\r\n        end: new Date(2013,10,30,17,30),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t10a",\r\n        type: "session",\r\n        title: "SOA Governance",\r\n        speaker: ["IZUAZMA13"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,17,00),\r\n        end: new Date(2013,10,30,17,30),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "break4",\r\n        type: "break",\r\n        title: "Main Agenda End",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,17,30),\r\n        end: new Date(2013,10,30,17,30),\r\n        location: "none",\r\n        track: 0\r\n    }\r\n    ]}'),
(1, 'var baseagenda = {\r\nsessions: [\r\n    {\r\n        id: "reg1",\r\n        type: "break",\r\n        title: "Registration",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,08,30),\r\n        end: new Date(2013,10,30,09,00),\r\n        location: "lobby",\r\n        track: 0\r\n    },\r\n    {\r\n        id: "opening",\r\n        type: "break",\r\n        title: "Opening",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,09,00),\r\n        end: new Date(2013,10,30,09,15),\r\n        location: "main",\r\n        track: 0\r\n    },\r\n    {\r\n        id: "keynote1",\r\n        type: "break",\r\n        title: "WSO2 Keynote",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,09,15),\r\n        end: new Date(2013,10,30,09,45),\r\n        location: "TT1",\r\n        track: 0\r\n    },\r\n    {\r\n        id: "t1t01a",\r\n        type: "session",\r\n        title: "TBA",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,09,45),\r\n        end: new Date(2013,10,30,10,30),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n     {\r\n        id: "break1",\r\n        type: "break",\r\n        title: "Break",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,10,30),\r\n        end: new Date(2013,10,30,11,00),\r\n        location: "lobby",\r\n        track: 0\r\n    },\r\n    {\r\n        id: "t1t02a",\r\n        type: "session",\r\n        title: "Re-design Enterprise IT with WSO2 App Factory and WSO2 Cloud",\r\n        speaker: ["B6cvdMAB"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,11,00),\r\n        end: new Date(2013,10,30,11,30),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t01a",\r\n        type: "session",\r\n        title: "The New ESB – RESTy, Connected, Collaborative, and Optimized",\r\n        speaker: ["2cnXVMAY"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,11,00),\r\n        end: new Date(2013,10,30,11,30),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n     {\r\n        id: "t1t03a",\r\n        type: "session",\r\n        title: "Deploying and Extending Apache Stratos (Incubating) an Open PaaS",\r\n        speaker: ["HTcHWMA1"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,11,30),\r\n        end: new Date(2013,10,30,12,00),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t02a",\r\n        type: "session",\r\n        title: "Using the Carbon Architecture To Build a Fit-for-Purpose Platform",\r\n        speaker: ["2e9BgMAI"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,11,30),\r\n        end: new Date(2013,10,30,12,00),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "t1t04a",\r\n        type: "session",\r\n        title: "The Integration Game Changer: WSO2 Integration Cloud",\r\n        speaker: ["HTcHWMA1"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,12,00),\r\n        end: new Date(2013,10,30,12,30),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t03a",\r\n        type: "session",\r\n        title: "Using WSO2 ESB to integrate Salesforce.com and SAP ERP",\r\n        speaker: ["2e9BgMAI"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,12,00),\r\n        end: new Date(2013,10,30,12,30),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "break2",\r\n        type: "break",\r\n        title: "Lunch",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,12,30),\r\n        end: new Date(2013,10,30,13,30),\r\n        location: "lobby",\r\n        track: 0\r\n    },\r\n    {\r\n        id: "t1t05a",\r\n        type: "session",\r\n        title: "Mentor Graphics Cloud Services Platform – WSO2 implementation",\r\n        speaker: ["IZUAZMA6"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,13,30),\r\n        end: new Date(2013,10,30,14,00),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t04a",\r\n        type: "session",\r\n        title: "Weapons Free: Open Source Solutions to Programmatic and Operational Challenges Faced by the Defense and Intelligence Communities in the Age of Sequestration",\r\n        speaker: ["IVjWQMA1"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,13,30),\r\n        end: new Date(2013,10,30,14,00),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "t1t06a",\r\n        type: "session",\r\n        title: "Building an Enterprise PaaS framework using Opensource components",\r\n        speaker: ["IZUAZMA7"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,14,00),\r\n        end: new Date(2013,10,30,14,30),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t05a",\r\n        type: "session",\r\n        title: "A Case Study Using WSO2 Middleware in an Enterprise SOA Infrastructure in Support of a US Military Weapon System",\r\n        speaker: ["IZUAZMA8"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,14,00),\r\n        end: new Date(2013,10,30,14,30),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "t1t07a",\r\n        type: "session",\r\n        title: "West Connect powered by WSO2",\r\n        speaker: ["IZUAZMA9"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,14,30),\r\n        end: new Date(2013,10,30,15,00),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t06a",\r\n        type: "session",\r\n        title: "Why Deploy An Enterprise App Store?",\r\n        speaker: ["FbagaMAB"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,14,30),\r\n        end: new Date(2013,10,30,15,00),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "break3",\r\n        type: "break",\r\n        title: "Break",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,15,00),\r\n        end: new Date(2013,10,30,15,30),\r\n        location: "lobby",\r\n        track: 0\r\n    },\r\n    {\r\n        id: "t1t08a",\r\n        type: "session",\r\n        title: "Advanced API Management Tactics",\r\n        speaker: ["GDTEtMAP"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,15,30),\r\n        end: new Date(2013,10,30,16,00),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t07a",\r\n        type: "session",\r\n        title: "Identity Management Best Practices with WSO2 Identity Server",\r\n        speaker: ["IZUAZMA10"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,15,30),\r\n        end: new Date(2013,10,30,16,00),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "t1t09a",\r\n        type: "session",\r\n        title: "Thinking of you. Customizing the store of the WSO2 API Manager for the non programmer",\r\n        speaker: ["CGenYMAT1"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,16,00),\r\n        end: new Date(2013,10,30,16,30),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t08a",\r\n        type: "session",\r\n        title: "Securing Cloud and Mobile: Pragmatic Enterprise Security Architecture",\r\n        speaker: ["2dAxTMAU"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,16,00),\r\n        end: new Date(2013,10,30,16,30),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n     {\r\n        id: "t1t10a",\r\n        type: "session",\r\n        title: "Powering an enterprise with messaging and APIs",\r\n        speaker: ["IZUAZMA11"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,16,30),\r\n        end: new Date(2013,10,30,17,00),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t09a",\r\n        type: "session",\r\n        title: "Re-Thinking Enterprise SOA & IT Governance",\r\n        speaker: ["2e9JWMAY"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,16,30),\r\n        end: new Date(2013,10,30,17,00),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "t1t11a",\r\n        type: "session",\r\n        title: "Creating the API Centric Enterprise: Towards a Connected Business",\r\n        speaker: ["IZUAZMA12"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,17,00),\r\n        end: new Date(2013,10,30,17,30),\r\n        location: "TT1",\r\n        track: 1\r\n    },\r\n    {\r\n        id: "t2t10a",\r\n        type: "session",\r\n        title: "SOA Governance",\r\n        speaker: ["IZUAZMA13"],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,17,00),\r\n        end: new Date(2013,10,30,17,30),\r\n        location: "TT2",\r\n        track: 2\r\n    },\r\n    {\r\n        id: "break4",\r\n        type: "break",\r\n        title: "Main Agenda End",\r\n        speaker: [],\r\n        abstract: "",\r\n        start: new Date(2013,10,30,17,30),\r\n        end: new Date(2013,10,30,17,30),\r\n        location: "none",\r\n        track: 0\r\n    }\r\n    ]}');

-- --------------------------------------------------------

--
-- Table structure for table `attendee`
--

CREATE TABLE IF NOT EXISTS `attendee` (
  `id` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `organisation` varchar(255) DEFAULT NULL,
  `bio` text,
  `expertise` varchar(255) DEFAULT NULL,
  `regcode` varchar(255) NOT NULL,
  `home` varchar(255) DEFAULT NULL,
  `interests` varchar(255) DEFAULT NULL,
  `accepting` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `coords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE IF NOT EXISTS `meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requester` varchar(255) NOT NULL,
  `requestee` varchar(255) NOT NULL,
  `session` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `requestmessage` varchar(255) DEFAULT NULL,
  `responsemessage` varchar(255) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `sendnotes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requester` (`requester`),
  KEY `requestee` (`requestee`),
  KEY `session` (`session`),
  KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_availability`
--

CREATE TABLE IF NOT EXISTS `meeting_availability` (
  `session` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`session`,`user`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message_queue`
--

CREATE TABLE IF NOT EXISTS `message_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` varchar(255) NOT NULL,
  `to_user` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notification_queue`
--

CREATE TABLE IF NOT EXISTS `notification_queue` (
  `user` varchar(255) NOT NULL,
  `meeting` int(11) NOT NULL,
  PRIMARY KEY (`user`,`meeting`),
  KEY `meeting` (`meeting`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `user` varchar(255) NOT NULL,
  `session` varchar(255) NOT NULL,
  `attending` varchar(255) NOT NULL,
  `notes` text,
  `contentrating` int(11) DEFAULT NULL,
  `speakerrating` int(11) DEFAULT NULL,
  `feedback` text,
  PRIMARY KEY (`user`,`session`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `abstract` varchar(255) DEFAULT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `session_speaker`
--

CREATE TABLE IF NOT EXISTS `session_speaker` (
  `session` int(11) NOT NULL,
  `speaker` varchar(255) NOT NULL,
  PRIMARY KEY (`session`,`speaker`),
  KEY `speaker` (`speaker`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `user` varchar(255) NOT NULL,
  `otid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE IF NOT EXISTS `sponsor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `organisation` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `smallad` varchar(255) DEFAULT NULL,
  `largead` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_contacts`
--

CREATE TABLE IF NOT EXISTS `sponsor_contacts` (
  `sponsor` int(11) NOT NULL,
  `contact` varchar(255) NOT NULL,
  PRIMARY KEY (`sponsor`,`contact`),
  KEY `contact` (`contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_follow_up`
--

CREATE TABLE IF NOT EXISTS `sponsor_follow_up` (
  `attendee` varchar(255) NOT NULL,
  `sponsor` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attendee`,`sponsor`),
  KEY `sponsor` (`sponsor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_reps`
--

CREATE TABLE IF NOT EXISTS `sponsor_reps` (
  `sponsor` int(11) NOT NULL,
  `rep` varchar(255) NOT NULL,
  PRIMARY KEY (`sponsor`,`rep`),
  KEY `rep` (`rep`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE IF NOT EXISTS `version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meeting`
--
ALTER TABLE `meeting`
  ADD CONSTRAINT `meeting_ibfk_1` FOREIGN KEY (`requester`) REFERENCES `attendee` (`id`),
  ADD CONSTRAINT `meeting_ibfk_2` FOREIGN KEY (`requestee`) REFERENCES `attendee` (`id`),
  ADD CONSTRAINT `meeting_ibfk_3` FOREIGN KEY (`session`) REFERENCES `session` (`id`),
  ADD CONSTRAINT `meeting_ibfk_4` FOREIGN KEY (`location`) REFERENCES `location` (`id`);

--
-- Constraints for table `meeting_availability`
--
ALTER TABLE `meeting_availability`
  ADD CONSTRAINT `meeting_availability_ibfk_1` FOREIGN KEY (`session`) REFERENCES `session` (`id`),
  ADD CONSTRAINT `meeting_availability_ibfk_2` FOREIGN KEY (`user`) REFERENCES `attendee` (`id`);

--
-- Constraints for table `notification_queue`
--
ALTER TABLE `notification_queue`
  ADD CONSTRAINT `notification_queue_ibfk_1` FOREIGN KEY (`user`) REFERENCES `attendee` (`id`),
  ADD CONSTRAINT `notification_queue_ibfk_2` FOREIGN KEY (`meeting`) REFERENCES `meeting` (`id`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`user`) REFERENCES `attendee` (`id`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`location`) REFERENCES `location` (`id`);

--
-- Constraints for table `session_speaker`
--
ALTER TABLE `session_speaker`
  ADD CONSTRAINT `session_speaker_ibfk_1` FOREIGN KEY (`session`) REFERENCES `session` (`id`),
  ADD CONSTRAINT `session_speaker_ibfk_2` FOREIGN KEY (`speaker`) REFERENCES `attendee` (`id`);

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`user`) REFERENCES `attendee` (`id`);

--
-- Constraints for table `sponsor_contacts`
--
ALTER TABLE `sponsor_contacts`
  ADD CONSTRAINT `sponsor_contacts_ibfk_1` FOREIGN KEY (`sponsor`) REFERENCES `sponsor` (`id`),
  ADD CONSTRAINT `sponsor_contacts_ibfk_2` FOREIGN KEY (`contact`) REFERENCES `attendee` (`id`);

--
-- Constraints for table `sponsor_follow_up`
--
ALTER TABLE `sponsor_follow_up`
  ADD CONSTRAINT `sponsor_follow_up_ibfk_1` FOREIGN KEY (`attendee`) REFERENCES `attendee` (`id`),
  ADD CONSTRAINT `sponsor_follow_up_ibfk_2` FOREIGN KEY (`sponsor`) REFERENCES `sponsor` (`id`);

--
-- Constraints for table `sponsor_reps`
--
ALTER TABLE `sponsor_reps`
  ADD CONSTRAINT `sponsor_reps_ibfk_1` FOREIGN KEY (`sponsor`) REFERENCES `sponsor` (`id`),
  ADD CONSTRAINT `sponsor_reps_ibfk_2` FOREIGN KEY (`rep`) REFERENCES `attendee` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
