
echo "" > source_file.txt
a=1

while [ $a -lt $1 ]
do
a=`expr $a + 1`
echo `date +"%y-%m-%d %T %N"` >> source_file.txt
done
