-- create the table for list of frequent cash buyers
CREATE TABLE IF NOT EXISTS freq_flyers (
          buyer VARCHAR(255) 
);

-- import 
COPY freq_flyers 
FROM '/Users/gordo/multco_prop_sales/input/freq_flyers.csv'
WITH CSV HEADER DELIMITER ',' QUOTE '"';