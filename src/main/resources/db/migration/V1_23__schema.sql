create table KEY_DATE
(
  CUSTODY_ID NUMBER not null
    references CUSTODY,
  KEY_DATE_TYPE_ID NUMBER not null
    references R_STANDARD_REFERENCE_LIST,
  KEY_DATE DATE not null,
  PARTITION_AREA_ID NUMBER not null
    references PARTITION_AREA,
  SOFT_DELETED NUMBER not null
    constraint TRUE_OR_FALSE56
      check (SOFT_DELETED IN (0, 1)),
  ROW_VERSION NUMBER default 0 not null,
  TRAINING_SESSION_ID NUMBER,
  CREATED_BY_USER_ID NUMBER not null,
  LAST_UPDATED_USER_ID NUMBER not null,
  CREATED_DATETIME DATE not null,
  LAST_UPDATED_DATETIME DATE not null,
  KEY_DATE_ID NUMBER not null
    constraint XPKKEY_DATE
      primary key,
  constraint XAK1KEY_DATE
    unique (CUSTODY_ID, KEY_DATE_TYPE_ID, KEY_DATE)
);
