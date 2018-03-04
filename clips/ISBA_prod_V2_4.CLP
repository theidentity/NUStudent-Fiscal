        ;(printout t "/~Food~/" crlf)
;;;=======================================================
;;;     Student Budget Recommender System
;;;     
;;;     This expert system decides a housing solution for a student based on
;;;     the student's preferences and also estimates the monthly budget
;;;
;;;     Project by:
;;;
;;;     Abu Mathew Thoppan
;;;     Balaji Nataraj
;;;     Balagopal Unnikrishnan
;;;     Prateek Kashyap
;;;     Saurabh Semwal
;;;     Vikneshkumar Balakrishnan
;;;
;;;=======================================================

;;;*************
;;;DEFFUNCTIONS
;;;*************

(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction Yes-No-Question (?question)
   (bind ?response (ask-question ?question Yes No y n))
   (if (or (eq ?response Yes) (eq ?response y))
       then Yes 
       else No))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;template for housing kNowledge base
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deftemplate housing-kb
        (slot area-name (type SYMBOL))
        (slot housing-type (type SYMBOL) (allowed-symbols HDB_without_AC HDB_with_AC Condominium_without_AC Condominium_with_AC Married_Apartment_with_AC Married_Apartment_without_AC Single_Room_with_AC Single_Room_without_AC))
        (slot sharing (type SYMBOL) (allowed-symbols Single_Room Shared_Room whole-unit))
        (slot rent (type INTEGER))
        (slot pub (type INTEGER))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;template for food-exp kNowledge base
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deftemplate food-exp-kb
        (slot cooking-type (type SYMBOL)(allowed-symbols cook-always cook-never cook-sometimes))
        (slot food-type (type SYMBOL) (allowed-symbols veg Non-veg))
        (slot price (type INTEGER))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;template for travel-exp kNowledge base
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deftemplate travel-exp-kb
        (slot area-name (type SYMBOL))
        (slot mode (type SYMBOL) (allowed-symbols Bus/MRT Cycle Taxi Walk))
        (slot price (type FLOAT))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;template for outputs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deftemplate housing-output
        (slot area-name (type SYMBOL))
        (slot house-type (type SYMBOL))
        (slot share-type (type SYMBOL))
        (slot rent (type INTEGER))
        (slot pub (type INTEGER))
)
(deftemplate food-output
        (slot food-type (type SYMBOL))
        (slot cook-type (type SYMBOL))
        (slot cook-exp (type INTEGER))
)
(deftemplate travel-output
        (slot travel-mode (type SYMBOL))
        (slot fare-2-nus (type FLOAT))
        (slot fare-2-others (type FLOAT))
)
;;;;;;;;;;;;;;;;
;Housing kNowledge base     
;;;;;;;;;;;;;;;;
(deffacts housing-kb-input 
        (housing-kb (area-name Jurong_East)(housing-type HDB_without_AC)(sharing Shared_Room)(rent 350)(pub 35))
        (housing-kb (area-name Jurong_East)(housing-type HDB_with_AC)(sharing Shared_Room)(rent 400)(pub 50))
        (housing-kb (area-name Jurong_East)(housing-type HDB_without_AC)(sharing Single_Room)(rent 700)(pub 65))
        (housing-kb (area-name Jurong_East)(housing-type HDB_with_AC)(sharing Single_Room)(rent 800)(pub 100))
        (housing-kb (area-name Queenstown)(housing-type HDB_without_AC)(sharing Shared_Room)(rent 500)(pub 35))
        (housing-kb (area-name Queenstown)(housing-type HDB_with_AC)(sharing Shared_Room)(rent 550)(pub 50))
        (housing-kb (area-name Queenstown)(housing-type HDB_without_AC)(sharing Single_Room)(rent 1000)(pub 65))
        (housing-kb (area-name Queenstown)(housing-type HDB_with_AC)(sharing Single_Room)(rent 1100)(pub 100))
        (housing-kb (area-name Commonwealth)(housing-type HDB_without_AC)(sharing Shared_Room)(rent 500)(pub 35))
        (housing-kb (area-name Commonwealth)(housing-type HDB_with_AC)(sharing Shared_Room)(rent 550)(pub 50))
        (housing-kb (area-name Commonwealth)(housing-type HDB_without_AC)(sharing Single_Room)(rent 1000)(pub 65))
        (housing-kb (area-name Commonwealth)(housing-type HDB_with_AC)(sharing Single_Room)(rent 1100)(pub 100))
        (housing-kb (area-name Holland_Village)(housing-type HDB_without_AC)(sharing Shared_Room)(rent 500)(pub 35))
        (housing-kb (area-name Holland_Village)(housing-type HDB_with_AC)(sharing Shared_Room)(rent 550)(pub 50))
        (housing-kb (area-name Holland_Village)(housing-type HDB_without_AC)(sharing Single_Room)(rent 1000)(pub 65))
        (housing-kb (area-name Holland_Village)(housing-type HDB_with_AC)(sharing Single_Room)(rent 1100)(pub 100))
        (housing-kb (area-name Haw_Par_Villa)(housing-type Condominium_without_AC)(sharing Shared_Room)(rent 600)(pub 45))
        (housing-kb (area-name Haw_Par_Villa)(housing-type Condominium_with_AC)(sharing Shared_Room)(rent 650)(pub 60))
        (housing-kb (area-name Haw_Par_Villa)(housing-type Condominium_without_AC)(sharing Single_Room)(rent 1200)(pub 85))
        (housing-kb (area-name Haw_Par_Villa)(housing-type Condominium_with_AC)(sharing Single_Room)(rent 1300)(pub 120))
        (housing-kb (area-name Pasir_Panjang)(housing-type Condominium_without_AC)(sharing Shared_Room)(rent 600)(pub 45))
        (housing-kb (area-name Pasir_Panjang)(housing-type Condominium_with_AC)(sharing Shared_Room)(rent 650)(pub 60))
        (housing-kb (area-name Pasir_Panjang)(housing-type Condominium_without_AC)(sharing Single_Room)(rent 1200)(pub 85))
        (housing-kb (area-name Pasir_Panjang)(housing-type Condominium_with_AC)(sharing Single_Room)(rent 1300)(pub 120))
        (housing-kb (area-name Alexandra)(housing-type Condominium_without_AC)(sharing Shared_Room)(rent 550)(pub 45))
        (housing-kb (area-name Alexandra)(housing-type Condominium_with_AC)(sharing Shared_Room)(rent 600)(pub 60))
        (housing-kb (area-name Alexandra)(housing-type Condominium_without_AC)(sharing Single_Room)(rent 1100)(pub 85))
        (housing-kb (area-name Alexandra)(housing-type Condominium_with_AC)(sharing Single_Room)(rent 1200)(pub 120))
        (housing-kb (area-name Buona_Vista)(housing-type Condominium_without_AC)(sharing Shared_Room)(rent 600)(pub 45))
        (housing-kb (area-name Buona_Vista)(housing-type Condominium_with_AC)(sharing Shared_Room)(rent 650)(pub 60))
        (housing-kb (area-name Buona_Vista)(housing-type Condominium_without_AC)(sharing Single_Room)(rent 1200)(pub 85))
        (housing-kb (area-name Buona_Vista)(housing-type Condominium_with_AC)(sharing Single_Room)(rent 1300)(pub 120))
        (housing-kb (area-name NUS_PGP)(housing-type Single_Room_without_AC)(sharing Single_Room)(rent 512)(pub 0))
        (housing-kb (area-name NUS_PGP)(housing-type Single_Room_with_AC)(sharing Single_Room)(rent 852)(pub 0))
        (housing-kb (area-name NUS_PGP)(housing-type Married_Apartment_without_AC)(sharing whole-unit)(rent 1420)(pub 0))
        (housing-kb (area-name NUS_PGP)(housing-type Married_Apartment_with_AC)(sharing whole-unit)(rent 1590)(pub 0))
        (housing-kb (area-name NUS_Utown)(housing-type Single_Room_without_AC)(sharing Single_Room)(rent 576)(pub 0))
        (housing-kb (area-name NUS_Utown)(housing-type Single_Room_with_AC)(sharing Single_Room)(rent 640)(pub 0))
        (housing-kb (area-name NUS_Utown)(housing-type Married_Apartment_without_AC)(sharing whole-unit)(rent 1620)(pub 0))
        (housing-kb (area-name NUS_Utown)(housing-type Married_Apartment_with_AC)(sharing whole-unit)(rent 1688)(pub 0))
        (housing-kb (area-name Kent_Ridge)(housing-type Condominium_without_AC)(sharing Shared_Room)(rent 450)(pub 45))
        (housing-kb (area-name Kent_Ridge)(housing-type Condominium_with_AC)(sharing Shared_Room)(rent 500)(pub 60))
        (housing-kb (area-name Kent_Ridge)(housing-type Condominium_without_AC)(sharing Single_Room)(rent 900)(pub 85))
        (housing-kb (area-name Kent_Ridge)(housing-type Condominium_with_AC)(sharing Single_Room)(rent 1000)(pub 120))
        (housing-kb (area-name Dover)(housing-type HDB_without_AC)(sharing Shared_Room)(rent 400)(pub 35))
        (housing-kb (area-name Dover)(housing-type HDB_with_AC)(sharing Shared_Room)(rent 450)(pub 50))
        (housing-kb (area-name Dover)(housing-type HDB_without_AC)(sharing Single_Room)(rent 800)(pub 65))
        (housing-kb (area-name Dover)(housing-type HDB_with_AC)(sharing Single_Room)(rent 900)(pub 100))
        (housing-kb (area-name Dover)(housing-type Condominium_without_AC)(sharing Shared_Room)(rent 500)(pub 45))
        (housing-kb (area-name Dover)(housing-type Condominium_with_AC)(sharing Shared_Room)(rent 550)(pub 60))
        (housing-kb (area-name Dover)(housing-type Condominium_without_AC)(sharing Single_Room)(rent 1000)(pub 85))
        (housing-kb (area-name Dover)(housing-type Condominium_with_AC)(sharing Single_Room)(rent 1100)(pub 120))
        (housing-kb (area-name West_Coast)(housing-type HDB_without_AC)(sharing Shared_Room)(rent 400)(pub 35))
        (housing-kb (area-name West_Coast)(housing-type HDB_with_AC)(sharing Shared_Room)(rent 450)(pub 50))
        (housing-kb (area-name West_Coast)(housing-type HDB_without_AC)(sharing Single_Room)(rent 800)(pub 65))
        (housing-kb (area-name West_Coast)(housing-type HDB_with_AC)(sharing Single_Room)(rent 900)(pub 100))
        (housing-kb (area-name West_Coast)(housing-type Condominium_without_AC)(sharing Shared_Room)(rent 450)(pub 45))
        (housing-kb (area-name West_Coast)(housing-type Condominium_with_AC)(sharing Shared_Room)(rent 500)(pub 60))
        (housing-kb (area-name West_Coast)(housing-type Condominium_without_AC)(sharing Single_Room)(rent 900)(pub 85))
        (housing-kb (area-name West_Coast)(housing-type Condominium_with_AC)(sharing Single_Room)(rent 1000)(pub 120))
        (housing-kb (area-name Clementi)(housing-type HDB_without_AC)(sharing Shared_Room)(rent 400)(pub 35))
        (housing-kb (area-name Clementi)(housing-type HDB_with_AC)(sharing Shared_Room)(rent 450)(pub 50))
        (housing-kb (area-name Clementi)(housing-type HDB_without_AC)(sharing Single_Room)(rent 800)(pub 65))
        (housing-kb (area-name Clementi)(housing-type HDB_with_AC)(sharing Single_Room)(rent 900)(pub 100))
        (housing-kb (area-name Clementi)(housing-type Condominium_without_AC)(sharing Shared_Room)(rent 450)(pub 45))
        (housing-kb (area-name Clementi)(housing-type Condominium_with_AC)(sharing Shared_Room)(rent 500)(pub 60))
        (housing-kb (area-name Clementi)(housing-type Condominium_without_AC)(sharing Single_Room)(rent 900)(pub 85))
        (housing-kb (area-name Clementi)(housing-type Condominium_with_AC)(sharing Single_Room)(rent 1000)(pub 120))
)
;;;;;;;;;;;;;;;;
;food expense kNowledge base     
;;;;;;;;;;;;;;;;
(deffacts food-exp-kb-input
        (food-exp-kb (cooking-type cook-always)(food-type veg)(price 6))
        (food-exp-kb (cooking-type cook-always)(food-type Non-veg)(price 9))
        (food-exp-kb (cooking-type cook-never)(food-type veg)(price 10))
        (food-exp-kb (cooking-type cook-never)(food-type Non-veg)(price 15))
        (food-exp-kb (cooking-type cook-sometimes)(food-type veg)(price 8))
        (food-exp-kb (cooking-type cook-sometimes)(food-type Non-veg)(price 10))
)
;;;;;;;;;;;;;;;;
;travel expense kNowledge base     
;;;;;;;;;;;;;;;;
(deffacts travel-exp-kb-input
        (travel-exp-kb (area-name Jurong_East)(mode Bus/MRT)(price 2.32))
        (travel-exp-kb (area-name Clementi)(mode Bus/MRT)(price 1.54))
        (travel-exp-kb (area-name West_Coast)(mode Bus/MRT)(price 1.54))
        (travel-exp-kb (area-name Dover)(mode Bus/MRT)(price 1.54))
        (travel-exp-kb (area-name Kent_Ridge)(mode Bus/MRT)(price 1.54))
        (travel-exp-kb (area-name Queenstown)(mode Bus/MRT)(price 1.74))
        (travel-exp-kb (area-name Commonwealth)(mode Bus/MRT)(price 1.74))
        (travel-exp-kb (area-name Holland_Village)(mode Bus/MRT)(price 1.74))
        (travel-exp-kb (area-name Alexandra)(mode Bus/MRT)(price 1.94))
        (travel-exp-kb (area-name Buona_Vista)(mode Bus/MRT)(price 1.54))
        (travel-exp-kb (area-name Haw_Par_Villa)(mode Bus/MRT)(price 1.74))
        (travel-exp-kb (area-name Pasir_Panjang)(mode Bus/MRT)(price 1.74))
        (travel-exp-kb (area-name Jurong_East)(mode Cycle)(price 1.0))
        (travel-exp-kb (area-name Clementi)(mode Cycle)(price 1.0))
        (travel-exp-kb (area-name West_Coast)(mode Cycle)(price 1.0))
        (travel-exp-kb (area-name Dover)(mode Cycle)(price 1.0))
        (travel-exp-kb (area-name Kent_Ridge)(mode Cycle)(price 1.0))
        (travel-exp-kb (area-name Queenstown)(mode Cycle)(price 1.0))
        (travel-exp-kb (area-name Commonwealth)(mode Cycle)(price 1.0))
        (travel-exp-kb (area-name Holland_Village)(mode Cycle)(price 1.0))
        (travel-exp-kb (area-name Alexandra)(mode Cycle)(price 1.0))
        (travel-exp-kb (area-name Buona_Vista)(mode Cycle)(price 1.0))
        (travel-exp-kb (area-name Haw_Par_Villa)(mode Cycle)(price 1.0))
        (travel-exp-kb (area-name Pasir_Panjang)(mode Cycle)(price 1.0))
        (travel-exp-kb (area-name Jurong_East)(mode Taxi)(price 17.0))
        (travel-exp-kb (area-name Clementi)(mode Taxi)(price 13.0))
        (travel-exp-kb (area-name West_Coast)(mode Taxi)(price 12.0))
        (travel-exp-kb (area-name Dover)(mode Taxi)(price 11.0))
        (travel-exp-kb (area-name Kent_Ridge)(mode Taxi)(price 12.0))
        (travel-exp-kb (area-name Queenstown)(mode Taxi)(price 16.0))
        (travel-exp-kb (area-name Commonwealth)(mode Taxi)(price 16.0))
        (travel-exp-kb (area-name Holland_Village)(mode Taxi)(price 14.0))
        (travel-exp-kb (area-name Alexandra)(mode Taxi)(price 24.0))
        (travel-exp-kb (area-name Buona_Vista)(mode Taxi)(price 12.0))
        (travel-exp-kb (area-name Haw_Par_Villa)(mode Taxi)(price 17.0))
        (travel-exp-kb (area-name Pasir_Panjang)(mode Taxi)(price 19.0))
        (travel-exp-kb (area-name NUS_PGP)(mode Walk)(price 0.0))
        (travel-exp-kb (area-name NUS_Utown)(mode Walk)(price 0.0))
)
;;;*************
;;;DEFRULES
;;;*************

