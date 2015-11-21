fd = load 'flightdelays' using org.apache.hive.hcatalog.pig.HCatLoader();
fd_fil = filter fd by arrdelay>0;

fd_final = order fd_fil by arrdelay DESC parallel 3;

store fd_final into '/user/horton/flightdelays_nonzero' using PigStorage(',');

13265
