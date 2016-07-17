encode_chars_hex( )
{
 while read -N 1 char; do printf "%02x" "'$char"; done
}

