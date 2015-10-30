
#1 Prepare dataset of rows are new, i.e, non of source_keys in current dataset are in dimension table 

delete from em_erp.em_mara4_new ;
insert into em_erp.em_mara4_new 
SELECT em_mara4.matnr
FROM `em_erp`.`em_mara4` em_mara4  LEFT join dw_sourcing.d_Item item
on
em_mara4.MATNR=item.material_number 
where item.material_number is null;


# 2 Load brand new source keys into dimension table 

insert into dw_sourcing.d_Item
SELECT NULL, em_mara4.matnr,'2015-10-10','2999-12-31'
FROM `em_erp`.`em_mara4_new` em_mara4 


#  changes in source
update em_erp.em_mara4 set mtart='mtart_change1' where matnr='matnum20000005';


#3 Get dimension Item rows which are existing in d_Vendor but there is change in columns
#  for which history to be maintained (put them into _changed table)

delete from  em_erp.em_mara4_changed ;
insert into em_erp.em_mara4_changed 
SELECT em_mara4.matnr,
    `em_mara4`.`MTART`,    `em_mara4`.`MBRSH`,    `em_mara4`.`MATKL`,
    `em_mara4`.`MEINS`,    `em_mara4`.`BSTME`,    `em_mara4`.`MAX01`,    `em_mara4`.`MAX02`,
    `em_mara4`.`MAX03`,    `em_mara4`.`MAX04`,    `em_mara4`.`MAX05`,    `em_mara4`.`MAX06`,
    `em_mara4`.`MAX07`,    `em_mara4`.`MAX08`,    `em_mara4`.`MAX09`,    `em_mara4`.`MAX10`,
    `em_mara4`.`MAX11`,    `em_mara4`.`MAX12`,    `em_mara4`.`MAX13`,    `em_mara4`.`MAX14`,
    `em_mara4`.`MAX15`,    `em_mara4`.`MAX16`,    `em_mara4`.`MAX17`,    `em_mara4`.`MAX18`,
    `em_mara4`.`MAX19`,    `em_mara4`.`MAX20`,    `em_mara4`.`MAX21`
FROM `em_erp`.`em_mara4` em_mara4  inner join dw_sourcing.d_Item item
on
em_mara4.MATNR=item.material_number 
#and em_mara4.MTART<>item.material_type;


# 4.1 close existing rows

update dw_sourcing.d_Item item join em_erp.em_mara4_changed em_mara4
on item.material_number =em_mara4.MATNR
and item.eff_to_date='2999-12-31'
 set eff_to_date='2015-10-11';

d_Item = LOAD 'Item.csv';
em_mara4 = LOAD 'em_mara4.csv';

updateable = join d_Item by (material_number) inner em_mara4 by (MATNR);
updateable = filter updateable d_Item.eff_to_date=='2999-12-31';




# 4.2 Insert new rows

insert into dw_sourcing.d_Item
SELECT NULL, em_mara4.matnr
,    `em_mara4`.`MTART`,    `em_mara4`.`MBRSH`,    `em_mara4`.`MATKL`,
    `em_mara4`.`MEINS`,    `em_mara4`.`BSTME`,    `em_mara4`.`MAX01`,    `em_mara4`.`MAX02`,
    `em_mara4`.`MAX03`,    `em_mara4`.`MAX04`,    `em_mara4`.`MAX05`,    `em_mara4`.`MAX06`,
    `em_mara4`.`MAX07`,    `em_mara4`.`MAX08`,    `em_mara4`.`MAX09`,    `em_mara4`.`MAX10`,
    `em_mara4`.`MAX11`,    `em_mara4`.`MAX12`,    `em_mara4`.`MAX13`,    `em_mara4`.`MAX14`,
    `em_mara4`.`MAX15`,    `em_mara4`.`MAX16`,    `em_mara4`.`MAX17`,    `em_mara4`.`MAX18`,
    `em_mara4`.`MAX19`,    `em_mara4`.`MAX20`,    `em_mara4`.`MAX21`,'2015-10-11','2999-12-31'
FROM `em_erp`.`em_mara4_changed` em_mara4 





