// Author: Kuldeep Aher
// Date: 2024-08-05

#include <stdio.h>
#include <syslog.h>



int main(int argc, char *argv[]){
    openlog(NULL, 0, LOG_USER);
	if (argc != 3){
		syslog(LOG_ERR, "Error: 2 arrguments expected as [filesdir] [searchstr] but were not provided.");
        closelog();
		return 1;
	}
	
	const char *writefile = argv[1];
	const char *writestr = argv[2];


    // write to file
	FILE *fp;
	fp = fopen(writefile, "w");
	if (fp == NULL){
		syslog(LOG_ERR,"Error: Failed to create file %s.", writefile);
        closelog();
		return 1;
	}
	fprintf(fp, "%s\n", writestr);
	syslog(LOG_DEBUG, "Writing '%s' to %s", writestr, writefile);
    closelog();
	fclose(fp);

	return 0;
}
