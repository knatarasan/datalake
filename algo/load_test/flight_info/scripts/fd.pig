fd = load 'fd.csv' using PigStorage(',') as ( Year:int, Month:int, DayOfMonth:int, DepTime:int, UniqueCarrier:chararray, FlightNum:int, ArrDelay:int, Origin:chararray, Dest:chararray);
--Total rows 29534
avg_AD_avg = group fd by Origin;
avg_AD = foreach avg_AD_avg generate group as Origin,AVG(fd.ArrDelay) as avg_arr_delay;

avg_AD_SFO = filter avg_AD by Origin=='SFO';

jn = join fd by Origin,avg_AD_SFO by Origin;

--fd_final = foreach jn generate *;

dump jn;



