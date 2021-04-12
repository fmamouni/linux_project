#!/bin/bash
#-------------
#creators: Andrea, Fatine, Danny, Lera
#------------
#------------
#sudo apt install figlet
#-----------
# Define the total function
clear
functionCounter=0
#total=0
while true
do
accumulate(){
((functionCounter++))
echo $((total +=$1))
}
accumulate $subtotal
done
# -------
# Define arrays for price
build_pizza_size_price=(10 13 15)
signature_pizza_size_price=(6 9 10)
wings_size_price=(6 12 16 19 21)
pasta_size_price=(6 9)
Dessert_size_price=(3 4 5)
Drink_size_price=(2 3 4)
#----------------
#Welcome and customer input
#cowsay -f gnu Welcome to FLAD Pizza | lolcat
#tput setab 3
tput bold
tput blink
figlet Welcome to FLAD Pizza! -f banner | lolcat
tput sgr0
#echo "welcome to Flad" | lolcat 
tput bold
tput setaf 4
printf "\n"
echo " we are glad to have you join us. Please help answer the below questions: " | lolcat 
tput sgr0
read -p " Please enter your first name: " F_NAME
read -p " Please enter your last name: " L_NAME
read -p " Please enter your email address: " EMAIL
read -p " please enter your city: " CITY
read -p " Please enter your phone number: " PHONE
read -p " Please enter your street addres: " STREET
read -p " Please enter your zipcode: " ZIPCODE
echo "-------------" | lolcat
echo "-------------" | lolcat
# Zipcode
cowsay -f tux We deliver to zipcode range 22211 and 24500 | lolcat 
read -p " $F_NAME, please confirm if you prefer to pick up your order or have it delivered.
Type 1 for pick up or 2 for delivery: "  DELIVERY
if [ $DELIVERY -eq 2 ]; then  
if [ $ZIPCODE -ge 22211 ] && [ $ZIPCODE -le 24500 ]; then 
echo "------------" 
sleep 3
echo "Thank you for confirming, Your order will be ready and delivered to $ADDRESS, $CITY, $ZIPCODE in 15 min" 
elif [ $ZIPCODE -lt 22211 ] || [ $ZIPCODE -gt 24500 ]; then
read -p " We are sorry, Our services don't cover the zipcode area $ZIPCODE. Please confirm if you prefer to pick up your order. Please select 1 to pick up your order or 2 to cancel the order >> " PICKUP
if [ $PICKUP -eq 2 ]; then 
echo "---------"
sleep 3
echo " Sorry to see you leave. We hope to see you back soon"
elif [ $PICKUP -eq 1 ]; then 
sleep 3
echo "--------"
echo " Awesome, let's get you started with your order. "
elif [ $DELIVERY -eq 1 ]; then 
echo " Awesome. Your order will be ready in 10 min. Let's get you started with your order!"
elif [ $DELIVERY -eq 1 ]; then 
echo " Thank you for confirming $F_NAME, Your order will be ready in the next 10 min."
fi
fi
fi
# Menu
sleep 1
tput sgr0
tput blink
echo " -*-*-*-*-*-*-*-*" | lolcat
echo " Let us get you started, $F_NAME." 
tput blink
echo " -*-*-*-*-*-*-*-*" | lolcat
while true;  
do
echo "This is the list of offerings in our menu:
1. Pizza 
2. Wings 
3. Pasta 
4. Dessert
5. Drinks 
6. Sauce" |lolcat
read -p "Please choose your order number (1-6) from the list above: " CHOICE
if [ $CHOICE -eq 1 ]; then
echo " Great choice $F_NAME. At FLAD pizza you may choose one of our signature pizza or build your own"

