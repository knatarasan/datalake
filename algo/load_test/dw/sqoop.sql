sqoop import --connect jdbc:mysql://wn1.kara/dw_sourcing --username dw_sourcing --password dw_sourcing --table d_Item --split-by item_id --target-dir /datalake/algo/load_test/dw/d_Item

sqoop import --connect jdbc:mysql://wn1.kara/dw_sourcing --username dw_sourcing --password dw_sourcing --table f_Invoice --split-by item_id --target-dir /datalake/algo/load_test/dw/f_Invoice


CREATE TABLE dw_sourcing.d_Item (
  `item_id` int,
  `material_number` varchar(20),
  `material_type` varchar(50),
  `industry_sector` varchar(50),
  `material_group` varchar(20),
  `base_unit_of_measure` varchar(3),
  `order_unit` varchar(3),
  `material_xx1` varchar(50),
  `material_xx2` varchar(50),
  `material_xx3` varchar(50),
  `material_xx4` varchar(50),
  `material_xx5` varchar(50),
  `material_xx6` varchar(50),
  `material_xx7` varchar(50),
  `material_xx8` varchar(50),
  `material_xx9` varchar(50),
  `material_xx10` varchar(50),
  `material_xx11` varchar(50),
  `material_xx12` varchar(50),
  `material_xx13` varchar(50),
  `material_xx14` varchar(50),
  `material_xx15` varchar(50),
  `material_xx16` varchar(50),
  `material_xx17` varchar(50),
  `material_xx18` varchar(50),
  `material_xx19` varchar(50),
  `material_xx20` varchar(50),
  `material_xx21` varchar(50),
  `eff_from_date` date,
  `eff_to_date` date
 )ROW FORMAT DELIMITED
	FIELDS TERMINATED by ','
	LINES TERMINATED by '\n'
	STORED AS TEXTFILE
	LOCATION '/datalake/algo/load_test/dw/d_Item/';



create table dw_sourcing.f_Invoice(
Item_id int,
Vendor_id int,
Date_id int,
inv_fact1 Double,
inv_fact2 Double,
inv_fact3 Double,
inv_fact4 Double,
BSE_XX5 Varchar(50),
BSE_XX6 Varchar(50),
BSE_XX7 Varchar(50),
BSE_XX8 Varchar(50),
BSE_XX9 Varchar(50),
BSE_XX10 Varchar(50),
BSE_XX11 Varchar(50),
BSE_XX12 Varchar(50),
BSE_XX13 Varchar(50),
BSE_XX14 Varchar(50),
BSE_XX15 Varchar(50),
BSE_XX16 Varchar(50),
BSE_XX17 Varchar(50),
BSE_XX18 Varchar(50),
BSE_XX19 Varchar(50),
BSE_XX20 Varchar(50),
BSE_XX21 Varchar(50),
BSE_XX22 Varchar(50),
BSE_XX23 Varchar(50),
BSE_XX24 Varchar(50),
BSE_XX25 Varchar(50)
)ROW FORMAT DELIMITED
FIELDS TERMINATED by ','
LINES TERMINATED by '\n'
STORED AS TEXTFILE
LOCATION '/datalake/algo/load_test/dw/f_Invoice/';




----Load data into bucketed table -------

create table dw_sourcing.f_Invoice_bucket(
Item_id int,
Vendor_id int,
Date_id int,
inv_fact1 Double,
inv_fact2 Double,
inv_fact3 Double,
inv_fact4 Double,
BSE_XX5 Varchar(50),
BSE_XX6 Varchar(50),
BSE_XX7 Varchar(50),
BSE_XX8 Varchar(50),
BSE_XX9 Varchar(50),
BSE_XX10 Varchar(50),
BSE_XX11 Varchar(50),
BSE_XX12 Varchar(50),
BSE_XX13 Varchar(50),
BSE_XX14 Varchar(50),
BSE_XX15 Varchar(50),
BSE_XX16 Varchar(50),
BSE_XX17 Varchar(50),
BSE_XX18 Varchar(50),
BSE_XX19 Varchar(50),
BSE_XX20 Varchar(50),
BSE_XX21 Varchar(50),
BSE_XX22 Varchar(50),
BSE_XX23 Varchar(50),
BSE_XX24 Varchar(50),
BSE_XX25 Varchar(50)
)
CLUSTERED BY (ITEM_ID) INTO 8 buckets
ROW FORMAT DELIMITED
FIELDS TERMINATED by ','
LINES TERMINATED by '\n'
STORED AS TEXTFILE
;
