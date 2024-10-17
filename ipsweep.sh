#This is a comment and saying that this script is bash
#!/bin/bash

#This is a for loop. We execute the command for every ip in the given network. Thus the range is from 1-254
for ip in seq 1 254 ;do

#Ping the ip address. (-c 1):Ping one IP at a time  ($1.$ip): $1 will be user input. We will input the first 3. EX 192.24.1 and so for loop $ip will be 1. 192.24.1.1 will
#be pinged
#Grep "64 bytes" : If ip responde, te result will be 64 bytes from given ip.
#cut -d "" -f 4: It cuts the whole response with the delimiter (-d) whitespace ("") and picks the 4th term (-f 4) from it
#tr -d ":" We pass colon(:) as delimiter and tr command deletes it  (&):Allows the thread to work simultaneously
# | (pipe) joins all the above command as a single command
ping -c 1 $1.$ip | grep "64 bytes" | cut -d "" -f 4 | tr -d ":" &
done
