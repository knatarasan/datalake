fd = load '/user/horton/flightdelays_clean' using PigStorage(',');

fd_grp = group fd all;

fd_cnt = foreach fd_grp generate COUNT(fd);


store fd_cnt into '/user/horton/cleaned_total' using PigStorage(',');
