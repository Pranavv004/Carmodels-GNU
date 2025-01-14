% Car brands
brand(toyota).
brand(honda).
brand(ford).
brand(bmw).
brand(audi).
brand(mercedes).
brand(chevrolet).
brand(nissan).
brand(hyundai).
brand(kia).

% Car models
model(toyota, camry).
model(toyota, corolla).
model(honda, accord).
model(honda, civic).
model(ford, mustang).
model(ford, focus).
model(bmw, series3).
model(bmw, series5).
model(audi, a4).
model(audi, a6).
model(mercedes, c_class).
model(mercedes, e_class).
model(chevrolet, impala).
model(chevrolet, malibu).
model(nissan, altima).
model(nissan, maxima).
model(hyundai, elantra).
model(hyundai, sonata).
model(kia, optima).
model(kia, soul).

% Car types
type(camry, sedan).
type(corolla, sedan).
type(accord, sedan).
type(civic, sedan).
type(mustang, coupe).
type(focus, hatchback).
type(series3, sedan).
type(series5, sedan).
type(a4, sedan).
type(a6, sedan).
type(c_class, sedan).
type(e_class, sedan).
type(impala, sedan).
type(malibu, sedan).
type(altima, sedan).
type(maxima, sedan).
type(elantra, sedan).
type(sonata, sedan).
type(optima, sedan).
type(soul, hatchback).

% Fuel types
fuel(camry, diesel).
fuel(corolla, diesel).
fuel(accord, petrol).
fuel(civic, petrol).
fuel(mustang, petrol).
fuel(focus, petrol).
fuel(series3, diesel).
fuel(series5, diesel).
fuel(a4, diesel).
fuel(a6, diesel).
fuel(c_class, petrol).
fuel(e_class, petrol).
fuel(impala, petrol).
fuel(malibu, petrol).
fuel(altima, petrol).
fuel(maxima, petrol).
fuel(elantra, petrol).
fuel(sonata, petrol).
fuel(optima, petrol).
fuel(soul, petrol).

% Car origins
origin(toyota, japan).
origin(honda, japan).
origin(ford, usa).
origin(bmw, germany).
origin(audi, germany).
origin(mercedes, germany).
origin(chevrolet, usa).
origin(nissan, japan).
origin(hyundai, south_korea).
origin(kia, south_korea).

% Car prices (in thousands of dollars)
price(camry, 25).
price(corolla, 20).
price(accord, 26).
price(civic, 21).
price(mustang, 35).
price(focus, 19).
price(series3, 40).
price(series5, 55).
price(a4, 38).
price(a6, 50).
price(c_class, 41).
price(e_class, 54).
price(impala, 31).
price(malibu, 23).
price(altima, 24).
price(maxima, 34).
price(elantra, 19).
price(sonata, 22).
price(optima, 23).
price(soul, 18).

% Car years
year(camry, 2020).
year(corolla, 2019).
year(accord, 2021).
year(civic, 2020).
year(mustang, 2021).
year(focus, 2018).
year(series3, 2019).
year(series5, 2021).
year(a4, 2018).
year(a6, 2020).
year(c_class, 2021).
year(e_class, 2019).
year(impala, 2020).
year(malibu, 2019).
year(altima, 2021).
year(maxima, 2020).
year(elantra, 2019).
year(sonata, 2020).
year(optima, 2018).
year(soul, 2017).

% Rule to determine if a car is expensive
expensive(Model) :-
    price(Model, Price),
    Price > 30.

% Rule to determine if a car is a recent model (2020 or newer)
recent(Model) :-
    year(Model, Year),
    Year >= 2020.

% Rule to find cars from a specific brand
cars_of_brand(Brand, Model) :-
    model(Brand, Model).

% Rule to find cars of a specific type
cars_of_type(Type, Model) :-
    type(Model, Type).

% Rule to find cars by fuel type
cars_by_fuel(FuelType, Model) :-
    fuel(Model, FuelType).

% Rule to find cars by origin country
cars_by_origin(Country, Brand) :-
    origin(Brand, Country).

