fd = load 'fd.csv' using PigStorage(',') as ( Year:int, Month:int, DayOfMonth:int, DepTime:int, UniqueCarrier:chararray, FlightNum:int, ArrDelay:int, Origin:chararray, Dest:chararray);

fd2 = filter fd by Origin=='SFO';

fd3 = order fd2 by Month,DayOfMonth ;


fd4 = group fd3 by (Year,Month,DayOfMonth,Origin);



fd5= foreach fd4 {
	ordered = order fd3 by ArrDelay DESC;
	avg_delay = AVG(ordered.ArrDelay);
	limited = limit ordered 2;
	GENERATE FLATTEN(limited) ,avg_delay;
}


dump fd5;
/*

(2008,1,3,2059,WN,1924,266,SFO,LAS)
(2008,1,3,1657,WN,106,207,SFO,MDW)

(2008,1,4,1708,WN,3662,172,SFO,SAN)
(2008,1,4,1914,WN,1924,169,SFO,LAS)
(2008,1,4,1727,WN,1018,161,SFO,LAS)
(2008,1,4,1531,WN,106,134,SFO,MDW)
(2008,1,4,1946,WN,442,113,SFO,LAX)

*/
