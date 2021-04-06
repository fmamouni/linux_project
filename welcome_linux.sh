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
clear
# If returning customer
elif [ $status -eq 2 ]; then
echo " Welcome back!  Let us retrieve your data"
read -p " Would you please confirm your first name >> " F_NAME
read -p " Would you please confirm your last name? >> " L_NAME
read -p " PLease confirm your zipcode >>" ZIPCODE
#cat Customer$F_NAME$L_NAME.txt
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
fi
# Menu
echo " -*-*-*-*-*-*-*-*"
echo " Let's get you started $F_NAME"
echo " -*-*-*-*-*-*-*-*"
while true;  
do
echo "This is the list of offerings in our menu:
1. Pizza
2. Wings
3. Pasta
4. Dessert
5. Drinks
6. Sauce"
read -p "Please choose your order number (1-6) from the list above >>" CHOICE
if [ $CHOICE -eq 1 ]; then
echo " Great choice $F_NAME. At xx pizza you may choose one of our signature pizza or build your own"
clear 
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
clear
read -p " please choose your pizza topping >>" topping
read -p " please choose your pizza size 
1 for personal
2 for medium
3 for large >>" signature_pizza_size
if [ $signature_pizza_size -eq 1 ]; then
signature_pizza_size_price=5.5
elif [ $signature_pizza_size -eq 2 ]; then
signature_pizza_size_price=8.5
elif [$signature_pizza_size -eq 3 ]; then 
signature_pizza_size_price=10.50
fi
clear
#crust choice
 echo " We offer a variety of crust options: 
 1. stuffed crust
 2. Original Pan 
 3. Hand Tossed
 4. Thin Crust
 5.Deep dish" 
 read -p " Please chosse your crust preferance >>"  CRUST
clear 
# Crust flavor
 echo "We offer a variety of crust flavors:
 1. no flavor
 2. Garlic buttery blend
 3. Cohort 3 favorite
 4. Toasted paresan"
 read -p " Please choose our crust flavor preferance (1-4) >>" FLAVOR
 echo " Thank you, $F_NAME!"
