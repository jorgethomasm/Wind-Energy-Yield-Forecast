#!/bin/bash

echo "Updating wind power forecast..."
cd /home/app && /usr/local/bin/Rscript -e "renv::run('/home/app/test.R')"
echo "Finished."