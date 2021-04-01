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
read -p " please enter your city. >>" CITY
read -p "Please enter your phone number. >>" PHONE
read -p " Please enter your street addres. >>" STREET
read -p " Please enter your zipcode. >>" ZIPCODE

#Create a specific text for that specific customer
echo " Customer first name: $F_NAME
Customer last name: $L_NAME
Customer email address: $EMAIL
Customer phone number: $PHONE
Customer Street address: $ADDRESS, $CITY
Customer Ziocode: $ZIPCODE" >> CustomerF_NAME$L_NAME.txt
# If returning customer
elif [ $status -eq 2 ]; then
echo " Welcome back!  Let us retrieve your data"
read -p " Would you please confirm your first name >> " F_NAME
read -p " Would you please confirm your last name? >> " L_NAME
read -p " PLease confirm your zipcode >>" ZIPCODE
fi
# Zipcode
read -p " $F_NAME, please confirm if you would like to pick up your order or have it delivered. Type 1 for pick up or 2 for delivery >>"  DELIVERY
if [ $DELIVERY -eq 2 ]; then  
if [ $ZIPCODE -ge 11111 ] && [ $ZIPCODE -le 14500 ]; then 
echo "Thank you for confirming, Your order will be ready and delivered to $ADDRESS, $CITY, $ZIPCODE in 15 min" 
elif [ $ZIPCODE -lt 11111 ] || [ $ZIPCODE -gt 14500 ]; then 
echo " We are sorry, Our services don't cover the zipcode area $ZIPCODE. Please confirm if you prefer to pick up your order. Please select 1 to pick up your order or 2 to cancel the order >> " PICKUP
if [ $PICKUP -eq 2 ]; then 
echo " Sorry to see you leave. We hope to see you back soon" 
elif [ $PICKUP -eq 1 ]; then 
echo " Awesome, let's get you started with your order. "
elif [ $DELIVERY -eq 1 ]; then 
echo " Awesome. Your order will be ready in 10 min. Let's get you started with your order!"
fi
fi
fi
# Menu


