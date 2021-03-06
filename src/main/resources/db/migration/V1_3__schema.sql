CREATE TABLE R_AD_RQMNT_TYPE_MAIN_CATEGORY
(
  AD_RQMNT_TYPE_MAIN_CATEGORY_ID NUMBER        NOT NULL
    PRIMARY KEY,
  CODE                           VARCHAR2(20)  NOT NULL,
  DESCRIPTION                    VARCHAR2(200) NOT NULL
);

CREATE TABLE R_RQMNT_TYPE_MAIN_CATEGORY
(
  RQMNT_TYPE_MAIN_CATEGORY_ID NUMBER        NOT NULL
    PRIMARY KEY,
  CODE                        VARCHAR2(20)  NOT NULL,
  DESCRIPTION                 VARCHAR2(200) NOT NULL
);

create table EVENT
(
  EVENT_ID NUMBER not null
    constraint XPKEVENT
      primary key,
  CONSECUTIVE_TO_EVENT_ID NUMBER
    constraint R_785
      references EVENT,
  CONCURRENT_WITH_EVENT_ID NUMBER
    constraint R_784
      references EVENT,
  OFFENDER_ID NUMBER not null
    references OFFENDER,
  EVENT_NUMBER VARCHAR2(10),
  REFERRAL_DATE DATE not null,
  NOTES CLOB,
  SOFT_DELETED NUMBER not null
    constraint TRUE_OR_FALSE52
      check (SOFT_DELETED IN (0, 1)),
  PARTITION_AREA_ID NUMBER,
  ROW_VERSION NUMBER default 0 not null,
  CREATED_BY_USER_ID NUMBER not null,
  CREATED_DATETIME DATE not null,
  LAST_UPDATED_USER_ID NUMBER not null,
  LAST_UPDATED_DATETIME DATE not null,
  TRAINING_SESSION_ID NUMBER,
  ORGANISATIONS T_ARR_ORGANISATIONS,
  IN_BREACH NUMBER not null
    constraint TRUE_OR_FALSE53
      check (IN_BREACH IN (0, 1)),
  ACTIVE_FLAG NUMBER not null
    constraint TRUE_OR_FALSE54
      check (ACTIVE_FLAG IN (0, 1)),
  BREACH_END DATE,
  CPS_DATE DATE,
  CPS_DOCUMENT BLOB,
  CPS_DOCUMENT_NAME VARCHAR2(200),
  FTC_COUNT NUMBER default 0 not null,
  PENDING_TRANSFER NUMBER not null
    constraint TRUE_OR_FALSE_1415501270
      check (PENDING_TRANSFER IN (0, 1)),
  CONVICTION_DATE DATE,
  FIRST_RELEASE_DATE DATE,
  PSS_RQMNT_FLAG NUMBER(22) not null
    constraint TRUE_OR_FALSE_1988266100
      check (PSS_RQMNT_FLAG IN (0, 1)),
  CPS_LAST_UPDATED_USER_ID NUMBER,
  CPS_LAST_UPDATED_AUTH_PROV_ID NUMBER,
  CPS_CREATED_PROVIDER_ID NUMBER,
  CPS_CREATED_BY_USER_ID NUMBER,
  CPS_CREATED_DATETIME DATE,
  CPS_ALFRESCO_DOCUMENT_ID VARCHAR2(36)
    constraint XAK1EVENT
      unique,
  CPS_SOFT_DELETED NUMBER
    constraint TRUE_OR_FALSE_1617352144
      check (CPS_SOFT_DELETED IN (0, 1)),
  COURT_ID NUMBER
);

CREATE TABLE R_NSI_TYPE
(
  NSI_TYPE_ID NUMBER        NOT NULL
    PRIMARY KEY,
  CODE        VARCHAR2(20)  NOT NULL,
  DESCRIPTION VARCHAR2(200) NOT NULL
);