% Rule to find cars within a price range
cars_within_price_range(MinPrice, MaxPrice, Model) :-
    price(Model, Price),
    Price >= MinPrice,
    Price =< MaxPrice.

% Rule to find if the input is the cheapest car
cheapest_car(Model) :-
    price(Model, Price),
    \+ (price(_, OtherPrice), OtherPrice < Price).

% Rule to find if the input is the most expensive car
most_expensive_car(Model) :-
    price(Model, Price),
    \+ (price(_, OtherPrice), OtherPrice > Price).

% Rule to find the oldest car
oldest_car(Model) :-
    year(Model, Year),
    \+ (year(_, OtherYear), OtherYear < Year).

% Rule to find the newest car
newest_car(Model) :-
    year(Model, Year),
    \+ (year(_, OtherYear), OtherYear > Year).

% Rule to find cars with a specific brand and type
brand_and_type(Brand, Type, Model) :-
    model(Brand, Model),
    type(Model, Type).

% Rule to find Japanese cars produced after 2018 that cost over $20,000
japanese_post2018_20kplus(Model) :-
    origin(Brand, japan),
    model(Brand, Model),
    year(Model, Year),
    Year > 2018,
    price(Model, Price),
    Price > 20.

% Rule to find German coupes
german_coupe(Model) :-
    origin(Brand, germany),
    model(Brand, Model),
    type(Model, coupe).

% Rule to find sedans that cost under $25,000 and use petrol
affordable_petrol_sedan(Model) :-
    type(Model, sedan),
    fuel(Model, petrol),
    price(Model, Price),
    Price < 25.

% Rule to find hatchbacks that are from 2019 and cost less than $20,000
budget_2019_hatchback(Model) :-
    type(Model, hatchback),
    year(Model, 2019),
    price(Model, Price),
    Price < 20.

% Rule to find cars with petrol fuel and produced in 2021
petrol_2021_car(Model) :-
    fuel(Model, petrol),
    year(Model, 2021).

% Rule to find sedans costing between $20,000 and $25,000
sedan_20_25k(Model) :-
    type(Model, sedan),
    price(Model, Price),
    Price >= 20,
    Price =< 25.

% Rule to find cars with a specific brand and fuel type
brand_and_fuel(Brand, FuelType, Model) :-
    model(Brand, Model),
    fuel(Model, FuelType).

% Rule to find cars with a specific brand and within a price range
brand_within_price_range(Brand, MinPrice, MaxPrice, Model) :-
    model(Brand, Model),
    price(Model, Price),
    Price >= MinPrice,
    Price =< MaxPrice.

% Rule to find cars with a specific brand and year
brand_and_year(Brand, Year, Model) :-
    model(Brand, Model),
    year(Model, Year).

% Rule to find cars with a specific type and within a price range
type_within_price_range(Type, MinPrice, MaxPrice, Model) :-
    type(Model, Type),
    price(Model, Price),
    Price >= MinPrice,
    Price =< MaxPrice.

% Rule to find cars made before 2018 with diesel fuel
old_diesel_car(Model) :-
    year(Model, Year),
    Year < 2018,
    fuel(Model, diesel).

% Rule to find hatchbacks from Japan
japanese_hatchback(Model) :-
    origin(Brand, japan),
    model(Brand, Model),
    type(Model, hatchback).

% Rule to find cars that cost more than $40,000 and are from Germany
luxury_german_car(Model) :-
    origin(Brand, germany),
    model(Brand, Model),
    price(Model, Price),
    Price > 40.

% Rule to find the cheapest sedan from South Korea
cheapest_korean_sedan(Model) :-
    origin(Brand, south_korea),
    model(Brand, Model),
    type(Model, sedan),
    price(Model, Price),
    \+ (price(_, OtherPrice), OtherPrice < Price, type(_, sedan), origin(_, south_korea)).

% Rule to find American hatchbacks
american_hatchback(Model) :-
    origin(Brand, usa),
    model(Brand, Model),
    type(Model, hatchback).

% Rule to find sedans that run on diesel fuel and are made after 2019
recent_diesel_sedan(Model) :-
    type(Model, sedan),
    fuel(Model, diesel),
    year(Model, Year),
    Year > 2019.

