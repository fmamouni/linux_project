#!/bin/bash
#variable initiation arrays for prices of each menu item
build_pizza_size_price=(10.00 13.00 15.00)
signature_pizza_size_price=(5.50 8.50 10.50)
wings_size_price=(6.99 12.00 16.99 18.99 20.99)
pasta_size_price=(6.99 8.99)
Dessert_size_price=(2.99 3.99 4.99)
Drink_size_price=(1.29 1.99 2.10)
#conditions statement for single order:
#build your own pizza
if [ $build_pizza_size -eq 1 ]; then
build_pizza_size_price=${build_pizza_size_price[0]}
elif [ $build_pizza_size -eq 2 ]; then
build_pizza_size_price=${build_pizza_size_price[1]}
elif [ $build_pizza_size -eq 3 ]; then
build_pizza_size_price=${build_pizza_size_price[2]}
fi
#signature pizza
if [ $signature_pizza_size -eq 1 ]; then
signature_pizza_size_price=${signature_pizza_size_price[0]}
elif [ $signature_pizza_size -eq 2 ]; then
signature_pizza_size_price=${signature_pizza_signature_price[1]}
elif [ $signature_pizza_size -eq 3 ]; then
signature_pizza_size_price=${signature_pizza_signature_price[2]}
fi
#Wings
if [ $wings_size -eq 1 ]; then
wings_size_price=${wings_size_price[0]}
elif [ $signature_pizza_size -eq 2 ]; then
wings_size_price=${wings_size_price[1]}
elif [ $signature_pizza_size -eq 3 ]; then
wings_size_price=${wings_size_price[2]}
elif [ $signature_pizza_size -eq 4 ]; then
wings_size_price=${wings_size_price[3]}
elif [ $signature_pizza_size -eq 5 ]; then
wings_size_price=${wings_size_price[4]}
fi
#pasta
if [ $pasta_size -eq 1 ]; then
pasta_size_price=${pasta_size_price[0]}
elif [ $pasta_size -eq 2 ]; then
pasta_size_price=${pasta_size_price[1]}
fi
#Dessert
if [ $Dessert_size -eq 1 ]; then
Dessert_size_price=${Dessert_size_price[0]}
elif [ $Dessert_size -eq 2 ]; then
Dessert_size_price=${Dessert_size_price[1]}
Dessert_size_price=${Dessert_size_price[1]}
elif [ $Dessert_size -eq 3 ]; then
Dessert_size_price=${Dessert_size_price[2]}
fi
#Drink
if [ $Drink_size -eq 1 ]; then
Drink_size_price=${Drink_size_price[0]}
elif [ $Drink_size -eq 2 ]; then
Drink_size_price=${Drink_size_price[1]}
elif [ $Drink_size -eq 3 ]; then
Drink_size_price=${Drink_size_price[2]}
fi
#Calculating the total
total=$(echo "scale=2; $build_pizza_size_price+$signature_pizza_size_price+$wi>


