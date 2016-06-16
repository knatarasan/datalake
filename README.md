# datalake
Repository to store best practices on Big DATA Tools and techniques



dw--
    --ingest
      --data
        /source_table_name.dat
	--log
		sqoop logs
    --etl
    --presentation


Hadoop file system    
    
/apps/dw
        --ingest
        --etl
        --presentation



#ingestion
	1. source data ingested by one of the channel sqoop
	2. Flat file loaded into an external table
	3. The same loaded into final stage table
	Eg:
		1. em_erp.em_mara is ingested using 
			$sqoop import --connect jdbc:mysql://wn1.kara/em_erp --username em_erp --password em_erp --table em_mara --target-dir /apps/dw/ingest/data/em_mara
		2. Table ingest.em_mara_stg is created with above data
		3. Data loaded into ingest.em_mara





Follow this link to get tips for Readme Markup

https://github.com/tchapi/markdown-cheatsheet/blob/master/README.md
