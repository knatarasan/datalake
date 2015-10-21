mara4 = LOAD 'mara4.csv' using PigStorage(',') as(MATNR:chararray,MTART:chararray,MBRSH:chararray,MATKL:chararray,MEINS:chararray,BSTME:chararray,MAX01:chararray);

mara_upd = filter mara4 by MATNR=='matnum20000006';
mara_remain = filter mara4 by MATNR!='matnum20000006';
mara_upd = foreach mara_upd generate $0..$3,'DON',$5,$6;
mara_final = union mara_upd,mara_remain;
dump mara_final;