CREATE TABLE RQMNT
(
  RQMNT_ID                       NUMBER NOT NULL
    PRIMARY KEY,
  START_DATE                     DATE   NOT NULL,
  RQMNT_NOTES                    CLOB,
  COMMENCEMENT_DATE              DATE,
  TERMINATION_DATE               DATE,
  EXPECTED_START_DATE            DATE,
  EXPECTED_END_DATE              DATE,
  RQMNT_TYPE_SUB_CATEGORY_ID     NUMBER
    REFERENCES R_STANDARD_REFERENCE_LIST,
  AD_RQMNT_TYPE_SUB_CATEGORY_ID  NUMBER
    REFERENCES R_STANDARD_REFERENCE_LIST,
  RQMNT_TYPE_MAIN_CATEGORY_ID    NUMBER
    REFERENCES R_RQMNT_TYPE_MAIN_CATEGORY,
  AD_RQMNT_TYPE_MAIN_CATEGORY_ID NUMBER
    REFERENCES R_AD_RQMNT_TYPE_MAIN_CATEGORY,
  OFFENDER_ID                    NUMBER NOT NULL
    REFERENCES OFFENDER
);


CREATE TABLE NSI
(
  NSI_ID          NUMBER NOT NULL
    PRIMARY KEY,
  OFFENDER_ID     NUMBER NOT NULL
    REFERENCES OFFENDER,
  EVENT_ID        NUMBER
    REFERENCES EVENT,
  NSI_TYPE_ID     NUMBER NOT NULL
    REFERENCES R_NSI_TYPE,
  NSI_SUB_TYPE_ID NUMBER
    REFERENCES R_STANDARD_REFERENCE_LIST,
  NOTES           CLOB,
  RQMNT_ID        NUMBER
    REFERENCES RQMNT
);

CREATE TABLE R_LIC_COND_TYPE_MAIN_CAT
(
  LIC_COND_TYPE_MAIN_CAT_ID NUMBER        NOT NULL
    PRIMARY KEY,
  CODE                      VARCHAR2(100) NOT NULL,
  DESCRIPTION               VARCHAR2(200)
);

CREATE TABLE R_CONTACT_OUTCOME_TYPE
(
  CONTACT_OUTCOME_TYPE_ID NUMBER       NOT NULL
    PRIMARY KEY,
  CODE                    VARCHAR2(10) NOT NULL,
  DESCRIPTION             VARCHAR2(50) NOT NULL
);

CREATE TABLE R_CONTACT_TYPE
(
  CONTACT_TYPE_ID NUMBER not null
    constraint XPKR_CONTACT_TYPE
      primary key,
  CODE VARCHAR2(10) not null,
  DESCRIPTION VARCHAR2(4000) not null,
  SHORT_DESCRIPTION VARCHAR2(500),
  SELECTABLE CHAR not null
    constraint YES_OR_NO9
      check (SELECTABLE IN ('N','Y')),
  NATIONAL_STANDARDS_CONTACT CHAR
    constraint YES_OR_NO_409
      check (NATIONAL_STANDARDS_CONTACT IN ('Y','N')),
  ATTENDANCE_CONTACT CHAR
    constraint YES_OR_NO_410
      check (ATTENDANCE_CONTACT IN ('Y','N')),
  RECORDED_HOURS_CREDITED CHAR
    constraint YES_OR_NO_411
      check (RECORDED_HOURS_CREDITED IN ('Y','N')),
  SENSITIVE_CONTACT CHAR
    constraint YES_OR_NO_412
      check (SENSITIVE_CONTACT IN ('Y','N')),
  OFFENDER_LEVEL_CONTACT CHAR
    constraint YES_OR_NO_413
      check (OFFENDER_LEVEL_CONTACT IN ('Y','N')),
  ROW_VERSION NUMBER default 0 not null,
  CREATED_DATETIME DATE not null,
  APPEARS_IN_LIST_OF_CONTACTS CHAR,
  SMS_MESSAGE_TEXT CHAR
    constraint YES_OR_NO_414
      check (SMS_MESSAGE_TEXT IN ('Y','N')),
  OFFENDER_EVENT_0 CHAR
    constraint YES_OR_NO_415
      check (OFFENDER_EVENT_0 IN ('Y','N')),
  LEGACY_ORDERS CHAR
    constraint YES_OR_NO_416
      check (LEGACY_ORDERS IN ('Y','N')),
  LAST_UPDATED_DATETIME DATE not null,
  CJA_ORDERS CHAR
    constraint YES_OR_NO_417
      check (CJA_ORDERS IN ('Y','N')),
  DPA_EXCLUDE CHAR
    constraint YES_OR_NO_418
      check (DPA_EXCLUDE IN ('Y','N')),
  TRAINING_SESSION_ID NUMBER,
  CONTACT_OUTCOME_FLAG CHAR not null
    constraint YES_OR_NO_OR_BOTH_ONLY
      check (CONTACT_OUTCOME_FLAG IN ('Y', 'N', 'B')),
  CONTACT_LOCATION_FLAG CHAR not null
    constraint YES_OR_NO_OR_BOTH_ONLY1
      check (CONTACT_LOCATION_FLAG IN ('Y', 'N', 'B')),
  CREATED_BY_USER_ID NUMBER not null,
  CONTACT_ALERT_FLAG CHAR not null,
  LAST_UPDATED_USER_ID NUMBER not null,
  FUTURE_SCHEDULED_CONTACTS_FLAG CHAR,
  CONTACT_TYPE_ICON_ID NUMBER,
  EDITABLE CHAR,
  DEFAULT_HEADINGS CLOB,
  PSS_RQMNT CHAR
    constraint YES_OR_NO_ONLY_130798902
      check (PSS_RQMNT IN ('Y','N')),
  RAR_ACTIVITY CHAR
    constraint YES_OR_NO_ONLY_1112934154
      check (RAR_ACTIVITY IN ('Y','N')),
  SPG_OVERRIDE NUMBER
    constraint TRUE_OR_FALSE_1089845492
      check (SPG_OVERRIDE IN (0, 1)),
  NOMIS_CONTACT_TYPE VARCHAR2(4000),
  SPG_INTEREST NUMBER default 1
    constraint TRUE_OR_FALSE_1289205498
      check (SPG_INTEREST IN (0, 1)),
  SGC_FLAG NUMBER default 0
    constraint TRUE_OR_FALSE_1656616625
      check (SGC_FLAG IN (0, 1)),
  constraint XAK1R_CONTACT_TYPE
    unique (CODE, TRAINING_SESSION_ID, CONTACT_TYPE_ID)
);


