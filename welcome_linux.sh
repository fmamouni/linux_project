#!/bin/bash
#Welcome and customer input
echo "welcome to xx pizza!!"
read -p "Please confirm whether you are new or a returning customer
 1 New costumer or 2 Returning customer >> " status
if [ $status -eq 1 ]; then 
echo " we are glad to have you join our community. Please help answer the below question"  
read -p " Please enter your first name. >>" F_NAME
read -p " Please enter your last name. >>" L_NAME
read -p " Please enter your email addres. >>s" EMAIL
read -p " Please enter your street addres. >>" STREET
read -p " Please enter your zipcode. >>" ZIPCODE
read -p " please enter your city. >>" CITY
read -p "Please enter your phone number. >>" PHONE
sudo useradd $F_NAME$L_NAME
sudo passwd $F_NAME$L_NAME
chage $F_NAME$L_NAME
if [ $status -eq 2 ]; then
sudo useradd $F_NAME$L_NAME
sudo passwd $F_NAME$L_NAME


