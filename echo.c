#include "csapp.h"

void echo(int connfd)
{
    size_t n;
    char buf[MAXLINE];
    rio_t rio;

    Rio_readinitb(&rio, connfd);
    while((n = Rio_readlineb(&rio, buf, MAXLINE)) != 0) {
        Fputs(buf, stdout);
        Fgets(buf, MAXLINE, stdin);
        Rio_writen(connfd, buf, strlen(buf));
    }
}