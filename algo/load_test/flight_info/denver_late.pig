fd = load '/user/horton/flightdelays_clean' using PigStorage(',') as (Year:int, Month:int, DayofMonth:int, DepTime:int, UniqueCarrier:chararray, FlightNum:chararray, ArrDelay:int, Origin:chararray,Dest:chararray);

fd_fil = filter fd by Dest=='DEN' and ArrDelay>=60;

fd_grp = group fd_fil all;

fd_cnt = foreach fd_grp generate COUNT(fd_fil);

store fd_cnt into '/user/horton/denver_late' using PigStorage(',');
