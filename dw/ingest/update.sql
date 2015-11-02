update dw_sourcing.d_Item item join em_erp.em_mara_changed em_mara_changed
on item.material_number =em_mara_changed.MATNR
and item.eff_to_date='2999-12-31'
 set eff_to_date='2015-10-11';