% Rule to find cars with a specific type and fuel type
type_and_fuel(Type, FuelType, Model) :-
    type(Model, Type),
    fuel(Model, FuelType).

% Rule to find cars with a specific type and year
type_and_year(Type, Year, Model) :-
    type(Model, Type),
    year(Model, Year).

% Rule to find cars with a specific fuel type and within a price range
fuel_within_price_range(FuelType, MinPrice, MaxPrice, Model) :-
    fuel(Model, FuelType),
    price(Model, Price),
    Price >= MinPrice,
    Price =< MaxPrice.

% Rule to find cars with a specific fuel type and year
fuel_and_year(FuelType, Year, Model) :-
    fuel(Model, FuelType),
    year(Model, Year).

% Rule to find cars with a specific origin and type
origin_and_type(Country, Type, Model) :-
    origin(Brand, Country),
    model(Brand, Model),
    type(Model, Type).

% Rule to find cars with a specific origin and fuel type
origin_and_fuel(Country, FuelType, Model) :-
    origin(Brand, Country),
    model(Brand, Model),
    fuel(Model, FuelType).

% Rule to find cars with a specific origin and within a price range
origin_within_price_range(Country, MinPrice, MaxPrice, Model) :-
    origin(Brand, Country),
    model(Brand, Model),
    price(Model, Price),
    Price >= MinPrice,
    Price =< MaxPrice.

% Rule to find cars with a specific origin and year
origin_and_year(Country, Year, Model) :-
    origin(Brand, Country),
    model(Brand, Model),
    year(Model, Year).

% Rule to find cars with a specific origin, type, and fuel type
origin_type_fuel(Country, Type, FuelType, Model) :-
    origin(Brand, Country),
    model(Brand, Model),
    type(Model, Type),
    fuel(Model, FuelType).

% Rule to find cars with a specific origin, type, and within a price range
origin_type_price(Country, Type, MinPrice, MaxPrice, Model) :-
    origin(Brand, Country),
    model(Brand, Model),
    type(Model, Type),
    price(Model, Price),
    Price >= MinPrice,
    Price =< MaxPrice.

% Rule to find cars with a specific origin, fuel type, and year
origin_fuel_year(Country, FuelType, Year, Model) :-
    origin(Brand, Country),
    model(Brand, Model),
    fuel(Model, FuelType),
    year(Model, Year).

% Rule to find cars with a specific type, fuel type, and year
type_fuel_year(Type, FuelType, Year, Model) :-
    type(Model, Type),
    fuel(Model, FuelType),
    year(Model, Year).

% Rule to find cars with a specific type, fuel type, and within a price range
type_fuel_price(Type, FuelType, MinPrice, MaxPrice, Model) :-
    type(Model, Type),
    fuel(Model, FuelType),
    price(Model, Price),
    Price >= MinPrice,
    Price =< MaxPrice.

% Rule to find cars with a specific brand, type, and fuel type
brand_type_fuel(Brand, Type, FuelType, Model) :-
    model(Brand, Model),
    type(Model, Type),
    fuel(Model, FuelType).

% Rule to find cars with a specific brand, type, and within a price range
brand_type_price(Brand, Type, MinPrice, MaxPrice, Model) :-
    model(Brand, Model),
    type(Model, Type),
    price(Model, Price),
    Price >= MinPrice,
    Price =< MaxPrice.

% Rule to find cars with a specific brand, type, and year
brand_type_year(Brand, Type, Year, Model) :-
    model(Brand, Model),
    type(Model, Type),
    year(Model, Year).

% Rule to find cars with a specific brand, fuel type, and within a price range
brand_fuel_price(Brand, FuelType, MinPrice, MaxPrice, Model) :-
    model(Brand, Model),
    fuel(Model, FuelType),
    price(Model, Price),
    Price >= MinPrice,
    Price =< MaxPrice.

% Rule to find cars with a specific brand, fuel type, and year
brand_fuel_year(Brand, FuelType, Year, Model) :-
    model(Brand, Model),
    fuel(Model, FuelType),
    year(Model, Year).

