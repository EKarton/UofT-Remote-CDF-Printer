## A shell script used to print documents at UofT!
This shell script aims to improve work productivity and take advantage of UofT's CS PoST printing benefits by printing documents with ease.

### Disclaimer: 
I have no responsibility over any damages or loss that may occur during the execution of or usage of my shell script.
Please note that I have developed and ran this shell script for UofT's downtown campus; thus, I have no guarantee on whether it works for other UofT campuses.

### How it works:
1. On your local machine, it sends all the documents on the folder with the shell script over to the UofT CS lab machines in the folder ~/Desktop/PrintJobs (if there is no such folder it will make one for you)
2. Then, on the UofT CS lab machines, it will print all the documents stored in $REMOTE_PRINTFOLDER to a printer named $PRINTER
3. Finally, on your local machine, it will delete all your documents in your folder with the shell script to indicate that it has finished printing.

### Pre-requisites:
You will need either:
- A windows machine with WSL (Windows Subsystem for Linux) installed, or
- A linux machine, or
- A Mac OS machine

### Installation:
Please follow the following instructions to help you run the shell script
1. Download the shell script, name it as print.sh and copy it to a dedicated printing folder (note that it must be an empty folder!)
2. Open the shell script and fill in the following values in <> located near the top of the file:
  a. Your UTOR ID
  b. A printer at UofT that supports printing from UofT's CS lab machines (my favourite is p2210a which is on the third floor of Bahen)

### Printing documents:
1. Put all the documents that you want to print from your local machine to the folder containing the shell script
2. Run the shell script (for Window users, open up bash and type print.sh)

### Credits:
The shell script was developed by Emilio Kartono 
