sqoop import --connect jdbc:mysql://wn1.kara/dw_sourcing --username dw_sourcing --password dw_sourcing --table d_Item --split-by item_id --target-dir /datalake/algo/load_test/dw/d_Item

sqoop import --connect jdbc:mysql://wn1.kara/dw_sourcing --username dw_sourcing --password dw_sourcing --table f_Invoice --split-by item_id --target-dir /datalake/algo/load_test/dw/f_Invoice
