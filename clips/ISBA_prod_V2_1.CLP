;;;=======================================================
;;;	Student Budget Recommender System
;;;	
;;;	This expert system decides a housing solution for a student based on
;;;	the student's preferences and also estimates the monthly budget
;;;
;;;	Project by:
;;;
;;;	Abu Mathew Thoppan
;;;	Balaji Nataraj
;;;	Balagopal Unnikrishnan
;;;	Prateek Kashyap
;;;	Saurabh Semwal
;;;	Vikneshkumar Balakrishnan
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

(deffunction yes-or-no-p (?question)
   (bind ?response (ask-question ?question yes no y n))
   (if (or (eq ?response yes) (eq ?response y))
       then yes 
       else no))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;template for housing knowledge base
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deftemplate housing-kb
	(slot area-name (type SYMBOL))
	(slot housing-type (type SYMBOL) (allowed-symbols hdb-non-ac hdb-ac condo-non-ac condo-ac married-apt-ac married-apt-non-ac single-room-ac single-room-non-ac))
	(slot sharing (type SYMBOL) (allowed-symbols fullroom sharedroom whole-unit))
	(slot rent (type INTEGER))
	(slot pub (type INTEGER))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;template for food-exp knowledge base
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deftemplate food-exp-kb
	(slot cooking-type (type SYMBOL)(allowed-symbols cook-always cook-never cook-sometimes))
	(slot food-type (type SYMBOL) (allowed-symbols veg non-veg))
	(slot price (type INTEGER))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;template for travel-exp knowledge base
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deftemplate travel-exp-kb
	(slot area-name (type SYMBOL))
	(slot mode (type SYMBOL) (allowed-symbols bus/mrt cycle taxi walk))
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
;Housing knowledge base     
;;;;;;;;;;;;;;;;
(deffacts housing-kb-input 
	(housing-kb (area-name jurong-east)(housing-type hdb-non-ac)(sharing sharedroom)(rent 350)(pub 35))
	(housing-kb (area-name jurong-east)(housing-type hdb-ac)(sharing sharedroom)(rent 400)(pub 50))
	(housing-kb (area-name jurong-east)(housing-type hdb-non-ac)(sharing fullroom)(rent 700)(pub 65))
	(housing-kb (area-name jurong-east)(housing-type hdb-ac)(sharing fullroom)(rent 800)(pub 100))
	(housing-kb (area-name queenstown)(housing-type hdb-non-ac)(sharing sharedroom)(rent 500)(pub 35))
	(housing-kb (area-name queenstown)(housing-type hdb-ac)(sharing sharedroom)(rent 550)(pub 50))
	(housing-kb (area-name queenstown)(housing-type hdb-non-ac)(sharing fullroom)(rent 1000)(pub 65))
	(housing-kb (area-name queenstown)(housing-type hdb-ac)(sharing fullroom)(rent 1100)(pub 100))
	(housing-kb (area-name commonwealth)(housing-type hdb-non-ac)(sharing sharedroom)(rent 500)(pub 35))
	(housing-kb (area-name commonwealth)(housing-type hdb-ac)(sharing sharedroom)(rent 550)(pub 50))
	(housing-kb (area-name commonwealth)(housing-type hdb-non-ac)(sharing fullroom)(rent 1000)(pub 65))
	(housing-kb (area-name commonwealth)(housing-type hdb-ac)(sharing fullroom)(rent 1100)(pub 100))
	(housing-kb (area-name holland-village)(housing-type hdb-non-ac)(sharing sharedroom)(rent 500)(pub 35))
	(housing-kb (area-name holland-village)(housing-type hdb-ac)(sharing sharedroom)(rent 550)(pub 50))
	(housing-kb (area-name holland-village)(housing-type hdb-non-ac)(sharing fullroom)(rent 1000)(pub 65))
	(housing-kb (area-name holland-village)(housing-type hdb-ac)(sharing fullroom)(rent 1100)(pub 100))
	(housing-kb (area-name haw-par-villa)(housing-type condo-non-ac)(sharing sharedroom)(rent 600)(pub 45))
	(housing-kb (area-name haw-par-villa)(housing-type condo-ac)(sharing sharedroom)(rent 650)(pub 60))
	(housing-kb (area-name haw-par-villa)(housing-type condo-non-ac)(sharing fullroom)(rent 1200)(pub 85))
	(housing-kb (area-name haw-par-villa)(housing-type condo-ac)(sharing fullroom)(rent 1300)(pub 120))
	(housing-kb (area-name pasir-panjang)(housing-type condo-non-ac)(sharing sharedroom)(rent 600)(pub 45))
	(housing-kb (area-name pasir-panjang)(housing-type condo-ac)(sharing sharedroom)(rent 650)(pub 60))
	(housing-kb (area-name pasir-panjang)(housing-type condo-non-ac)(sharing fullroom)(rent 1200)(pub 85))
	(housing-kb (area-name pasir-panjang)(housing-type condo-ac)(sharing fullroom)(rent 1300)(pub 120))
	(housing-kb (area-name alexandra)(housing-type condo-non-ac)(sharing sharedroom)(rent 550)(pub 45))
	(housing-kb (area-name alexandra)(housing-type condo-ac)(sharing sharedroom)(rent 600)(pub 60))
	(housing-kb (area-name alexandra)(housing-type condo-non-ac)(sharing fullroom)(rent 1100)(pub 85))
	(housing-kb (area-name alexandra)(housing-type condo-ac)(sharing fullroom)(rent 1200)(pub 120))
	(housing-kb (area-name buona-vista)(housing-type condo-non-ac)(sharing sharedroom)(rent 600)(pub 45))
	(housing-kb (area-name buona-vista)(housing-type condo-ac)(sharing sharedroom)(rent 650)(pub 60))
	(housing-kb (area-name buona-vista)(housing-type condo-non-ac)(sharing fullroom)(rent 1200)(pub 85))
	(housing-kb (area-name buona-vista)(housing-type condo-ac)(sharing fullroom)(rent 1300)(pub 120))
	(housing-kb (area-name nus-pgp)(housing-type single-room-non-ac)(sharing fullroom)(rent 512)(pub 0))
	(housing-kb (area-name nus-pgp)(housing-type single-room-ac)(sharing fullroom)(rent 852)(pub 0))
	(housing-kb (area-name nus-pgp)(housing-type married-apt-non-ac)(sharing whole-unit)(rent 1420)(pub 0))
	(housing-kb (area-name nus-pgp)(housing-type married-apt-ac)(sharing whole-unit)(rent 1590)(pub 0))
	(housing-kb (area-name nus-utown)(housing-type single-room-non-ac)(sharing fullroom)(rent 576)(pub 0))
	(housing-kb (area-name nus-utown)(housing-type single-room-ac)(sharing fullroom)(rent 640)(pub 0))
	(housing-kb (area-name nus-utown)(housing-type married-apt-non-ac)(sharing whole-unit)(rent 1620)(pub 0))
	(housing-kb (area-name nus-utown)(housing-type married-apt-ac)(sharing whole-unit)(rent 1688)(pub 0))
	(housing-kb (area-name kent-ridge)(housing-type condo-non-ac)(sharing sharedroom)(rent 450)(pub 45))
	(housing-kb (area-name kent-ridge)(housing-type condo-ac)(sharing sharedroom)(rent 500)(pub 60))
	(housing-kb (area-name kent-ridge)(housing-type condo-non-ac)(sharing fullroom)(rent 900)(pub 85))
	(housing-kb (area-name kent-ridge)(housing-type condo-ac)(sharing fullroom)(rent 1000)(pub 120))
	(housing-kb (area-name dover)(housing-type hdb-non-ac)(sharing sharedroom)(rent 400)(pub 35))
	(housing-kb (area-name dover)(housing-type hdb-ac)(sharing sharedroom)(rent 450)(pub 50))
	(housing-kb (area-name dover)(housing-type hdb-non-ac)(sharing fullroom)(rent 800)(pub 65))
	(housing-kb (area-name dover)(housing-type hdb-ac)(sharing fullroom)(rent 900)(pub 100))
	(housing-kb (area-name dover)(housing-type condo-non-ac)(sharing sharedroom)(rent 500)(pub 45))
	(housing-kb (area-name dover)(housing-type condo-ac)(sharing sharedroom)(rent 550)(pub 60))
	(housing-kb (area-name dover)(housing-type condo-non-ac)(sharing fullroom)(rent 1000)(pub 85))
	(housing-kb (area-name dover)(housing-type condo-ac)(sharing fullroom)(rent 1100)(pub 120))
	(housing-kb (area-name west-coast)(housing-type hdb-non-ac)(sharing sharedroom)(rent 400)(pub 35))
	(housing-kb (area-name west-coast)(housing-type hdb-ac)(sharing sharedroom)(rent 450)(pub 50))
	(housing-kb (area-name west-coast)(housing-type hdb-non-ac)(sharing fullroom)(rent 800)(pub 65))
	(housing-kb (area-name west-coast)(housing-type hdb-ac)(sharing fullroom)(rent 900)(pub 100))
	(housing-kb (area-name west-coast)(housing-type condo-non-ac)(sharing sharedroom)(rent 450)(pub 45))
	(housing-kb (area-name west-coast)(housing-type condo-ac)(sharing sharedroom)(rent 500)(pub 60))
	(housing-kb (area-name west-coast)(housing-type condo-non-ac)(sharing fullroom)(rent 900)(pub 85))
	(housing-kb (area-name west-coast)(housing-type condo-ac)(sharing fullroom)(rent 1000)(pub 120))
	(housing-kb (area-name clementi)(housing-type hdb-non-ac)(sharing sharedroom)(rent 400)(pub 35))
	(housing-kb (area-name clementi)(housing-type hdb-ac)(sharing sharedroom)(rent 450)(pub 50))
	(housing-kb (area-name clementi)(housing-type hdb-non-ac)(sharing fullroom)(rent 800)(pub 65))
	(housing-kb (area-name clementi)(housing-type hdb-ac)(sharing fullroom)(rent 900)(pub 100))
	(housing-kb (area-name clementi)(housing-type condo-non-ac)(sharing sharedroom)(rent 450)(pub 45))
	(housing-kb (area-name clementi)(housing-type condo-ac)(sharing sharedroom)(rent 500)(pub 60))
	(housing-kb (area-name clementi)(housing-type condo-non-ac)(sharing fullroom)(rent 900)(pub 85))
	(housing-kb (area-name clementi)(housing-type condo-ac)(sharing fullroom)(rent 1000)(pub 120))
)
;;;;;;;;;;;;;;;;
;food expense knowledge base     
;;;;;;;;;;;;;;;;
(deffacts food-exp-kb-input
	(food-exp-kb (cooking-type cook-always)(food-type veg)(price 6))
	(food-exp-kb (cooking-type cook-always)(food-type non-veg)(price 9))
	(food-exp-kb (cooking-type cook-never)(food-type veg)(price 10))
	(food-exp-kb (cooking-type cook-never)(food-type non-veg)(price 15))
	(food-exp-kb (cooking-type cook-sometimes)(food-type veg)(price 8))
	(food-exp-kb (cooking-type cook-sometimes)(food-type non-veg)(price 10))
)
;;;;;;;;;;;;;;;;
;travel expense knowledge base     
;;;;;;;;;;;;;;;;
(deffacts travel-exp-kb-input
	(travel-exp-kb (area-name jurong-east)(mode bus/mrt)(price 2.32))
	(travel-exp-kb (area-name clementi)(mode bus/mrt)(price 1.54))
	(travel-exp-kb (area-name west-coast)(mode bus/mrt)(price 1.54))
	(travel-exp-kb (area-name dover)(mode bus/mrt)(price 1.54))
	(travel-exp-kb (area-name kent-ridge)(mode bus/mrt)(price 1.54))
	(travel-exp-kb (area-name queenstown)(mode bus/mrt)(price 1.74))
	(travel-exp-kb (area-name commonwealth)(mode bus/mrt)(price 1.74))
	(travel-exp-kb (area-name holland-village)(mode bus/mrt)(price 1.74))
	(travel-exp-kb (area-name alexandra)(mode bus/mrt)(price 1.94))
	(travel-exp-kb (area-name buona-vista)(mode bus/mrt)(price 1.54))
	(travel-exp-kb (area-name haw-par-villa)(mode bus/mrt)(price 1.74))
	(travel-exp-kb (area-name pasir-panjang)(mode bus/mrt)(price 1.74))
	(travel-exp-kb (area-name jurong-east)(mode cycle)(price 1.0))
	(travel-exp-kb (area-name clementi)(mode cycle)(price 1.0))
	(travel-exp-kb (area-name west-coast)(mode cycle)(price 1.0))
	(travel-exp-kb (area-name dover)(mode cycle)(price 1.0))
	(travel-exp-kb (area-name kent-ridge)(mode cycle)(price 1.0))
	(travel-exp-kb (area-name queenstown)(mode cycle)(price 1.0))
	(travel-exp-kb (area-name commonwealth)(mode cycle)(price 1.0))
	(travel-exp-kb (area-name holland-village)(mode cycle)(price 1.0))
	(travel-exp-kb (area-name alexandra)(mode cycle)(price 1.0))
	(travel-exp-kb (area-name buona-vista)(mode cycle)(price 1.0))
	(travel-exp-kb (area-name haw-par-villa)(mode cycle)(price 1.0))
	(travel-exp-kb (area-name pasir-panjang)(mode cycle)(price 1.0))
	(travel-exp-kb (area-name jurong-east)(mode taxi)(price 17.0))
	(travel-exp-kb (area-name clementi)(mode taxi)(price 13.0))
	(travel-exp-kb (area-name west-coast)(mode taxi)(price 12.0))
	(travel-exp-kb (area-name dover)(mode taxi)(price 11.0))
	(travel-exp-kb (area-name kent-ridge)(mode taxi)(price 12.0))
	(travel-exp-kb (area-name queenstown)(mode taxi)(price 16.0))
	(travel-exp-kb (area-name commonwealth)(mode taxi)(price 16.0))
	(travel-exp-kb (area-name holland-village)(mode taxi)(price 14.0))
	(travel-exp-kb (area-name alexandra)(mode taxi)(price 24.0))
	(travel-exp-kb (area-name buona-vista)(mode taxi)(price 12.0))
	(travel-exp-kb (area-name haw-par-villa)(mode taxi)(price 17.0))
	(travel-exp-kb (area-name pasir-panjang)(mode taxi)(price 19.0))
	(travel-exp-kb (area-name nus-pgp)(mode walk)(price 0.0))
	(travel-exp-kb (area-name nus-utown)(mode walk)(price 0.0))
)
;;;*************
;;;DEFRULES
;;;*************

