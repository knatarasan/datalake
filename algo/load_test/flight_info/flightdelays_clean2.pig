--fd = load 'part-m-00075' using PigStorage(',') as (Year:int, Month:int, DayofMonth:int, DepTime:int,UniqueCarrier:chararray, FlightNum:int, ArrDelay:int, Origin:chararray , Dest:chararray);

fd = load '/datalake/algo/load_test/flight_info/data/flightdelays_clean' using PigStorage(',') as (Year:int, Month:int, DayofMonth:int, DepTime:int,UniqueCarrier:chararray, FlightNum:int, ArrDelay:int, Origin:chararray , Dest:chararray);

fd_group = group fd by Dest;

--(OAK,{(2008,1,5,1018,WN,3668,22,BUR,OAK),(2008,1,5,837,WN,2613,4,BUR,OAK),(2008,1,5,1806,WN,2182,20,BUR,OAK),(2008,1,5,2017,WN,1587,88,BUR,OAK),(2008,1,5,1750,WN,1398,62,BUR,OAK)})
--(PHX,{(2008,1,5,1837,WN,980,5,BUR,PHX),(2008,1,5,1415,WN,891,57,BUR,PHX),(2008,1,5,1654,WN,481,29,BUR,PHX),(2008,1,5,2131,WN,444,54,BUR,PHX),(2008,1,5,1038,WN,320,8,BUR,PHX)})

fd_cnt = foreach fd_group generate group, AVG(fd.ArrDelay);

dump fd_cnt;



