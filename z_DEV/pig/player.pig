p = load 'Players.csv' using PigStorage(',') as (player:chararray,school:chararray,rank:int,city:chararray,sal:int,married:chararray);

pa = load 'PlayerAwards.csv' using PigStorage(',') as (Year:int,player:chararray,school:chararray,trophy:chararray,class:chararray,pos:chararray);

p_pa = join p by player,pa by player using 'replicated';

p_pa = limit p_pa 10;

store p_pa into 'p_pa' using PigStorage(',');
