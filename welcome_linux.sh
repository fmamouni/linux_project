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
Customer Ziocode: $ZIPCODE" >> Customer$F_NAME$L_NAME.txt
# If returning customer
elif [ $status -eq 2 ]; then
echo " Welcome back!  Let us retrieve your data"
read -p " Would you please confirm your first name >> " F_NAME
read -p " Would you please confirm your last name? >> " L_NAME
read -p " PLease confirm your zipcode >>" ZIPCODE
fi
# Zipcode
#Do we want to charge a delivery fee?
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
elif [ $DELIVERY -eq 1 ]; then 
echo " Thank you for confirming $F_NAME, YOur order will be ready in the next 10 min. Let's get you start your order"
fi
fi
fi
# Menu
echo " -*-*-*-*-*-*-*-*"
echo " Let's get you started $F_NAME"
echo " -*-*-*-*-*-*-*-*"
echo "
1: Pizza
2: Wings
3: Pasta
4: Dessert
5: Drinks
6: Sauce"
read  -p " Please choose your order number (1-6) from the list above >>" CHOICE
if [ $CHOICE -eq 1 ]; then
echo " Great choice $F_NAME. At xx pizza you may choose one of our signature pizza or build your own" 
echo "-------------------------"
echo " Our xx signature pizza comes with your choice of crust, crust flavor, and classic marinara"
echo " size           Slices          Price        Order number"
echo "........................................................."
echo " Personal        4 slices        $ 5.5            1       "
echo " Medium          8 slices        $ 8.5            2       "
echo " Large           8 slices        $ 10.5           3       "
echo " XX signature pizza toppings:
- Cheese (mozzarella cheese)
- Pepperoni
- Supreme (peperoni, sausage, mushroom, red onion, green bell peppers, mediterranean black olives)
- Meat lovers
- Veggie lovers"
read -p " Would you like one of our signature pizza? 1 for yes and 2 for no? >>" SIGNATURE
if [ $SIGNATURE -eq 1 ]; then 
#Define price for signature pizza
personal=5.50
medium=8.50
large=10.50
read -p " please choose your pizza topping >>" topping
read -p " please choose your pizza size 
1 for personal
2 for medium
3 for large >>" pizza_size
if [ $pizza_size -eq 1 ]; then
subtotal=5.5
elif [ $pizza_size -eq 2 ]; then
subtotal=8.5
elif [$pizza_size -eq 3 ]; then 
subtotal=10.50
fi
fi
fi
#crust choice
echo " Please choose your crust choice
1 stuffed crust
2 Original Pan 
3 Hand Tossed
4 Thin Crust
5 Deep dish" 
read -p " Please chosse your crust preferance >>"  CRUST
# Crust flavor
echo " Please choose your crust flavor
1 no flavor
2 Garlic buttery blend
3 Cohort 3 favorite
4 Toasted paresan"
read -p " Please choose our crust flavor preferance (1-4) >>" FLAVOR
echo " Thank you , $F_NAME! YOur order so far is $pizza_size $topping pizza, $Flavor $CRUST. Is that correct?"  
#payment
#printf "$"; echo "scale=2; ((250/100)*$subtotal)+$subtotal | bc-l"
