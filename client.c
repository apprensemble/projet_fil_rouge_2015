#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/socket.h>

int main (int argc, char *argv[]) {
int mon_socket;
mon_socket = socket(AF_INET , SOCK_STREAM , 0);

if (mon_socket == -1) {
  printf("impossible de creer ton socket de merde");

}
return 0;

}
