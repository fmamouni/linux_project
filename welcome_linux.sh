#!/bin/bash
# -------------------------------------------------
#creators: Andrea, Fatine, Danny, Lera
#--------------------------------------------------
#--------------------------------------------------
#sudo apt install figlet
#--------------------------------------------------
# Define the total function
clear
main_menu(){
echo " This is the list of offerings in our menu:" | lolcat
echo "
1. Signature Pizza
2. Build your own Pizza 
3. Wings 
4. Pasta 
5. Dessert
6. Drinks 
7. Sauce
8. Checkout" |lolcat
read -p "Please choose your order number (1-8) from the list above: " CHOICE
}
checkout(){
printf "The subtotal will be: %5s$total \n" "$" | lolcat
tax=$( printf "%0.2f\n" $(echo "scale=2; $total*0.025" | bc))
printf "The Tax will be: %11s$tax  \n" "$" | lolcat
grand_total=$(echo "scale=2; $total+$tax" | bc)
printf " The grand total for your order will be: %2s$grand_total \n" "$" | lolcat
echo "---------------------------------------------"
tput blink
echo "---------------------------------------------" | lolcat
echo " Payment Options:" | lolcat
echo " --------------------------------------------" | lolcat
tput sgr0
echo " Please confirm if you prefer to pay cash or credit card."
read -p " Type 1 for cash and 2 for credit card: " payment
if [[ $payment -eq 1 ]]; then
echo " Thank you for confirming. Please have your cash ready" | lolcat
elif [[ $payment -eq 2 ]]; then
read -p " Please enter your credit card number: "  credit number
read -p " Please enter your card's expiration year: " ex_year
read -p " Please enter your card's expiration month: " ex_month
read -p " Please enter your CVV 3 numbers in the back of your card: " cvv
fi
sleep 2
echo "-----------------------------------------------" | lolcat
echo " $F_NAME, It was our pleasure serving you! We hope you enjoy your order. See you back soon!" | lolcat
}
cancel(){
while true
do
 read -p "Would you like to go back to main menu or checkout?
1. Main menu
2. Checkout: " cancel
if [ $cancel -eq 1 ]; then
main_menu
elif [ $cancel -eq 2 ]; then
break
checkout
fi
done
}
#Calculating the total
functionCounter=0
total=0
while true
do
accumulate(){
((functionCounter++))
echo $((total += $1))
    }
accumulate $subtotal
done
# -------------------------------------------------
# Define arrays for price
#--------------------------------------------------
build_pizza_size_price=(10 13 15)
signature_pizza_size_price=(6 9 10)
wings_size_price=(6 12 16 19 21)
pasta_size_price=(6 7 9)
Dessert_size_price=(3 4 5)
Drink_size_price=(2 3 4)

