-- DDL for PM1

-- Note: In Databricks, primary key and foreign key constraints are declarative and not enforced


-- Important information about Databricks constraints:
-- 1. Primary and foreign key constraints in Databricks are informational only and not enforced
-- 2. They serve as documentation for relationships between tables
-- 3. Databricks does not automatically validate that these constraints are satisfied
-- 4. You must implement data validation in your ETL processes to maintain data integrity
-- For more information, see: https://docs.databricks.com/en/tables/constraints.html
        

CREATE DATABASE IF NOT EXISTS pm1;

USE pm1;

CREATE TABLE IF NOT EXISTS PE1 (
  OderID               INT             NOT NULL,
  Description          STRING          NOT NULL,
  Name                 STRING          NOT NULL,
  CONSTRAINT pk_pe1 PRIMARY KEY (OderID, Description, Name)
)
COMMENT 'Test Description'
USING DELTA;

CREATE TABLE IF NOT EXISTS PE2 (
  Id                   INT             NOT NULL,
  CONSTRAINT pk_pe2 PRIMARY KEY (Id)
)
USING DELTA;


-- Adding Foreign Key Constraints (Informational, not enforced)

-- Note: Foreign key columns must match primary key columns exactly

ALTER TABLE PE2 ADD CONSTRAINT fk_pe2_id_pe1 FOREIGN KEY (Id) REFERENCES PE1(OderID);