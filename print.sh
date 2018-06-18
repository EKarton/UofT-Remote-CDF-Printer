#!/bin/bash

# Environment variables
UTOR_ID="<YOUR_UTORID>"
END_POINT="teach.cs.utoronto.ca"
REMOTE_PRINTJOBS_FOLDER="~/Desktop/PrintJobs"
PRINTER="<A_UOFT_PRINTER>"

ssh "$UTOR_ID"@"$END_POINT" bash -c "'
	# Make the PrintJobs folder if it does not exist
	if ! [ -d "$REMOTE_PRINTJOBS_FOLDER" ]; then
		mkdir "$REMOTE_PRINTJOBS_FOLDER"
		echo "Making new folder under $REMOTE_PRINTJOBS_FOLDER"
	fi

	# Remove all print job files in the folder
	rm -rf "$REMOTE_PRINTJOBS_FOLDER"/*
	echo "Removed all files under $REMOTE_PRINTJOBS_FOLDER"
'"

# Send files to be printed to the folder
rsync -avP -e ssh --exclude="print.sh" --exclude="desktop.ini" * "$UTOR_ID"@"$END_POINT":"$REMOTE_PRINTJOBS_FOLDER"
echo "Sent all files (except print.sh and desktop.ini) to $REMOTE_PRINTJOBS_FOLDER"

# Print the files
ssh "$UTOR_ID@$END_POINT" bash -c "'
	# print -P $PRINTER "$REMOTE_PRINTJOBS_FOLDER/*"
	echo "Printed all files except for print.sh and desktop.ini to printer $PRINTER"
	lpq -P "$PRINTER"
	pquota
'"

# Remove all files in the folder
read -p "Printing is complete. Press ENTER to finish up the printing process."
shopt -s extglob
rm -v !("print.sh"|"desktop.ini")
echo "Cleaning complete!"
