fd = load '/datalake/algo/load_test/flight_info/data/flightdelays_clean' using PigStorage(',') as (Year:int, Month:int, DayofMonth:int, DepTime:int,UniqueCarrier:chararray, FlightNum:int, ArrDelay:int, Origin:chararray , Dest:chararray);

--2008,1,5,1018,WN,3668,22,BUR,OAK
--2008,1,5,1038,WN,320,8,BUR,PHX
--2008,1,5,2131,WN,444,54,BUR,PHX

fd_sort = order fd by Dest  ;

store fd_sort into  '/datalake/algo/load_test/flight_info/data/flightdelays_clean_sorted' using PigStorage(',');