#--------------------------------------------------
#Welcome and customer input
#--------------------------------------------------
tput bold
tput blink
figlet Welcome to FLAD Pizza! -f banner | lolcat
tput sgr0
#-------------------------------------------------
#Welcome message
#-------------------------------------------------
tput bold
tput setaf 4
printf "\n"
echo " We are glad to have you join us. Please help answer the below questions: " | lolcat 
tput sgr0
read -p " Please enter your first name: " F_NAME
read -p " Please enter your last name: " L_NAME
read -p " Please enter your email address: " EMAIL
read -p " Please enter your city: " CITY
read -p " Please enter your phone number: " PHONE
read -p " Please enter your street address: " STREET
cowsay -f tux We deliver to zipcode range 22211 and 24500 | lolcat 
read -p " Please enter your zipcode: " ZIPCODE
echo "----------------------------------------------" | lolcat
echo "----------------------------------------------" | lolcat
clear
# Zipcode
#cowsay -f tux We deliver to zipcode range 22211 and 24500 | lolcat 
echo " $F_NAME, please confirm if you prefer to pick up your order or have it delivered." | lolcat
read -p "Type 1 for pick up or 2 for delivery: "  DELIVERY
if [ $DELIVERY -eq 2 ]; then  
if [ $ZIPCODE -ge 22211 ] && [ $ZIPCODE -le 24500 ]; then 
echo "----------------------------------------------" 
sleep 3
echo "Thank you for confirming, Your order will be ready and delivered to $ADDRESS $CITY $ZIPCODE in 15 min" 
elif [ $ZIPCODE -lt 22211 ] || [ $ZIPCODE -gt 24500 ]; then
read -p " We are sorry, Our services don't cover the zipcode area $ZIPCODE. Please confirm if you prefer to pick up your order. Please select 1 to pick up your order or 2 to cancel the order >> " PICKUP
if [ $PICKUP -eq 2 ]; then 
echo "-----------------------------------------------"
sleep 3
echo " Sorry to see you leave. We hope to see you back soon. If you change your mind, check out our menu below:"
elif [ $PICKUP -eq 1 ]; then 
sleep 3
echo "-----------------------------------------------"
echo " Awesome, Thank you for confirming $F_NAME. Your order will be ready in 15 min. "
elif [ $DELIVERY -eq 1 ]; then 
echo " Awesome. Your order will be ready in 10 min."
elif [ $DELIVERY -eq 1 ]; then 
echo " Thank you for confirming $F_NAME, Your order will be ready in the next 10 min."
fi
fi
fi
# Menu
sleep 1
tput sgr0
tput blink
echo " -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-" | lolcat
echo " Let us get you started, $F_NAME." 
tput blink
echo " -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-" | lolcat
while true
 do
main_menu
#while [ "$choice" -eq 1 ]
#do
if [ $CHOICE -eq 1 ]; then
echo " Great choice $F_NAME. At FLAD pizza you may choose one of our signature pizza or build your own"

echo "--------------------------------------------------------" 
echo " Our FLAD signature pizza comes with your choice of crust, crust flavor, and classic marinara"
tput blink
echo "---------------------------------------------------------" | lolcat
echo " size           Slices          Price        Order number" | lolcat
echo "........................................................." | lolcat
tput sgr0
echo " Personal        4 slices        $ 6            1       "
echo " Medium          8 slices        $ 9            2       "
echo " Large           8 slices        $ 10           3       "
echo " "
echo "--------------------------------------------------------"
#read -p " Would you like one of our signature pizza? 1 for yes and 2 for no?: " SIGNATURE
#if [ $SIGNATURE -eq 1 ]; then 
echo "--------------------------------------------------------" | lolcat
echo " FLAD signature pizza toppings: " | lolcat
echo "--------------------------------------------------------" | lolcat
echo "1- Cheese (mozzarella cheese)" | lolcat
echo "2- Pepperoni" | lolcat
echo "3- Supreme (peperoni, sausage, mushroom, red onion, green bell peppers, mediteranean" | lolcat
echo "4- Meat lovers" | lolcat
echo "5- Veggie lovers" | lolcat
echo "0- cancel order" | lolcat
read -p "Please choose your pizza topping (1-5): " topping
if [ $topping -eq 0 ]; then
cancel
fi
echo " "
#crust choice
echo " We offer a variety of crust options:" 
tput blink
echo "---------------------------------------------" | lolcat
echo " Crust options" | lolcat
echo "---------------------------------------------" | lolcat
tput sgr0
 echo " 
 1. stuffed crust
 2. Original Pan 
 3. Hand Tossed
 4. Thin Crust
 5. Deep dish 
 0. cancel order" | lolcat
read -p " Please choose your crust preferance: " SIGNATURE_CRUST
if [ $SIGNATURE_CRUST -eq 0 ]; then
cancel
fi
echo " "
# Crust flavor
echo "We offer a variety of crust flavors:"
tput blink
echo "----------------------------------------------" | lolcat
echo " Crust Flavor" | lolcat
tput blink
echo " ---------------------------------------------" | lolcat
tput sgr0
echo " 
 1. no flavor
 2. Garlic buttery blend
 3. FLAD pizza favorite
 4. Toasted paresan
 0. Cancel order" | lolcat
