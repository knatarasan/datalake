[kannappan@wn2 flight_info]$ cat flightdelays_join_merge_ex.pig

/*
fd = load '/datalake/algo/load_test/flight_info/data/flightdelays_clean' using PigStorage(',') as (Year:int, Month:int, DayofMonth:int, DepTime:int,UniqueCarrier:chararray, FlightNum:int, ArrDelay:int, Origin:chararray , Dest:chararray);

flight_delay_clean
------------------
Year, Month, DayofMonth, DepTime,UniqueCarrier, FlightNum, ArrDelay, Origin , Dest;
2008,1,5,1018,WN,3668,22,BUR,OAK
2008,1,5,1038,WN,320,8,BUR,PHX
2008,1,5,2131,WN,444,54,BUR,PHX

SFO_WEATHER
-----------

/datalake/algo/load_test/flight_info/data/weather/weather.csv

YEAR,MONTH,DAY,PRCP,TMAX,TMIN
2008,1,1,0,122,39
2008,1,2,0,117,39
2008,1,3,43,150,94
2008,1,5,533,150,100

Expected output

2008,1,5,1018,WN,3668,22,BUR,OAK,533,150,100
2008,1,5,1038,WN,320,8,BUR,PHX,533,150,100
2008,1,5,2131,WN,444,54,BUR,PHX,533,150,100
*/


fd = load '/datalake/algo/load_test/flight_info/data/flightdelays_clean/' using PigStorage(',') as (Year:int, Month:int, DayofMonth:int, DepTime:int,UniqueCarrier:chararray, FlightNum:int, ArrDelay:int, Origin:chararray , Dest:chararray);

fd = order fd by Year, Month, DayofMonth;

weather = load '/datalake/algo/load_test/flight_info/data/weather' using PigStorage(',') as (Year:int,Month:int,DayofMonth:int,PRCP:int,TMAX:int,TMIN:int);

weather = order weather by Year, Month, DayofMonth;

fd_weather = join fd by (Year,Month,DayofMonth),  weather by (Year,Month,DayofMonth) using 'merge';


fd_weather_final = foreach fd_weather generate fd::Year,fd::Month,fd::DayofMonth,fd::DepTime,fd::UniqueCarrier,fd::FlightNum,fd::ArrDelay,fd::Origin,fd::Dest,weather::PRCP,weather::TMAX,weather::TMIN;

explain fd_weather_final;




