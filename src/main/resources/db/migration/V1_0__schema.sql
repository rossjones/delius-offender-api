
CREATE OR REPLACE TYPE T_ARR_ORGANISATIONS AS ARRAY(512);


CREATE TABLE OFFENDER
(
	FIRST_NAME           VARCHAR2(35) NOT NULL ,
	OFFENDER_ID          INTEGER NOT NULL ,
	CRN                  CHAR(7) NOT NULL ,
	SECOND_NAME          VARCHAR2(35) NULL ,
	PNC_NUMBER           CHAR(13) NULL ,
	CRO_NUMBER           VARCHAR2(12) NULL ,
	THIRD_NAME           VARCHAR2(35) NULL ,
	SURNAME              VARCHAR2(35) NOT NULL ,
	NOMS_NUMBER          CHAR(7) NULL ,
	PREVIOUS_SURNAME     VARCHAR2(35) NULL ,
	ALLOW_SMS            CHAR(1) NULL  CONSTRAINT  YES_OR_NO_OR_UNKNOWN9 CHECK (ALLOW_SMS IN ('N','Y','U')),
	DATE_OF_BIRTH_DATE   DATE NOT NULL ,
	NI_NUMBER            CHAR(9) NULL ,
	NOTES                CLOB NULL ,
	LANGUAGE_CONCERNS    VARCHAR2(4000) NULL ,
	DECEASED_DATE        DATE NULL ,
	INTERPRETER_REQUIRED CHAR(1) NULL  CONSTRAINT  YES_OR_NO_OR_UNKNOWN10 CHECK (INTERPRETER_REQUIRED IN ('N','Y','U')),
	IMMIGRATION_NUMBER   VARCHAR2(20) NULL ,
	EXCLUSION_MESSAGE    VARCHAR2(200) NULL ,
	RESTRICTION_MESSAGE  VARCHAR2(200) NULL ,
	TELEPHONE_NUMBER     VARCHAR2(35) NULL ,
	MOBILE_NUMBER        VARCHAR2(35) NULL ,
	E_MAIL_ADDRESS       VARCHAR2(255) NULL ,
	PARTITION_AREA_ID    INTEGER NOT NULL ,
	SOFT_DELETED         SMALLINT NOT NULL  CONSTRAINT  TRUE_OR_FALSE65 CHECK (SOFT_DELETED IN (0, 1)),
	ROW_VERSION          INTEGER DEFAULT  0  NOT NULL ,
	TITLE_ID             INTEGER NULL ,
	GENDER_ID            INTEGER NOT NULL ,
	ETHNICITY_ID         INTEGER NULL ,
	NATIONALITY_ID       INTEGER NULL ,
	IMMIGRATION_STATUS_ID INTEGER NULL ,
	LANGUAGE_ID          INTEGER NULL ,
	RELIGION_ID          INTEGER NULL ,
	SURNAME_SOUNDEX      VARCHAR2(50) NOT NULL ,
	CREATED_DATETIME     DATE NOT NULL ,
	MOST_RECENT_PRISONER_NUMBER VARCHAR2(10) NULL ,
	LAST_UPDATED_DATETIME DATE NOT NULL ,
	LAST_UPDATED_DATETIME_DIVERSIT DATE NULL ,
	SECOND_NATIONALITY_ID INTEGER NULL ,
	SEXUAL_ORIENTATION_ID INTEGER NULL ,
	CURRENT_EXCLUSION    INTEGER DEFAULT  0  NOT NULL  CONSTRAINT  CON_CURRENT_EXCLUSION CHECK (CURRENT_EXCLUSION IN (0, 1)),
	CREATED_BY_USER_ID   INTEGER NOT NULL ,
	LAST_UPDATED_USER_ID INTEGER NOT NULL ,
	TRAINING_SESSION_ID  INTEGER NULL ,
	FIRST_NAME_SOUNDEX   VARCHAR2(50) NOT NULL ,
	MIDDLE_NAME_SOUNDEX  VARCHAR2(50) NULL ,
	LAST_UPDATED_USER_ID_DIVERSITY INTEGER NOT NULL ,
	CURRENT_DISPOSAL     INTEGER DEFAULT  0  NOT NULL  CONSTRAINT  CON_CURRENT_DISPOSAL CHECK (CURRENT_DISPOSAL IN (0, 1)),
	CURRENT_HIGHEST_RISK_COLOUR VARCHAR2(10) NULL ,
	CURRENT_RESTRICTION  INTEGER DEFAULT  0  NOT NULL  CONSTRAINT  CON_CURRENT_RESTRICTION CHECK (CURRENT_RESTRICTION IN (0, 1)),
	INSTITUTION_ID       INTEGER NULL ,
	ESTABLISHMENT        CHAR(1) NULL  CONSTRAINT  YES_OR_NO_ONLY32 CHECK (ESTABLISHMENT IN ('Y','N')),
	ORGANISATIONS        T_ARR_ORGANISATIONS NULL ,
	CURRENT_TIER         INTEGER NULL ,
	PENDING_TRANSFER     SMALLINT NOT NULL  CONSTRAINT  TRUE_OR_FALSE66 CHECK (PENDING_TRANSFER IN (0, 1)),
	OFFENDER_DETAILS     CLOB NULL ,
	PREVIOUS_CONVICTION_DATE DATE NULL ,
	PREVIOUS_CONVICTION_DOCUMENT BLOB NULL ,
	PREV_CONVICTION_DOCUMENT_NAME VARCHAR2(200) NULL ,
	CURRENT_REMAND_STATUS VARCHAR2(200) NULL ,
	OM_ALLOCATION_DECISION_ID INTEGER NULL ,
	PREV_CON_LAST_UPDATED_USER_ID INTEGER NULL ,
	PREV_CON_LAST_UPD_AUTH_PROV_ID INTEGER NULL ,
	PREV_CON_CREATED_PROVIDER_ID INTEGER NULL ,
	PREV_CON_CREATED_BY_USER_ID INTEGER NULL ,
	PREV_CON_CREATED_DATETIME DATE NULL ,
	PREV_CON_ALFRESCO_DOCUMENT_ID VARCHAR2(36) NULL ,
	TRANSGENDER_CONSENT_DISCLOSE CHAR(1) NULL  CONSTRAINT  YES_OR_NO_ONLY_1345657105 CHECK (TRANSGENDER_CONSENT_DISCLOSE IN ('Y','N')),
	TRANSGENDER_PROCESS_ID INTEGER NULL ,
CONSTRAINT  XPKOFFENDER PRIMARY KEY (OFFENDER_ID),CONSTRAINT  XAK1OFFENDER UNIQUE (PREV_CON_ALFRESCO_DOCUMENT_ID)
);