read -p "Please choose your crust flavor preferance from the list above: " SIGNATURE_FLAVOR
if [ $SIGNATURE_FLAVOR -eq 0 ]; then
cancel
fi
echo " "
tput blink
echo "----------------------------------------------" | lolcat
echo "Signature Pizza size:" | lolcat
echo "----------------------------------------------" | lolcat
tput sgr0
echo "1 for personal" | lolcat
echo "2 for medium" | lolcat
echo "3 for large: " | lolcat
echo " 0 to cancel" | lolcat
read -p "Please choose your signature pizza size: " signature_pizza_size
if [ $signature_pizza_size -eq 0 ]; then
cancel
elif [[ $signature_pizza_size == "1" ]]; then
subtotal=${signature_pizza_size_price[0]}
elif [[ $signature_pizza_size == "2" ]]; then
subtotal=${signature_pizza_size_price[1]}
elif [[ $signature_pizza_size == "3" ]]; then
subtotal=${signature_pizza_size_price[2]}
fi
accumulate $subtotal
# Go back to main menu for additional order
read -p "Would you like to go for an additional order? Type 1 for yes or 2 for no: "  additional_order
if [ $additional_order -eq 1 ]; then
main_menu
elif [ $additional_order -eq 2 ]; then
checkout
break
fi
clear
#------------------------------------------
# Build your own pizza
#------------------------------------------
echo " "
elif [ $CHOICE -eq 2 ]; then
#elif [ $SIGNATURE -eq 2 ]; then
echo " ------------------------------------"
echo " Let us have you build your own pizza" 
echo " All create your own pizza come with your choice of crust type, up to
3 toppings, crust flavor, and your personal choice of cheese. "
tput sgr0
tput blink
echo "---------------------------------------------------------" | lolcat
echo " size           Slices          Price        Order number" | lolcat
echo "........................................................." | lolcat
tput sgr0
echo " Personal        4 slices        $ 10            1       " | lolcat
echo " Medium          8 slices        $ 13            2       " | lolcat
echo " Large           8 slices        $ 15            3       " | lolcat
#-------------------------------------------------------------
#Build your own pizza crust types
#-------------------------------------------------------------
echo " "
tput blink
echo "--------------------------------------------------------" | lolcat
echo " Crust choice:" | lolcat
echo " -------------------------------------------------------" | lolcat
tput sgr0
echo "
1. Stuffed crust
2. Original Pan 
3. Hand Tossed
4. Thin Crust
5. Deep dish  
0. Cancel" | lolcat
read -p " Please choose your crust preferance: " CRUST
if [ $CRUST -eq 0 ]; then
cancel
fi
#-------------------------------------------------------------
# Crust flavor
#-------------------------------------------------------------
tput blink
echo "--------------------------------------------------------" | lolcat
echo " Crust flavor" | lolcat
echo " -------------------------------------------------------" | lolcat
tput sgr0
echo "
1. no flavor
2. Garlic buttery blend
3. FLAD favorite
4. Toasted parmesan
0. Cancel" | lolcat
read -p " Please choose your crust flavor: " CRUST_FLAVOR
if [ $CRUST_FLAVOR -eq 0 ]; then
cancel
fi

