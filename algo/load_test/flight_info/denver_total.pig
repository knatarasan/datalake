fd = load '/user/horton/flightdelays_clean' using PigStorage(',') as (Year:chararray, Month:chararray, DayofMonth:chararray, DepTime:chararray, UniqueCarrier:chararray, FlightNum:chararray, ArrDelay:chararray, Origin:chararray,Dest:chararray);

fd_fil = filter fd by Dest=='DEN';

fd_grp = group fd_fil all;

fd_cnt = foreach fd_grp generate COUNT(fd_fil);

store fd_cnt into '/user/horton/denver_total' using PigStorage(',');
