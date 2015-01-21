
-- create the table for the original cash transaction records
CREATE TABLE cash_sales_orig (
          ZIP INT
        , date_coe DATE
        , STREET_NO INT
        , STREET_DIR VARCHAR(2)
        , STREET VARCHAR(50)
        , STREET_TYP VARCHAR(5)
        , unit_no VARCHAR(10)
        , Prop_type VARCHAR(7)
);

-- import the original cash transactions
-- before importing this table, i converted date_coe to date field with 4-digit years
COPY cash_sales_orig 
FROM '/Users/gordo/multco_prop_taxes/input/2014-12-12_Lee_van_der_Voo-Cash_Sales_Multnomah.csv' 
WITH CSV HEADER NULL 'NULL';

-- enforce uppercase for all text fields (since postgres treats lower- and upper- as distinct values)
UPDATE cash_sales_orig
SET STREET_DIR = UPPER(STREET_DIR)
, STREET = UPPER(STREET)
, STREET_TYP = UPPER(STREET_TYP)
, unit_no = UPPER(unit_no)
, Prop_type = UPPER(Prop_type);

-- add a distinct key to the table
ALTER TABLE cash_sales_orig ADD COLUMN id SERIAL PRIMARY KEY;

-- create a table for the appended cash transactions
CREATE TABLE IF NOT EXISTS cash_sales_appd (
	  ZIP INT
	, STREET_NO INT
	, STREET_DIR VARCHAR(2)
	, STREET VARCHAR(50)
	, STREET_TYP VARCHAR(5)
	, unit_no VARCHAR(10)
	, ADDRESS_FU VARCHAR(255)
	, STATE_ID VARCHAR(255)
	, RNO VARCHAR(255)
	, OWNER1 VARCHAR(255)
	, OWNER2 VARCHAR(255)
	, OWNER3 VARCHAR(255)
	, OWNERADDR VARCHAR(255)
	, OWNERCITY VARCHAR(255)
	, OWNERSTATE VARCHAR(255)
	, OWNERZIP VARCHAR(255)
	, SITEADDR VARCHAR(255)
	, SITECITY VARCHAR(255)
	, SITE_STATE VARCHAR(255)
	, SITEZIP VARCHAR(255)
	, LEGAL_DESC VARCHAR(255)
	, TAXCODE VARCHAR(255)
	, PROP_CODE VARCHAR(255)
	, PRPCD_DESC VARCHAR(255)
	, LANDUSE VARCHAR(255)
	, YEARBUILT VARCHAR(255)
	, BLDGSQFT VARCHAR(255)
	, BEDROOMS VARCHAR(255)
	, FLOORS VARCHAR(255)
	, UNITS VARCHAR(255)
	, MKTVALYR1 VARCHAR(255)
	, LANDVAL1 VARCHAR(255)
	, BLDGVAL1 VARCHAR(255)
	, TOTALVAL1 VARCHAR(255)
	, MKTVALYR2 VARCHAR(255)
	, LANDVAL2 VARCHAR(255)
	, BLDGVAL2 VARCHAR(255)
	, TOTALVAL2 VARCHAR(255)
	, MKTVALYR3 VARCHAR(255)
	, LANDVAL3 VARCHAR(255)
	, BLDGVAL3 VARCHAR(255)
	, TOTALVAL3 VARCHAR(255)
	, SALEDATE DATE
	, SALEPRICE BIGINT
	, ACC_STATUS VARCHAR(255)
	, A_T_SQFT VARCHAR(255)
	, A_T_ACRES VARCHAR(255)
	, FRONTAGE VARCHAR(255)
	, COUNTY VARCHAR(255)
	, SOURCE VARCHAR(255)
	, PROPERTYID VARCHAR(255)
	, TLID VARCHAR(255)
);

-- import the appended cash transactions
-- had to replace the string 'NULL' with '' for some fields
COPY cash_sales_appd
FROM '/Users/gordo/multco_prop_taxes/input/MultcoCashRealEstateTransactions.csv' 
WITH CSV HEADER NULL '';

-- enforce uppercase for all text fields (since postgres treats lower- and upper- as distinct values)
UPDATE cash_sales_appd
SET STREET_DIR = UPPER(STREET_DIR)
, STREET = UPPER(STREET)
, STREET_TYP = UPPER(STREET_TYP)
, unit_no = UPPER(unit_no)
, ADDRESS_FU = UPPER(ADDRESS_FU)
, STATE_ID = UPPER(STATE_ID)
, RNO = UPPER(RNO)
, OWNER1 = UPPER(OWNER1)
, OWNER2 = UPPER(OWNER2)
, OWNER3 = UPPER(OWNER3)
, OWNERADDR = UPPER(OWNERADDR)
, OWNERCITY = UPPER(OWNERCITY)
, OWNERSTATE = UPPER(OWNERSTATE)
, OWNERZIP = UPPER(OWNERZIP)
, SITEADDR = UPPER(SITEADDR)
, SITECITY = UPPER(SITECITY)
, SITE_STATE = UPPER(SITE_STATE)
, SITEZIP = UPPER(SITEZIP)
, LEGAL_DESC = UPPER(LEGAL_DESC)
, TAXCODE = UPPER(TAXCODE)
, PROP_CODE = UPPER(PROP_CODE)
, PRPCD_DESC = UPPER(PRPCD_DESC)
, LANDUSE = UPPER(LANDUSE)
, YEARBUILT = UPPER(YEARBUILT)
, BLDGSQFT = UPPER(BLDGSQFT)
, BEDROOMS = UPPER(BEDROOMS)
, FLOORS = UPPER(FLOORS)
, UNITS = UPPER(UNITS)
, MKTVALYR1 = UPPER(MKTVALYR1)
, LANDVAL1 = UPPER(LANDVAL1)
, BLDGVAL1 = UPPER(BLDGVAL1)
, TOTALVAL1 = UPPER(TOTALVAL1)
, MKTVALYR2 = UPPER(MKTVALYR2)
, LANDVAL2 = UPPER(LANDVAL2)
, BLDGVAL2 = UPPER(BLDGVAL2)
, TOTALVAL2 = UPPER(TOTALVAL2)
, MKTVALYR3 = UPPER(MKTVALYR3)
, LANDVAL3 = UPPER(LANDVAL3)
, BLDGVAL3 = UPPER(BLDGVAL3)
, TOTALVAL3 = UPPER(TOTALVAL3)
, ACC_STATUS = UPPER(ACC_STATUS)
, A_T_SQFT = UPPER(A_T_SQFT)
, A_T_ACRES = UPPER(A_T_ACRES)
, FRONTAGE = UPPER(FRONTAGE)
, COUNTY = UPPER(COUNTY)
, SOURCE = UPPER(SOURCE)
, PROPERTYID = UPPER(PROPERTYID)
, TLID = UPPER(TLID);

-- add a distinct key to the table
ALTER TABLE cash_sales_appd ADD COLUMN id SERIAL PRIMARY KEY;