CREATE TABLE LIC_CONDITION
(
  LIC_CONDITION_ID          NUMBER NOT NULL
    PRIMARY KEY,
  START_DATE                DATE   NOT NULL,
  LIC_CONDITION_NOTES       CLOB,
  COMMENCEMENT_DATE         DATE,
  COMMENCEMENT_NOTES        CLOB,
  TERMINATION_DATE          DATE,
  TERMINATION_NOTES         CLOB,
  EXPECTED_START_DATE       DATE,
  EXPECTED_END_DATE         DATE,
  LIC_COND_TYPE_SUB_CAT_ID  NUMBER
    REFERENCES R_STANDARD_REFERENCE_LIST,
  CREATED_DATETIME          DATE   NOT NULL,
  LIC_COND_TYPE_MAIN_CAT_ID NUMBER
    REFERENCES R_LIC_COND_TYPE_MAIN_CAT,
  OFFENDER_ID               NUMBER NOT NULL
    REFERENCES OFFENDER,
  ACTIVE_FLAG               NUMBER NOT NULL
);

CREATE TABLE R_EXPLANATION
(
  EXPLANATION_ID NUMBER        NOT NULL
    PRIMARY KEY,
  CODE           VARCHAR2(10)  NOT NULL,
  DESCRIPTION    VARCHAR2(100) NOT NULL
);

CREATE TABLE PROBATION_AREA
(
  PROBATION_AREA_ID     NUMBER           NOT NULL
    PRIMARY KEY,
  CODE                  CHAR(3)          NOT NULL,
  DESCRIPTION           VARCHAR2(60)     NOT NULL,
  SELECTABLE            CHAR             NOT NULL,
  ROW_VERSION           NUMBER DEFAULT 0 NOT NULL,
  FORM_20_CODE          VARCHAR2(20),
  MIGRATED_DATE         DATE,
  HO_AREA_CODE          VARCHAR2(20),
  CREATED_BY_USER_ID    NUMBER           NOT NULL,
  CREATED_DATETIME      DATE             NOT NULL,
  LAST_UPDATED_USER_ID  NUMBER           NOT NULL,
  LAST_UPDATED_DATETIME DATE             NOT NULL,
  TRAINING_SESSION_ID   NUMBER,
  TRUST_CODE            CHAR(3),
  TRUST_DIVISION_ID     NUMBER,
  TRUST_CPA_ID          NUMBER,
  PRIVATE               NUMBER           NOT NULL,
  DIVISION_ID           NUMBER,
  ORGANISATION_ID       NUMBER           NOT NULL,
  CONTACT_NAME          VARCHAR2(200),
  ADDRESS_ID            NUMBER           NOT NULL,
  START_DATE            DATE             NOT NULL,
  END_DATE              DATE,
  SPG_ACTIVE_ID         NUMBER           NOT NULL,
  INSTITUTION_ID        NUMBER,
  ESTABLISHMENT         CHAR
);


