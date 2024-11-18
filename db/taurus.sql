-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2024 a las 04:47:56
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `taurus`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_claims`
--

CREATE TABLE `tb_claims` (
  `ClaimId_PK` int(11) NOT NULL,
  `Claim_No` varchar(50) DEFAULT NULL,
  `Risk_Id` int(11) DEFAULT NULL,
  `n_TermMaster_FK` int(11) DEFAULT NULL,
  `n_potransaction_FK` int(11) DEFAULT NULL,
  `Policy_No_SimpleSolve` varchar(50) DEFAULT NULL,
  `n_PolicyNoId_FK` int(11) DEFAULT NULL,
  `n_PORiskMasterFK` int(11) DEFAULT NULL,
  `Date_Of_Loss` date DEFAULT NULL,
  `Insured_Name` varchar(255) DEFAULT NULL,
  `n_InsuredPersonInfoId_FK` int(11) DEFAULT NULL,
  `Agency_Name` varchar(255) DEFAULT NULL,
  `n_AgencyPersoninfoId_FK` int(11) DEFAULT NULL,
  `n_AgencyAccount_FK` int(11) DEFAULT NULL,
  `n_SubAgentPersoninfo_FK` int(11) DEFAULT NULL,
  `Reported_By_PersonId_FK` int(11) DEFAULT NULL,
  `InHouseCounsel_Person_FK` int(11) DEFAULT NULL,
  `Reported_By_PersonId_FK_Old` int(11) DEFAULT NULL,
  `PA_PersonId_FK` int(11) DEFAULT NULL,
  `Reported_By_Deprecated` varchar(255) DEFAULT NULL,
  `Reported_By_Relation_Code` varchar(50) DEFAULT NULL,
  `ClaimTypeId_FK` int(11) DEFAULT NULL,
  `Loss_Type_Code` varchar(50) DEFAULT NULL,
  `Amount_Claimed` decimal(15,2) DEFAULT NULL,
  `Letter_URL_Path` varchar(255) DEFAULT NULL,
  `Remarks` text DEFAULT NULL,
  `Allocated_To_UserId_FK` int(11) DEFAULT NULL,
  `Date_Allocated` datetime DEFAULT NULL,
  `Date_First_Visited` datetime DEFAULT NULL,
  `Service_Repre_UserId_FK` int(11) DEFAULT NULL,
  `Approval_Status_Code` varchar(50) DEFAULT NULL,
  `Claim_Approved_UserId_FK` int(11) DEFAULT NULL,
  `Comment` text DEFAULT NULL,
  `Claim_Status_Code` varchar(50) DEFAULT NULL,
  `Claim_SubStatus_Code` varchar(50) DEFAULT NULL,
  `Date_Close` date DEFAULT NULL,
  `Total_Paid_Amount` decimal(15,2) DEFAULT NULL,
  `Total_Paid_Amt_New` decimal(15,2) DEFAULT NULL,
  `Attorney_Involved_YN` tinyint(1) DEFAULT NULL,
  `PA_Involved_YN` tinyint(1) DEFAULT NULL,
  `DFS_Complain_YN` tinyint(1) DEFAULT NULL,
  `Catastrophe_YN` tinyint(1) DEFAULT NULL,
  `Event_Name` varchar(255) DEFAULT NULL,
  `Data_Source` varchar(255) DEFAULT NULL,
  `n_PrimaryAttorneyPersonId_FK` int(11) DEFAULT NULL,
  `d_PrimaryAttoryAssignDate` datetime DEFAULT NULL,
  `n_CoAttorneyPersonId_FK` int(11) DEFAULT NULL,
  `d_CoAttoryAssignDate` datetime DEFAULT NULL,
  `n_Copytoclientfk` int(11) DEFAULT NULL,
  `s_CountyCode` varchar(50) DEFAULT NULL,
  `Inserted_UserId_FK` int(11) DEFAULT NULL,
  `Inserted_Date` datetime DEFAULT NULL,
  `Updated_UserId_FK` int(11) DEFAULT NULL,
  `Updated_Date` datetime DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_claims_checklist`
--

