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
 echo " Thank you , $F_NAME! YOur order so far is $pizza_size $topping pizz>"
fi
fi
fi
# Build your own pizza
if [ $SIGNATURE -eq 2 ]; then
echo :" ---------------------"
echo " Let us have you build your own pizza" 
echo " All create your own pizza come with your choice if crust type, up to 3 toppings ( any extra topping would be at an additional $ 1.25), crust flavor, and your personal choice of cheese. "
echo " size           Slices          Price        Order number"
echo "........................................................."
echo " Personal        4 slices        $ 10.00            1       "
echo " Medium          8 slices        $ 13.00            2       "
echo " Large           8 slices        $ 15.00            3       "
read -p " Please select your pizza size >>" piza_size
#Build your own pizza crust types
echo " Crust choice:
  1 stuffed crust
  2 Original Pan 
 3 Hand Tossed
 4 Thin Crust
 5 Deep dish" 
 read -p " Please chosse your crust preferance >>"  CRUST
 # Crust flavor
 echo " Crust flavor
 1 no flavor
 2 Garlic buttery blend
 3 Cohort 3 favorite
 4 Toasted paresan"
read - p " Please choose your crust flavor >>" CRUST
echo " Toppings:
1 Mushrooms
2 Red Onions
3 Mediterranean black olives
4 Jalapeno Peppers
5 Banana peppers
6 Pinaples
7 Roma tomatoes
8 Spinach
9 Artichoke hearts
10 Anchovies
11 Ham
12 Sausage
13  Grilled chicken
14 Pepperoni"
counter=1
read -p "Please choose  up to 3 toppings >>" toppings
toppings=(Red_Onions Mediterranean_black_olives Jalapeno Banana_peppers Pinaple  Roma_tomatoes spinach Artichoke_heart Anchovies Ham Sausage Grilled_chicken Pepperoni) 
for t in ${toppings[@]} 
do 
echo "$counter.$t"
((counter++))
done
fi
#payment
#printf "$"; echo "scale=2; ((250/100)*$subtotal)+$subtotal | bc-l"
# Side menu 
# Wings: 
echo "wings"
read -p " Please choose your flavor of wings >>" wings
echo "
1 Traditional mild
2 Sweet and sour
3 BBQ
4 Spicy
5 Soy sauce"
echo " wings size"
read -p " Please choose the size of wings that you would like >>" size
echo "
1 6 piece $ 6.99
2 12 piece $ 12.99
3 18 piece $ 16.99
4 20 piece $ 18.99
5 24 piece $ 20.99"
if [ $size -eq 1 ]; then
subtotal=6.99
elif [ $size -eq 2 ]; then
subtotal=12.99
elif [ $size -eq 3 ]; then
subtotal=16.99
elif [ $size -eq 4 ]; then
subtotal=18.99
elif [ $size -eq 5 ]; then
subtotal=20.99
fi
# Pasta 
echo "Pasta"
read -p "Please choose your favorite Pasta >>" pasta
echo "
1. Creamy Mushroom with Shrimp
2. Bake Chicken with Alfredo Sauce
3. Meatball with red onion
4. Ham with olives
5. Italian Sausage"
echo "pasta size"
read -p "Please choose the size of the bowl for your pasta >>" pasta_size
echo "
1. Small size $ 6.99
2. Large size $ 8.99"
if [ $pasta_size -eq 1 ]; then
subtotal=6.99
elif [ $pasta_size -eq 2 ]; then
subtotal=8.99
fi
# Dessert
echo "Dessert"
read -p "Please choose your favorite dessert" Dessert
echo "
1 Chocolate Chip Cookies
2 Cinnamon Mini Sticks
3 Garlic Butter Sticks
4 Apple Pie
5 Ice cream sundae"
echo "Dessert size"
read -p "Please choose the dessert size" Dessert_size
echo "
1 Small size $ 2.99
2 Medium size $ 3.99
3 Large size $ 4.99"
if [ $Dessert_size -eq 1 ]; then
subtotal=2.99
elif [ $Dessert_size -eq 2 ]; then
subtotal=3.99
elif [ $Dessert_size -eq 3 ]; then
subtotal=4.99
fi
# Drink
echo "Drink"
read -p "Please choose your drink" Drink
echo "
1 Coca cola
2 Pepsi
3 Sprite
4 Mountain Dew
5 Dr. Pepper
6 Orange Juice
7 Apple Juice
8 Ice Tea
9 Spring water"
# Drink 
echo "Drink size"
read -p "Please choose the size of drink" Drink_size
echo "
1 Small 8.oz $ 1.29
2 Medium 16.oz $ 1.99
3 Large 20.0z $ 2.10"
if [ $Drink_size -eq 1 ]; then
subtotal=1.29
elif [ $Drink_size -eq 2 ]; then
subtotal=1.99
elif [ $Drink_size -eq 3 ]; then
subtotal=2.10
fi
#
