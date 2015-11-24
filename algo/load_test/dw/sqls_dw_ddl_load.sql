

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



insert into dw_sourcing.d_Item values (,'MT_NUM','MT_Type','MT_sec','MAT_GR','MEI','BST',
'MAX01','MAX02','MAX03','MAX04','MAX05','MAX06','MAX07','MAX08','MAX09','MAX10',
'MAX11','MAX12','MAX13','MAX14','MAX15','MAX16','MAX17','MAX18','MAX19','MAX20','MAX21','2015-10-10','2999-12-31');

insert into dw_sourcing.d_Item  
SELECT  NULL,
	 concat('mat_num',rand()*100000000000)
    ,concat('mat_typ',rand()*100000000000),   `d_Item`.`industry_sector`,    `d_Item`.`material_group`,
    `d_Item`.`base_unit_of_measure`,    `d_Item`.`order_unit`,    `d_Item`.`material_xx1`,    `d_Item`.`material_xx2`,    `d_Item`.`material_xx3`,
    `d_Item`.`material_xx4`,    `d_Item`.`material_xx5`,    `d_Item`.`material_xx6`,    `d_Item`.`material_xx7`,    `d_Item`.`material_xx8`,
    `d_Item`.`material_xx9`,    `d_Item`.`material_xx10`,    `d_Item`.`material_xx11`,    `d_Item`.`material_xx12`,    `d_Item`.`material_xx13`,
    `d_Item`.`material_xx14`,    `d_Item`.`material_xx15`,    `d_Item`.`material_xx16`,    `d_Item`.`material_xx17`,    `d_Item`.`material_xx18`,
    `d_Item`.`material_xx19`,    `d_Item`.`material_xx20`,    `d_Item`.`material_xx21`,    `d_Item`.`eff_from_date`,    `d_Item`.`eff_to_date`
FROM `dw_sourcing`.`d_Item`;



create table dw_sourcing.f_Invoice(
Item_id integer,
Vendor_id integer,
Date_id integer,
inv_fact1 Double,
inv_fact2 Double,
inv_fact3 Double,
inv_fact4 Double,
BSE_XX5	Varchar(50)	,
BSE_XX6	Varchar(50)	,
BSE_XX7	Varchar(50)	,
BSE_XX8	Varchar(50)	,
BSE_XX9	Varchar(50)	,
BSE_XX10 Varchar(50)	,
BSE_XX11 Varchar(50)	,
BSE_XX12 Varchar(50)	,
BSE_XX13 Varchar(50)	,
BSE_XX14 Varchar(50)	,
BSE_XX15 Varchar(50)	,
BSE_XX16 Varchar(50)	,
BSE_XX17 Varchar(50)	,
BSE_XX18 Varchar(50)	,
BSE_XX19 Varchar(50)	,
BSE_XX20 Varchar(50)	,
BSE_XX21 Varchar(50)	,
BSE_XX22 Varchar(50)	,
BSE_XX23 Varchar(50)	,
BSE_XX24 Varchar(50)	,
BSE_XX25 Varchar(50)	
    );


#Load fact table f_Invoice 
--------------------------

insert into dw_sourcing.f_Invoice 
select d_Item.item_id,1,20151124 , 
rand()*100000000000 as inv_fact1,
rand()*100000000000 as inv_fact2,
rand()*100000000000 as inv_fact3,
rand()*100000000000 as inv_fact4,
'BSE_XX5' as BSE_XX5,
'BSE_XX6' as BSE_XX6,
'BSE_XX7' as BSE_XX7,
'BSE_XX8' as BSE_XX8,
'BSE_XX9' as BSE_XX9,
'BSE_XX10' as BSE_XX10,
'BSE_XX11' as BSE_XX11,
'BSE_XX12' as BSE_XX12,
'BSE_XX13' as BSE_XX13,
'BSE_XX14' as BSE_XX14,
'BSE_XX15' as BSE_XX15,
'BSE_XX16' as BSE_XX16,
'BSE_XX17' as BSE_XX17,
'BSE_XX18' as BSE_XX18,
'BSE_XX19' as BSE_XX19,
'BSE_XX20' as BSE_XX20,
'BSE_XX21' as BSE_XX21,
'BSE_XX22' as BSE_XX22,
'BSE_XX23' as BSE_XX23,
'BSE_XX24' as BSE_XX24,
'BSE_XX25' as BSE_XX25,
rom  dw_sourcing.d_Item;

