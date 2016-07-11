get_n_rand_bits () #http://unix.stackexchange.com/a/157837 n must be in increments of 15 bits, <60
{
    local n=$1 rnd=$RANDOM rnd_bitlen=15;
    while (( rnd_bitlen < n )); do
        rnd=$(( rnd<<15|$RANDOM ));
        let rnd_bitlen+=15;
    done;
    echo $(( rnd>>(rnd_bitlen-n) ))
}