#-----------------------------------------------------------
#toppings
#-----------------------------------------------------------
tput blink
echo "------------------------------------------------------" | lolcat
echo " Toppings:" | lolcat
echo "------------------------------------------------------" | lolcat
tput sgr0
echo "
1. Mushrooms
2. Red Onions
3. Mediterranean black olives
4. Jalapeno Peppers
5. Banana peppers
6. Pinaples
7. Roma tomatoes
8. Spinach
9. Artichoke hearts
10.Anchovies
11.Ham
12.Sausage
13.Grilled chicken
14.Pepperoni
0. Cancel" | lolcat
#counter=1
echo " Kindly choose up to three toppings." | lolcat
tput sgr0
read -p "Please choose your first topping: " topping1
read -p " Please choose your second topping: " topping2
read -p " Please choose your third topping: " topping3
#toppings=(Red_Onions Mediterranean_black_olives Jalapeno Banana_peppers Pinaple  Roma_tomatoes spinach Artichoke_heart Anchovies Ham Sausage Grilled_chicken Pepperoni) 
#for t in ${toppings[@]} 
if [ $topping1 -eq 0 ]; then
cancel
elif [ $topping2 -eq 0 ]; then
cancel
elif [ $topping3 -eq 0 ]; then
cancel
fi
#echo "$counter.$"
#((counter++))
#done
echo " "
tput blink
echo "--------------------------------------------" | lolcat
echo " pizza size"  | lolcat
echo "--------------------------------------------" | lolcat
tput sgr0
echo " 
1. Personal
2. Medium
3. Large
0. Cancel" | lolcat
read -p " Please select your built pizza size: " build_pizza_size
if [ $build_pizza_size -eq 0 ]; then
cancel
elif [[ $build_pizza_size == "1" ]]; then
subtotal=${build_pizza_size_price[0]}
elif [[ $build_pizza_size == "2" ]]; then
subtotal=${build_pizza_size_price[1]}
elif [[ $build_pizza_size == "3" ]]; then
subtotal=${build_pizza_size_price[2]}
fi
accumulate $subtotal
#------------------------------------------------
# GO to main menu for additional order
#------------------------------------------------
read -p " Would you like to go for an additional order? Type 1 for yes or 2 for no >> " additional_order
if [ $additional_order -eq 1 ]; then
main_menu
elif [ $additional_order -eq 2 ]; then
checkout
break
fi
clear
#-----------------------------------------------
#-----------------------------------------------
# Side menu 
#-----------------------------------------------
#-----------------------------------------------
# Wings 
#-----------------------------------------------
elif [ $CHOICE -eq 3 ]; then
echo " Great choice $F_NAME. Our wings come in different flavors:"
echo " "
tput blink
echo "----------------------------------------" | lolcat
echo " Wings Flavors:" | lolcat
echo "----------------------------------------" | lolcat
sleep 2
tput sgr0
echo "
1. Traditional mild
2. Sweet and sour
3. BBQ
4. Spicy
5. Soy sauce
0. Cancel" | lolcat
read -p " Please choose your flavor of wings: " wings
if [ $wings -eq 0 ]; then
cancel
fi

#-----------------------------------------------
# Wings size
#-----------------------------------------------
echo " Now that you have chosen your wings flavor, let's choose the size of your order. Please select from the below list"
echo " "
tput blink
echo "------------------------------------------" | lolcat
echo " Wings size: " | lolcat
echo " -----------------------------------------" | lolcat
tput sgr0
echo "
1. 6 pieces $ 6
2. 12 pieces $ 12
3. 18 pieces $ 16
4. 20 pieces $ 19
5. 24 pieces $ 21
0. Cancel " | lolcat
read -p " Please choose the size of wings that you would like from (1-5): " wings_size
if [ $wings_size -eq 0 ]; then
cancel
elif [[ $wings_size == "1" ]]; then
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
#--------------------------------------------------
#GO to main menu for additional order
#--------------------------------------------------
read -p "Would you like to go for an additional order? Type 1 for yes or 2 for no: " additional_order
if [ $additional_order -eq 1 ]; then
main_menu
elif [ $additional_order -eq 2 ]; then
checkout
break
fi
clear
#-------------------------------------------------
# Pasta 
#-------------------------------------------------
elif [ $CHOICE -eq 4 ]; then
echo " "
echo " Great choice $F_NAME."
echo " Our pasta is the best!! These are the different pasta options: "
tput blink
echo " -------------------------------------------" | lolcat
echo " Pasta Flavors:" | lolcat
echo " -------------------------------------------" | lolcat
tput sgr0
echo "
1. Creamy Mushroom with Shrimp
2. Baked Chicken with Alfredo Sauce
3. Meatball with red onion
4. Ham with olives
5. Italian Sausage
0. Cancel" | lolcat
read -p "Please choose your favorite Pasta from (1-5): " pasta
if [ $pasta -eq 0 ]; then
cancel
fi

