#em_mara_snap  is going to contain snapshot of Item table received today
/*
ingest.em_mara_snap	:	will contain today's snapshot of Item data
ingest.em_mara_new 	:	will contain Items which are not present in d_Item
ingest.em_mara_changed 	:	will contain Items which have been in d_Item  , but attributes have changes

*/

-- DDL of snap, new and changed tables

CREATE TABLE ingest.em_mara_snap (
  `MATNR` varchar(50),
  `MTART` varchar(50),
  `MBRSH` varchar(50),
  `MATKL` varchar(20),
  `MEINS` varchar(3),
  `BSTME` varchar(3),
  `MAX01` varchar(50),
  `MAX02` varchar(50),
  `MAX03` varchar(50),
  `MAX04` varchar(50),
  `MAX05` varchar(50),
  `MAX06` varchar(50),
  `MAX07` varchar(50),
  `MAX08` varchar(50),
  `MAX09` varchar(50),
  `MAX10` varchar(50),
  `MAX11` varchar(50),
  `MAX12` varchar(50),
  `MAX13` varchar(50),
  `MAX14` varchar(50),
  `MAX15` varchar(50),
  `MAX16` varchar(50),
  `MAX17` varchar(50),
  `MAX18` varchar(50),
  `MAX19` varchar(50),
  `MAX20` varchar(50),
  `MAX21` varchar(50)
) ;


CREATE TABLE ingest.em_mara_new (
  `MATNR` varchar(50),
  `MTART` varchar(50),
  `MBRSH` varchar(50),
  `MATKL` varchar(20),
  `MEINS` varchar(3),
  `BSTME` varchar(3),
  `MAX01` varchar(50),
  `MAX02` varchar(50),
  `MAX03` varchar(50),
  `MAX04` varchar(50),
  `MAX05` varchar(50),
  `MAX06` varchar(50),
  `MAX07` varchar(50),
  `MAX08` varchar(50),
  `MAX09` varchar(50),
  `MAX10` varchar(50),
  `MAX11` varchar(50),
  `MAX12` varchar(50),
  `MAX13` varchar(50),
  `MAX14` varchar(50),
  `MAX15` varchar(50),
  `MAX16` varchar(50),
  `MAX17` varchar(50),
  `MAX18` varchar(50),
  `MAX19` varchar(50),
  `MAX20` varchar(50),
  `MAX21` varchar(50)
) ;

CREATE TABLE ingest.em_mara_changed (
  `MATNR` varchar(50),
  `MTART` varchar(50),
  `MBRSH` varchar(50),
  `MATKL` varchar(20),
  `MEINS` varchar(3),
  `BSTME` varchar(3),
  `MAX01` varchar(50),
  `MAX02` varchar(50),
  `MAX03` varchar(50),
  `MAX04` varchar(50),
  `MAX05` varchar(50),
  `MAX06` varchar(50),
  `MAX07` varchar(50),
  `MAX08` varchar(50),
  `MAX09` varchar(50),
  `MAX10` varchar(50),
  `MAX11` varchar(50),
  `MAX12` varchar(50),
  `MAX13` varchar(50),
  `MAX14` varchar(50),
  `MAX15` varchar(50),
  `MAX16` varchar(50),
  `MAX17` varchar(50),
  `MAX18` varchar(50),
  `MAX19` varchar(50),
  `MAX20` varchar(50),
  `MAX21` varchar(50)
) ;


CREATE TABLE ingest.em_mara_snap2 (
  `MATNR` varchar(50),
  `MTART` varchar(50),
  `MBRSH` varchar(50),
  `MATKL` varchar(20),
  `MEINS` varchar(3),
  `BSTME` varchar(3),
  `MAX01` varchar(50),
  `MAX02` varchar(50),
  `MAX03` varchar(50),
  `MAX04` varchar(50),
  `MAX05` varchar(50),
  `MAX06` varchar(50),
  `MAX07` varchar(50),
  `MAX08` varchar(50),
  `MAX09` varchar(50),
  `MAX10` varchar(50),
  `MAX11` varchar(50),
  `MAX12` varchar(50),
  `MAX13` varchar(50),
  `MAX14` varchar(50),
  `MAX15` varchar(50),
  `MAX16` varchar(50),
  `MAX17` varchar(50),
  `MAX18` varchar(50),
  `MAX19` varchar(50),
  `MAX20` varchar(50),
  `MAX21` varchar(50)
) ;

insert into ingest.em_mara_snap2 select 
`MATNR`	,
concat(MTART,'upd'),
`MBRSH`	,
`MATKL`	,
`MEINS`	,
`BSTME`	,
`MAX01`	,
`MAX02`	,
`MAX03`	,
`MAX04`	,
`MAX05`	,
`MAX06`	,
`MAX07`	,
`MAX08`	,
`MAX09`	,
`MAX10`	,
`MAX11`	,
`MAX12`	,
`MAX13`	,
`MAX14`	,
`MAX15`	,
`MAX16`	,
`MAX17`	,
`MAX18`	,
`MAX19`	,
`MAX20`	,
`MAX21`	
from ingest.em_mara_snap;

