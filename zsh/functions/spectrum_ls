# Show all 256 colors with color number
# Pass custom test, or defaults to Test
#function spectrum_ls() {
  txt="The quick brown fox jumps over the lazy dog"
  if (( $# > 0)); then
    txt=$1
  fi
  for code in {000..255}; do
    print -P -- "$code: %F{$code}$txt%f"
  done
#}