% Rule to find cars with a specific brand, type, fuel type, and within a price range
brand_type_fuel_price(Brand, Type, FuelType, MinPrice, MaxPrice, Model) :-
    model(Brand, Model),
    type(Model, Type),
    fuel(Model, FuelType),
    price(Model, Price),
    Price >= MinPrice,
    Price =< MaxPrice.

% Rule to find cars with a specific brand, type, fuel type, and year
brand_type_fuel_year(Brand, Type, FuelType, Year, Model) :-
    model(Brand, Model),
    type(Model, Type),
    fuel(Model, FuelType),
    year(Model, Year).

% Rule to find cars with a specific brand, type, within a price range, and year
brand_type_price_year(Brand, Type, MinPrice, MaxPrice, Year, Model) :-
    model(Brand, Model),
    type(Model, Type),
    price(Model, Price),
    Price >= MinPrice,
    Price =< MaxPrice,
    year(Model, Year).

% Rule to find cars with a specific brand, fuel type, within a price range, and year
brand_fuel_price_year(Brand, FuelType, MinPrice, MaxPrice, Year, Model) :-
    model(Brand, Model),
    fuel(Model, FuelType),
    price(Model, Price),
    Price >= MinPrice,
    Price =< MaxPrice,
    year(Model, Year).

% Rule to find cars with a specific type, fuel type, within a price range, and year
type_fuel_price_year(Type, FuelType, MinPrice, MaxPrice, Year, Model) :-
    type(Model, Type),
    fuel(Model, FuelType),
    price(Model, Price),
    Price >= MinPrice,
    Price =< MaxPrice,
    year(Model, Year).

% Rule to find cars with a specific brand, type, fuel type, within a price range, and year
brand_type_fuel_price_year(Brand, Type, FuelType, MinPrice, MaxPrice, Year, Model) :-
    model(Brand, Model),
    type(Model, Type),
    fuel(Model, FuelType),
    price(Model, Price),
    Price >= MinPrice,
    Price =< MaxPrice,
    year(Model, Year).

% Rule to find cars that are from the USA and are sedans
usa_sedan(Model) :-
    origin(Brand, usa),
    model(Brand, Model),
    type(Model, sedan).

% Rule to find cars from Japan that are less than $25,000
japan_under_25k(Model) :-
    origin(Brand, japan),
    model(Brand, Model),
    price(Model, Price),
    Price < 25.

% Rule to find hatchback cars produced before 2020
older_hatchback(Model) :-
    type(Model, hatchback),
    year(Model, Year),
    Year < 2020.

% Rule to find German cars that use diesel
german_diesel(Model) :-
    origin(Brand, germany),
    model(Brand, Model),
    fuel(Model, diesel).

% Rule to find South Korean sedans with a price over $20,000
south_korean_expensive_sedan(Model) :-
    origin(Brand, south_korea),
    model(Brand, Model),
    type(Model, sedan),
    price(Model, Price),
    Price > 20.

% Rule to find cars that are German sedans from 2021
german_sedan_2021(Model) :-
    origin(Brand, germany),
    model(Brand, Model),
    type(Model, sedan),
    year(Model, 2021).

% Rule to find Japanese coupes
japanese_coupe(Model) :-
    origin(Brand, japan),
    model(Brand, Model),
    type(Model, coupe).

% Rule to find cars under $20,000 made in 2018 or earlier
affordable_old_car(Model) :-
    price(Model, Price),
    Price < 20,
    year(Model, Year),
    Year =< 2018.

% Rule to find American cars with petrol fuel
american_petrol_car(Model) :-
    origin(Brand, usa),
    model(Brand, Model),
    fuel(Model, petrol).

% Rule to find cars that are sedans with a price between $20,000 and $30,000
sedan_in_20_30k(Model) :-
    type(Model, sedan),
    price(Model, Price),
    Price >= 20,
    Price =< 30.

% Rule to find cars made in 2020 that cost more than $30,000
expensive_2020_car(Model) :-
    year(Model, 2020),
    price(Model, Price),
    Price > 30.

