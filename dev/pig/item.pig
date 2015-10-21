
em_mara4 = LOAD 'mara4.csv' using PigStorage(',') as(MATNR:chararray,MTART:chararray,MBRSH:chararray,MATKL:chararray,MEINS:chararray,BSTME:chararray,MAX01:chararray);


dump em_mara4;

