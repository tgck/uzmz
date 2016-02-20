#include <stdio.h>
#include "unistd.h"

#define INTERVAL 1

/* 
 http://kougaku-navi.net/c_technique/index.html#anime
 */
int main(int argc, char* args[])
{
    while (1) {
		fprintf(stderr, "1234567890\r");
		sleep(INTERVAL);
		fprintf(stderr, "*         \r");
		sleep(INTERVAL);
		fprintf(stderr, " *        \r");
		sleep(INTERVAL);
		fprintf(stderr, "  *       \r");
		sleep(INTERVAL);
		fprintf(stderr, "   *      \r");
		sleep(INTERVAL);
		fprintf(stderr, "    *     \r");
		sleep(INTERVAL);
		fprintf(stderr, "     *    \r");
		sleep(INTERVAL);
		fprintf(stderr, "      *   \r");
		sleep(INTERVAL);
		fprintf(stderr, "       *  \r");
		sleep(INTERVAL);
		fprintf(stderr, "        * \r");
		sleep(INTERVAL);
		fprintf(stderr, "         *\r");
		sleep(INTERVAL);
		fprintf(stderr, "          \r");
		sleep(INTERVAL);
    }
}
