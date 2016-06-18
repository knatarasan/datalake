
a=1

while [ $a -lt $1 ]
do
a=`expr $a + 1`
echo `date +"%y-%m-%d %T %N"`
done
