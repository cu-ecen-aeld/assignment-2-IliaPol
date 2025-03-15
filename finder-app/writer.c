#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    openlog("writer", LOG_PID, LOG_USER);
    
    if (argc != 3) {
        syslog(LOG_ERR, "Invalid Number of Arguments. Should be 2");
        closelog();
        return 1;
    }
    
    char *writefile = argv[1];
    char *writestr = argv[2];
    
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Failed to open file: %s", writefile);
        closelog();
        return 1;
    }
    
    fprintf(file, "%s\n", writestr);
    fclose(file);
    
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
    
    closelog();
    return 0;
}