[kannappan@wn2 flight_info]$ pig flightdelays_join_merge_ex.pig
WARNING: Use "yarn jar" to launch YARN applications.
15/11/22 15:48:51 INFO pig.ExecTypeProvider: Trying ExecType : LOCAL
15/11/22 15:48:51 INFO pig.ExecTypeProvider: Trying ExecType : MAPREDUCE
15/11/22 15:48:51 INFO pig.ExecTypeProvider: Picked MAPREDUCE as the ExecType
2015-11-22 15:48:51,475 [main] INFO  org.apache.pig.Main - Apache Pig version 0.15.0.2.3.0.0-2557 (rexported) compiled Jul 14 2015, 10:10:23
2015-11-22 15:48:51,475 [main] INFO  org.apache.pig.Main - Logging error messages to: /home/kannappan/datalake/algo/load_test/flight_info/pig_1448236131472.log
2015-11-22 15:48:52,610 [main] INFO  org.apache.pig.impl.util.Utils - Default bootup file /home/kannappan/.pigbootup not found
2015-11-22 15:48:53,047 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to hadoop file system at: hdfs://wn1.kara:8020
2015-11-22 15:48:57,104 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2015-11-22 15:48:57,218 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, ConstantCalculator, GroupByConstParallelSetter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, PartitionFilterOptimizer, PredicatePushdownOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter]}
#-----------------------------------------------
# New Logical Plan:
#-----------------------------------------------
fd_weather_final: (Name: LOStore Schema: fd::Year#16:int,fd::Month#17:int,fd::DayofMonth#18:int,fd::DepTime#19:int,fd::UniqueCarrier#20:chararray,fd::FlightNum#21:int,fd::ArrDelay#22:int,fd::Origin#23:chararray,fd::Dest#24:chararray,weather::PRCP#28:int,weather::TMAX#29:int,weather::TMIN#30:int)
|
|---fd_weather_final: (Name: LOForEach Schema: fd::Year#16:int,fd::Month#17:int,fd::DayofMonth#18:int,fd::DepTime#19:int,fd::UniqueCarrier#20:chararray,fd::FlightNum#21:int,fd::ArrDelay#22:int,fd::Origin#23:chararray,fd::Dest#24:chararray,weather::PRCP#28:int,weather::TMAX#29:int,weather::TMIN#30:int)
    |   |
    |   (Name: LOGenerate[false,false,false,false,false,false,false,false,false,false,false,false] Schema: fd::Year#16:int,fd::Month#17:int,fd::DayofMonth#18:int,fd::DepTime#19:int,fd::UniqueCarrier#20:chararray,fd::FlightNum#21:int,fd::ArrDelay#22:int,fd::Origin#23:chararray,fd::Dest#24:chararray,weather::PRCP#28:int,weather::TMAX#29:int,weather::TMIN#30:int)ColumnPrune:OutputUids=[16, 17, 18, 19, 20, 21, 22, 23, 24, 28, 29, 30]ColumnPrune:InputUids=[16, 17, 18, 19, 20, 21, 22, 23, 24, 28, 29, 30]
    |   |   |
    |   |   fd::Year:(Name: Project Type: int Uid: 16 Input: 0 Column: (*))
    |   |   |
    |   |   fd::Month:(Name: Project Type: int Uid: 17 Input: 1 Column: (*))
    |   |   |
    |   |   fd::DayofMonth:(Name: Project Type: int Uid: 18 Input: 2 Column: (*))
    |   |   |
    |   |   fd::DepTime:(Name: Project Type: int Uid: 19 Input: 3 Column: (*))
    |   |   |
    |   |   fd::UniqueCarrier:(Name: Project Type: chararray Uid: 20 Input: 4 Column: (*))
    |   |   |
    |   |   fd::FlightNum:(Name: Project Type: int Uid: 21 Input: 5 Column: (*))
    |   |   |
    |   |   fd::ArrDelay:(Name: Project Type: int Uid: 22 Input: 6 Column: (*))
    |   |   |
    |   |   fd::Origin:(Name: Project Type: chararray Uid: 23 Input: 7 Column: (*))
    |   |   |
    |   |   fd::Dest:(Name: Project Type: chararray Uid: 24 Input: 8 Column: (*))
    |   |   |
    |   |   weather::PRCP:(Name: Project Type: int Uid: 28 Input: 9 Column: (*))
    |   |   |
    |   |   weather::TMAX:(Name: Project Type: int Uid: 29 Input: 10 Column: (*))
    |   |   |
    |   |   weather::TMIN:(Name: Project Type: int Uid: 30 Input: 11 Column: (*))
    |   |
    |   |---(Name: LOInnerLoad[0] Schema: fd::Year#16:int)
    |   |
    |   |---(Name: LOInnerLoad[1] Schema: fd::Month#17:int)
    |   |
    |   |---(Name: LOInnerLoad[2] Schema: fd::DayofMonth#18:int)
    |   |
    |   |---(Name: LOInnerLoad[3] Schema: fd::DepTime#19:int)
    |   |
    |   |---(Name: LOInnerLoad[4] Schema: fd::UniqueCarrier#20:chararray)
    |   |
    |   |---(Name: LOInnerLoad[5] Schema: fd::FlightNum#21:int)
    |   |
    |   |---(Name: LOInnerLoad[6] Schema: fd::ArrDelay#22:int)
    |   |
    |   |---(Name: LOInnerLoad[7] Schema: fd::Origin#23:chararray)
    |   |
    |   |---(Name: LOInnerLoad[8] Schema: fd::Dest#24:chararray)
    |   |
    |   |---(Name: LOInnerLoad[12] Schema: weather::PRCP#28:int)
    |   |
    |   |---(Name: LOInnerLoad[13] Schema: weather::TMAX#29:int)
    |   |
    |   |---(Name: LOInnerLoad[14] Schema: weather::TMIN#30:int)
    |
    |---fd_weather: (Name: LOJoin(MERGE) Schema: fd::Year#16:int,fd::Month#17:int,fd::DayofMonth#18:int,fd::DepTime#19:int,fd::UniqueCarrier#20:chararray,fd::FlightNum#21:int,fd::ArrDelay#22:int,fd::Origin#23:chararray,fd::Dest#24:chararray,weather::Year#25:int,weather::Month#26:int,weather::DayofMonth#27:int,weather::PRCP#28:int,weather::TMAX#29:int,weather::TMIN#30:int)
        |   |
        |   Year:(Name: Project Type: int Uid: 16 Input: 0 Column: 0)
        |   |
        |   Month:(Name: Project Type: int Uid: 17 Input: 0 Column: 1)
        |   |
        |   DayofMonth:(Name: Project Type: int Uid: 18 Input: 0 Column: 2)
        |   |
        |   Year:(Name: Project Type: int Uid: 25 Input: 1 Column: 0)
        |   |
        |   Month:(Name: Project Type: int Uid: 26 Input: 1 Column: 1)
        |   |
        |   DayofMonth:(Name: Project Type: int Uid: 27 Input: 1 Column: 2)
        |
        |---fd: (Name: LOSort Schema: Year#16:int,Month#17:int,DayofMonth#18:int,DepTime#19:int,UniqueCarrier#20:chararray,FlightNum#21:int,ArrDelay#22:int,Origin#23:chararray,Dest#24:chararray)
        |   |   |
        |   |   Year:(Name: Project Type: int Uid: 16 Input: 0 Column: 0)
        |   |   |
        |   |   Month:(Name: Project Type: int Uid: 17 Input: 0 Column: 1)
        |   |   |
        |   |   DayofMonth:(Name: Project Type: int Uid: 18 Input: 0 Column: 2)
        |   |
        |   |---fd: (Name: LOForEach Schema: Year#16:int,Month#17:int,DayofMonth#18:int,DepTime#19:int,UniqueCarrier#20:chararray,FlightNum#21:int,ArrDelay#22:int,Origin#23:chararray,Dest#24:chararray)
        |       |   |
        |       |   (Name: LOGenerate[false,false,false,false,false,false,false,false,false] Schema: Year#16:int,Month#17:int,DayofMonth#18:int,DepTime#19:int,UniqueCarrier#20:chararray,FlightNum#21:int,ArrDelay#22:int,Origin#23:chararray,Dest#24:chararray)ColumnPrune:OutputUids=[16, 17, 18, 19, 20, 21, 22, 23, 24]ColumnPrune:InputUids=[16, 17, 18, 19, 20, 21, 22, 23, 24]
        |       |   |   |
        |       |   |   (Name: Cast Type: int Uid: 16)
        |       |   |   |
        |       |   |   |---Year:(Name: Project Type: bytearray Uid: 16 Input: 0 Column: (*))
        |       |   |   |
        |       |   |   (Name: Cast Type: int Uid: 17)
        |       |   |   |
        |       |   |   |---Month:(Name: Project Type: bytearray Uid: 17 Input: 1 Column: (*))
        |       |   |   |
        |       |   |   (Name: Cast Type: int Uid: 18)
        |       |   |   |
        |       |   |   |---DayofMonth:(Name: Project Type: bytearray Uid: 18 Input: 2 Column: (*))
        |       |   |   |
        |       |   |   (Name: Cast Type: int Uid: 19)
        |       |   |   |
        |       |   |   |---DepTime:(Name: Project Type: bytearray Uid: 19 Input: 3 Column: (*))
        |       |   |   |
        |       |   |   (Name: Cast Type: chararray Uid: 20)
        |       |   |   |
        |       |   |   |---UniqueCarrier:(Name: Project Type: bytearray Uid: 20 Input: 4 Column: (*))
        |       |   |   |
        |       |   |   (Name: Cast Type: int Uid: 21)
        |       |   |   |
        |       |   |   |---FlightNum:(Name: Project Type: bytearray Uid: 21 Input: 5 Column: (*))
        |       |   |   |
        |       |   |   (Name: Cast Type: int Uid: 22)
        |       |   |   |
        |       |   |   |---ArrDelay:(Name: Project Type: bytearray Uid: 22 Input: 6 Column: (*))
        |       |   |   |
        |       |   |   (Name: Cast Type: chararray Uid: 23)
        |       |   |   |
        |       |   |   |---Origin:(Name: Project Type: bytearray Uid: 23 Input: 7 Column: (*))
        |       |   |   |
        |       |   |   (Name: Cast Type: chararray Uid: 24)
        |       |   |   |
        |       |   |   |---Dest:(Name: Project Type: bytearray Uid: 24 Input: 8 Column: (*))
        |       |   |
        |       |   |---(Name: LOInnerLoad[0] Schema: Year#16:bytearray)
        |       |   |
        |       |   |---(Name: LOInnerLoad[1] Schema: Month#17:bytearray)
        |       |   |
        |       |   |---(Name: LOInnerLoad[2] Schema: DayofMonth#18:bytearray)
        |       |   |
        |       |   |---(Name: LOInnerLoad[3] Schema: DepTime#19:bytearray)
        |       |   |
        |       |   |---(Name: LOInnerLoad[4] Schema: UniqueCarrier#20:bytearray)
        |       |   |
        |       |   |---(Name: LOInnerLoad[5] Schema: FlightNum#21:bytearray)
        |       |   |
        |       |   |---(Name: LOInnerLoad[6] Schema: ArrDelay#22:bytearray)
        |       |   |
        |       |   |---(Name: LOInnerLoad[7] Schema: Origin#23:bytearray)
        |       |   |
        |       |   |---(Name: LOInnerLoad[8] Schema: Dest#24:bytearray)
        |       |
        |       |---fd: (Name: LOLoad Schema: Year#16:bytearray,Month#17:bytearray,DayofMonth#18:bytearray,DepTime#19:bytearray,UniqueCarrier#20:bytearray,FlightNum#21:bytearray,ArrDelay#22:bytearray,Origin#23:bytearray,Dest#24:bytearray)RequiredFields:null
        |
        |---weather: (Name: LOSort Schema: Year#25:int,Month#26:int,DayofMonth#27:int,PRCP#28:int,TMAX#29:int,TMIN#30:int)
            |   |
            |   Year:(Name: Project Type: int Uid: 25 Input: 0 Column: 0)
            |   |
            |   Month:(Name: Project Type: int Uid: 26 Input: 0 Column: 1)
            |   |
            |   DayofMonth:(Name: Project Type: int Uid: 27 Input: 0 Column: 2)
            |
            |---weather: (Name: LOForEach Schema: Year#25:int,Month#26:int,DayofMonth#27:int,PRCP#28:int,TMAX#29:int,TMIN#30:int)
                |   |
                |   (Name: LOGenerate[false,false,false,false,false,false] Schema: Year#25:int,Month#26:int,DayofMonth#27:int,PRCP#28:int,TMAX#29:int,TMIN#30:int)ColumnPrune:OutputUids=[25, 26, 27, 28, 29, 30]ColumnPrune:InputUids=[25, 26, 27, 28, 29, 30]
                |   |   |
                |   |   (Name: Cast Type: int Uid: 25)
                |   |   |
                |   |   |---Year:(Name: Project Type: bytearray Uid: 25 Input: 0 Column: (*))
                |   |   |
                |   |   (Name: Cast Type: int Uid: 26)
                |   |   |
                |   |   |---Month:(Name: Project Type: bytearray Uid: 26 Input: 1 Column: (*))
                |   |   |
                |   |   (Name: Cast Type: int Uid: 27)
                |   |   |
                |   |   |---DayofMonth:(Name: Project Type: bytearray Uid: 27 Input: 2 Column: (*))
                |   |   |
                |   |   (Name: Cast Type: int Uid: 28)
                |   |   |
                |   |   |---PRCP:(Name: Project Type: bytearray Uid: 28 Input: 3 Column: (*))
                |   |   |
                |   |   (Name: Cast Type: int Uid: 29)
                |   |   |
                |   |   |---TMAX:(Name: Project Type: bytearray Uid: 29 Input: 4 Column: (*))
                |   |   |
                |   |   (Name: Cast Type: int Uid: 30)
                |   |   |
                |   |   |---TMIN:(Name: Project Type: bytearray Uid: 30 Input: 5 Column: (*))
                |   |
                |   |---(Name: LOInnerLoad[0] Schema: Year#25:bytearray)
                |   |
                |   |---(Name: LOInnerLoad[1] Schema: Month#26:bytearray)
                |   |
                |   |---(Name: LOInnerLoad[2] Schema: DayofMonth#27:bytearray)
                |   |
                |   |---(Name: LOInnerLoad[3] Schema: PRCP#28:bytearray)
                |   |
                |   |---(Name: LOInnerLoad[4] Schema: TMAX#29:bytearray)
                |   |
                |   |---(Name: LOInnerLoad[5] Schema: TMIN#30:bytearray)
                |
                |---weather: (Name: LOLoad Schema: Year#25:bytearray,Month#26:bytearray,DayofMonth#27:bytearray,PRCP#28:bytearray,TMAX#29:bytearray,TMIN#30:bytearray)RequiredFields:null
#-----------------------------------------------
# Physical Plan:
#-----------------------------------------------
fd_weather_final: Store(fakefile:org.apache.pig.builtin.PigStorage) - scope-91
|
|---fd_weather_final: New For Each(false,false,false,false,false,false,false,false,false,false,false,false)[bag] - scope-90
    |   |
    |   Project[int][0] - scope-66
    |   |
    |   Project[int][1] - scope-68
    |   |
    |   Project[int][2] - scope-70
    |   |
    |   Project[int][3] - scope-72
    |   |
    |   Project[chararray][4] - scope-74
    |   |
    |   Project[int][5] - scope-76
    |   |
    |   Project[int][6] - scope-78
    |   |
    |   Project[chararray][7] - scope-80
    |   |
    |   Project[chararray][8] - scope-82
    |   |
    |   Project[int][12] - scope-84
    |   |
    |   Project[int][13] - scope-86
    |   |
    |   Project[int][14] - scope-88
    |
    |---fd_weather: MergeJoin[tuple] - scope-63
        |
        |---fd: POSort[bag]() - scope-32
        |   |   |
        |   |   Project[int][0] - scope-29
        |   |   |
        |   |   Project[int][1] - scope-30
        |   |   |
        |   |   Project[int][2] - scope-31
        |   |
        |   |---fd: New For Each(false,false,false,false,false,false,false,false,false)[bag] - scope-28
        |       |   |
        |       |   Cast[int] - scope-2
        |       |   |
        |       |   |---Project[bytearray][0] - scope-1
        |       |   |
        |       |   Cast[int] - scope-5
        |       |   |
        |       |   |---Project[bytearray][1] - scope-4
        |       |   |
        |       |   Cast[int] - scope-8
        |       |   |
        |       |   |---Project[bytearray][2] - scope-7
        |       |   |
        |       |   Cast[int] - scope-11
        |       |   |
        |       |   |---Project[bytearray][3] - scope-10
        |       |   |
        |       |   Cast[chararray] - scope-14
        |       |   |
        |       |   |---Project[bytearray][4] - scope-13
        |       |   |
        |       |   Cast[int] - scope-17
        |       |   |
        |       |   |---Project[bytearray][5] - scope-16
        |       |   |
        |       |   Cast[int] - scope-20
        |       |   |
        |       |   |---Project[bytearray][6] - scope-19
        |       |   |
        |       |   Cast[chararray] - scope-23
        |       |   |
        |       |   |---Project[bytearray][7] - scope-22
        |       |   |
        |       |   Cast[chararray] - scope-26
        |       |   |
        |       |   |---Project[bytearray][8] - scope-25
        |       |
        |       |---fd: Load(/datalake/algo/load_test/flight_info/data/flightdelays_clean:PigStorage(',')) - scope-0
        |
        |---weather: POSort[bag]() - scope-56
            |   |
            |   Project[int][0] - scope-53
            |   |
            |   Project[int][1] - scope-54
            |   |
            |   Project[int][2] - scope-55
            |
            |---weather: New For Each(false,false,false,false,false,false)[bag] - scope-52
                |   |
                |   Cast[int] - scope-35
                |   |
                |   |---Project[bytearray][0] - scope-34
                |   |
                |   Cast[int] - scope-38
                |   |
                |   |---Project[bytearray][1] - scope-37
                |   |
                |   Cast[int] - scope-41
                |   |
                |   |---Project[bytearray][2] - scope-40
                |   |
                |   Cast[int] - scope-44
                |   |
                |   |---Project[bytearray][3] - scope-43
                |   |
                |   Cast[int] - scope-47
                |   |
                |   |---Project[bytearray][4] - scope-46
                |   |
                |   Cast[int] - scope-50
                |   |
                |   |---Project[bytearray][5] - scope-49
                |
                |---weather: Load(/datalake/algo/load_test/flight_info/data/weather:PigStorage(',')) - scope-33

2015-11-22 15:48:57,942 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2015-11-22 15:48:58,258 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.SecondaryKeyOptimizerMR - Using Secondary Key Optimization for MapReduce node scope-95
2015-11-22 15:48:58,258 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.SecondaryKeyOptimizerMR - Using Secondary Key Optimization for MapReduce node scope-122
2015-11-22 15:48:58,301 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 8
2015-11-22 15:48:58,302 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 8
#--------------------------------------------------
# Map Reduce Plan                                  
#--------------------------------------------------
MapReduce node scope-92
Map Plan
Store(hdfs://wn1.kara:8020/tmp/temp-426788593/tmp1465223968:org.apache.pig.impl.io.InterStorage) - scope-93
|
|---fd: New For Each(false,false,false,false,false,false,false,false,false)[bag] - scope-28
    |   |
    |   Cast[int] - scope-2
    |   |
    |   |---Project[bytearray][0] - scope-1
    |   |
    |   Cast[int] - scope-5
    |   |
    |   |---Project[bytearray][1] - scope-4
    |   |
    |   Cast[int] - scope-8
    |   |
    |   |---Project[bytearray][2] - scope-7
    |   |
    |   Cast[int] - scope-11
    |   |
    |   |---Project[bytearray][3] - scope-10
    |   |
    |   Cast[chararray] - scope-14
    |   |
    |   |---Project[bytearray][4] - scope-13
    |   |
    |   Cast[int] - scope-17
    |   |
    |   |---Project[bytearray][5] - scope-16
    |   |
    |   Cast[int] - scope-20
    |   |
    |   |---Project[bytearray][6] - scope-19
    |   |
    |   Cast[chararray] - scope-23
    |   |
    |   |---Project[bytearray][7] - scope-22
    |   |
    |   Cast[chararray] - scope-26
    |   |
    |   |---Project[bytearray][8] - scope-25
    |
    |---fd: Load(/datalake/algo/load_test/flight_info/data/flightdelays_clean:PigStorage(',')) - scope-0--------
Global sort: false
----------------

MapReduce node scope-95
Map Plan
fd: Local Rearrange[tuple]{tuple}(false) - scope-101
|   |
|   Constant(all) - scope-100
|
|---New For Each(false,false,false)[tuple] - scope-99
    |   |
    |   Project[int][0] - scope-96
    |   |
    |   Project[int][1] - scope-97
    |   |
    |   Project[int][2] - scope-98
    |
    |---Load(hdfs://wn1.kara:8020/tmp/temp-426788593/tmp1465223968:org.apache.pig.impl.builtin.RandomSampleLoader('org.apache.pig.impl.io.InterStorage','100')) - scope-94--------
Reduce Plan
Store(hdfs://wn1.kara:8020/tmp/temp-426788593/tmp947085863:org.apache.pig.impl.io.InterStorage) - scope-112
|
|---New For Each(false)[tuple] - scope-111
    |   |
    |   POUserFunc(org.apache.pig.impl.builtin.FindQuantiles)[tuple] - scope-110
    |   |
    |   |---Project[tuple][*] - scope-109
    |
    |---New For Each(false,false)[tuple] - scope-108
        |   |
        |   Constant(-1) - scope-107
        |   |
        |   Project[bag][1] - scope-103
        |
        |---Package(Packager)[tuple]{chararray} - scope-102--------
Global sort: false
Secondary sort: true
----------------

MapReduce node scope-114
Map Plan
fd: Local Rearrange[tuple]{tuple}(false) - scope-115
|   |
|   Project[int][0] - scope-29
|   |
|   Project[int][1] - scope-30
|   |
|   Project[int][2] - scope-31
|
|---Load(hdfs://wn1.kara:8020/tmp/temp-426788593/tmp1465223968:org.apache.pig.impl.io.InterStorage) - scope-113--------
Reduce Plan
Store(hdfs://wn1.kara:8020/tmp/temp-426788593/tmp-2133027146:org.apache.pig.impl.io.InterStorage) - scope-155
|
|---New For Each(true)[tuple] - scope-118
    |   |
    |   Project[bag][1] - scope-117
    |
    |---Package(LitePackager)[tuple]{tuple} - scope-116--------
Global sort: true
Quantile file: hdfs://wn1.kara:8020/tmp/temp-426788593/tmp947085863
----------------

MapReduce node scope-157
Map Plan
fd_weather_final: Store(fakefile:org.apache.pig.builtin.PigStorage) - scope-91
|
|---fd_weather_final: New For Each(false,false,false,false,false,false,false,false,false,false,false,false)[bag] - scope-90
    |   |
    |   Project[int][0] - scope-66
    |   |
    |   Project[int][1] - scope-68
    |   |
    |   Project[int][2] - scope-70
    |   |
    |   Project[int][3] - scope-72
    |   |
    |   Project[chararray][4] - scope-74
    |   |
    |   Project[int][5] - scope-76
    |   |
    |   Project[int][6] - scope-78
    |   |
    |   Project[chararray][7] - scope-80
    |   |
    |   Project[chararray][8] - scope-82
    |   |
    |   Project[int][12] - scope-84
    |   |
    |   Project[int][13] - scope-86
    |   |
    |   Project[int][14] - scope-88
    |
    |---fd_weather: MergeJoin[tuple] - scope-63
        |
        |---Load(hdfs://wn1.kara:8020/tmp/temp-426788593/tmp-2133027146:org.apache.pig.impl.io.InterStorage) - scope-156--------
Global sort: false
----------------

MapReduce node scope-119
Map Plan
Store(hdfs://wn1.kara:8020/tmp/temp-426788593/tmp-1054196594:org.apache.pig.impl.io.InterStorage) - scope-120
|
|---weather: New For Each(false,false,false,false,false,false)[bag] - scope-52
    |   |
    |   Cast[int] - scope-35
    |   |
    |   |---Project[bytearray][0] - scope-34
    |   |
    |   Cast[int] - scope-38
    |   |
    |   |---Project[bytearray][1] - scope-37
    |   |
    |   Cast[int] - scope-41
    |   |
    |   |---Project[bytearray][2] - scope-40
    |   |
    |   Cast[int] - scope-44
    |   |
    |   |---Project[bytearray][3] - scope-43
    |   |
    |   Cast[int] - scope-47
    |   |
    |   |---Project[bytearray][4] - scope-46
    |   |
    |   Cast[int] - scope-50
    |   |
    |   |---Project[bytearray][5] - scope-49
    |
    |---weather: Load(/datalake/algo/load_test/flight_info/data/weather:PigStorage(',')) - scope-33--------
Global sort: false
----------------

MapReduce node scope-122
Map Plan
weather: Local Rearrange[tuple]{tuple}(false) - scope-128
|   |
|   Constant(all) - scope-127
|
|---New For Each(false,false,false)[tuple] - scope-126
    |   |
    |   Project[int][0] - scope-123
    |   |
    |   Project[int][1] - scope-124
    |   |
    |   Project[int][2] - scope-125
    |
    |---Load(hdfs://wn1.kara:8020/tmp/temp-426788593/tmp-1054196594:org.apache.pig.impl.builtin.RandomSampleLoader('org.apache.pig.impl.io.InterStorage','100')) - scope-121--------
Reduce Plan
Store(hdfs://wn1.kara:8020/tmp/temp-426788593/tmp927207245:org.apache.pig.impl.io.InterStorage) - scope-139
|
|---New For Each(false)[tuple] - scope-138
    |   |
    |   POUserFunc(org.apache.pig.impl.builtin.FindQuantiles)[tuple] - scope-137
    |   |
    |   |---Project[tuple][*] - scope-136
    |
    |---New For Each(false,false)[tuple] - scope-135
        |   |
        |   Constant(-1) - scope-134
        |   |
        |   Project[bag][1] - scope-130
        |
        |---Package(Packager)[tuple]{chararray} - scope-129--------
Global sort: false
Secondary sort: true
----------------

MapReduce node scope-141
Map Plan
weather: Local Rearrange[tuple]{tuple}(false) - scope-142
|   |
|   Project[int][0] - scope-53
|   |
|   Project[int][1] - scope-54
|   |
|   Project[int][2] - scope-55
|
|---Load(hdfs://wn1.kara:8020/tmp/temp-426788593/tmp-1054196594:org.apache.pig.impl.io.InterStorage) - scope-140--------
Reduce Plan
Store(hdfs://wn1.kara:8020/tmp/temp-426788593/tmp-318607618:org.apache.pig.impl.io.InterStorage) - scope-146
|
|---New For Each(true)[tuple] - scope-145
    |   |
    |   Project[bag][1] - scope-144
    |
    |---Package(LitePackager)[tuple]{tuple} - scope-143--------
Global sort: true
Quantile file: hdfs://wn1.kara:8020/tmp/temp-426788593/tmp927207245
----------------

MapReduce node scope-148
Map Plan
Local Rearrange[tuple]{tuple}(false) - scope-150
|   |
|   Project[tuple][*] - scope-149
|
|---Load(hdfs://wn1.kara:8020/tmp/temp-426788593/tmp-318607618:org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MergeJoinIndexer('org.apache.pig.impl.io.InterStorage','eNrVVb1z1EYUf6fz2ZeLbWwCNIwLT4B00oQqM+QDG+zJJYK7wW64Ks/SWiey0i6rldGlYIYGClooUmQmBSX/BJMidVKmYuipKcPb1Z1PPh82g5nMRIVG773d9/F77/30/DU0MgWf3cE9dHMdc3dNKRz4caaLB3+v/Pon/laHWhtmsvgXVkgAqN+bMW+6dFOoyEWJQZ+5Mo7cHQx+Zmno9jEUQrqsYAF5FClLozilI/1BFgfIfRww5UqOaeZ2h7ouSVA+NQecHiyQo87uGuftVObah4aQCUoNn/sU1CuDehTUixPJPZO4dyPnOr6B8kqh4OJEauaUDel2JFOohToYselDK9lUItkII5bdhftQp5jJj2yQaTjlG3SGQci/D3OJz3CPkW2pYjOgkXEm6UjrouHDbHJLCG2lWR8Wky2xqyfDzFvttqjqmklVLiShvTqtJNuxUeHDchwHaiYL0tgs7O3lcYO/x6xPtsbcPy/+OPfTX3VwNqHFBYabGBAwbfhE9xXL+oKHhfzuaun0XpNeS+arsDm1hob5fUONolw4FnZCtNLnH8CJQwI6C4RkGk6XYNL5yNvSKk6jK8Woqq/18BiFuX2SwaMppuoyMo9yojHsdJW4wwI9zm22B4txNlRTM9KwBy2xx5RBipFwVioRGEdptI5RZ3c7l5xlPThD3qkhW6TnzCrJ3IZmplHpa4LT9ASC50lK03O2Mj37e2fmd+djV7hxSDcuFSigf5KAoy0+7Hq+Bw0MgjyhjY7NJq9pbWKEbYPT3ZxWiIVdVMg543GWrEOrhG97IBkNBvIY7bwtkmAdaDg/SQEhavQs0rR9s/bUaOMWOGWLEdtWGDCl4YvJu5Klo+WtHCQ/y0LFVCqVKAI0lY9czolcVyK0JCqWakMnGrqT7ocweiWM3gSM3gEYPUuJXpUSKY+6MjRz/USOb1lIzVytHrug495ZEqF91XBpKumaa15lr2lXDSanAP6lpyXpsSCV/DFjuUMaLlo/yayVtVQ4ZB3mFdO5Src06jyjCSgn6CCddHbMHlOKzohQYD+5mk2uts+S5oLbTjWLmDr96vdnbx48+soxP8HGHvKcEYxL43M382SHqYfPn658+uTlY7NMNkBRTLo34vl3kqe1WviKQ6BZRfPAzUN8/MFmKJvkvI+XaaRv9AtDRL8xwpJVLZvXl8eMglGtHNEQI6+ar+loXj4Szcs2g/8xmt9OoHn9I6HpTEdz40g0N2wG/zmaxVtnqeLA','','null','scope','true')) - scope-147--------
Reduce Plan
Store(hdfs://wn1.kara:8020/tmp/temp-426788593/tmp-235592854:org.apache.pig.impl.io.InterStorage) - scope-154
|
|---New For Each(true)[bag] - scope-153
    |   |
    |   Project[tuple][1] - scope-152
    |
    |---Package(Packager)[tuple]{tuple} - scope-151--------
Global sort: false
----------------

2015-11-22 15:48:58,474 [main] INFO  org.apache.pig.Main - Pig script completed in 7 seconds and 414 milliseconds (7414 ms)