CREATE TABLE `tb_claims_checklist` (
  `id` int(11) NOT NULL,
  `task_title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `is_active` enum('YES','NO') DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_claim_checklist_responses`
--

CREATE TABLE `tb_claim_checklist_responses` (
  `id` int(11) NOT NULL,
  `checklist_task_id` int(11) DEFAULT NULL,
  `claim_id` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `checklist_owner_id` int(11) DEFAULT NULL,
  `is_task_completed` enum('Y','N') DEFAULT NULL,
  `short_notes` text DEFAULT NULL,
  `system_assign` enum('Y','N') DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_holdingcompanies`
--

CREATE TABLE `tb_holdingcompanies` (
  `n_HoldingCompanyId_PK` int(11) NOT NULL,
  `s_HoldingCompanyCode` varchar(50) DEFAULT NULL,
  `s_HoldingCompanyName` varchar(255) DEFAULT NULL,
  `n_Personinfo_FK` int(11) DEFAULT NULL,
  `company_address` text DEFAULT NULL,
  `website_url` varchar(500) DEFAULT NULL,
  `logo_url` varchar(500) DEFAULT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `naic_number` int(11) DEFAULT NULL,
  `metadad` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadad`)),
  `payment_wesite_url` varchar(500) DEFAULT NULL,
  `payment_mailling_address` text DEFAULT NULL,
  `payment_overnight_address` text DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `primary_color` varchar(50) DEFAULT NULL,
  `secondary_color` varchar(50) DEFAULT NULL,
  `n_CreatedUser` int(11) DEFAULT NULL,
  `d_CreatedDate` datetime DEFAULT NULL,
  `n_UpdatedUser` int(11) DEFAULT NULL,
  `d_UpdatedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_policies`
--

