#em_mara_snap  is going to contain snapshot of Item table received today
/*
em_erp.em_mara_snap	:	will contain today's snapshot of Item data
em_erp.em_mara_new 	:	will contain Items which are not present in d_Item
em_erp.em_mara_changed 	:	will contain Items which have been in d_Item  , but attributes have changes
*/

/* set sql_safe_updates=0;  */

#--0    Update mara_snap from Item file which arrived today

/* clean up stg tables */
truncate table em_erp.em_mara_snap;
truncate table em_erp.em_mara_new ;
truncate table em_erp.em_mara_changed ;


insert into em_erp.em_mara_snap
SELECT MATNR,
    MTART,    MBRSH,    MATKL,
    MEINS,    BSTME,    
    MAX01,    MAX02,
    MAX03,    MAX04,    MAX05,    MAX06,
    MAX07,    MAX08,    MAX09,    MAX10,
    MAX11,    MAX12,    MAX13,    MAX14,
    MAX15,    MAX16,    MAX17,    MAX18,
    MAX19,    MAX20,    MAX21
FROM `em_erp`.`em_mara3` ;


#--1    Prepare dataset of for _new, (i.e, non of source_keys which are present in new available in dimension table 



insert into em_erp.em_mara_new 
SELECT em_mara_snap.matnr,
    `em_mara_snap`.`MTART`,    `em_mara_snap`.`MBRSH`,    `em_mara_snap`.`MATKL`,
    `em_mara_snap`.`MEINS`,    `em_mara_snap`.`BSTME`,    `em_mara_snap`.`MAX01`,    `em_mara_snap`.`MAX02`,
    `em_mara_snap`.`MAX03`,    `em_mara_snap`.`MAX04`,    `em_mara_snap`.`MAX05`,    `em_mara_snap`.`MAX06`,
    `em_mara_snap`.`MAX07`,    `em_mara_snap`.`MAX08`,    `em_mara_snap`.`MAX09`,    `em_mara_snap`.`MAX10`,
    `em_mara_snap`.`MAX11`,    `em_mara_snap`.`MAX12`,    `em_mara_snap`.`MAX13`,    `em_mara_snap`.`MAX14`,
    `em_mara_snap`.`MAX15`,    `em_mara_snap`.`MAX16`,    `em_mara_snap`.`MAX17`,    `em_mara_snap`.`MAX18`,
    `em_mara_snap`.`MAX19`,    `em_mara_snap`.`MAX20`,    `em_mara_snap`.`MAX21`
FROM `em_erp`.`em_mara_snap` em_mara_snap  LEFT join dw_sourcing.d_Item item
on
em_mara_snap.MATNR=item.material_number 
where item.material_number is null;


#--2   Load brand new source keys into dimension table 

insert into dw_sourcing.d_Item
SELECT NULL, MATNR,
    MTART,    MBRSH,    MATKL,
    MEINS,    BSTME,    
    MAX01,    MAX02,
    MAX03,    MAX04,    MAX05,    MAX06,
    MAX07,    MAX08,    MAX09,    MAX10,
    MAX11,    MAX12,    MAX13,    MAX14,
    MAX15,    MAX16,    MAX17,    MAX18,
    MAX19,    MAX20,    MAX21,'2015-10-10','2999-12-31'
FROM `em_erp`.`em_mara_new`;


#-- changes in source
#--update em_erp.em_mara_snap set mtart='mtart_change1' where matnr='matnum20000005';


#--3 	Get dimension Item rows which are existing in d_Item but there is change in columns
--  for which history to be maintained (put them into _changed table)

/* Test run stuck at the following step for longer time  
during stuk the record count is around a million rows
####
select count(*) from em_erp.em_mara_snap;
1048576

select count(*) from dw_sourcing.d_Item item;
1048577

*/

insert into em_erp.em_mara_changed 
SELECT em_mara_snap.MATNR,
    `em_mara_snap`.`MTART`,    `em_mara_snap`.`MBRSH`,    `em_mara_snap`.`MATKL`,
    `em_mara_snap`.`MEINS`,    `em_mara_snap`.`BSTME`,    `em_mara_snap`.`MAX01`,    `em_mara_snap`.`MAX02`,
    `em_mara_snap`.`MAX03`,    `em_mara_snap`.`MAX04`,    `em_mara_snap`.`MAX05`,    `em_mara_snap`.`MAX06`,
    `em_mara_snap`.`MAX07`,    `em_mara_snap`.`MAX08`,    `em_mara_snap`.`MAX09`,    `em_mara_snap`.`MAX10`,
    `em_mara_snap`.`MAX11`,    `em_mara_snap`.`MAX12`,    `em_mara_snap`.`MAX13`,    `em_mara_snap`.`MAX14`,
    `em_mara_snap`.`MAX15`,    `em_mara_snap`.`MAX16`,    `em_mara_snap`.`MAX17`,    `em_mara_snap`.`MAX18`,
    `em_mara_snap`.`MAX19`,    `em_mara_snap`.`MAX20`,    `em_mara_snap`.`MAX21`
FROM `em_erp`.`em_mara_snap` em_mara_snap  inner join dw_sourcing.d_Item item
on
em_mara_snap.MATNR=item.material_number 
and em_mara_snap.MTART<>item.material_type
where item.eff_to_date='2999-12-31';

#-- 4.1 close existing rows

update dw_sourcing.d_Item item join em_erp.em_mara_changed em_mara_changed
on item.material_number =em_mara_changed.MATNR
 set eff_to_date='2015-10-11';

#-- 4.2 Insert new rows

insert into dw_sourcing.d_Item
SELECT NULL, MATNR,
    MTART,    MBRSH,    MATKL,
    MEINS,    BSTME,
    MAX01,    MAX02,
    MAX03,    MAX04,    MAX05,    MAX06,
    MAX07,    MAX08,    MAX09,    MAX10,
    MAX11,    MAX12,    MAX13,    MAX14,
    MAX15,    MAX16,    MAX17,    MAX18,
    MAX19,    MAX20,    MAX21,'2015-10-11','2999-12-31'
FROM `em_erp`.`em_mara_changed`;


