#em_mara_snap  is going to contain snapshot of Item table received today

CREATE TABLE `em_mara_snap` (
  `MATNR` varchar(50) NOT NULL,
  `MTART` varchar(50) DEFAULT NULL,
  `MBRSH` varchar(50) DEFAULT NULL,
  `MATKL` varchar(20) DEFAULT NULL,
  `MEINS` varchar(3) DEFAULT NULL,
  `BSTME` varchar(3) DEFAULT NULL,
  `MAX01` varchar(50) DEFAULT NULL,
  `MAX02` varchar(50) DEFAULT NULL,
  `MAX03` varchar(50) DEFAULT NULL,
  `MAX04` varchar(50) DEFAULT NULL,
  `MAX05` varchar(50) DEFAULT NULL,
  `MAX06` varchar(50) DEFAULT NULL,
  `MAX07` varchar(50) DEFAULT NULL,
  `MAX08` varchar(50) DEFAULT NULL,
  `MAX09` varchar(50) DEFAULT NULL,
  `MAX10` varchar(50) DEFAULT NULL,
  `MAX11` varchar(50) DEFAULT NULL,
  `MAX12` varchar(50) DEFAULT NULL,
  `MAX13` varchar(50) DEFAULT NULL,
  `MAX14` varchar(50) DEFAULT NULL,
  `MAX15` varchar(50) DEFAULT NULL,
  `MAX16` varchar(50) DEFAULT NULL,
  `MAX17` varchar(50) DEFAULT NULL,
  `MAX18` varchar(50) DEFAULT NULL,
  `MAX19` varchar(50) DEFAULT NULL,
  `MAX20` varchar(50) DEFAULT NULL,
  `MAX21` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE em_erp.em_mara_new (
  `MATNR` varchar(50) NOT NULL,
  `MTART` varchar(50) DEFAULT NULL,
  `MBRSH` varchar(50) DEFAULT NULL,
  `MATKL` varchar(20) DEFAULT NULL,
  `MEINS` varchar(3) DEFAULT NULL,
  `BSTME` varchar(3) DEFAULT NULL,
  `MAX01` varchar(50) DEFAULT NULL,
  `MAX02` varchar(50) DEFAULT NULL,
  `MAX03` varchar(50) DEFAULT NULL,
  `MAX04` varchar(50) DEFAULT NULL,
  `MAX05` varchar(50) DEFAULT NULL,
  `MAX06` varchar(50) DEFAULT NULL,
  `MAX07` varchar(50) DEFAULT NULL,
  `MAX08` varchar(50) DEFAULT NULL,
  `MAX09` varchar(50) DEFAULT NULL,
  `MAX10` varchar(50) DEFAULT NULL,
  `MAX11` varchar(50) DEFAULT NULL,
  `MAX12` varchar(50) DEFAULT NULL,
  `MAX13` varchar(50) DEFAULT NULL,
  `MAX14` varchar(50) DEFAULT NULL,
  `MAX15` varchar(50) DEFAULT NULL,
  `MAX16` varchar(50) DEFAULT NULL,
  `MAX17` varchar(50) DEFAULT NULL,
  `MAX18` varchar(50) DEFAULT NULL,
  `MAX19` varchar(50) DEFAULT NULL,
  `MAX20` varchar(50) DEFAULT NULL,
  `MAX21` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE em_erp.em_mara_changed (
  `MATNR` varchar(50) NOT NULL,
  `MTART` varchar(50) DEFAULT NULL,
  `MBRSH` varchar(50) DEFAULT NULL,
  `MATKL` varchar(20) DEFAULT NULL,
  `MEINS` varchar(3) DEFAULT NULL,
  `BSTME` varchar(3) DEFAULT NULL,
  `MAX01` varchar(50) DEFAULT NULL,
  `MAX02` varchar(50) DEFAULT NULL,
  `MAX03` varchar(50) DEFAULT NULL,
  `MAX04` varchar(50) DEFAULT NULL,
  `MAX05` varchar(50) DEFAULT NULL,
  `MAX06` varchar(50) DEFAULT NULL,
  `MAX07` varchar(50) DEFAULT NULL,
  `MAX08` varchar(50) DEFAULT NULL,
  `MAX09` varchar(50) DEFAULT NULL,
  `MAX10` varchar(50) DEFAULT NULL,
  `MAX11` varchar(50) DEFAULT NULL,
  `MAX12` varchar(50) DEFAULT NULL,
  `MAX13` varchar(50) DEFAULT NULL,
  `MAX14` varchar(50) DEFAULT NULL,
  `MAX15` varchar(50) DEFAULT NULL,
  `MAX16` varchar(50) DEFAULT NULL,
  `MAX17` varchar(50) DEFAULT NULL,
  `MAX18` varchar(50) DEFAULT NULL,
  `MAX19` varchar(50) DEFAULT NULL,
  `MAX20` varchar(50) DEFAULT NULL,
  `MAX21` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#set sql_safe_updates=0

# Update mara_snap from Item file which arrived today

insert into em_erp.em_mara_snap
SELECT concat('matnum',em_mara.matnr),
    `em_mara`.`MTART`,    `em_mara`.`MBRSH`,    `em_mara`.`MATKL`,
    `em_mara`.`MEINS`,    `em_mara`.`BSTME`,    `em_mara`.`MAX01`,    `em_mara`.`MAX02`,
    `em_mara`.`MAX03`,    `em_mara`.`MAX04`,    `em_mara`.`MAX05`,    `em_mara`.`MAX06`,
    `em_mara`.`MAX07`,    `em_mara`.`MAX08`,    `em_mara`.`MAX09`,    `em_mara`.`MAX10`,
    `em_mara`.`MAX11`,    `em_mara`.`MAX12`,    `em_mara`.`MAX13`,    `em_mara`.`MAX14`,
    `em_mara`.`MAX15`,    `em_mara`.`MAX16`,    `em_mara`.`MAX17`,    `em_mara`.`MAX18`,
    `em_mara`.`MAX19`,    `em_mara`.`MAX20`,    `em_mara`.`MAX21`
FROM `em_erp`.`em_mara` em_mara  where  em_mara.matnr=20000005;


#1 Prepare dataset of rows are new, i.e, non of source_keys in current dataset are in dimension table 

delete from em_erp.em_mara_new ;
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


# 2 Load brand new source keys into dimension table 

insert into dw_sourcing.d_Item
SELECT NULL, em_mara_new.matnr
,    `em_mara_new`.`MTART`,    `em_mara_new`.`MBRSH`,    `em_mara_new`.`MATKL`,
    `em_mara_new`.`MEINS`,    `em_mara_new`.`BSTME`,    `em_mara_new`.`MAX01`,    `em_mara_new`.`MAX02`,
    `em_mara_new`.`MAX03`,    `em_mara_new`.`MAX04`,    `em_mara_new`.`MAX05`,    `em_mara_new`.`MAX06`,
    `em_mara_new`.`MAX07`,    `em_mara_new`.`MAX08`,    `em_mara_new`.`MAX09`,    `em_mara_new`.`MAX10`,
    `em_mara_new`.`MAX11`,    `em_mara_new`.`MAX12`,    `em_mara_new`.`MAX13`,    `em_mara_new`.`MAX14`,
    `em_mara_new`.`MAX15`,    `em_mara_new`.`MAX16`,    `em_mara_new`.`MAX17`,    `em_mara_new`.`MAX18`,
    `em_mara_new`.`MAX19`,    `em_mara_new`.`MAX20`,    `em_mara_new`.`MAX21`,'2015-10-10','2999-12-31'
FROM `em_erp`.`em_mara_new` em_mara_new 


-- changes in source
--update em_erp.em_mara_snap set mtart='mtart_change1' where matnr='matnum20000005';


#3 Get dimension Item rows which are existing in d_Item but there is change in columns
#  for which history to be maintained (put them into _changed table)

delete from  em_erp.em_mara_changed ;
insert into em_erp.em_mara_changed 
SELECT em_mara_snap.matnr,
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
and em_mara_snap.MTART<>item.material_type;


# 4.1 close existing rows

update dw_sourcing.d_Item item join em_erp.em_mara_changed em_mara_changed
on item.material_number =em_mara_changed.MATNR
 set eff_to_date='2015-10-11';

# 4.2 Insert new rows

insert into dw_sourcing.d_Item
SELECT NULL, em_mara_changed.matnr
,    `em_mara_changed`.`MTART`,    `em_mara_changed`.`MBRSH`,    `em_mara_changed`.`MATKL`,
    `em_mara_changed`.`MEINS`,    `em_mara_changed`.`BSTME`,    `em_mara_changed`.`MAX01`,    `em_mara_changed`.`MAX02`,
    `em_mara_changed`.`MAX03`,    `em_mara_changed`.`MAX04`,    `em_mara_changed`.`MAX05`,    `em_mara_changed`.`MAX06`,
    `em_mara_changed`.`MAX07`,    `em_mara_changed`.`MAX08`,    `em_mara_changed`.`MAX09`,    `em_mara_changed`.`MAX10`,
    `em_mara_changed`.`MAX11`,    `em_mara_changed`.`MAX12`,    `em_mara_changed`.`MAX13`,    `em_mara_changed`.`MAX14`,
    `em_mara_changed`.`MAX15`,    `em_mara_changed`.`MAX16`,    `em_mara_changed`.`MAX17`,    `em_mara_changed`.`MAX18`,
    `em_mara_changed`.`MAX19`,    `em_mara_changed`.`MAX20`,    `em_mara_changed`.`MAX21`,'2015-10-11','2999-12-31'
FROM `em_erp`.`em_mara_changed` em_mara_changed 