CREATE TABLE `tb_policies` (
  `n_PolicyNoId_PK` int(11) NOT NULL,
  `Policy_No` varchar(50) DEFAULT NULL,
  `Policy_No_Gfs` varchar(50) DEFAULT NULL,
  `n_ProductId_FK` int(11) DEFAULT NULL,
  `n_OwnerId_FK` int(11) NOT NULL,
  `n_IssueCompanyID_FK` int(11) DEFAULT NULL,
  `s_IssueCountryCode` varchar(10) DEFAULT NULL,
  `s_IssueStateCode` varchar(10) DEFAULT NULL,
  `n_UnderwriterClient_FK` int(11) DEFAULT NULL,
  `s_QuoteNumber` varchar(50) DEFAULT NULL,
  `d_InceptionDate` date DEFAULT NULL,
  `n_BillAccountMaster_FK` int(11) DEFAULT NULL,
  `s_PolicyStatusCode` varchar(50) DEFAULT NULL,
  `s_PolicyStatusReason` varchar(255) DEFAULT NULL,
  `n_AgencyAccount_FK` int(11) DEFAULT NULL,
  `n_SubAgentPersoninfo_FK` int(11) DEFAULT NULL,
  `n_LatestTermMasterFK` int(11) DEFAULT NULL,
  `n_cancelTranFK` int(11) DEFAULT NULL,
  `s_RenewalTypeCode` varchar(50) DEFAULT NULL,
  `n_RenewalTypeUpdateBy` int(11) DEFAULT NULL,
  `n_RenewalTypeUpdateDate` date DEFAULT NULL,
  `s_NonRenewReasonCode` varchar(50) DEFAULT NULL,
  `d_BookingDate` date DEFAULT NULL,
  `Policy_No_SimpleSolve` varchar(50) DEFAULT NULL,
  `d_InceptionDate_SimpleSolve` date DEFAULT NULL,
  `s_ExtendedCoverage` varchar(50) DEFAULT NULL,
  `s_VmmCoverage` varchar(50) DEFAULT NULL,
  `n_CitizenTotalPremium` decimal(15,2) DEFAULT NULL,
  `n_CitizenTotalPremiumRenewal` decimal(15,2) DEFAULT NULL,
  `d_InsuredLivingDate` date DEFAULT NULL,
  `d_PolicyOrigNBDate` date DEFAULT NULL,
  `s_Custom1` varchar(50) DEFAULT NULL,
  `n_CreatedUser` int(11) DEFAULT NULL,
  `d_CreatedDate` datetime DEFAULT NULL,
  `n_UpdatedUser` int(11) DEFAULT NULL,
  `d_UpdatedDate` datetime DEFAULT NULL,
  `n_EditVersion` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_poriskadditionalfloodinfos`
--

CREATE TABLE `tb_poriskadditionalfloodinfos` (
  `PORiskMasterId_PK` int(11) NOT NULL,
  `n_PolicyId_FK` int(11) DEFAULT NULL,
  `n_RiskId_FK` int(11) DEFAULT NULL,
  `FloodRiskLevel` varchar(50) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_users`
--

CREATE TABLE `tb_users` (
  `Admin_ID` int(11) NOT NULL,
  `Admin_ID_Old` int(11) DEFAULT NULL,
  `Admin_ID_New` int(11) DEFAULT NULL,
  `UserId_PK_CMS` int(11) NOT NULL,
  `s_UserCode` varchar(50) DEFAULT NULL,
  `n_PersonInfoId_FK` int(11) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `UserName_Original` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `PasswordHash` varchar(255) DEFAULT NULL,
  `PasswordOld` varchar(255) DEFAULT NULL,
  `Level` int(11) DEFAULT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `s_MiddleName` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `s_ScreenName` varchar(50) DEFAULT NULL,
  `s_JobTitle` varchar(50) DEFAULT NULL,
  `s_DepartmentCode` varchar(50) DEFAULT NULL,
  `s_SoftwareLicenceNo` varchar(50) DEFAULT NULL,
  `s_UserStatus` varchar(50) DEFAULT NULL,
  `s_UserTypeCode_NOTUSE` varchar(50) DEFAULT NULL,
  `s_UserSubTypeCode_NOTUSE` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `s_PwdRecoverKey` varchar(255) DEFAULT NULL,
  `s_PwdKeyExp` datetime DEFAULT NULL,
  `s_AuthKey_PolicyMap` varchar(255) DEFAULT NULL,
  `d_EffectiveDate` date DEFAULT NULL,
  `d_ExpiryDate` date DEFAULT NULL,
  `s_IsAdmin` tinyint(1) DEFAULT NULL,
  `Created_On` datetime DEFAULT NULL,
  `Closing_Date` datetime DEFAULT NULL,
  `Access_Modules` text DEFAULT NULL,
  `Closing_Date_Crystal` datetime DEFAULT NULL,
  `s_ThemeName` varchar(50) DEFAULT NULL,
  `gcm_regid` varchar(255) DEFAULT NULL,
  `Last_UserID` int(11) DEFAULT NULL,
  `Last_Timestamp` datetime DEFAULT NULL,
  `Login_FirstTime` tinyint(1) DEFAULT NULL,
  `n_CreatedUser` int(11) DEFAULT NULL,
  `d_CreatedDate` datetime DEFAULT NULL,
  `n_UpdatedUser` int(11) DEFAULT NULL,
  `d_UpdatedDate` datetime DEFAULT NULL,
  `n_EditVersion` int(11) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `activation_token` varchar(255) DEFAULT NULL,
  `cognito_id` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_claims`
--
ALTER TABLE `tb_claims`
  ADD PRIMARY KEY (`ClaimId_PK`),
  ADD KEY `FK_Claim_PolicyNoId` (`n_PolicyNoId_FK`),
  ADD KEY `fk_claims_allocated_to` (`Allocated_To_UserId_FK`),
  ADD KEY `fk_claims_service_rep` (`Service_Repre_UserId_FK`),
  ADD KEY `fk_claims_approved_by` (`Claim_Approved_UserId_FK`);

--
-- Indices de la tabla `tb_claims_checklist`
--
ALTER TABLE `tb_claims_checklist`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_claim_checklist_responses`
--
ALTER TABLE `tb_claim_checklist_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_responses_claims` (`claim_id`),
  ADD KEY `fk_responses_tasks` (`checklist_task_id`);

--
-- Indices de la tabla `tb_holdingcompanies`
--
ALTER TABLE `tb_holdingcompanies`
  ADD PRIMARY KEY (`n_HoldingCompanyId_PK`);

--
-- Indices de la tabla `tb_policies`
--
ALTER TABLE `tb_policies`
  ADD PRIMARY KEY (`n_PolicyNoId_PK`);

--
-- Indices de la tabla `tb_poriskadditionalfloodinfos`
--
ALTER TABLE `tb_poriskadditionalfloodinfos`
  ADD PRIMARY KEY (`PORiskMasterId_PK`);

--
-- Indices de la tabla `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`UserId_PK_CMS`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_claims`
--
ALTER TABLE `tb_claims`
  ADD CONSTRAINT `FK_Claim_PolicyNoId` FOREIGN KEY (`n_PolicyNoId_FK`) REFERENCES `tb_policies` (`n_PolicyNoId_PK`),
  ADD CONSTRAINT `fk_claims_allocated_to` FOREIGN KEY (`Allocated_To_UserId_FK`) REFERENCES `tb_users` (`UserId_PK_CMS`),
  ADD CONSTRAINT `fk_claims_approved_by` FOREIGN KEY (`Claim_Approved_UserId_FK`) REFERENCES `tb_users` (`UserId_PK_CMS`),
  ADD CONSTRAINT `fk_claims_service_rep` FOREIGN KEY (`Service_Repre_UserId_FK`) REFERENCES `tb_users` (`UserId_PK_CMS`);

--
-- Filtros para la tabla `tb_claim_checklist_responses`
--
ALTER TABLE `tb_claim_checklist_responses`
  ADD CONSTRAINT `fk_responses_claims` FOREIGN KEY (`claim_id`) REFERENCES `tb_claims` (`ClaimId_PK`),
  ADD CONSTRAINT `fk_responses_tasks` FOREIGN KEY (`checklist_task_id`) REFERENCES `tb_claims_checklist` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