#-------------------------------------------------
#pasta size
#-------------------------------------------------
echo " "
tput blink
echo "--------------------------------------------" | lolcat
echo " Pasta Size:" |lolcat
echo " -------------------------------------------"
tput sgr0
echo "
1. Small size $ 6
2. Medium Size $ 7
3. Large size $ 9
0. Cancel" | lolcat
read -p "Please choose the size of the bowl for your pasta: " pasta_size
if [ $pasta_size -eq 0 ]; then
cancel
elif [[ $pasta_size == "1" ]]; then
subtotal=${pasta_size_price[0]}
elif [[ $pasta_size == "2" ]]; then
subtotal=${pasta_size_price[1]}
elif [[ $pasta_size == "3" ]]; then
subtotal=${pasta_size_price[2]}
fi
accumulate $subtotal
# GO  to main menu for additional order
read -p "Would you like to go for an additional order? Type 1 for yes or 2 for no:  " additional_order
if [ $additional_order -eq 1 ]; then
main_menu
elif [ $additional_order -eq 2 ]; then
break
fi
clear
#-------------------------------------------------
# Dessert
#-------------------------------------------------
elif [ $CHOICE -eq 5 ]; then
echo " "
echo " Great choice $F_NAME! There is always a craving for sweets"
tput blink
echo " -------------------------------------------" | lolcat
echo " Dessert Options:" | lolcat
echo " -------------------------------------------" | lolcat
tput sgr0
echo " 
1. Chocolate Chip Cookies
2. Cinnamon Mini Sticks
3. Garlic Butter Sticks
4. Apple Pie
5. Ice cream sundae
0. Cancel" | lolcat
read -p "Please choose your favorite dessert: " Dessert
if [ $Dessert -eq 0 ]; then
cancel
fi
echo " "
tput blink
echo "--------------------------------------------" | lolcat
echo "Dessert size: " | lolcat
echo "--------------------------------------------" | lolcat
tput sgr0
echo "
1. Small size $ 3
2. Medium size $ 4
3. Large size $ 5
0. Cancel" | lolcat
read -p "Please choose the dessert size: " Dessert_size
if [ $Dessert_size -eq 0 ]; then
cancel
elif [[ $Dessert_size == "1" ]]; then
subtotal=${Dessert_size_price[0]}
elif [[ $Dessert_size == "2" ]]; then
subtotal=${Dessert_size_price[1]}
elif [[ $Dessert_size == "3" ]]; then
subtotal=${Dessert_size_price[2]}
fi
accumulate $subtotal
# GO  to main menu for additional order
read -p "Would you like to go for an additional order? Type 1 for yes or 2 for no: " additional_order
if [ $additional_order -eq 1 ]; then
main_menu
elif [ $additional_order -eq 2 ]; then
checkout
break
fi
clear
# Drink
elif [ $CHOICE -eq 6 ]; then
echo " "
echo " Great choice $F_NAME."
tput blink
echo "------------------------------------------" | lolcat
echo "Drink options:" | lolcat
echo "------------------------------------------" | lolcat
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
9 Spring water
0 Cancel" | lolcat
read -p "Please choose your drink: " Drink
if [ $Drink -eq 0 ]; then
cancel
fi
# Drink 
echo " "
tput blink
echo "-------------------------------------------" | lolcat
echo "Drink size:" | lolcat
echo "-------------------------------------------" | lolcat
tput sgr0
echo "
1 Small 8.oz $ 2
2 Medium 16.oz $ 3
3 Large 20.0z $ 4
0 Cancel"| lolcat
read -p "Please choose the size of drink: " Drink_size
if [ $Drink_size -eq 0 ]; then
cancel
elif [[ $Drink_size == "1" ]]; then
subtotal=${Drink_size_price[0]}
elif [[ $Drink_size == "2" ]]; then
subtotal=${Drink_size_price[1]}
elif [[ $Drink_size == "3" ]]; then
subtotal=${Drink_size_price[2]}
fi
accumulate $subtotal
# GO  to main menu for additional order
read -p "Would you like to go for an additional order? Type 1 for yes or 2 for no:  " additional_order
if [ $additional_order -eq 1 ]; then
main_menu
elif [ $additional_order -eq 2 ]; then
checkout
break
fi

