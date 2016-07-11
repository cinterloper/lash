generate_task_id () {
  $(echo $1|encode_chars_hex)$( printf "%x" $(( 70368744177664 - $(get_n_rand_bits 45) )))
}