(defrule welcome-msg
	=>
	(printout t "Welcome to Student Budget Recommendor System" crlf)
	(printout t "What is your constraint on Cost vs Convenience?" crlf)
	(printout t "1. Save money and have only necessary facilities" crlf "2. Spend conveniently for comfort" crlf "(1/2)" crlf) 
	(assert (con-factor
		(ask-question "Your Choice: " 1 2))) 
)
;;
(defrule little-far-cheap-place
	(con-factor 1)
=>	
	(printout t "Are you okay with staying a little far from NUS if it is a cheaper place? (yes/no)" crlf)
	(assert (far-cheap-place (yes-or-no-p "Your Choice: ")))
)
;;
(defrule calm-place
	(con-factor 2)
=>	
	(printout t "Do you prefer to stay in a calm residential area? (yes/no)" crlf)
	(assert (calm-place (yes-or-no-p "Your Choice: ")))
)
;;
(defrule group-1
	(con-factor 1)
	(far-cheap-place yes)
=>
	(assert (cluster1))
)
;;
(defrule group-3a
	(con-factor 1)
	(far-cheap-place no)
=>
	(assert (cluster3))
)
;;
(defrule group-2
	(con-factor 2)
	(calm-place yes)
=>
	(assert (cluster2))
)
;;
(defrule easy-access-near-NUS-cheaper
	(con-factor 2)
	(calm-place no)
=>
	(printout t "Do you prefer to stay just outside campus because it is cheaper than campus accomadation? (yes/no)" crlf)
	(assert (easy-access-NUS-cheap (yes-or-no-p "Your Choice: ")))
)
;;
(defrule group-3b
	(con-factor 2)
	(calm-place no)
	(easy-access-NUS-cheap yes)
=>
	(assert (cluster3))
)
;;
(defrule group-4
	(con-factor 2)
	(calm-place no)
	(easy-access-NUS-cheap no)
=>	
	(assert (cluster4))
)
(defrule 1-bus-ter
	(cluster1)
=>
	(printout t "Do you prefer to have a bus terminal near your place? (yes/no)" crlf)
	(assert (bus-ter (yes-or-no-p "Your Choice: ")))
)
(defrule 1-bus-sports
	(cluster1)
=>
	(printout t "Do prefer to have any sports facilities near by? (yes/no)" crlf)
	(assert (sports (yes-or-no-p "Your Choice: ")))
)
(defrule 1-bus-sports-y-park-mall
	(cluster1)
	(bus-ter yes)
	(sports yes)
=>
	(printout t "Do you want either a park or a mall near by? (yes/no)" crlf)
	(assert (park-mall (yes-or-no-p "Your Choice: ")))
)
(defrule 1-bus-y-sports-n
	(cluster1)
	(bus-ter yes)
	(sports no)
=>
	(printout t "Jurong East" crlf)
	(assert (location jurong-east))
)
(defrule 1-bus-sports-park-mall-y
	(cluster1)
	(bus-ter yes)
	(sports yes)
	(park-mall yes)
=>
	(printout t "Jurong East" crlf)
	(assert (location jurong-east))
)
(defrule 1-bus-sports-y-park-mall-n
	(cluster1)
	(bus-ter yes)
	(sports yes)
	(park-mall no)
=>
	(printout t "Commonwealth" crlf)
	(assert (location commonwealth))
)
(defrule 1-bus-n-sports-y
	(cluster1)
	(bus-ter no)
	(sports yes)
=>
	(printout t "Queenstown" crlf)
	(assert (location queenstown))
)
(defrule 1-bus-sports-n-park
	(cluster1)
	(bus-ter no)
	(sports no)
=>	
	(printout t "Do you want a park near by? (yes/no)" crlf)
	(assert (park (yes-or-no-p "Your Choice: ")))
)
(defrule 1-bus-sports-n-park-y
	(cluster1)
	(bus-ter no)
	(sports no)
	(park yes)
=>	
	(printout t "Holland Village" crlf)
	(assert (location holland-village))
)
(defrule 1-bus-sports-park-n-mall
	(cluster1)
	(bus-ter no)
	(sports no)
	(park no)
=>	
	(printout t "Do you want a mall near by? (yes/no)?" crlf)
	(assert (mall (yes-or-no-p "Your Choice: ")))
)
(defrule 1-bus-sports-park-n-mall-y
	(cluster1)
	(bus-ter no)
	(sports no)
	(park no)
	(mall yes)
=>	
	(printout t "Jurong East" crlf)
	(assert (location jurong-east))
)
(defrule 1-bus-sports-park-mall-n
	(cluster1)
	(bus-ter no)
	(sports no)
	(park no)
	(mall no)	
=>	
	(printout t "Commonwealth" crlf)
	(assert (location commonwealth))
)
(defrule 2-bus-ter
	(cluster2)
=>
	(printout t "Do you prefer to have a bus terminal near your place? (yes/no)" crlf)
	(assert (bus-ter (yes-or-no-p "Your Choice: ")))
)
(defrule 2-bus-y
	(cluster2)
	(bus-ter yes)
=>
	(printout t "Buona Vista" crlf)
	(assert (location buona-vista))
)
(defrule 2-bus-n-religious
	(cluster2)
	(bus-ter no)
=>
	(printout t "Do you want any religious places near by? (yes/no)" crlf)
	(assert (religious (yes-or-no-p "Your Choice: ")))
)
(defrule 2-bus-n-religious-y-church-mosque
	(cluster2)
	(bus-ter no)
	(religious yes)
=>
	(printout t "Do you want either a church or a mosque near by? (yes/no)" crlf)
	(assert (church-mosque (yes-or-no-p "Your Choice: ")))
)
(defrule 2-bus-religious-n-park-mall
	(cluster2)
	(bus-ter no)
	(religious no)
=>
	(printout t "Do you want either a park or a mall near by? (yes/no)" crlf)
	(assert (park-mall (yes-or-no-p "Your Choice: ")))
)
(defrule 2-bus-n-religious-church-mosque-y
	(cluster2)
	(bus-ter no)
	(religious yes)
	(church-mosque yes)
=>
	(printout t "How Par Villa" crlf)
	(assert (location how-par-villa))
)
(defrule 2-bus-n-religious-y-church-mosque-n
	(cluster2)
	(bus-ter no)
	(religious yes)
	(church-mosque no)
=>
	(printout t "Pasir Panjang" crlf)
	(assert (location pasir-panjang))
)
(defrule 2-bus-religious-n-park-mall-y
	(cluster2)
	(bus-ter no)
	(religious no)
	(park-mall yes)
=>
	(printout t "Alexandra" crlf)
	(assert (location alexandra))
)
(defrule 2-bus-religious-park-mall-n
	(cluster2)
	(bus-ter no)
	(religious no)
	(park-mall no)
=>
	(printout t "Buona Vista" crlf)
	(assert (location buona-vista))
)
(defrule 3-bus-ter
	(cluster3)
=>
	(printout t "Do you prefer to have a bus terminal near your place? (yes/no)" crlf)
	(assert (bus-ter (yes-or-no-p "Your Choice: ")))
)
(defrule 3-bus-y
	(cluster3)
	(bus-ter yes)
=>
	(printout t "Clementi" crlf)
	(assert (location clementi))
)
(defrule 3-bus-n-mall
	(cluster3)
	(bus-ter no)
=>
	(printout t "Do you want a mall near by? (yes/no)" crlf)
	(assert (mall (yes-or-no-p "Your Choice: ")))
)
(defrule 3-bus-n-mall-y-mrt
	(cluster3)
	(bus-ter no)
	(mall yes)
=>
	(printout t "Do you want an MRT station near by? (yes/no)" crlf)
	(assert (mrt (yes-or-no-p "Your Choice: ")))
)
(defrule 3-bus-mall-n-mosque
	(cluster3)
	(bus-ter no)
	(mall no)
=>
	(printout t "Do you want a mosque near by? (yes/no)" crlf)
	(assert (mosque (yes-or-no-p "Your Choice: ")))
)
(defrule 3-bus-n-mall-mrt-y
	(cluster3)
	(bus-ter no)
	(mall yes)
	(mrt yes)
=>
	(printout t "Clementi" crlf)
	(assert (location clementi))
)
(defrule 3-bus-n-mall-y-mrt-n
	(cluster3)
	(bus-ter no)
	(mall yes)
	(mrt no)
=>
	(printout t "West Coast" crlf)
	(assert (location west-coast))
)
(defrule 3-bus-mall-n-mosque-y
	(cluster3)
	(bus-ter no)
	(mall no)
	(mosque yes)
=>
	(printout t "Dover" crlf)
	(assert (location dover))
)
(defrule 3-bus-mall-mosque-n-chinese
	(cluster3)
	(bus-ter no)
	(mall no)
	(mosque no)
=>
	(printout t "Do you want a chinese temple near by? (yes/no)" crlf)
	(assert (chinese (yes-or-no-p "Your Choice: ")))
)
(defrule 3-bus-mall-mosque-n-chinese-y-mrt
	(cluster3)
	(bus-ter no)
	(mall no)
	(mosque no)	
	(chinese yes)
=>
	(printout t "Do you want an MRT station near by? (yes/no)" crlf)
	(assert (mrt (yes-or-no-p "Your Choice: ")))
)
(defrule 3-bus-mall-mosque-chinese-n
	(cluster3)
	(bus-ter no)
	(mall no)
	(mosque no)
	(chinese no)	
=>
	(printout t "Kent Ridge" crlf)
	(assert (location kent-ridge))
)
(defrule 3-bus-mall-mosque-n-chinese-mrt-y
	(cluster3)
	(bus-ter no)
	(mall no)
	(mosque no)	
	(chinese yes)
	(mrt yes)
=>
	(printout t "Dover" crlf)
	(assert (location dover))
)
(defrule 3-bus-mall-mosque-n-chinese-y-mrt-n
	(cluster3)
	(bus-ter no)
	(mall no)
	(mosque no)	
	(chinese yes)
	(mrt no)
=>
	(printout t "West Coast" crlf)
	(assert (location west-coast))
)
(defrule 4-nus
	(cluster4)
=>
	(printout t "What type of atmosphere do you want in the campus accomodation?" crlf "1. Lively place, many student activities" crlf "2. Calm place, many in-house facilities" crlf "(1/2)" crlf)
	(assert (nus (ask-question "Your Choice: " 1 2)))
)
(defrule 4-nus-utown
	(cluster4)
	(nus 1)
=>	
	(printout t "NUS-UTOWN" crlf)
	(assert (location nus-utown))
)
(defrule 4-nus-pgp
	(cluster4)
	(nus 2)
=>	
	(printout t "NUS-PGP" crlf)
	(assert (location nus-pgp))
)
(defrule sharing-opt-non-nus
	(location ?location)
	(not (location nus-utown))
	(not (location nus-pgp))
=>	
	(printout t "Do you prefer to share the room? (yes/no)" crlf)
	(assert (sharing-opt (yes-or-no-p "Your Choice: ")))
)
(defrule room-opt-nus
	(or (location nus-utown) (location nus-pgp))
=>	
	(printout t "Do you prefer to have a married apartment? (yes/no)" crlf)
	(assert (married-apt (yes-or-no-p "Your Choice: ")))
)
(defrule house-ac
	(location ?location)
	(or (sharing-opt ?sharing-opt)(married-apt ?married-apt))
=>
	(printout t "Do you prefer Aircon? (yes/no)" crlf)
	(assert (ac (yes-or-no-p "Your Choice: ")))
)
(defrule sharing-non-nus
	(sharing-opt ?sharing-opt)
=>
	(if (eq ?sharing-opt yes)
	then
	(assert (sharing sharedroom))
	else
	(assert (sharing fullroom)))
)
(defrule cluster-1-house
	(sharing ?sharing)
	(or (location jurong-east)
	    (location queenstown)
	    (location commonwealth)
	    (location holland-village))
	(ac ?ac)
=>
	(if (eq ?ac yes)
	then 
	(printout t "HDB-AC" crlf)
	(assert (housing-type hdb-ac))
	else	
	(printout t "HDB-NON-AC" crlf)
	(assert (housing-type hdb-non-ac)))
)
(defrule cluster-2-house
	(sharing ?sharing)
	(or (location haw-par-villa)
	    (location pasir-panjang)
		(location buona-vista)
	    (location alexandra))
	(ac ?ac)
=>
	(if (eq ?ac yes)
	then 
	(printout t "CONDO-AC" crlf)
	(assert (housing-type condo-ac))
	else	
	(printout t "CONDO-NON-AC" crlf)
	(assert (housing-type condo-non-ac)))
) 
(defrule cluster-3a-house
	(con-factor 1)
	(sharing ?sharing)
	(or (location clementi)
	    (location west-coast)
	    (location dover)
	    (location kent-ridge))
	(ac ?ac)
=>
	(if (eq ?ac yes)
	then 
	(printout t "HDB-AC" crlf)
	(assert (housing-type hdb-ac))
	else	
	(printout t "HDB-NON-AC" crlf)
	(assert (housing-type hdb-non-ac)))
) 
(defrule cluster-3b-house
	(con-factor 2)
	(sharing ?sharing)
	(or (location clementi)
	    (location west-coast)
	    (location dover)
	    (location kent-ridge))
	(ac ?ac)
=>
	(if (eq ?ac yes)
	then 
	(printout t "CONDO-AC" crlf)
	(assert (housing-type condo-ac))
	else	
	(printout t "CONDO-NON-AC" crlf)
	(assert (housing-type condo-non-ac)))
) 
(defrule cluster-4-house
	(or (location nus-utown)
	    (location nus-pgp))
	(married-apt ?married-apt)
	(ac ?ac)
=>
	(if (eq ?married-apt yes)
	then 
		(if (eq ?ac yes)
		then
		(printout t "MARRIED-APT-AC" crlf)
		(assert (housing-type married-apt-ac))
		(assert (sharing whole-unit))
		else 
		(printout t "MARRIED-APT-NON-AC" crlf)
		(assert (housing-type married-apt-non-ac))
		(assert (sharing whole-unit)))
	else
		(if (eq ?ac yes)
		then
		(printout t "SINGLE-ROOM-AC" crlf)
		(assert (housing-type single-room-ac))
		(assert (no-cooking-allowed))
		(assert (cook-opt 3))
		(assert (sharing fullroom))
		else 
		(printout t "SINGLE-ROOM-NON-AC" crlf)
		(assert (housing-type single-room-non-ac))
		(assert (no-cooking-allowed))
		(assert (cook-opt 3))
		(assert (sharing fullroom)))
	)
)  
;;;HANDLING HOUSING TYPE FOR KENT RIDGE ALONE 
(defrule kent-ridge-spl-case1  
	(location kent-ridge)
  	?f1 <- (housing-type hdb-ac)
  =>
	(retract ?f1)	
	(assert (housing-type condo-ac))
)
(defrule kent-ridge-spl-case2  
	(location kent-ridge)
  	?f2 <- (housing-type hdb-non-ac)
  =>
	(retract ?f2)	
	(assert (housing-type condo-non-ac))
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
	(printout t "What is your food preference?" crlf "1. Vegetarian" crlf "2. Non Vegetarian" crlf "(1/2)" crlf) 
	(assert (food-pref (ask-question "Your Choice: " 1 2)))
)
(defrule food-type
	(food-pref ?food-pref)
=>
	(if (eq ?food-pref 1)
	then
	(assert (food-type veg))
	else
	(assert (food-type non-veg)))
)
(defrule cook-opt
	(housing-done)
	(food-pref ?food-pref)
	(housing-type ?housing-type)
	(not (no-cooking-allowed))
=>
	(printout t "How often do you cook?" crlf "1. Always" crlf "2. Sometimes" crlf "3. Never" crlf "(1/2/3)" crlf) 
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
	(assert (pref-travel-mode bus/mrt))
)
(defrule travel-pref-cluster2   
	(food-done)
	(cluster2)   
=>
	(assert (pref-travel-mode bus/mrt))
)
(defrule travel-pref-cluster3a
	(food-done)
	(con-factor 1)
	(cluster3)
=>
	(assert (pref-travel-mode cycle))
)
(defrule travel-pref-cluster3b
	(food-done)
	(con-factor 2)
	(cluster3)
=>
	(assert (pref-travel-mode bus/mrt))
)
(defrule cluster4-travel-part
	(food-done)
	(cluster4)
=>
	(assert (travel-mode walk))
	(assert (travel-mode-fixed))
)
(defrule check-travel-pref
	(pref-travel-mode ?pref-travel-mode)
=>
	(printout t "Preferred mode of transport to college is " ?pref-travel-mode crlf "Do you wish to change option (yes/no)" crlf)
	(assert (change-travel-pref (yes-or-no-p "Your Choice: ")))
)
(defrule show-travel-pref
	(change-travel-pref yes)
=>
	(printout t "What is your travel preference to college?" crlf)
	(printout t "1. Bus/MRT" crlf "2. TAXI" crlf "3.CYCLE" crlf "(1/2/3)" crlf) 
	(assert (user-travel-pref (ask-question "Your Choice: " 1 2 3)))     
)
(defrule fix-travel-pref-no-change
	(change-travel-pref no)
	(pref-travel-mode ?pref-travel-mode)
=>
	(assert (travel-mode-fixed))
	(assert (travel-mode ?pref-travel-mode))
)
(defrule fix-travel-pref-change
	(change-travel-pref yes)
	(user-travel-pref ?user-travel-pref)
=>
	(if (eq ?user-travel-pref 1)
	then
	(assert (travel-mode bus/mrt))
	else
		(if (eq ?user-travel-pref 2)
		then
		(assert (travel-mode taxi))
		else
		(assert (travel-mode cycle))))
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
	(printout t crlf)
	(printout t crlf)
	(printout t "YOUR TOTAL BUDGET IS SGD " (+ ?rent ?pub ?cook-exp ?fare-2-nus ?fare-2-others 15) crlf)
	(printout t "1.	Housing :" crlf)
	(printout t "Place :" ?x-location crlf)
	(printout t "House Type :" ?x-housing-type crlf)
	(printout t "Share Type :" ?x-sharing crlf)
	(printout t "Rent : SGD " ?rent crlf)
	(printout t "PUB : SGD " ?pub crlf)
	(printout t "2.	Food :" crlf)
	(if (eq ?x-food-type veg)
	then
	(printout t "Food type : Vegetarian " crlf)
	else
	(printout t "Food type : Non-Vegetarian " crlf))
	(if (eq ?x-cooking-type cook-always)
	then
	(printout t "your cooking preference is 'cook always at home' " crlf)
	else
		(if (eq ?x-cooking-type cook-sometimes)
		then 
		(printout t "your cooking preference is 'cook sometimes at home' " crlf)
		else 
		(printout t "your cooking preference is 'never cook at home' " crlf))
	)
	(printout t "Food expenditure is SGD " ?cook-exp crlf)
	(printout t "3.	Travel :" crlf)
	(printout t "To NUS - SGD " ?fare-2-nus crlf)
	(printout t "To other places - SGD " ?fare-2-others crlf)
	(printout t "4. Mobile: " crlf)
	(printout t "Mobile Expenditure is SGD 15" crlf )
)
