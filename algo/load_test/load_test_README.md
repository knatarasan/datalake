Hadoop load test
----------------

22NOV2015
---------
pig

	i) select , group by

	ii) order
		Observed that pig uses 3 m-r jobs to achive sort

	iii)join 
		--replicated
		--sort-merge
		--map-side
		--hash-join (default)

refer logs from   https://github.com/knatarasan/datalake/tree/master/algo/load_test/flight_info/logs

23NOV2015
---------
	i) Load flight delays data into Hive 
		--Load csv file
		--then into orc table
		--play around 
			--with different file formats
			--different sql - group by, order by , sort by , window functions
			--various joins
	
			--partition by 
			--bucketed by

			--dynamic partition
			--explain
	