CREATE TABLE PROVIDER_LOCATION
(
  PROVIDER_LOCATION_ID  NUMBER           NOT NULL
    PRIMARY KEY,
  CODE                  CHAR(7)          NOT NULL,
  DESCRIPTION           VARCHAR2(50)     NOT NULL,
  FAX_NUMBER            VARCHAR2(35),
  EXTERNAL_PROVIDER_ID  NUMBER           NOT NULL,
  ROW_VERSION           NUMBER DEFAULT 0 NOT NULL,
  ADDRESS_ID            NUMBER,
  START_DATE            DATE             NOT NULL,
  END_DATE              DATE,
  NOTES                 CLOB,
  CONTACT_NAME          VARCHAR2(107),
  CREATED_DATETIME      DATE             NOT NULL,
  CREATED_BY_USER_ID    NUMBER           NOT NULL,
  LAST_UPDATED_DATETIME DATE             NOT NULL,
  LAST_UPDATED_USER_ID  NUMBER           NOT NULL,
  TRAINING_SESSION_ID   NUMBER,
  PROBATION_AREA_ID     NUMBER
    REFERENCES PROBATION_AREA
);

CREATE TABLE PROVIDER_EMPLOYEE
(
  PROVIDER_EMPLOYEE_ID  NUMBER           NOT NULL
    PRIMARY KEY,
  CODE                  CHAR(4)          NOT NULL,
  SURNAME               VARCHAR2(35)     NOT NULL,
  START_DATE            DATE             NOT NULL,
  FORENAME              VARCHAR2(35)     NOT NULL,
  END_DATE              DATE,
  FORENAME2             VARCHAR2(35),
  ROW_VERSION           NUMBER DEFAULT 0 NOT NULL,
  EXTERNAL_PROVIDER_ID  NUMBER           NOT NULL,
  CREATED_BY_USER_ID    NUMBER           NOT NULL,
  CREATED_DATETIME      DATE             NOT NULL,
  LAST_UPDATED_USER_ID  NUMBER           NOT NULL,
  LAST_UPDATED_DATETIME DATE             NOT NULL,
  TRAINING_SESSION_ID   NUMBER,
  PROBATION_AREA_ID     NUMBER
    REFERENCES PROBATION_AREA
);

CREATE TABLE STAFF
(
  STAFF_ID              NUMBER           NOT NULL
    PRIMARY KEY,
  START_DATE            DATE             NOT NULL,
  SURNAME               VARCHAR2(35)     NOT NULL,
  END_DATE              DATE,
  FORENAME              VARCHAR2(35)     NOT NULL,
  ROW_VERSION           NUMBER DEFAULT 0 NOT NULL,
  FORENAME2             VARCHAR2(35),
  STAFF_GRADE_ID        NUMBER,
  TITLE_ID              NUMBER
    REFERENCES R_STANDARD_REFERENCE_LIST,
  OFFICER_CODE          CHAR(7),
  CREATED_BY_USER_ID    NUMBER           NOT NULL,
  LAST_UPDATED_USER_ID  NUMBER           NOT NULL,
  CREATED_DATETIME      DATE             NOT NULL,
  LAST_UPDATED_DATETIME DATE             NOT NULL,
  TRAINING_SESSION_ID   NUMBER,
  PRIVATE               NUMBER           NOT NULL,
  SC_PROVIDER_ID        NUMBER,
  PROBATION_AREA_ID     NUMBER           NOT NULL
    REFERENCES PROBATION_AREA
);

CREATE TABLE LOCAL_DELIVERY_UNIT
(
  LOCAL_DELIVERY_UNIT_ID NUMBER not null
    constraint XPKLOCAL_DELIVERY_UNIT
      primary key,
  CODE VARCHAR2(10) not null,
  DESCRIPTION VARCHAR2(50) not null,
  SELECTABLE CHAR not null
    constraint YES_OR_NO11
      check (SELECTABLE IN ('N','Y')),
  ROW_VERSION NUMBER default 0 not null,
  CREATED_DATETIME DATE not null,
  CREATED_BY_USER_ID NUMBER not null,
  LAST_UPDATED_DATETIME DATE not null,
  LAST_UPDATED_USER_ID NUMBER not null,
  TRAINING_SESSION_ID NUMBER,
  PROBATION_AREA_ID NUMBER not null
    references PROBATION_AREA,
  constraint XAK1LOCAL_DELIVERY_UNIT
    unique (CODE, TRAINING_SESSION_ID, LOCAL_DELIVERY_UNIT_ID)
);

