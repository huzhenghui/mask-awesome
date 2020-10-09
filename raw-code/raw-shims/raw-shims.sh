if [ "${#}" -ne 2 ];
then
    exit 1;
fi
if [ "${1}" != "-c" ];
then
    exit 2;
fi
echo "${2}"