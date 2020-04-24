CREATE table "PATIENT" (
"PNO" VARCHAR2(5) NOT NULL,
"PNAME" VARCHAR2(15) NOT NULL,
"TITLE" VARCHAR2(4) NOT NULL,
"DOB" DATE NOT NULL, "CHILDREN"
NUMBER(2,0) NOT NULL, "GP"
VARCHAR2(15) NOT NULL
);
INSERT ALL
INTO "PATIENT" VALUES('p1','minogue','miss',(to_date('03-08-1976','dd/mm/yyyy')),0,'Dr.Williams')
INTO "PATIENT" VALUES('p7','dury','mrs',(to_date('25-06-1971','dd/mm/yyyy')),0,'Dr.Taylor')
INTO "PATIENT" VALUES('p2','currie','mrs',(to_date('13-01-1962','dd/mm/yyyy')),3,'Dr.Thatcher')
INTO "PATIENT" VALUES('p3','mansell','mr',(to_date('23-05-1968','dd/mm/yyyy')),2,'Dr.Williams')
INTO "PATIENT" VALUES('p8','gooch','mr',(to_date('12-04-1960','dd/mm/yyyy')),1,'Dr.Spock')
INTO "PATIENT" VALUES('p4','gooch','mrs',(to_date('13-06-1966','dd/mm/yyyy')),1,'Dr.Spock')
SELECT * FROM dual;
------ DRUG --------------
CREATE table "DRUG" (
"DNO" VARCHAR2(5) NOT NULL,
"DNAME" VARCHAR2(15) NOT NULL,
"UNIT" VARCHAR2(5) NOT NULL,
"DOI" DATE NOT NULL,
"COST" NUMBER(*,2) NOT NULL
);

INSERT ALL
INTO "DRUG" VALUES('d5','fly high','mg',(to_date('10-07-2005','dd/mm/yyyy')),1.89)
INTO "DRUG" VALUES('d1','sweet dreams','tab',(to_date('20-04-2004','dd/mm/yyyy')),0.15)
INTO "DRUG" VALUES('d2','bliss','mg',(to_date('12-03-2008','dd/mm/yyyy')),5.00)
INTO "DRUG" VALUES('d7','split','tab',(to_date('04-09-2007','dd/mm/yyyy')),0.90)
INTO "DRUG" VALUES('d6','slow down','gm',(to_date('05-08-2006','dd/mm/yyyy')),1.66)
SELECT * FROM dual;

------- DOSE -------------
CREATE table "DOSE" (
"PNO" VARCHAR2(5) NOT NULL,
"DNO" VARCHAR2(5) NOT NULL,
"DOSEDATE" DATE NOT NULL,
"QTY" NUMBER(2) NOT NULL
);
INSERT ALL
INTO "DOSE" VALUES('p2','d6',(to_date('2009-07-12','yyyy/mm/dd')),3)
INTO "DOSE" VALUES('p4','d5',(to_date('2009-09-10','yyyy/mm/dd')),5)
INTO "DOSE" VALUES('p8','d7',(to_date('2009-11-05','yyyy/mm/dd')),2)
INTO "DOSE" VALUES('p4','d6',(to_date('2009-11-30','yyyy/mm/dd')),2)
INTO "DOSE" VALUES('p4','d7',(to_date('2010-01-02','yyyy/mm/dd')),8)
INTO "DOSE" VALUES('p4','d2',(to_date('2010-04-01','yyyy/mm/dd')),3)
INTO "DOSE" VALUES('p1','d6',(to_date('2010-05-05','yyyy/mm/dd')),2)
INTO "DOSE" VALUES('p8','d2',(to_date('2010-05-31','yyyy/mm/dd')),1)
INTO "DOSE" VALUES('p4','d5',(to_date('2009-02-01','yyyy/mm/dd')),5)
INTO "DOSE" VALUES('p1','d1',(to_date('2009-10-02','yyyy/mm/dd')),3)
INTO "DOSE" VALUES('p7','d1',(to_date('2009-10-20','yyyy/mm/dd')),6)
INTO "DOSE" VALUES('p1','d7',(to_date('2010-03-03','yyyy/mm/dd')),6)
INTO "DOSE" VALUES('p4','d1',(to_date('2010-06-05','yyyy/mm/dd')),6)
SELECT * from dual;



ALTER TABLE "PATIENT" add CONSTRAINT "PATIENT_PK" PRIMARY KEY ("PNO");

ALTER TABLE "DRUG" add CONSTRAINT "DRUG_PK" PRIMARY KEY ("DNO");

ALTER TABLE "DOSE" add CONSTRAINT "DOSE_PK" PRIMARY KEY ("DNO", "PNO", "DOSEDATE");

ALTER TABLE "DOSE"
Add CONSTRAINT "DOSE_FK1"
Foreign Key ("PNO")
References Patient ("PNO");

ALTER TABLE "DOSE"
Add CONSTRAINT "DOSE_FK2"
Foreign Key ("DNO")
REFERENCES Drug ("DNO");





