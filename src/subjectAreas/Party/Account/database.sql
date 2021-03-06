CREATE SCHEMA IF NOT EXISTS ACCOUNT_ENTITY_GROUP;

CREATE TABLE ACCOUNT_ENTITY_GROUP.BILLING_FREQUENCY (
  ID VARCHAR(36) UNIQUE NOT NULL,
  BILLING_FREQUENCY_NAME VARCHAR(500) NOT NULL,
  NAME VARCHAR(500) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT_ROLE (
  ACCOUNT_CONTACT_ROLE_TYPE VARCHAR(500),
  ID VARCHAR(36) UNIQUE NOT NULL,
  ACTIVE_FROM_DATE DATE,
  ACTIVE_TO_DATE DATE,
  PRIMARY KEY (ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT (
  ID VARCHAR(36) UNIQUE NOT NULL,
  DEPARTMENT_NAME VARCHAR(500),
  ASSISTANT_PHONE VARCHAR(500),
  TITLE VARCHAR(500),
  LAST_ACTIVITY_DATE DATE,
  CONTACT_NOTE VARCHAR(500),
  ASSISTANT_NAME VARCHAR(500),
  PRIMARY KEY (ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_PARTNER (
  ID VARCHAR(36) UNIQUE NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT (
  BILL_DELIVERY_METHOD VARCHAR(500),
  USE_AS_SALES_ACCOUNT BOOLEAN NOT NULL,
  ASSIGN_TERRITORY_FLAG BOOLEAN,
  AUTO_PAY_ENABLED_FLAG BOOLEAN,
  AUTO_PAYMENT_AMOUNT INTEGER,
  USE_AS_SERVICE_ACCOUNT BOOLEAN NOT NULL,
  USE_AS_BILLING_ACCOUNT BOOLEAN NOT NULL,
  DESCRIPTION VARCHAR(500),
  ID VARCHAR(36) UNIQUE NOT NULL,
  S_LA_EXPIRATION_DATE DATE,
  NAME VARCHAR(500) NOT NULL,
  ACCOUNT_TYPE VARCHAR(500),
  BALANCE_AMOUNT INTEGER,
  HOLD_STATUS_REASON VARCHAR(500),
  GENERAL_LEDGER_ACCOUNT VARCHAR(500),
  THIRTY_DAY_BALANCE_AMOUNT INTEGER,
  SIXTY_DAY_BALANCE_AMOUNT INTEGER,
  USE_AS_SHIPPING_ACCOUNT BOOLEAN NOT NULL,
  S_LA_TYPE VARCHAR(500),
  BALANCE_AMOUNT_LIMIT INTEGER,
  LAST_ACTIVITY_DATE DATE,
  NUMBER VARCHAR(500) NOT NULL,
  NINETY_DAY_BALANCE_AMOUNT INTEGER,
  PAYMENT_TERM VARCHAR(500) NOT NULL,
  DEFAULT_FREIGHT_TERMS VARCHAR(500),
  PRIMARY KEY (ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT_ROLE_ACCOUNT_CONTACT_JOIN (
  ACCOUNT_CONTACT_ROLE_ID  VARCHAR(36) NOT NULL,
  ACCOUNT_CONTACT_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_CONTACT_ROLE_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT_ROLE(ID),
  FOREIGN KEY(ACCOUNT_CONTACT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT_REPORTS_TO_ACCOUNT_CONTACT_JOIN (
  ACCOUNT_CONTACT_ID_LEFT  VARCHAR(36) NOT NULL,
  ACCOUNT_CONTACT_ID_RIGHT VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_CONTACT_ID_LEFT) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID),
  FOREIGN KEY(ACCOUNT_CONTACT_ID_RIGHT) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT_MAILING_ADDRESS_JOIN (
  ACCOUNT_CONTACT_ID  VARCHAR(36) NOT NULL,
  CONTACT_POINT_ADDRESS_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_CONTACT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID),
  FOREIGN KEY(CONTACT_POINT_ADDRESS_ID) REFERENCES CONTACT_POINT_ENTITY_GROUP.CONTACT_POINT_ADDRESS(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT_ACCOUNT_JOIN (
  ACCOUNT_CONTACT_ID  VARCHAR(36) NOT NULL,
  ACCOUNT_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_CONTACT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID),
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT_FAX_PHONE_JOIN (
  ACCOUNT_CONTACT_ID  VARCHAR(36) NOT NULL,
  CONTACT_POINT_PHONE_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_CONTACT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID),
  FOREIGN KEY(CONTACT_POINT_PHONE_ID) REFERENCES CONTACT_POINT_ENTITY_GROUP.CONTACT_POINT_PHONE(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT_BUSINESS_PHONE_JOIN (
  ACCOUNT_CONTACT_ID  VARCHAR(36) NOT NULL,
  CONTACT_POINT_PHONE_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_CONTACT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID),
  FOREIGN KEY(CONTACT_POINT_PHONE_ID) REFERENCES CONTACT_POINT_ENTITY_GROUP.CONTACT_POINT_PHONE(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT_CONTACT_EMAIL_JOIN (
  ACCOUNT_CONTACT_ID  VARCHAR(36) NOT NULL,
  CONTACT_POINT_EMAIL_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_CONTACT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID),
  FOREIGN KEY(CONTACT_POINT_EMAIL_ID) REFERENCES CONTACT_POINT_ENTITY_GROUP.CONTACT_POINT_EMAIL(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT_MOBILE_PHONE_JOIN (
  ACCOUNT_CONTACT_ID  VARCHAR(36) NOT NULL,
  CONTACT_POINT_PHONE_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_CONTACT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID),
  FOREIGN KEY(CONTACT_POINT_PHONE_ID) REFERENCES CONTACT_POINT_ENTITY_GROUP.CONTACT_POINT_PHONE(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT_INDIRECT_RELATION_ACCOUNT_CONTACT_JOIN (
  ACCOUNT_CONTACT_ID_LEFT  VARCHAR(36) NOT NULL,
  ACCOUNT_CONTACT_ID_RIGHT VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_CONTACT_ID_LEFT) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID),
  FOREIGN KEY(ACCOUNT_CONTACT_ID_RIGHT) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT_INDIVIDUAL_JOIN (
  ACCOUNT_CONTACT_ID  VARCHAR(36) NOT NULL,
  INDIVIDUAL_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_CONTACT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID),
  FOREIGN KEY(INDIVIDUAL_ID) REFERENCES PARTY_ENTITY_GROUP.INDIVIDUAL(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT_OTHER_CONTACT_ADDRESS_JOIN (
  ACCOUNT_CONTACT_ID  VARCHAR(36) NOT NULL,
  CONTACT_POINT_ADDRESS_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_CONTACT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID),
  FOREIGN KEY(CONTACT_POINT_ADDRESS_ID) REFERENCES CONTACT_POINT_ENTITY_GROUP.CONTACT_POINT_ADDRESS(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT_HOME_PHONE_JOIN (
  ACCOUNT_CONTACT_ID  VARCHAR(36) NOT NULL,
  CONTACT_POINT_PHONE_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_CONTACT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID),
  FOREIGN KEY(CONTACT_POINT_PHONE_ID) REFERENCES CONTACT_POINT_ENTITY_GROUP.CONTACT_POINT_PHONE(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_PARTNER_ACCOUNT_JOIN (
  ACCOUNT_PARTNER_ID  VARCHAR(36) NOT NULL,
  ACCOUNT_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_PARTNER_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_PARTNER(ID),
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_PARTNER_PARTNER_ACCOUNT_JOIN (
  ACCOUNT_PARTNER_ID  VARCHAR(36) NOT NULL,
  ACCOUNT_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_PARTNER_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_PARTNER(ID),
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_BILL_CONTACT_ADDRESS_JOIN (
  ACCOUNT_ID  VARCHAR(36) NOT NULL,
  CONTACT_POINT_ADDRESS_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID),
  FOREIGN KEY(CONTACT_POINT_ADDRESS_ID) REFERENCES CONTACT_POINT_ENTITY_GROUP.CONTACT_POINT_ADDRESS(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_BILL_FREQUENCY_JOIN (
  ACCOUNT_ID  VARCHAR(36) NOT NULL,
  BILLING_FREQUENCY_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID),
  FOREIGN KEY(BILLING_FREQUENCY_ID) REFERENCES ACCOUNT_ENTITY_GROUP.BILLING_FREQUENCY(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_PARTY_ROLE_JOIN (
  ACCOUNT_ID  VARCHAR(36) NOT NULL,
  PARTY_ROLE_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID),
  FOREIGN KEY(PARTY_ROLE_ID) REFERENCES PARTY_ROLE_ENTITY_GROUP.PARTY_ROLE(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_FAX_PHONE_JOIN (
  ACCOUNT_ID  VARCHAR(36) NOT NULL,
  CONTACT_POINT_PHONE_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID),
  FOREIGN KEY(CONTACT_POINT_PHONE_ID) REFERENCES CONTACT_POINT_ENTITY_GROUP.CONTACT_POINT_PHONE(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_SALES_PHONE_JOIN (
  ACCOUNT_ID  VARCHAR(36) NOT NULL,
  CONTACT_POINT_PHONE_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID),
  FOREIGN KEY(CONTACT_POINT_PHONE_ID) REFERENCES CONTACT_POINT_ENTITY_GROUP.CONTACT_POINT_PHONE(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_AUTO_PAYMENT_METHOD_JOIN (
  ACCOUNT_ID  VARCHAR(36) NOT NULL,
  PAYMENT_METHOD_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID),
  FOREIGN KEY(PAYMENT_METHOD_ID) REFERENCES PAYMENT_METHOD_ENTITY_GROUP.PAYMENT_METHOD(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_SHIPPING_ADDRESS_JOIN (
  ACCOUNT_ID  VARCHAR(36) NOT NULL,
  CONTACT_POINT_ADDRESS_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID),
  FOREIGN KEY(CONTACT_POINT_ADDRESS_ID) REFERENCES CONTACT_POINT_ENTITY_GROUP.CONTACT_POINT_ADDRESS(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_PARTY_JOIN (
  ACCOUNT_ID  VARCHAR(36) NOT NULL,
  PARTY_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID),
  FOREIGN KEY(PARTY_ID) REFERENCES PARTY_ENTITY_GROUP.PARTY(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_PARENT_ACCOUNT_JOIN (
  ACCOUNT_ID_LEFT  VARCHAR(36) NOT NULL,
  ACCOUNT_ID_RIGHT VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_ID_LEFT) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID),
  FOREIGN KEY(ACCOUNT_ID_RIGHT) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_SHIPPING_CONTACT_JOIN (
  ACCOUNT_ID  VARCHAR(36) NOT NULL,
  ACCOUNT_CONTACT_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID),
  FOREIGN KEY(ACCOUNT_CONTACT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT_CONTACT(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_SHIPPING_PHONEID_JOIN (
  ACCOUNT_ID  VARCHAR(36) NOT NULL,
  CONTACT_POINT_PHONE_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID),
  FOREIGN KEY(CONTACT_POINT_PHONE_ID) REFERENCES CONTACT_POINT_ENTITY_GROUP.CONTACT_POINT_PHONE(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_SHIPPING_EMAIL_JOIN (
  ACCOUNT_ID  VARCHAR(36) NOT NULL,
  CONTACT_POINT_EMAIL_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID),
  FOREIGN KEY(CONTACT_POINT_EMAIL_ID) REFERENCES CONTACT_POINT_ENTITY_GROUP.CONTACT_POINT_EMAIL(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_ORDER_DELIVERY_METHOD_JOIN (
  ACCOUNT_ID  VARCHAR(36) NOT NULL,
  ORDER_DELIVERY_METHOD_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID),
  FOREIGN KEY(ORDER_DELIVERY_METHOD_ID) REFERENCES SALES_ORDER_ENTITY_GROUP.ORDER_DELIVERY_METHOD(ID)
);

CREATE TABLE ACCOUNT_ENTITY_GROUP.ACCOUNT_PRIMARY_SALES_CONTACT_POINT_JOIN (
  ACCOUNT_ID  VARCHAR(36) NOT NULL,
  CONTACT_POINT_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID),
  FOREIGN KEY(CONTACT_POINT_ID) REFERENCES CONTACT_POINT_ENTITY_GROUP.CONTACT_POINT(ID)
);