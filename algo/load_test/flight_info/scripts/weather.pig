sf = load 'we.csv' using PigStorage(',');

sf_jan = filter sf by $2==1;


dump sf_jan;
