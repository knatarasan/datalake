drop table ingest.em_mara_stg ;

CREATE External TABLE ingest.em_mara_stg (
  `MATNR` int,
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
)ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
stored as TEXTFILE
LOCATION '/apps/dw/ingest/data/em_mara';

sqoop import --connect jdbc:mysql://wn1.kara/em_erp --username em_erp --password em_erp --table em_mara3 --target-dir /apps/dw/ingest/data/em_mara --split-by matnr


CREATE TABLE ingest.em_mara_snap (
  `MATNR` int,
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
)
clustered by (MATNR) into 10 buckets
stored as ORC;


insert into table ingest.em_mara_snap select * from ingest.em_mara_stg;





































--Before Index at ingest.em_mara
hive> select * from ingest.em_mara where MTART='MTART92153750259.5724';
OK
20000001	MTART92153750259.5724	MBRSH28488486472.97219	MATKL	MEI	BST	MAX01	MAX02	MAX03	MAX04	MAX05	MAX06	MAX07	MAX08	MAX09MAX10	MAX11	MAX12	MAX13	MAX14	MAX15	MAX16	MAX17	MAX18	MAX19	MAX20	MAX21
Time taken: 0.23 seconds, Fetched: 1 row(s)

create index em_mara_index
on table ingest.em_mara(MTART)
AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler'
WITH DEFERRED REBUILD;

--After Index at ingest.em_mara
hive> select * from ingest.em_mara where MTART='MTART92153750259.5724';
OK
20000001	MTART92153750259.5724	MBRSH28488486472.97219	MATKL	MEI	BST	MAX01	MAX02	MAX03	MAX04	MAX05	MAX06	MAX07	MAX08	MAX09MAX10	MAX11	MAX12	MAX13	MAX14	MAX15	MAX16	MAX17	MAX18	MAX19	MAX20	MAX21
Time taken: 0.168 seconds, Fetched: 1 row(s)
hive> select * from ingest.em_mara where MTART='MTART92153750259.5724';