clear
#Sauce
sauce=(Classic_Marinara Buffalo Creamy_Garlic_Parmesan Barbeque)
elif [ $CHOICE -eq 7 ]; then
echo " "
echo " Sauces are the secret to our authenticity. The more you get from them the better, $F_NAME.
This is the list of our sauce options" | lolcat
tput blink
echo " -------------------------------------------" | lolcat
echo " Sauce Options:" | lolcat
echo "--------------------------------------------" | lolcat
tput sgr0
echo "
1. Classic Marinara
2. Buffalo
3. Creamy Garlic Parmesan
4. Barbeque
0. Cancel" | lolcat
echo " Sauce comes at an additional cost of $ 2.00 " | lolcat
read -p " Do you want some sauce? Select 1 for or 0 for no: " sauce
if [ $sauce -eq 0 ]; then
cancel
elif [[ $sauce -eq 1 ]]; then
read -p " Please confirm your choice of sauce (1-4): " sauce
subtotal=2
fi
accumulate $subtotal
# GO  to main menu for additional order
read -p "Would you like to go for an additional order? Type 1 for yes or 2 for no: " additional_order
if [ $additional_order -eq 1 ]; then
main_menu
elif [ $additional_order -eq 2 ]; then
checkout
break
fi
clear
elif [ $CHOICE -eq 8 ]; then
checkout
break
fi
done
#Calculating the total
#functionCounter=0
 #total=0
 #w#hile true
 #do
 #accumulate(){
 #((functionCounter++))
 # echo $((total += $1))
   #read -p " Would you like to go for additional order?" Additional
  #if [[ $additional -eq 2 ]]; then 
  #brea
 #}
 #accumulate $subtotal
 #done

#accumulate $subtotal
#printf "The subtotal will be: %5s$total \n" "$"
#tax=$( printf "%0.2f\n" $(echo "scale=2; $total*0.025" | bc))
#printf "The Tax will be: %11s$tax  \n" "$"
#grand_total=$(echo "scale=2; $total+$tax" | bc)
#printf " The grand total for your order will be: %2s$grand_total \n" "$"
#Payment options
#echo "----------------------------------------------"
#echo "----------------------------------------------"
#echo " Payment Options:"
#echo " ---------------------------------------------"
#read -p " Please confirm if you prefer to pay cash or credict card. Type 1 for cash and 2 for credit card: " payment
#if [[ $payment -eq 1 ]]; then
#echo " Thank you for confirming. Please have your cash ready"
#elif [[ $payment -eq 2 ]]; then
#read -p " Please enter your credit card number: " credit number
#read -p " Please enter your card's expiration year: " ex_year
#read -p " Please enter your card's expiration month: " ex_month
#read -p " Please enter your CVV (3 numbers in the back of your card: " cvv
#fi
#echo " $F_NAME, It was our pleasure serving you! We hope you enjoy your order and see you back soon!!" | lolcat

