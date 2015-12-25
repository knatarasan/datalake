
drop table dw_sourcing.d_Item;

CREATE TABLE dw_sourcing.d_Item (
  `item_id` int,
  `material_number` varchar(20),
  `material_type` varchar(50),
  `eff_from_date` date,
  `eff_to_date` date
)CLUSTERED BY(item_id) INTO 5 BUCKETS
STORED as orc TBLPROPERTIES ('transactional'='true');


CREATE TABLE ingest.em_mara_snap22 (
  `MATNR` varchar(50),
  `MTART` varchar(50)
) ;

insert into ingest.em_mara_snap22 values ('mat1','TYPE_A');
insert into ingest.em_mara_snap22 values ('mat2','TYPE_B'); 
insert into ingest.em_mara_snap22 values ('mat3','TYPE_B'); 
insert into ingest.em_mara_snap22 values ('mat4','TYPE_C'); 
insert into ingest.em_mara_snap22 values ('mat5','TYPE_C'); 
 

CREATE TABLE ingest.em_mara_new22 (
  `MATNR` varchar(50),
  `MTART` varchar(50)
) ;

CREATE TABLE ingest.em_mara_changed22 (
  `MATNR` varchar(50),
  `MTART` varchar(50)
) ;


insert into ingest.em_mara_new22 
SELECT MATNR,MTART
FROM `ingest`.`em_mara_snap22` em_mara_snap  LEFT join dw_sourcing.d_Item item
on
em_mara_snap.MATNR=item.material_number 
where item.material_number is null;


insert into dw_sourcing.d_Item
SELECT incr(), MATNR,
    MTART, '2015-10-10','2999-12-31'
FROM `ingest`.`em_mara_new22`;


create table ingest.em_mara_snap23 like ingest.em_mara_snap22;

insert into ingest.em_mara_snap23 values ('mat1','TYPE_AX');
insert into ingest.em_mara_snap23 values ('mat2','TYPE_BX'); 
insert into ingest.em_mara_snap23 values ('mat3','TYPE_BX');



insert into ingest.em_mara_changed22 
select AA.MATNR,AA.MTART from 
(SELECT em_mara_snap.MATNR,
    em_mara_snap.MTART,item.material_number,item.material_type
FROM `ingest`.`em_mara_snap23` em_mara_snap  inner join dw_sourcing.d_Item item
on
em_mara_snap.MATNR=item.material_number 
where item.eff_to_date='2999-12-31'
)AA
where AA.MTART<>AA.material_type;


update dw_sourcing.d_Item set eff_to_date='2015-10-11'
where  eff_to_date='2999-12-31' and
 material_number in
(select MATNR from  ingest.em_mara_changed22 );



insert into dw_sourcing.d_Item
SELECT incr(), MATNR,
    MTART,'2015-10-11','2999-12-31'
FROM `ingest`.`em_mara_changed22`;


