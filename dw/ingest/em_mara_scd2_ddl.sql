#em_mara_snap  is going to contain snapshot of Item table received today
/*
em_erp.em_mara_snap	:	will contain today's snapshot of Item data
em_erp.em_mara_new 	:	will contain Items which are not present in d_Item
em_erp.em_mara_changed 	:	will contain Items which have been in d_Item  , but attributes have changes

*/

-- DDL of snap, new and changed tables

CREATE TABLE em_erp.em_mara_snap (
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