CREATE TABLE SC_PROVIDER
(
  SC_PROVIDER_ID NUMBER not null
    constraint XPKSC_PROVIDER
      primary key,
  CODE VARCHAR2(20) not null,
  DESCRIPTION VARCHAR2(200) not null,
  PROVIDER_ID NUMBER not null
    constraint R_888
      references PROBATION_AREA,
  CONTACT_NAME VARCHAR2(200),
  ADDRESS_ID NUMBER not null,
  PRIVATE NUMBER not null
    constraint TRUE_OR_FALSE_243555997
      check (PRIVATE IN (0, 1)),
  START_DATE DATE not null,
  END_DATE DATE,
  ACTIVE_FLAG NUMBER not null,
  NOTES CLOB,
  ROW_VERSION NUMBER default 0 not null,
  CREATED_BY_USER_ID NUMBER not null,
  CREATED_DATETIME DATE not null,
  LAST_UPDATED_USER_ID NUMBER not null,
  LAST_UPDATED_DATETIME DATE not null,
  TRAINING_SESSION_ID NUMBER,
  constraint ACTIVE_FLAG_END_DATE_121858971
    check ( (ACTIVE_FLAG = 0 AND END_DATE IS NOT NULL)
      OR
            (ACTIVE_FLAG = 1 AND END_DATE IS NULL)
      )
);

CREATE TABLE TEAM
(
  TEAM_ID NUMBER not null
    constraint XPKTEAM
      primary key,
  CODE CHAR(6) not null,
  DESCRIPTION VARCHAR2(50) not null,
  DISTRICT_ID NUMBER,
  LOCAL_DELIVERY_UNIT_ID NUMBER,
  TELEPHONE VARCHAR2(35),
  UNPAID_WORK_TEAM CHAR not null
    constraint YES_OR_NO_OR_UNKNOWN8
      check (UNPAID_WORK_TEAM IN ('N','Y','U')),
  ROW_VERSION NUMBER default 0 not null,
  FAX_NUMBER VARCHAR2(35),
  CONTACT_NAME VARCHAR2(200),
  START_DATE DATE not null,
  END_DATE DATE,
  CREATED_DATETIME DATE not null,
  CREATED_BY_USER_ID NUMBER not null,
  LAST_UPDATED_DATETIME DATE not null,
  LAST_UPDATED_USER_ID NUMBER not null,
  TRAINING_SESSION_ID NUMBER,
  PROBATION_AREA_ID NUMBER not null
    references PROBATION_AREA,
  PRIVATE NUMBER not null
    constraint TRUE_OR_FALSE_924858398
      check (PRIVATE IN (0, 1)),
  SC_PROVIDER_ID NUMBER,
  DESIGNATED_TRANSFER_TEAM NUMBER default 0
    constraint TRUE_OR_FALSE_871680176
      check (DESIGNATED_TRANSFER_TEAM IN (0, 1)),
  constraint XAK2TEAM
    unique (CODE, TRAINING_SESSION_ID, TEAM_ID),
  constraint PROVIDER_LOCATION_DATE_VALID8
    check ( (
        (START_DATE <= END_DATE) OR (END_DATE IS NULL)
      ))
);

CREATE TABLE PROVIDER_TEAM
(
  PROVIDER_TEAM_ID      NUMBER           NOT NULL
    PRIMARY KEY,
  CODE                  CHAR(3)          NOT NULL,
  NAME                  VARCHAR2(50)     NOT NULL,
  EXTERNAL_PROVIDER_ID  NUMBER           NOT NULL,
  START_DATE            DATE,
  END_DATE              DATE,
  UNPAID_WORK           CHAR,
  ROW_VERSION           NUMBER DEFAULT 0 NOT NULL,
  CREATED_DATETIME      DATE             NOT NULL,
  CREATED_BY_USER_ID    NUMBER           NOT NULL,
  LAST_UPDATED_DATETIME DATE             NOT NULL,
  LAST_UPDATED_USER_ID  NUMBER           NOT NULL,
  TRAINING_SESSION_ID   NUMBER,
  PROBATION_AREA_ID     NUMBER           NOT NULL
    REFERENCES PROBATION_AREA
);