(defrule welcome-msg
        =>
        (printout t "~~~Welcome to NU$tudent Budget Recommendation System~~~" crlf)
        (printout t "Are you ready to start?" crlf)
        (assert (start-app (Yes-No-Question "Your Choice: ")))
)
(defrule end-output 
        (start-app No)
        =>
        (printout t "~EndOfResult!" crlf )
)

(defrule convinience-cost(start-app Yes)
=>
        (printout t "What is your spending preference?" crlf)
        (printout t "1. I can spend for the needs but wants to minimize the cost as possible" crlf "2. I can spend for comfort and convenience" crlf "(1/2)" crlf) 
        (assert (con-factor
                (ask-question "Your Choice: " 1 2))) 
)
;;
(defrule little-far-cheap-place
        (con-factor 1)
=>      
        (printout t "Do you prefer to stay at a distant but cheaper place from NUS? (Yes/No)" crlf)
        (assert (far-cheap-place (Yes-No-Question "Your Choice: ")))
)
;;
(defrule calm-place
        (con-factor 2)
=>      
        (printout t "Do you want to stay at a calm residential area? (Yes/Nop)" crlf)
        (assert (calm-place (Yes-No-Question "Your Choice: ")))
)
;;
(defrule group-1
        (con-factor 1)
        (far-cheap-place Yes)
=>
        (assert (cluster1))
)
;;
(defrule group-3a
        (con-factor 1)
        (far-cheap-place No)
=>
        (assert (cluster3))
)
;;
(defrule group-2
        (con-factor 2)
        (calm-place Yes)
=>
        (assert (cluster2))
)
;;
(defrule easy-access-near-NUS-cheaper
        (con-factor 2)
        (calm-place No)
=>
        (printout t "Do you prefer to stay at near but outside NUS campus? (Yes/No)" crlf)
        (assert (easy-access-NUS-cheap (Yes-No-Question "Your Choice: ")))
)
;;
(defrule group-3b
        (con-factor 2)
        (calm-place No)
        (easy-access-NUS-cheap Yes)
=>
        (assert (cluster3))
)
;;
(defrule group-4
        (con-factor 2)
        (calm-place No)
        (easy-access-NUS-cheap No)
=>      
        (assert (cluster4))
)
(defrule 1-bus-ter
        (cluster1)
=>
        (printout t "Do you want a bus terminal nearby? (Yes/Nop)" crlf)
        (assert (bus-ter (Yes-No-Question "Your Choice: ")))
)
(defrule 1-bus-sports
        (cluster1)
=>
        (printout t "Do you want any sports facilities nearby? (Yes/Nop)" crlf)
        (assert (sports (Yes-No-Question "Your Choice: ")))
)
(defrule 1-bus-sports-y-park-mall
        (cluster1)
        (bus-ter Yes)
        (sports Yes)
=>
        (printout t "Do you want a park or a mall near by? (Yes/Nop)" crlf)
        (assert (park-mall (Yes-No-Question "Your Choice: ")))
)
(defrule 1-bus-y-sports-n
        (cluster1)
        (bus-ter Yes)
        (sports No)
=>
        ;(printout t "Jurong East" crlf)
        (assert (location Jurong_East))
)
(defrule 1-bus-sports-park-mall-y
        (cluster1)
        (bus-ter Yes)
        (sports Yes)
        (park-mall Yes)
=>
        ;(printout t "Jurong East" crlf)
        (assert (location Jurong_East))
)
(defrule 1-bus-sports-y-park-mall-n
        (cluster1)
        (bus-ter Yes)
        (sports Yes)
        (park-mall No)
=>
        ;(printout t "Commonwealth" crlf)
        (assert (location Commonwealth))
)
(defrule 1-bus-n-sports-y
        (cluster1)
        (bus-ter No)
        (sports Yes)
=>
        ;(printout t "Queenstown" crlf)
        (assert (location Queenstown))
)
(defrule 1-bus-sports-n-park
        (cluster1)
        (bus-ter No)
        (sports No)
=>      
        (printout t "Do you want a park nearby? (Yes/Nop)" crlf)
        (assert (park (Yes-No-Question "Your Choice: ")))
)
(defrule 1-bus-sports-n-park-y
        (cluster1)
        (bus-ter No)
        (sports No)
        (park Yes)
=>      
        ;(printout t "Holland Village" crlf)
        (assert (location Holland_Village))
)
(defrule 1-bus-sports-park-n-mall
        (cluster1)
        (bus-ter No)
        (sports No)
        (park No)
=>      
        (printout t "Do you want a mall nearby? (Yes/Nop)?" crlf)
        (assert (mall (Yes-No-Question "Your Choice: ")))
)
(defrule 1-bus-sports-park-n-mall-y
        (cluster1)
        (bus-ter No)
        (sports No)
        (park No)
        (mall Yes)
=>      
        ;(printout t "Jurong East" crlf)
        (assert (location Jurong_East))
)
(defrule 1-bus-sports-park-mall-n
        (cluster1)
        (bus-ter No)
        (sports No)
        (park No)
        (mall No)       
=>      
        ;(printout t "Commonwealth" crlf)
        (assert (location Commonwealth))
)
(defrule 2-bus-ter
        (cluster2)
=>
        (printout t "Do you want a bus terminal nearby? (Yes/Nop)" crlf)
        (assert (bus-ter (Yes-No-Question "Your Choice: ")))
)
(defrule 2-bus-y
        (cluster2)
        (bus-ter Yes)
=>
        ;(printout t "Buona Vista" crlf)
        (assert (location Buona_Vista))
)
(defrule 2-bus-n-religious
        (cluster2)
        (bus-ter No)
=>
        (printout t "Do you want any religious places nearby? (Yes/Nop)" crlf)
        (assert (religious (Yes-No-Question "Your Choice: ")))
)
(defrule 2-bus-n-religious-y-church-mosque
        (cluster2)
        (bus-ter No)
        (religious Yes)
=>
        (printout t "Do you want a church or a mosque near by? (Yes/Nop)" crlf)
        (assert (church-mosque (Yes-No-Question "Your Choice: ")))
)
(defrule 2-bus-religious-n-park-mall
        (cluster2)
        (bus-ter No)
        (religious No)
=>
        (printout t "Do you want a park or a mall nearby? (Yes/Nop)" crlf)
        (assert (park-mall (Yes-No-Question "Your Choice: ")))
)
(defrule 2-bus-n-religious-church-mosque-y
        (cluster2)
        (bus-ter No)
        (religious Yes)
        (church-mosque Yes)
=>
        ;(printout t "Haw Par Villa" crlf)
        (assert (location Haw_Par_Villa))
)
(defrule 2-bus-n-religious-y-church-mosque-n
        (cluster2)
        (bus-ter No)
        (religious Yes)
        (church-mosque No)
=>
        ;(printout t "Pasir Panjang" crlf)
        (assert (location Pasir_Panjang))
)
(defrule 2-bus-religious-n-park-mall-y
        (cluster2)
        (bus-ter No)
        (religious No)
        (park-mall Yes)
=>
        ;(printout t "Alexandra" crlf)
        (assert (location Alexandra))
)
(defrule 2-bus-religious-park-mall-n
        (cluster2)
        (bus-ter No)
        (religious No)
        (park-mall No)
=>
        ;(printout t "Buona Vista" crlf)
        (assert (location Buona_Vista))
)
(defrule 3-bus-ter
        (cluster3)
=>
        (printout t "Do you want a bus terminal nearby? (Yes/Nop)" crlf)
        (assert (bus-ter (Yes-No-Question "Your Choice: ")))
)
(defrule 3-bus-y
        (cluster3)
        (bus-ter Yes)
=>
        ;(printout t "Clementi" crlf)
        (assert (location Clementi))
)
(defrule 3-bus-n-mall
        (cluster3)
        (bus-ter No)
=>
        (printout t "Do you want a mall nearby? (Yes/Nop)" crlf)
        (assert (mall (Yes-No-Question "Your Choice: ")))
)
(defrule 3-bus-n-mall-y-mrt
        (cluster3)
        (bus-ter No)
        (mall Yes)
=>
        (printout t "Do you want an MRT station near by? (Yes/Nop)" crlf)
        (assert (mrt (Yes-No-Question "Your Choice: ")))
)
(defrule 3-bus-mall-n-mosque
        (cluster3)
        (bus-ter No)
        (mall No)
=>
        (printout t "Do you want a mosque near by? (Yes/Nop)" crlf)
        (assert (mosque (Yes-No-Question "Your Choice: ")))
)
(defrule 3-bus-n-mall-mrt-y
        (cluster3)
        (bus-ter No)
        (mall Yes)
        (mrt Yes)
=>
        ;(printout t "Clementi" crlf)
        (assert (location Clementi))
)
(defrule 3-bus-n-mall-y-mrt-n
        (cluster3)
        (bus-ter No)
        (mall Yes)
        (mrt No)
=>
        ;(printout t "West Coast" crlf)
        (assert (location West_Coast))
)
(defrule 3-bus-mall-n-mosque-y
        (cluster3)
        (bus-ter No)
        (mall No)
        (mosque Yes)
=>
        ;(printout t "Dover" crlf)
        (assert (location Dover))
)
(defrule 3-bus-mall-mosque-n-chinese
        (cluster3)
        (bus-ter No)
        (mall No)
        (mosque No)
=>
        (printout t "Do you want a chinese temple nearby? (Yes/Nop)" crlf)
        (assert (chinese (Yes-No-Question "Your Choice: ")))
)
(defrule 3-bus-mall-mosque-n-chinese-y-mrt
        (cluster3)
        (bus-ter No)
        (mall No)
        (mosque No)     
        (chinese Yes)
=>
        (printout t "Do you want an MRT station nearby? (Yes/Nop)" crlf)
        (assert (mrt (Yes-No-Question "Your Choice: ")))
)
(defrule 3-bus-mall-mosque-chinese-n
        (cluster3)
        (bus-ter No)
        (mall No)
        (mosque No)
        (chinese No)    
=>
        ;(printout t "Kent Ridge" crlf)
        (assert (location Kent_Ridge))
)
(defrule 3-bus-mall-mosque-n-chinese-mrt-y
        (cluster3)
        (bus-ter No)
        (mall No)
        (mosque No)     
        (chinese Yes)
        (mrt Yes)
=>
        ;(printout t "Dover" crlf)
        (assert (location Dover))
)
(defrule 3-bus-mall-mosque-n-chinese-y-mrt-n
        (cluster3)
        (bus-ter No)
        (mall No)
        (mosque No)     
        (chinese Yes)
        (mrt No)
=>
        ;(printout t "West Coast" crlf)
        (assert (location West_Coast))
)
(defrule 4-nus
        (cluster4)
=>
        (printout t "Which one of the following do you prefer in case of staying inside the campus?" crlf "1.A live and active place" crlf "2. A calm and more residential place" crlf "(1/2)" crlf)
        (assert (nus (ask-question "Your Choice: " 1 2)))
)
(defrule 4-NUS_Utown
        (cluster4)
        (nus 1)
=>      
        ;(printout t "NUS_Utown" crlf)
        (assert (location NUS_Utown))
)
(defrule 4-NUS_PGP
        (cluster4)
        (nus 2)
=>      
        ;(printout t "NUS_PGP" crlf)
        (assert (location NUS_PGP))
)
(defrule sharing-opt-Non-nus
        (location ?location)
        (not (location NUS_Utown))
        (not (location NUS_PGP))
=>      
        (printout t "Do you prefer to share the room? (Yes/No)" crlf)
        (assert (sharing-opt (Yes-No-Question "Your Choice: ")))
)
(defrule room-opt-nus
        (or (location NUS_Utown) (location NUS_PGP))
=>      
        (printout t "Are you looking for an apartment for married couples? (Yes/No)" crlf)
        (assert (married-apt (Yes-No-Question "Your Choice: ")))
)
(defrule house-ac
        (location ?location)
        (or (sharing-opt ?sharing-opt)(married-apt ?married-apt))
=>
        (printout t "Do you prefer air conditioner in you room? (Yes/No)" crlf)
        (assert (ac (Yes-No-Question "Your Choice: ")))
)
(defrule sharing-Non-nus
        (sharing-opt ?sharing-opt)
=>
        (if (eq ?sharing-opt Yes)
        then
        (assert (sharing Shared_Room))
        else
        (assert (sharing Single_Room)))
)
(defrule cluster-1-house
        (sharing ?sharing)
        (or (location Jurong_East)
            (location Queenstown)
            (location Commonwealth)
            (location Holland_Village))
        (ac ?ac)
=>
        (if (eq ?ac Yes)
        then 
        ;(printout t "HDB_with_AC" crlf)
        (assert (housing-type HDB_with_AC))
        else    
        ;(printout t "HDB_without_AC" crlf)
        (assert (housing-type HDB_without_AC)))
)
(defrule cluster-2-house
        (sharing ?sharing)
        (or (location Haw_Par_Villa)
            (location Pasir_Panjang)
                (location Buona_Vista)
            (location Alexandra))
        (ac ?ac)
=>
        (if (eq ?ac Yes)
        then 
        ;(printout t "Condominium_with_AC" crlf)
        (assert (housing-type Condominium_with_AC))
        else    
        ;(printout t "Condominium_without_AC" crlf)
        (assert (housing-type Condominium_without_AC)))
) 
(defrule cluster-3a-house
        (con-factor 1)
        (sharing ?sharing)
        (or (location Clementi)
            (location West_Coast)
            (location Dover)
            (location Kent_Ridge))
        (ac ?ac)
=>
        (if (eq ?ac Yes)
        then 
        ;(printout t "HDB_with_AC" crlf)
        (assert (housing-type HDB_with_AC))
        else    
        ;(printout t "HDB_without_AC" crlf)
        (assert (housing-type HDB_without_AC)))
) 
(defrule cluster-3b-house
        (con-factor 2)
        (sharing ?sharing)
        (or (location Clementi)
            (location West_Coast)
            (location Dover)
            (location Kent_Ridge))
        (ac ?ac)
=>
        (if (eq ?ac Yes)
        then 
        ;(printout t "Condominium_with_AC" crlf)
        (assert (housing-type Condominium_with_AC))
        else    
        ;(printout t "Condominium_without_AC" crlf)
        (assert (housing-type Condominium_without_AC)))
) 
(defrule cluster-4-house
        (or (location NUS_Utown)
            (location NUS_PGP))
        (married-apt ?married-apt)
        (ac ?ac)
=>
        (if (eq ?married-apt Yes)
        then 
                (if (eq ?ac Yes)
                then
                ;(printout t "Married_Apartment_with_AC" crlf)
                (assert (housing-type Married_Apartment_with_AC))
                (assert (sharing whole-unit))
                else 
                ;(printout t "Married_Apartment_without_AC" crlf)
                (assert (housing-type Married_Apartment_without_AC))
                (assert (sharing whole-unit)))
        else
                (if (eq ?ac Yes)
                then
                ;(printout t "Single_Room_with_AC" crlf)
                (assert (housing-type Single_Room_with_AC))
                (assert (No-cooking-allowed))
                (assert (cook-opt 3))
                (assert (sharing Single_Room))
                else 
                ;(printout t "Single_Room_without_AC" crlf)
                (assert (housing-type Single_Room_without_AC))
                (assert (No-cooking-allowed))
                (assert (cook-opt 3))
                (assert (sharing Single_Room)))
        )
)  
;;;HANDLING HOUSING TYPE FOR KENT RIDGE ALONE 
(defrule Kent_Ridge-spl-case1  
        (location Kent_Ridge)
        ?f1 <- (housing-type HDB_with_AC)
  =>
        (retract ?f1)   
        (assert (housing-type Condominium_with_AC))
)
(defrule Kent_Ridge-spl-case2  
        (location Kent_Ridge)
        ?f2 <- (housing-type HDB_without_AC)
  =>
        (retract ?f2)   
        (assert (housing-type Condominium_without_AC))
)
;;;;;HOUSING BUDGET;;;;
(defrule house-budget
        (location ?x-location)
        (housing-type ?x-housing-type)
        (sharing ?x-sharing)
        (housing-kb (area-name ?x-location)(housing-type ?x-housing-type)(sharing ?x-sharing)(rent ?rent)(pub ?pub))
=>
        (assert (housing-done))
        (assert (housing-output (area-name ?x-location)(house-type ?x-housing-type)(share-type ?x-sharing)(rent ?rent)(pub ?pub)))
)
(defrule food-pref
        (housing-done)
=>
        (printout t "What is your food preference?" crlf "1. Vegetarian" crlf "2. Non-Vegetarian" crlf "(1/2)" crlf) 
        (assert (food-pref (ask-question "Your Choice: " 1 2)))
)
(defrule food-type
        (food-pref ?food-pref)
=>
        (if (eq ?food-pref 1)
        then
        (assert (food-type veg))
        else
        (assert (food-type Non-veg)))
)
(defrule cook-opt
        (housing-done)
        (food-pref ?food-pref)
        (housing-type ?housing-type)
        (not (No-cooking-allowed))
=>
        (printout t "How often do you cook?" crlf "1. Almost always" crlf "2. Sometimes" crlf "3. Never" crlf "(1/2/3)" crlf) 
        (assert (cook-opt (ask-question "Your Choice: " 1 2 3)))
) 
(defrule cooking-type
        (cook-opt ?cook-opt)
=>
        (if (eq ?cook-opt 1)
        then
        (assert (cooking-type cook-always))
        else
                (if (eq ?cook-opt 2)
                then
                (assert (cooking-type cook-sometimes))
                else
                (assert (cooking-type cook-never))))
)
;;;;;;;FOOD BUDGET;;;;
(defrule food-budget
        (cooking-type ?x-cooking-type)
        (food-type ?x-food-type)
        (food-exp-kb (cooking-type ?x-cooking-type)(food-type ?x-food-type)(price ?price))
=>
        (assert (food-done))    
        (assert (food-output (food-type ?x-food-type)(cook-type ?x-cooking-type)(cook-exp (* ?price 30))))
)
;;;;;TRAVEL BUDGET;;;;
;;;;; PREFERRED TRAVEL MODES ;;;;;;
(defrule travel-pref-cluster1
        (food-done)
        (cluster1)
=>
        (assert (pref-travel-mode Bus/MRT))
)
(defrule travel-pref-cluster2   
        (food-done)
        (cluster2)   
=>
        (assert (pref-travel-mode Bus/MRT))
)
(defrule travel-pref-cluster3a
        (food-done)
        (con-factor 1)
        (cluster3)
=>
        (assert (pref-travel-mode Cycle))
)
(defrule travel-pref-cluster3b
        (food-done)
        (con-factor 2)
        (cluster3)
=>
        (assert (pref-travel-mode Bus/MRT))
)
(defrule cluster4-travel-part
        (food-done)
        (cluster4)
=>
        (assert (travel-mode Walk))
        (assert (travel-mode-fixed))
)
(defrule check-travel-pref
        (pref-travel-mode ?pref-travel-mode)
=>
        (printout t "We recommend you to take a " ?pref-travel-mode " to NUS." crlf "Do you wish to change the preference? (Yes/No)" crlf)
        (assert (change-travel-pref (Yes-No-Question "Your Choice: ")))
)
(defrule show-travel-pref
        (change-travel-pref Yes)
=>
        (printout t "What is your prefered mode of transportation to NUS?" crlf)
        (printout t "1. Bus/MRT" crlf "2. Taxi" crlf "3. Cycle" crlf "(1/2/3)" crlf) 
        (assert (user-travel-pref (ask-question "Your Choice: " 1 2 3)))     
)
(defrule fix-travel-pref-No-change
        (change-travel-pref No)
        (pref-travel-mode ?pref-travel-mode)
=>
        (assert (travel-mode-fixed))
        (assert (travel-mode ?pref-travel-mode))
)
(defrule fix-travel-pref-change
        (change-travel-pref Yes)
        (user-travel-pref ?user-travel-pref)
=>
        (if (eq ?user-travel-pref 1)
        then
        (assert (travel-mode Bus/MRT))
        else
                (if (eq ?user-travel-pref 2)
                then
                (assert (travel-mode Taxi))
                else
                (assert (travel-mode Cycle))))
        (assert (travel-mode-fixed))
)
(defrule travel-budget
        (travel-mode-fixed) 
        (travel-mode ?x-mode)
        (location ?x-location)
        (travel-exp-kb (area-name ?x-location)(mode ?x-mode)(price ?price))
=>
        (assert (travel-done))
        (assert (travel-output (travel-mode ?x-mode)(fare-2-nus (* ?price 22))(fare-2-others 40.0)))
)
;;;OUTPUT
(defrule final-output   
        (housing-output (area-name ?x-location)(house-type ?x-housing-type)(share-type ?x-sharing)(rent ?rent)(pub ?pub))
        (food-output (food-type ?x-food-type)(cook-type ?x-cooking-type)(cook-exp ?cook-exp))
        (travel-output (travel-mode ?x-mode)(fare-2-nus ?fare-2-nus)(fare-2-others ?fare-2-others))
=>


        (printout t "Result#{ \"total\" : " (+ ?rent ?pub ?cook-exp ?fare-2-nus ?fare-2-others 35) " ,")
        (printout t "\"sharing\" : \"" ?x-sharing "\",")
        (printout t "\"housetype\" : \"" ?x-housing-type "\",")
        (printout t "\"location\" : \"" ?x-location "\",")
        (printout t "\"monthlyhousing\" : " (+ ?rent ?pub) ",")
        (printout t "\"rent\" : " ?rent ",")
        (printout t "\"pub\" : " ?pub ",")
        (printout t "\"foodtype\" : \"" ?x-food-type "\",")
        (printout t "\"cookingtype\" : \"" ?x-cooking-type "\",")
        (printout t "\"cookingexp\" : \"" ?cook-exp "\",")
        (printout t "\"travelmode\" : \"" ?x-mode"\",")
        (printout t "\"totaltravel\" : " (+ ?fare-2-nus ?fare-2-others) ",")
        (printout t "\"fare2nus\" : " ?fare-2-nus " ,")
        (printout t "\"fare2others\" : " ?fare-2-others ",")
	(printout t "\"HousingRecommendation\" : \"Look for a /~")
        (if (neq ?x-sharing whole-unit)
        then
        (printout t ?x-sharing "~/ in a /~")
        )
        (printout t ?x-housing-type )
        (printout t "~/ around /~" ?x-location "~/ area.\",")	
	(printout t "\"FoodRecommendation\" : \"It's good that you are a /~")
        (if (eq ?x-food-type veg)
        then
        (printout t "vegetarian ")
        else
        (printout t "Non-vegetarian "))
        (printout t "~/and prefers /~")
        (if (eq ?x-cooking-type cook-always)
        then
        (printout t "to cook always.~/\",")
        else
                (if (eq ?x-cooking-type cook-sometimes)
                then 
                (printout t "to cook sometimes.~/\",")
                else 
                (printout t "not to cook.~/\","))
        )
        (printout t "\"misc\" : 35 }" crlf)


        (printout t "^*This is an average amount spent by people" crlf crlf "~EndOfResult!" crlf )
)

