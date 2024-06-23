/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     1/25/2024 12:36:39 AM                        */
/*==============================================================*/


drop index if exists CABIN_PK;

drop table if exists Cabin cascade;

drop index if exists FAMILY_PK;

drop table if exists Family cascade;

drop index if exists JOB_PK;

drop table if exists Job cascade;

drop index if exists JOIN_LOCATION_PK;

drop table if exists Join_Location cascade;

drop index if exists ASSOCIATION_9_FK;

drop index if exists ASSOCIATION_8_FK;

drop index if exists ASSOCIATION_5_FK;

drop index if exists ASSOCIATION_4_FK;

drop index if exists ASSOCIATION_3_FK;

drop index if exists ASSOCIATION_2_FK;

drop index if exists PASSENGER_TITLE_FK;

drop index if exists PASSENGER_PK;

drop table if exists Passenger cascade;

drop index if exists TICKET_PK;

drop table if exists Ticket cascade;

drop index if exists TITLE_PK;

drop table if exists Title cascade;

drop index if exists CLASS_DEP_PK;

drop table if exists class_dep cascade;

/*==============================================================*/
/* Table: Cabin                                                 */
/*==============================================================*/
create table Cabin (
   cabinCode            VARCHAR(254)         not null,
   deck                 VARCHAR(254)         null,
   constraint PK_CABIN primary key (cabinCode)
);

/*==============================================================*/
/* Index: CABIN_PK                                              */
/*==============================================================*/
create unique index CABIN_PK on Cabin (
cabinCode
);

/*==============================================================*/
/* Table: Family                                                */
/*==============================================================*/
create table Family (
   familyName           VARCHAR(254)         not null,
   constraint PK_FAMILY primary key (familyName)
);

/*==============================================================*/
/* Index: FAMILY_PK                                             */
/*==============================================================*/
create unique index FAMILY_PK on Family (
familyName
);

/*==============================================================*/
/* Table: Job                                                   */
/*==============================================================*/
create table Job (
   jobName              VARCHAR(254)         not null,
   constraint PK_JOB primary key (jobName)
);

/*==============================================================*/
/* Index: JOB_PK                                                */
/*==============================================================*/
create unique index JOB_PK on Job (
jobName
);

/*==============================================================*/
/* Table: Join_Location                                         */
/*==============================================================*/
create table Join_Location (
   locationName         VARCHAR(254)         not null,
   constraint PK_JOIN_LOCATION primary key (locationName)
);

/*==============================================================*/
/* Index: JOIN_LOCATION_PK                                      */
/*==============================================================*/
create unique index JOIN_LOCATION_PK on Join_Location (
locationName
);

/*==============================================================*/
/* Table: Passenger                                             */
/*==============================================================*/
create table Passenger (
   passengerId          INT4                 not null,
   ticketId             VARCHAR(254)         null,
   cabinCode            VARCHAR(254)         null,
   jobName              VARCHAR(254)         null,
   locationName         VARCHAR(254)         null,
   titleName            VARCHAR(254)         not null,
   depName              VARCHAR(254)         null,
   familyName           VARCHAR(254)         not null,
   sex                  VARCHAR(254)         null,
   name                 VARCHAR(254)         null,
   age                  INT4                 null,
   bodyFound            INT4                 null,
   rescuedBoat          VARCHAR(254)         null,
   constraint PK_PASSENGER primary key (passengerId)
);

/*==============================================================*/
/* Index: PASSENGER_PK                                          */
/*==============================================================*/
create unique index PASSENGER_PK on Passenger (
passengerId
);

/*==============================================================*/
/* Index: PASSENGER_TITLE_FK                                    */
/*==============================================================*/
create  index PASSENGER_TITLE_FK on Passenger (
titleName
);

/*==============================================================*/
/* Index: ASSOCIATION_2_FK                                      */
/*==============================================================*/
create  index ASSOCIATION_2_FK on Passenger (
familyName
);

/*==============================================================*/
/* Index: ASSOCIATION_3_FK                                      */
/*==============================================================*/
create  index ASSOCIATION_3_FK on Passenger (
cabinCode
);

/*==============================================================*/
/* Index: ASSOCIATION_4_FK                                      */
/*==============================================================*/
create  index ASSOCIATION_4_FK on Passenger (
ticketId
);

/*==============================================================*/
/* Index: ASSOCIATION_5_FK                                      */
/*==============================================================*/
create  index ASSOCIATION_5_FK on Passenger (
jobName
);

/*==============================================================*/
/* Index: ASSOCIATION_8_FK                                      */
/*==============================================================*/
create  index ASSOCIATION_8_FK on Passenger (
depName
);

/*==============================================================*/
/* Index: ASSOCIATION_9_FK                                      */
/*==============================================================*/
create  index ASSOCIATION_9_FK on Passenger (
locationName
);

/*==============================================================*/
/* Table: Ticket                                                */
/*==============================================================*/
create table Ticket (
   ticketId             VARCHAR(254)         not null,
   ticketFare           VARCHAR(254)         null,
   class                VARCHAR(254)         null,
   constraint PK_TICKET primary key (ticketId)
);

/*==============================================================*/
/* Index: TICKET_PK                                             */
/*==============================================================*/
create unique index TICKET_PK on Ticket (
ticketId
);

/*==============================================================*/
/* Table: Title                                                 */
/*==============================================================*/
create table Title (
   titleName            VARCHAR(254)         not null,
   constraint PK_TITLE primary key (titleName)
);

/*==============================================================*/
/* Index: TITLE_PK                                              */
/*==============================================================*/
create unique index TITLE_PK on Title (
titleName
);

/*==============================================================*/
/* Table: class_dep                                             */
/*==============================================================*/
create table class_dep (
   depName              VARCHAR(254)         not null,
   constraint PK_CLASS_DEP primary key (depName)
);

/*==============================================================*/
/* Index: CLASS_DEP_PK                                          */
/*==============================================================*/
create unique index CLASS_DEP_PK on class_dep (
depName
);

alter table Passenger
   add constraint FK_PASSENGE_PASSENGER_FAMILY foreign key (familyName)
      references Family (familyName)
      on delete cascade on update cascade;

alter table Passenger
   add constraint FK_PASSENGE_PASSENGER_CABIN foreign key (cabinCode)
      references Cabin (cabinCode)
      on delete cascade on update cascade;

alter table Passenger
   add constraint FK_PASSENGE_PASSENGER_CLASS_DE foreign key (depName)
      references class_dep (depName)
      on delete cascade on update cascade;

alter table Passenger
   add constraint FK_PASSENGE_PASSENGER_JOB foreign key (jobName)
      references Job (jobName)
      on delete cascade on update cascade;

alter table Passenger
   add constraint FK_PASSENGE_PASSENGER_JOIN_LOC foreign key (locationName)
      references Join_Location (locationName)
      on delete cascade on update cascade;

alter table Passenger
   add constraint FK_PASSENGE_PASSENGER_TICKET foreign key (ticketId)
      references Ticket (ticketId)
      on delete cascade on update cascade;

alter table Passenger
   add constraint FK_PASSENGE_PASSENGER_TITLE foreign key (titleName)
      references Title (titleName)
      on delete cascade on update cascade;

