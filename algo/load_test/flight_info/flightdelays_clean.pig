
fd = load '/datalake/algo/load_test/flight_info/data/' using PigStorage(',') as (Year:chararray, Month:chararray, DayofMonth:chararray, DayOfWeek:chararray, DepTime:chararray, CRSDepTime:chararray, ArrTime:chararray, CRSArrTime:chararray,
UniqueCarrier:chararray, FlightNum:chararray, TailNum:chararray, ActualElapsedTime:chararray, CRSElapsedTime:chararray, AirTime:chararray,
ArrDelay:chararray, DepDelay:chararray, Origin:chararray, Dest:chararray, Distance:chararray, TaxiIn:chararray, TaxiOut:chararray, Cancelled:chararray, 
CancellationCode:chararray, Diverted:chararray, CarrierDelay:chararray, WeatherDelay:chararray, NASDelay:chararray, SecurityDelay:chararray,
LateAircraftDelay:chararray  );

fd_fil = filter fd by DepTime !='NA';

fd_final = foreach fd_fil generate Year, Month, DayofMonth, DepTime, UniqueCarrier, FlightNum, ArrDelay, Origin , Dest;

store fd_final into '/datalake/algo/load_test/flight_info/data/flightdelays_clean' using PigStorage(',');




