#!/bin/sh

#location of the txt file of usernames
userfile=./userlist.txt

#get usernames from the file one-by-one
usernames=$(cat ./userlist | tr 'A-Z'  'a-z')

#running loop to add users and insert password
for user in $usernames
do
    password="$user""123"
    useradd -m $user
    echo $user:$password | chpasswd
done
