if [ -z "$1" ]
  then port=8000
else
    port=$1
fi
stop=0

trap 'stop=1' SIGINT
echo "Press CTRL+C to quit"
while ((stop!=1))
do
    res=`fuser -n tcp $port`
    if [ ${#res} == 0 ]
        then
            #echo "Port not in use";
            /path/to/python  /path/to/manage.py runserver
    #else
        #echo "Port in use: $res"
    fi
    sleep 1
done
