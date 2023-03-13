for tar_file in *.tar; do
  dir_name="${tar_file%%.*}"
  mkdir -p "$dir_name"
  mv "$tar_file" "$dir_name"
  tar -xf "$dir_name/$tar_file" -C "$dir_name"
done

