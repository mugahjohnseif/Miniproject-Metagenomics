```
#!/bin/bash

################################################################################
# Script Name: downloading_script.sh
# Description: For downloading SRA data using prefetch and converting to fastq using fasterq-dump.
# Author(s): Latifa, Brian, Joseph
# Date: December 1, 2023
# Version: 1.0
# Usage: bash downloading_script.sh
################################################################################

#Specify tool versions
prefetch_version="3.0.9"
fasterq_version="3.0.9"

# Specify the list of SRA accessions in a file
accession_file="sra_accessions.txt"

# Output folders
prefetch_output_folder="prefetch_results"
fasterq_output_folder="fasterq_results"

# Create the output folders
mkdir -p "$prefetch_output_folder" "$fasterq_output_folder"

# Loop through the list in the file and perform actions
for accession in $(cat "$accession_file"); do
    echo "Processing $accession..."

    # Use prefetch to download SRA data to a specific folder
    prefetch "$accession" -O "$prefetch_output_folder"
    echo "Downloading $accession..."

    # Use fasterq-dump to convert to fastq and save in a different folder
    fasterq-dump "$accession" -O "$fasterq_output_folder"

    echo "Processing completed for $accession"
done

```