CREATE TABLE PARTITION_AREA
(
  PARTITION_AREA_ID   NUMBER           NOT NULL
    PRIMARY KEY,
  AREA                VARCHAR2(30)     NOT NULL,
  ROW_VERSION         NUMBER DEFAULT 0 NOT NULL,
  TRAINING_SESSION_ID NUMBER
);


CREATE TABLE CONTACT
(
  CONTACT_ID                   NUMBER           NOT NULL
    PRIMARY KEY,
  LINKED_CONTACT_ID            NUMBER
    REFERENCES CONTACT,
  CONTACT_DATE                 DATE             NOT NULL,
  OFFENDER_ID                  NUMBER           NOT NULL
    REFERENCES OFFENDER,
  CONTACT_START_TIME           DATE,
  CONTACT_END_TIME             DATE,
  RQMNT_ID                     NUMBER
    REFERENCES RQMNT,
  LIC_CONDITION_ID             NUMBER
    REFERENCES LIC_CONDITION,
  PROVIDER_LOCATION_ID         NUMBER
    REFERENCES PROVIDER_LOCATION,
  PROVIDER_EMPLOYEE_ID         NUMBER
    REFERENCES PROVIDER_EMPLOYEE,
  HOURS_CREDITED               NUMBER(10, 2),
  NOTES                        CLOB,
  VISOR_CONTACT                CHAR,
  STAFF_ID                     NUMBER
    REFERENCES STAFF,
  TEAM_ID                      NUMBER
    REFERENCES TEAM,
  SOFT_DELETED                 NUMBER           NOT NULL,
  VISOR_EXPORTED               CHAR,
  PARTITION_AREA_ID            NUMBER           NOT NULL
    REFERENCES PARTITION_AREA,
  OFFICE_LOCATION_ID           NUMBER,
  ROW_VERSION                  NUMBER DEFAULT 0 NOT NULL,
  ALERT_ACTIVE                 CHAR,
  ATTENDED                     CHAR,
  CREATED_DATETIME             DATE             NOT NULL,
  COMPLIED                     CHAR,
  SENSITIVE                    CHAR,
  LAST_UPDATED_DATETIME        DATE             NOT NULL,
  EVENT_ID                     NUMBER
    REFERENCES EVENT,
  CONTACT_TYPE_ID              NUMBER           NOT NULL
    REFERENCES R_CONTACT_TYPE,
  PROVIDER_TEAM_ID             NUMBER
    REFERENCES PROVIDER_TEAM,
  CONTACT_OUTCOME_TYPE_ID      NUMBER
    REFERENCES R_CONTACT_OUTCOME_TYPE,
  CREATED_BY_USER_ID           NUMBER           NOT NULL,
  EXPLANATION_ID               NUMBER
    REFERENCES R_EXPLANATION,
  LAST_UPDATED_USER_ID         NUMBER           NOT NULL,
  TRAINING_SESSION_ID          NUMBER,
  TRUST_PROVIDER_FLAG          NUMBER           NOT NULL,
  STAFF_EMPLOYEE_ID            NUMBER           NOT NULL,
  PROBATION_AREA_ID            NUMBER           NOT NULL
    REFERENCES PROBATION_AREA,
  TRUST_PROVIDER_TEAM_ID       NUMBER           NOT NULL,
  ENFORCEMENT                  NUMBER,
  DOCUMENT_LINKED              CHAR,
  UPLOAD_LINKED                CHAR,
  LATEST_ENFORCEMENT_ACTION_ID NUMBER,
  NSI_ID                       NUMBER
    CONSTRAINT R_895
    REFERENCES NSI,
  TABLE_NAME                   VARCHAR2(30)
    CONSTRAINT CONTACT_TABLE_69233217
    CHECK (TABLE_NAME IN
           ('APPROVED_PREMISES_REFERRAL', 'APPROVED_PREMISES_RESIDENCE', 'COURT_REPORT', 'INSTITUTIONAL_REPORT')),
  PRIMARY_KEY_ID               NUMBER(22),
  PSS_RQMNT_ID                 NUMBER(22),
  RAR_ACTIVITY                 CHAR,
  NOMIS_CASE_NOTE_ID           NUMBER,
  LINKED_DOCUMENT_CONTACT_ID   NUMBER
);