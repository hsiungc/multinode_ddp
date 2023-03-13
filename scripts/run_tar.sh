dir="train"
  
# Loop through all subdirectories within the specified directory
for subdir in "$dir"/*; do
  echo "Searching $subdir for tar files"
  # Find all .tar files within the subdirectory and delete them
  find "$subdir" -type f -name "*.tar" -delete
  echo "Deleted tar files in $subdir"
done

echo "Finished deleting tar files in all subdirectories"