CREATE TABLE OFFENDER_ADDRESS
(
	OFFENDER_ADDRESS_ID  INTEGER NOT NULL ,
	START_DATE           DATE NOT NULL ,
	END_DATE             DATE NULL ,
	PARTITION_AREA_ID    INTEGER NOT NULL ,
	SOFT_DELETED         SMALLINT NOT NULL  CONSTRAINT  TRUE_OR_FALSE20 CHECK (SOFT_DELETED IN (0, 1)),
	ROW_VERSION          INTEGER DEFAULT  0  NOT NULL ,
	ADDRESS_STATUS_ID    INTEGER NOT NULL ,
	NO_FIXED_ABODE       CHAR(1) NULL  CONSTRAINT  YES_OR_NO_ONLY9 CHECK (NO_FIXED_ABODE IN ('Y','N')),
	OFFENDER_ID          INTEGER NOT NULL ,
	NOTES                CLOB NULL ,
	ADDRESS_NUMBER       VARCHAR2(35) NULL ,
	STREET_NAME          VARCHAR2(35) NULL ,
	DISTRICT             VARCHAR2(35) NULL ,
	TOWN_CITY            VARCHAR2(35) NULL ,
	CREATED_DATETIME     DATE NOT NULL ,
	COUNTY               VARCHAR2(35) NULL ,
	LAST_UPDATED_DATETIME DATE NOT NULL ,
	BUILDING_NAME        VARCHAR2(35) NULL ,
	POSTCODE             VARCHAR2(35) NULL ,
	CREATED_BY_USER_ID   INTEGER NOT NULL ,
	TELEPHONE_NUMBER     VARCHAR2(35) NULL ,
	LAST_UPDATED_USER_ID INTEGER NOT NULL ,
	TRAINING_SESSION_ID  INTEGER NULL ,
	ORGANISATIONS        T_ARR_ORGANISATIONS NULL ,
CONSTRAINT  XPKOFFENDER_ADDRESS PRIMARY KEY (OFFENDER_ADDRESS_ID),
CONSTRAINT OFFENDER_ADDRESS_START_LT_END CHECK ( (
(START_DATE <= END_DATE) OR (END_DATE IS NULL)
) )
)
	;

CREATE TABLE R_STANDARD_REFERENCE_LIST
(
	STANDARD_REFERENCE_LIST_ID INTEGER NOT NULL ,
	CODE_VALUE           VARCHAR2(100) NOT NULL ,
	CODE_DESCRIPTION     VARCHAR2(500) NOT NULL ,
	SELECTABLE           CHAR(1) NOT NULL  CONSTRAINT  YES_OR_NO27 CHECK (SELECTABLE IN ('N','Y')),
	CREATED_BY_USER_ID   INTEGER NOT NULL ,
	CREATED_DATETIME     DATE NOT NULL ,
	LAST_UPDATED_USER_ID INTEGER NOT NULL ,
	LAST_UPDATED_DATETIME DATE NOT NULL ,
	REFERENCE_DATA_MASTER_ID INTEGER NOT NULL ,
	ROW_VERSION          INTEGER DEFAULT  0  NOT NULL ,
	TRAINING_SESSION_ID  INTEGER NULL ,
	SPG_INTEREST         INTEGER NULL  CONSTRAINT  TRUE_OR_FALSE_1883892480 CHECK (SPG_INTEREST IN (0, 1)),
	SPG_OVERRIDE         INTEGER NULL  CONSTRAINT  TRUE_OR_FALSE_1684532474 CHECK (SPG_OVERRIDE IN (0, 1)),
CONSTRAINT  XPKR_STANDARD_REFERENCE_LIST PRIMARY KEY (STANDARD_REFERENCE_LIST_ID),CONSTRAINT  XAK1R_STANDARD_REFERENCE_LIST UNIQUE (CODE_VALUE,REFERENCE_DATA_MASTER_ID,STANDARD_REFERENCE_LIST_ID)
)
	;