% Rule to find Japanese sedans that run on diesel
japanese_diesel_sedan(Model) :-
    origin(Brand, japan),
    model(Brand, Model),
    type(Model, sedan),
    fuel(Model, diesel).

% Rule to find cars that are German sedans produced in 2019
german_sedan_2019(Model) :-
    origin(Brand, germany),
    model(Brand, Model),
    type(Model, sedan),
    year(Model, 2019).

% Rule to find South Korean cars made before 2019
old_south_korean(Model) :-
    origin(Brand, south_korea),
    model(Brand, Model),
    year(Model, Year),
    Year < 2019.

% Rule to find American sedans costing above $25,000
american_expensive_sedan(Model) :-
    origin(Brand, usa),
    model(Brand, Model),
    type(Model, sedan),
    price(Model, Price),
    Price > 25.

% Rule to find the oldest diesel sedan
oldest_diesel_sedan(Model) :-
    type(Model, sedan),
    fuel(Model, diesel),
    year(Model, Year),
    \+ (year(_, OtherYear), OtherYear < Year, fuel(_, diesel), type(_, sedan)).

% Rule to find the most recent American car under $25,000
newest_american_under_25k(Model) :-
    origin(Brand, usa),
    model(Brand, Model),
    price(Model, Price),
    Price < 25,
    year(Model, Year),
    \+ (year(_, OtherYear), OtherYear > Year, origin(_, usa), price(_, OtherPrice), OtherPrice < 25).

% Rule to find American cars that cost between $20,000 and $30,000 and run on petrol
american_midprice_petrol(Model) :-
    origin(Brand, usa),
    model(Brand, Model),
    fuel(Model, petrol),
    price(Model, Price),
    Price >= 20,
    Price =< 30.

% Rule to find Japanese sedans from 2020 or newer that run on petrol
japanese_recent_petrol_sedan(Model) :-
    origin(Brand, japan),
    model(Brand, Model),
    type(Model, sedan),
    fuel(Model, petrol),
    year(Model, Year),
    Year >= 2020.

% Rule to find German cars under $30,000
affordable_german_car(Model) :-
    origin(Brand, germany),
    model(Brand, Model),
    price(Model, Price),
    Price < 30.

% Rule to find sedans from South Korea produced in 2019
korean_sedan_2019(Model) :-
    origin(Brand, south_korea),
    model(Brand, Model),
    type(Model, sedan),
    year(Model, 2019).

% Rule to find American cars with diesel fuel
american_diesel_car(Model) :-
    origin(Brand, usa),
    model(Brand, Model),
    fuel(Model, diesel).

% Rule to find cars from South Korea that use petrol and are sedans
korean_petrol_sedan(Model) :-
    origin(Brand, south_korea),
    model(Brand, Model),
    fuel(Model, petrol),
    type(Model, sedan).

% Rule to find Japanese sedans made in 2021
japanese_2021_sedan(Model) :-
    origin(Brand, japan),
    model(Brand, Model),
    type(Model, sedan),
    year(Model, 2021).

% Rule to find South Korean hatchbacks
korean_hatchback(Model) :-
    origin(Brand, south_korea),
    model(Brand, Model),
    type(Model, hatchback).

% Rule to find American cars produced in or after 2019
recent_american_car(Model) :-
    origin(Brand, usa),
    model(Brand, Model),
    year(Model, Year),
    Year >= 2019.

% Rule to find the most recent Japanese car costing less than $30,000
newest_japanese_under_30k(Model) :-
    origin(Brand, japan),
    model(Brand, Model),
    price(Model, Price),
    Price < 30,
    year(Model, Year),
    \+ (year(_, OtherYear), OtherYear > Year, origin(_, japan), price(_, OtherPrice), OtherPrice < 30).

% Rule to find the cheapest American car with a price above $20,000 
cheapest_american_above_20k(Model) :-
    origin(Brand, usa),
    model(Brand, Model),
    price(Model, Price),
    Price > 20,
    \+ (price(OtherModel, OtherPrice), OtherPrice < Price, origin(OtherBrand, usa), OtherPrice > 20).

