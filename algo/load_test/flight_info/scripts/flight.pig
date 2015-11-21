fd = load '/user/horton/flightdelays/*' using PigStorage(',') as 
(Year:chararray,	Month:chararray,	DayofMonth:chararray,	DayOfWeek:chararray,	DepTime:chararray,	CRSDepTime:chararray,	ArrTime:chararray,	CRSArrTime:chararray,	UniqueCarrier:chararray,	FlightNum:chararray,	TailNum:chararray,	ActualElapsedTime:chararray,	CRSElapsedTime:chararray,	AirTime:chararray,	ArrDelay:chararray,	DepDelay:chararray,	Origin:chararray,	Dest:chararray,	Distance:chararray,	TaxiIn:chararray,	TaxiOut:chararray,	Cancelled:chararray,	CancellationCode:chararray,	Diverted:chararray,	CarrierDelay:chararray,	WeatherDelay:chararray,	NASDelay:chararray,	SecurityDelay:chararray,	LateAircraftDelay:chararray);

grp = group fd all;
cnt = foreach grp generate COUNT_STAR(fd.Year);
dump cnt;