echo "......"
# Go back to main menu for additional order
read -p "Do you like to go for a additional order? Type 1 for yes or 2 for no >>"
if [ $additional_order -eq 2 ]; then
break
fi
clear
# Build your own pizza
elif [ $SIGNATURE -eq 2 ]; then
echo " ---------------------"
echo " Let us have you build your own pizza" 
echo " All create your own pizza come with your choice of crust type, up to 3 toppings (any extra topping would be at an additional $ 1.25), crust flavor, and your personal choice of cheese. "
echo " size           Slices          Price        Order number"
echo "........................................................."
echo " Personal        4 slices        $ 10.00            1       "
echo " Medium          8 slices        $ 13.00            2       "
echo " Large           8 slices        $ 15.00            3       "
read -p " Please select your pizza size >>" build_piza_size
#if [ $build_pizza_size -eq 1 ]; then
#build_pizza_size_price=10.00
#elif [ $build_pizza_size -eq 2 ]; then
#build_pizza_size_price=13.00
#elif [ $build_pizza_size -eq 3 ]; then
#build_pizza_size_price=15.00
#fi
#Build your own pizza crust types
echo " Crust choice:
1. stuffed crust
2. Original Pan 
3. Hand Tossed
4. Thin Crust
5. Deep dish" 
read -p " Please chosse your crust preferance >>"  CRUST
# Crust flavor
echo " Crust flavor
1 no flavor
2 Garlic buttery blend
3 Cohort 3 favorite
4 Toasted paresan"
read -p " Please choose your crust flavor >>" CRUST
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
# GO to main menu for additional order
read -p " do you like to go for a additional order? Type 1 for yes or 2 for no >>" additional_order
if [ $additional_order -eq 2 ]; then
break
fi
# Side menu 
# Wings 
elif [ $CHOICE -eq 2 ]; then
echo " Great choice $F_NAME. Our wings come in different flavors:
1. Traditional mild
2. Sweet and sour
3. BBQ
4. Spicy
5. Soy sauce"
read -p " Please choose your flavor of wings >>" wings
echo "Now that you have chosen $wings flavor, let's choose the size of your order. Please select from the below list:
wings size:
1. 6 pieces $ 6.99
2. 12 pieces $ 12.99
3. 18 pieces $ 16.99
4. 20 pieces $ 18.99
5. 24 pieces $ 20.99"
read -p " Please choose the size of wings that you would like >>" wings_size
if [ $wings_size -eq 1 ]; then
wings_size_price=6.99
elif [ $wings_size -eq 2 ]; then
wings_size_price=12.99
#elif [ $wings_size -eq 3 ]; then
#wings_size_price=16.99
elif [ $wings_size -eq 4 ]; then
wings_size_price=18.99
elif [ $wings_size -eq 5 ]; then
wings_size_price=20.99
fi
#GO to main menu for additional order
read -p " do you like to go for a additional order? Type 1 for yes or 2 for no >> " additional_order
if [ $additional_order -eq 2 ]; then
break
fi
# Pasta 
elif [ $CHOICE -eq 3 ]; then
echo " Great choice $F_NAME."
echo " Our pasta is the best!! These are the different pasta options: 
1. Creamy Mushroom with Shrimp
2. Bake Chicken with Alfredo Sauce
3. Meatball with red onion
4. Ham with olives
5. Italian Sausage"
read -p "Please choose your favorite Pasta >>" pasta
echo "pasta size:
1. Small size $ 6.99
2. Large size $ 8.99"
read -p "Please choose the size of the bowl for your pasta >>" pasta_size
if [ $pasta_size -eq 1 ]; then
pasta_size_price=6.99
elif [ $pasta_size -eq 2 ]; then
pasta_size_price=8.99
fi
# GO  to main menu for additional order
read -p " do you like to go for a additional order? Type 1 for yes or 2 for no >>" additional_order
if [ $additional_order -eq 2 ]; then
break
fi
# Dessert
elif [ $CHOICE -eq 4 ]; then
echo " Great choice $F_NAME."
echo "Dessert options: 
1 Chocolate Chip Cookies
2 Cinnamon Mini Sticks
3 Garlic Butter Sticks
4. Apple Pieces
5. Ice cream sundae"
read -p "Please choose your favorite dessert" Dessert
echo "Dessert size: 
1 Small size $ 2.99
2 Medium size $ 3.99
3 Large size $ 4.99"
read -p "Please choose the dessert size" Dessert_size
if [ $Dessert_size -eq 1 ]; then
Dessert_size_price=2.99
elif [ $Dessert_size -eq 2 ]; then
Dessert_size_price=3.99
elif [ $Dessert_size -eq 3 ]; then
Dessert_size_price=4.99
fi
# GO  to main menu for additional order
read -p " do you like to go for a additional order? Type 1 for yes or 2 for no >>" additional_order
if [ $additional_order -eq 2 ]; then
break
fi
# Drink
elif [ $CHOICE -eq 5 ]; then
echo " Great choice $F_NAME."
echo "Drink options:
1 Coca cola
2 Pepsi
3 Sprite
4 Mountain Dew
5 Dr. Pepper
6 Orange Juice
7 Apple Juice
8 Ice Tea
9 Spring water"
read -p "Please choose your drink" Drink
# Drink 
echo "Drink size:
1 Small 8.oz $ 1.29
2 Medium 16.oz $ 1.99
3 Large 20.0z $ 2.10"
read -p "Please choose the size of drink" Drink_size
if [ $Drink_size -eq 1 ]; then
Drink_size_price=1.29
elif [ $Drink_size -eq 2 ]; then
Drink_size_price=1.99
elif [ $Drink_size -eq 3 ]; then
Drink_size_price=2.10
fi
# GO  to main menu for additional order
read -p " do you like to go for a additional order? Type 1 for yes or 2 for no >>" additional_order
if [ $additional_order -eq 2 ]; then
break
fi
#Sauce
sauce=(Classic_Marinara Buffalo Creamy_Garlic_Parmesan Barbeque)
elif [ $CHOICE -eq 6 ]; then
echo " Sauces are the secret to our authenticity. The more you get from them the better, $F_NAME.
This is the list of our sauce options, they are $ 2.00 each 
1. Classic Marinara
2. Buffalo
3. Creamy Garlic Parmesan
4. Barbeque"
read -p " Please confirm your choice of sauce >> " sauce
subtotal_Sauce=2
fi
# GO  to main menu for additional order
read -p " do you like to go for a additional order? Type 1 for yes or 2 for no" additional_order
if [ $additional_order -eq 2 ]; then
break
fi
done
#payment
#printf "$"; echo "scale=2; ((250/100)*$subtotal)+$subtotal | bc-l"
#price= $subtotal; echo $(($subtotal*25/100))
#echo $price
#single order
#variable initiation arrays for prices of each menu item
total=0
build_pizza_size_price=(10.00 13.00 15.00)
signature_pizza_size_price=(5.50 8.50 10.50)
wings_size_price=(6.99 12.00 16.99 18.99 20.99)
pasta_size_price=(6.99 8.99)
Dessert_size_price=(2.99 3.99 4.99)
Drink_size_price=(1.29 1.99 2.10)
#conditions statement for single order:
#build your own pizza
if [[ $build_pizza_size == "1" ]]; then
build_pizza_size_price=${build_pizza_size_price[0]}
elif [[ $build_pizza_size == "2" ]]; then
build_pizza_size_price=${build_pizza_size_price[1]}
elif [[ $build_pizza_size == "3" ]]; then
build_pizza_size_price=${build_pizza_size_price[2]}
fi
#signature pizza
if [[ $signature_pizza_size == "1" ]]; then
signature_pizza_size_price=${signature_pizza_size_price[0]}
elif [[ $signature_pizza_size == "2" ]]; then
signature_pizza_size_price=${signature_pizza_signature_price[1]}
elif [[ $signature_pizza_size == "3" ]]; then
signature_pizza_size_price=${signature_pizza_signature_price[2]}
fi
#Wings
if [[ $wings_size == "1" ]]; then
wings_size_price=${wings_size_price[0]}
elif [[ $signature_pizza_size == "2" ]]; then
wings_size_price=${wings_size_price[1]}
elif [[ $signature_pizza_size == "3" ]]; then
wings_size_price=${wings_size_price[2]}
elif [[ $signature_pizza_size == "4" ]]; then
wings_size_price=${wings_size_price[3]}
elif [[ $signature_pizza_size == "5" ]]; then
wings_size_price=${wings_size_price[4]}
fi
#pasta
if [[ $pasta_size == "1" ]]; then
pasta_size_price=${pasta_size_price[0]}
elif [[ $pasta_size == "2" ]]; then
pasta_size_price=${pasta_size_price[1]}
fi
#Dessert
if [[ $Dessert_size == "1" ]]; then
Dessert_size_price=${Dessert_size_price[0]}
elif [[ $Dessert_size == "2" ]]; then
Dessert_size_price=${Dessert_size_price[1]}
elif [[ $Dessert_size == "3" ]]; then
Dessert_size_price=${Dessert_size_price[2]}
fi
#Drink
if [[ $Drink_size == "1" ]]; then
Drink_size_price=${Drink_size_price[0]}
elif [[ $Drink_size == "2" ]]; then
Drink_size_price=${Drink_size_price[1]}
elif [[ $Drink_size == "3" ]]; then
Drink_size_price=${Drink_size_price[2]}
fi
#Calculating the total
total=$(echo "scale=2; $build_pizza_size_price+$signature_pizza_size_price+$wings_size_price+$pasta_size_price+$Dessert_size_price+$Drink_size_price" | bc)
echo $total