echo "-------------------------" 
echo " Our FLAD signature pizza comes with your choice of crust, crust flavor, and classic marinara"
tput blink
echo "-------------------------------------------" | lolcat
echo " size           Slices          Price        Order number" | lolcat
echo "........................................................." | lolcat
tput sgr0
echo " Personal        4 slices        $ 6            1       "
echo " Medium          8 slices        $ 9            2       "
echo " Large           8 slices        $ 10           3       "
echo " "
echo "----------------"
read -p " Would you like one of our signature pizza? 1 for yes and 2 for no?: " SIGNATURE
if [ $SIGNATURE -eq 1 ]; then 
echo "-------------" | lolcat
echo " FLAD signature pizza toppings: " | lolcat
echo "--------------" | lolcat
echo "
1- Cheese (mozzarella cheese)
2- Pepperoni
3- Supreme (peperoni, sausage, mushroom, red onion, green bell peppers, medite>
4- Meat lovers
5- Veggie lovers" | lolcat
read -p "Please choose your pizza topping (1-5): " topping
echo " "
#crust choice
echo " We offer a variety of crust options:" 
tput blink
echo "------------" | lolcat
echo " Crust options" | lolcat
echo "------------" | lolcat
tput sgr0
 echo " 
 1. stuffed crust
 2. Original Pan 
 3. Hand Tossed
 4. Thin Crust
 5.Deep dish" | lolcat 
read -p " Please chosse your crust preferance: "  CRUST
echo " "
# Crust flavor
echo " We offer a variety of crust flavors:"
tput blink
echo "--------" | lolcat
echo " Crust Flavor" | lolcat
echo " --------" | lolcat
tput sgr0
echo " 
 1. no flavor
 2. Garlic buttery blend
 3. FLAD pizza favorite
 4. Toasted paresan" | lolcat
read -p "Please choose your crust flavor preferance from the list above: " FLAVOR
echo " "
tput blink
echo "---------" | lolcat
echo "Signature Pizza size:" | lolcat
echo "----------" | lolcat
tput sgr0
echo "1 for personal" | lolcat
echo " 2 for medium" | lolcat
echo " 3 for large: " | lolcat
read -p "Please choose your pizza size: " signature_pizza_size
if [[ $signature_pizza_size == "1" ]]; then
 subtotal=${signature_pizza_size_price[0]}
elif [[ $signature_pizza_size == "2" ]]; then
 subtotal=${signature_pizza_size_price[1]}
elif [[ $signature_pizza_size == "3" ]]; then
 subtotal=${signature_pizza_size_price[2]}
fi
 accumulate $subtotal
# Go back to main menu for additional order
read -p "Would you like to go for an additional order? Type 1 for yes or 2 for no: " 
if [ $additional_order -eq 2 ]; then
break
fi
#----------------------
# Build your own pizza
#---------------------
echo " "
elif [ $SIGNATURE -eq 2 ]; then
echo " ---------------------"
echo " Let us have you build your own pizza" 
echo " All create your own pizza come with your choice of crust type, up to 3 toppings, crust flavor, and your personal choice of cheese. "
tput sgr0
tput blink
echo "---------------------" |lolcat
echo " size           Slices          Price        Order number" | lolcat
echo "........................................................." | lolcat
tput sgr0
echo " Personal        4 slices        $ 10            1       " | lolcat
echo " Medium          8 slices        $ 13            2       " | lolcat
echo " Large           8 slices        $ 15            3       " | lolcat
#--------------------------------
#Build your own pizza crust types
#-------------------------------
echo " "
tput blink
echo "---------" | lolcat
echo " Crust choice:" | lolcat
echo " ------------" | lolcat
tput sgr0
echo "
1. stuffed crust
2. Original Pan 
3. Hand Tossed
4. Thin Crust
5. Deep dish" | lolcat 
read -p " Please choose your crust preferance: "  CRUST
#---------------------
# Crust flavor
#-------------------
tput blink
echo "---------" | lolcat
echo " Crust flavor" | lolcat
echo " ---------" | lolcat
tput sgr0
echo "
1 no flavor
2 Garlic buttery blend
3 Cohort 3 favorite
4 Toasted paresan" | lolcat
read -p " Please choose your crust flavor: " CRUST

#---------------
#toppings
#----------------
tput blink
echo "--------------" | lolcat
echo " Toppings:" | lolcat
echo "--------" | lolcat
tput sgr0
echo "
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
14 Pepperoni" | lolcat

#counter=1
#tput setaf4
echo " Kindly choose up to three toppings."
tput sgr0
read -p "Please choose your first topping: " topping1
read -p " Please choose your second topping: " topping2
read -p " Please choose your third topping: " topping3
#toppings=(Red_Onions Mediterranean_black_olives Jalapeno Banana_peppers Pinaple  Roma_tomatoes spinach Artichoke_heart Anchovies Ham Sausage Grilled_chicken Pepperoni) 
#for t in ${toppings[@]} 
#do 
#echo "$counter.$t"
#((counter++))
#done
fi
echo " "
tput blink
echo "--------------" | lolcat
echo " pizza size"  | lolcat
echo "----------" | lolcat
tput sgr0
echo " 
4. Personal-A
5. Medium
6. Large" | lolcat
read -p " Please select your pizza size: " build_pizza_size
if [[ $build_pizza_size == "4" ]]; then
subtotal=${build_pizza_size_price[0]}
elif [[ $build_pizza_size == "5" ]]; then
subtotal=${build_pizza_size_price[1]}
elif [[ $build_pizza_size == "6" ]]; then
subtotal=${build_pizza_size_price[2]}
fi
accumulate $subtotal

#-------------------------
# GO to main menu for additional order
#-------------------------
read -p " Wouldr you like to go for an additional order? Type 1 for yes or 2 for no >> " additional_order
if [ $additional_order -eq 2 ]; then
break
fi
clear
#------------
#-----------
# Side menu 
#-----------
#-----------
# Wings 
#-------
elif [ $CHOICE -eq 2 ]; then
echo " Great choice $F_NAME. Our wings come in different flavors:"
echo " "
tput blink
echo "----------" | lolcat
echo " Wings Flavors:" | lolcat
echo "------------" | lolcat
sleep 2
tput sgr0
echo "
1. Traditional mild
2. Sweet and sour
3. BBQ
4. Spicy
5. Soy sauce" | lolcat
read -p " Please choose your flavor of wings: " wings
#---------
# Wings size
#---------
echo " Now that you have chosen your wings flavor, let's choose the size of your order. Please select from the below list"
echo " "
tput blink
echo "--------" | lolcat
echo " Wings size: " | lolcat
echo " ---------" | lolcat
tput sgr0
echo "
1. 6 pieces $ 6
2. 12 pieces $ 12
3. 18 pieces $ 16
4. 20 pieces $ 19
5. 24 pieces $ 21 " | lolcat
read -p " Please choose the size of wings that you would like from (1-5): " wings_size
if [[ $wings_size == "1" ]]; then
subtotal=${wings_size_price[0]}
elif [[ $wings_size == "2" ]]; then
subtotal=${wings_size_price[1]}
elif [[ $wings_size == "3" ]]; then
subtotal=${wings_size_price[2]}
elif [[ $wings_size == "4" ]]; then
subtotal=${wings_size_price[3]}
elif [[ $wings_size == "5" ]]; then
subtotal=${wings_size_price[4]}
fi
accumulate $subtotal
#-----------------
#GO to main menu for additional order
#----------------
read -p "Wouldp you like to go for an additional order? Type 1 for yes or 2 for no: " additional_order
if [ $additional_order -eq 2 ]; then
break
fi
#----------
# Pasta 
#---------
elif [ $CHOICE -eq 3 ]; then
echo " "
echo " Great choice $F_NAME."
echo " Our pasta is the best!! These are the different pasta options: "
tput blink
echo " ---------------" | lolcat
echo " PastaFlavors:" | lolcat
echo " ---------" | lolcat
tput sgr0
echo "
1. Creamy Mushroom with Shrimp
2. Bake Chicken with Alfredo Sauce
3. Meatball with red onion
4. Ham with olives
5. Italian Sausage" | lolcat
read -p "Please choose your favorite Pasta from (1-5): " pasta
#---------
#pasta size
#----------
clear
echo " "
tput blink
echo "---------" | lolcat
echo " Pasta Size:" |lolcat
echo " ---------"
tput sgr0
echo "
1. Small size $ 6
2. Large size $ 9" | lolcat
read -p "Please choose the size of the bowl for your pasta >>" pasta_size
if [[ $pasta_size == "1" ]]; then
subtotal=${pasta_size_price[0]}
elif [[ $pasta_size == "2" ]]; then
subtotal=${pasta_size_price[1]}
fi
accumulate $subtotal
# GO  to main menu for additional order
read -p "Wouldm you like to go for an additional order? Type 1 for yes or 2 for no:  " additional_order
if [ $additional_order -eq 2 ]; then
break
fi
clear
#--------
# Dessert
#--------
elif [ $CHOICE -eq 4 ]; then
echo " "
echo " Great choice $F_NAME! There is always a craving for sweets"
tput blink
echo " ---------" | lolcat
echo " Dessert Options:" | lolcat
echo " ---------" | lolcat
tput sgr0
echo " 
1 Chocolate Chip Cookies
2 Cinnamon Mini Sticks
3 Garlic Butter Sticks
4. Apple Pieces
5. Ice cream sundae" | lolcat
read -p "Please choose your favorite dessert: " Dessert
echo " "
tput blink
echo "------------" | lolcat
echo "Dessert size: " | lolcat
echo "-------------" | lolcat
tput sgr0
echo "
1 Small size $ 3
2 Medium size $ 4
3 Large size $ 5" | lolcat
read -p "Please choose the dessert size: " Dessert_size
if [[ $Dessert_size == "1" ]]; then
subtotal=${Dessert_size_price[0]}
elif [[ $Dessert_size == "2" ]]; then
subtotal=${Dessert_size_price[1]}
elif [[ $Dessert_size == "3" ]]; then
subtotal=${Dessert_size_price[2]}
fi
accumulate $subtotal
# GO  to main menu for additional order
read -p "Woulds you like to go for an additional order? Type 1 for yes or 2 for no: " additional_order
if [ $additional_order -eq 2 ]; then
break
fi
clear
# Drink
elif [ $CHOICE -eq 5 ]; then
echo " "
echo " Great choice $F_NAME."
tput blink
echo "----------" | lolcat
echo "Drink options:" | lolcat
echo "---------" | lolcat
tput sgr0
echo "
1 Coca cola
2 Pepsi
3 Sprite
4 Mountain Dew
5 Dr. Pepper
6 Orange Juice
7 Apple Juice
8 Ice Tea
9 Spring water" | lolcat
read -p "Please choose your drink: " Drink
# Drink 
echo " "
tput blink
echo "----------" | lolcat
echo "Drink size:" | lolcat
echo "--------" | lolcat
tput sgr0
echo "
1 Small 8.oz $ 2
2 Medium 16.oz $ 3
3 Large 20.0z $ 4"| lolcat
read -p "Please choose the size of drink: " Drink_size
if [[ $Drink_size == "1" ]]; then
subtotal=${Drink_size_price[0]}
elif [[ $Drink_size == "2" ]]; then
subtotal=${Drink_size_price[1]}
elif [[ $Drink_size == "3" ]]; then
subtotal=${Drink_size_price[2]}
fi
accumulate $subtotal
# GO  to main menu for additional order
read -p "Wouldk you like to go for an additional order? Type 1 for yes or 2 for no:  " additional_order
if [ $additional_order -eq 2 ]; then
break
fi
clear
#Sauce
sauce=(Classic_Marinara Buffalo Creamy_Garlic_Parmesan Barbeque)
elif [ $CHOICE -eq 6 ]; then
echo " "
echo " Sauces are the secret to our authenticity. The more you get from them the better, $F_NAME.
This is the list of our sauce options"
tput blink
echo " --------" | lolcat
echo " Sauce Options:" | lolcat
echo "---------" | lolcat
tput sgr0
echo "
1. Classic Marinara
2. Buffalo
3. Creamy Garlic Parmesan
4. Barbeque" | lolcat
read -p " Do you want some sauce? Select 1 for yes and 2 for no" sauce
if [[ $sauce -eq 1 ]]; then
read -p " Please confirm your choice of sauce (1-4): " sauce
subtotal=2
fi
fi
accumulate $subtotal
# GO  to main menu for additional order
read -p "Wouldy you like to go for an additional order? Type 1 for yes or 2 for no: " additional_order
if [ $additional_order -eq 2 ]; then
break
fi
clear
done
#Calculating the total
printf "The subtotal will be: %5s$total \n" "$"
tax=$( printf "%0.2f\n" $(echo "scale=2; $total*0.025" | bc))
printf "The Tax will be: %11s$tax  \n" "$"
grand_total=$(echo "scale=2; $total+$tax" | bc)
printf " The grand total for your order will be: %2s$grand_total \n" "$"
#Payment options
echo "---------------"
echo "--------------"
echo " Payment Options:"
echo " ----------"
read -p " Please confirm if you prefer to pay cash or credict card. Type 1 for cash and 2 for credit card: " payment
if [[ $payment -eq 1 ]]; then
echo " Thank you for confirming. Please have your cash ready"
elif [[ $payment -eq 2 ]]; then
read -p " Please enter your credit card number: " credit number
read -p " Please enter your card's expiration year: " ex_year
read -p " Please enter your card's expiration month: " ex_month
read -p " Please enter your CVV (3 numbers in the back of your card: " cvv
fi
echo " $F_NAME, It was our pleasure serving you! We hope you enjoy your order and see you back soon!!" | lolcat
