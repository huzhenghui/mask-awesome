if [ "${BASH_VERSINFO[0]}" -gt 4 ] || ([ "${BASH_VERSINFO[0]}" -eq 4 ] && [ "${BASH_VERSINFO[1]}" -ge 1 ])
then
source <("/usr/local/bin/starship" init bash --print-full-init)
else
source /dev/stdin <<<"$("/usr/local/bin/starship" init bash --print-full-init)"
fi