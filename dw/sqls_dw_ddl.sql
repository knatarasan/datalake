


CREATE TABLE dw_sourcing.d_Item (
  `item_id` int(11) NOT NULL auto_increment,
  `material_number` varchar(20) DEFAULT NULL,
  `material_type` varchar(50) DEFAULT NULL,
  `industry_sector` varchar(50) DEFAULT NULL,
  `material_group` varchar(20) DEFAULT NULL,
  `base_unit_of_measure` varchar(3) DEFAULT NULL,
  `order_unit` varchar(3) DEFAULT NULL,
  `material_xx1` varchar(50) DEFAULT NULL,
  `material_xx2` varchar(50) DEFAULT NULL,
  `material_xx3` varchar(50) DEFAULT NULL,
  `material_xx4` varchar(50) DEFAULT NULL,
  `material_xx5` varchar(50) DEFAULT NULL,
  `material_xx6` varchar(50) DEFAULT NULL,
  `material_xx7` varchar(50) DEFAULT NULL,
  `material_xx8` varchar(50) DEFAULT NULL,
  `material_xx9` varchar(50) DEFAULT NULL,
  `material_xx10` varchar(50) DEFAULT NULL,
  `material_xx11` varchar(50) DEFAULT NULL,
  `material_xx12` varchar(50) DEFAULT NULL,
  `material_xx13` varchar(50) DEFAULT NULL,
  `material_xx14` varchar(50) DEFAULT NULL,
  `material_xx15` varchar(50) DEFAULT NULL,
  `material_xx16` varchar(50) DEFAULT NULL,
  `material_xx17` varchar(50) DEFAULT NULL,
  `material_xx18` varchar(50) DEFAULT NULL,
  `material_xx19` varchar(50) DEFAULT NULL,
  `material_xx20` varchar(50) DEFAULT NULL,
  `material_xx21` varchar(50) DEFAULT NULL,
  `eff_from_date` date DEFAULT NULL,
  `eff_to_date` date DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




create table dw_sourcing.d_Vendor(
vendor_id	integer,
vendor_number	Varchar(20),
vendor_name	Varchar(50),
vendor_address	Varchar(50),
vendor_city	Varchar(50),
vendor_country	Varchar(50),
vendor_currency	CHAR(3),
vendor_xx2	Varchar(50),
vendor_xx3	Varchar(50),
vendor_xx4	Varchar(50),
vendor_xx5	Varchar(50),
vendor_xx6	Varchar(50),
vendor_xx7	Varchar(50),
vendor_xx8	Varchar(50),
vendor_xx9	Varchar(50),
vendor_xx10	Varchar(50),
vendor_xx11	Varchar(50),
vendor_xx12	Varchar(50),
vendor_xx13	Varchar(50),
vendor_xx14	Varchar(50),
vendor_xx15	Varchar(50),
vendor_xx16	Varchar(50),
vendor_xx17	Varchar(50),
vendor_xx18	Varchar(50),
vendor_xx19	Varchar(50),
vendor_xx20	Varchar(50),
vendor_xx21	Varchar(50),
vendor_xx22	Varchar(50),
vendor_xx23	Varchar(50),
vendor_xx24	Varchar(50),
vendor_xx25	Varchar(50),
eff_from_date	date,
eff_till_date	date,
PRIMARY KEY (vendor_id)
);


create table dw_sourcing.f_Invoice(
Item_id integer,
Vendor_id integer,
Date_id integer,
BSE_XX2	Varchar(50)	,
BSE_XX3	Varchar(50)	,
BSE_XX4	Varchar(50)	,
BSE_XX5	Varchar(50)	,
BSE_XX6	Varchar(50)	,
BSE_XX7	Varchar(50)	,
BSE_XX8	Varchar(50)	,
BSE_XX9	Varchar(50)	,
BSE_XX10		Varchar(50)	,
BSE_XX11		Varchar(50)	,
BSE_XX12		Varchar(50)	,
BSE_XX13		Varchar(50)	,
BSE_XX14		Varchar(50)	,
BSE_XX15		Varchar(50)	,
BSE_XX16		Varchar(50)	,
BSE_XX17		Varchar(50)	,
BSE_XX18		Varchar(50)	,
BSE_XX19		Varchar(50)	,
BSE_XX20		Varchar(50)	,
BSE_XX21		Varchar(50)	,
BSE_XX22		Varchar(50)	,
BSE_XX23		Varchar(50)	,
BSE_XX24		Varchar(50)	,
BSE_XX25		Varchar(50)	
    );


#Load into dimension table
--------------------------

insert into dw_sourcing.d_Item
SELECT NULL,`em_mara`.`MATNR`,    `em_mara`.`MTART`,    `em_mara`.`MBRSH`,    `em_mara`.`MATKL`,    `em_mara`.`MEINS`,
    `em_mara`.`BSTME`,    `em_mara`.`MAX01`,    `em_mara`.`MAX02`,    `em_mara`.`MAX03`,    `em_mara`.`MAX04`,
    `em_mara`.`MAX05`,    `em_mara`.`MAX06`,    `em_mara`.`MAX07`,    `em_mara`.`MAX08`,    `em_mara`.`MAX09`,
    `em_mara`.`MAX10`,    `em_mara`.`MAX11`,    `em_mara`.`MAX12`,    `em_mara`.`MAX13`,    `em_mara`.`MAX14`,
    `em_mara`.`MAX15`,    `em_mara`.`MAX16`,    `em_mara`.`MAX17`,    `em_mara`.`MAX18`,
    `em_mara`.`MAX19`,    `em_mara`.`MAX20`,    `em_mara`.`MAX21`,    '2015-10-19',
    '2999-12-31'
FROM `em_erp`.`em_mara`;



#Load fact table f_Invoice 
--------------------------

insert into dw_sourcing.f_Invoice 
select d_Item.item_id,0, `em_bseg`.`DATER`,    `em_bseg`.`BSE_XX2`,    `em_bseg`.`BSE_XX3`,
    `em_bseg`.`BSE_XX4`,    `em_bseg`.`BSE_XX5`,    `em_bseg`.`BSE_XX6`,
    `em_bseg`.`BSE_XX7`,    `em_bseg`.`BSE_XX8`,    `em_bseg`.`BSE_XX9`,
    `em_bseg`.`BSE_XX10`,    `em_bseg`.`BSE_XX11`,    `em_bseg`.`BSE_XX12`,
    `em_bseg`.`BSE_XX13`,    `em_bseg`.`BSE_XX14`,    `em_bseg`.`BSE_XX15`,
    `em_bseg`.`BSE_XX16`,    `em_bseg`.`BSE_XX17`,    `em_bseg`.`BSE_XX18`,
    `em_bseg`.`BSE_XX19`,    `em_bseg`.`BSE_XX20`,    `em_bseg`.`BSE_XX21`,
    `em_bseg`.`BSE_XX22`,    `em_bseg`.`BSE_XX23`,    `em_bseg`.`BSE_XX24`,
    `em_bseg`.`BSE_XX25`
from em_erp.em_bseg  inner join dw_sourcing.d_Item
on
em_bseg.MATNR = d_Item.material_number
and eff_to_date='2999-12-31'

