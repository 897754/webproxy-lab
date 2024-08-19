# Makefile for Proxy Lab 
#
# You may modify this file any way you like (except for the handin
# rule). Your instructor will type "make" on your specific Makefile to
# build your proxy from sources.

CC = gcc
CFLAGS = -g -Wall
LDFLAGS = -lpthread

# Default target
all: proxy

# Proxy targets
csapp.o: csapp.c csapp.h
	$(CC) $(CFLAGS) -c csapp.c

proxy.o: proxy.c csapp.h
	$(CC) $(CFLAGS) -c proxy.c

proxy: proxy.o csapp.o
	$(CC) $(CFLAGS) proxy.o csapp.o -o proxy $(LDFLAGS)

# Target to build echoserver and echoclient
echo:
	$(CC) $(CFLAGS) -o echoserveri echoserveri.c csapp.c echo.c
	$(CC) $(CFLAGS) -o echoclient echoclient.c csapp.c

# Creates a tarball in ../proxylab-handin.tar that you can then
# hand in. DO NOT MODIFY THIS!
handin:
	(make clean; cd ..; tar cvf $(USER)-proxylab-handin.tar proxylab-handout --exclude tiny --exclude nop-server.py --exclude proxy --exclude driver.sh --exclude port-for-user.pl --exclude free-port.sh --exclude ".*")

clean:
	rm -f *~ *.o proxy echoserveri echoclient core *.tar *.zip *.gzip *.bzip *.gz
