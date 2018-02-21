(defrule welcome-msg
=>
	(printout t "	:)    Welcome to Budget Recommendor System - SG    :)" crlf)
	(printout t " How do you want to spend? " crlf)
	(printout t " type 1 for 'cut cost as possible' or type 2 for 'spend convieniently' " crlf) 
	(bind ?i-con-factor(read))
	(assert (con-factor ?i-con-factor))

)
;;
(defrule little-far-cheap-place
	(con-factor 1)
=>	
	(printout t " Do you want to stay little far but a cheaper place, type 'yes' or 'no'? " crlf)
	(bind ?i-far-cheap-place(read))
	(assert (far-cheap-place ?i-far-cheap-place))
)
;;
(defrule calm-place
	(con-factor 2)
=>	
	(printout t " Do you want to stay in calm residential place, type 'yes' or 'no'? " crlf)
	(bind ?i-calm-place(read))
	(assert (calm-place ?i-calm-place))
)
;;
(defrule group-1
	(con-factor 1)
	(far-cheap-place yes)
=>
	(printout t "cluster-1" crlf)
	(assert (cluster1))
)
;;
(defrule group-3a
	(con-factor 1)
	(far-cheap-place no)
=>
	(printout t "cluster-3 in left leg" crlf)
	(assert (cluster3))
)
;;
(defrule group-2
	(con-factor 2)
	(calm-place yes)
=>
	(printout t "cluster-2" crlf)
	(assert (cluster2))
)
;;
(defrule easy-access-near-NUS-cheaper
	(con-factor 2)
	(calm-place no)
=>
	(printout t " Do you want to stay in easy accessible, near to NUS and little cheaper, type 'yes' or 'no'? " crlf)
	(bind ?i-easy-access-NUS-cheap(read))
	(assert (easy-access-NUS-cheap ?i-easy-access-NUS-cheap))
)
;;
(defrule group-3b
	(con-factor 2)
	(calm-place no)
	(easy-access-NUS-cheap yes)
=>
	(printout t "cluster-3 in right leg" crlf)
	(assert (cluster3))
)
;;
(defrule group-4
	(con-factor 2)
	(calm-place no)
	(easy-access-NUS-cheap no)
=>	
	(printout t "cluster-4" crlf)
	(assert (cluster4))
)
(defrule 1-bus-ter
	(cluster1)
=>
	(printout t "Do you want a bus terminal near by your place, type 'yes' or 'no'?" crlf)
	(bind ?i-bus-ter(read))
	(assert (bus-ter ?i-bus-ter))
)
(defrule 1-bus-y-sports
	(cluster1)
	(bus-ter yes)
=>
	(printout t "Do you want Sports facilities near by, type 'yes' or 'no'?" crlf)
	(bind ?i-sports(read))
	(assert (sports ?i-sports))
)
(defrule 1-bus-n-sports
	(cluster1)
	(bus-ter no)
=>
	(printout t "Do you want Sports facilities near by, type 'yes' or 'no'?" crlf)
	(bind ?i-sports(read))
	(assert (sports ?i-sports))
)
(defrule 1-bus-sports-y-park-mall
	(cluster1)
	(bus-ter yes)
	(sports yes)
=>
	(printout t "Do you want Park/Mall near by, type 'yes' or 'no'?" crlf)
	(bind ?i-park-mall(read))
	(assert (park-mall ?i-park-mall))
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
	(printout t "do you want a park near by, type 'yes' or 'no'?" crlf)
	(bind ?i-park(read))
	(assert (park ?i-park))
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
	(printout t "do you want a mall near by, type 'yes' or 'no'?" crlf)
	(bind ?i-mall(read))
	(assert (mall ?i-mall))
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
	(printout t "do you bus terminal near by, type 'yes' or 'no'?" crlf)
	(bind ?i-bus-ter(read))
	(assert (bus-ter ?i-bus-ter))
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
	(printout t "do you religious places near by, type 'yes' or 'no'?" crlf)
	(bind ?i-religious(read))
	(assert (religious ?i-religious))
)
(defrule 2-bus-n-religious-y-church-mosque
	(cluster2)
	(bus-ter no)
	(religious yes)
=>
	(printout t "do you church/mosque near by, type 'yes' or 'no'?" crlf)
	(bind ?i-church-mosque(read))
	(assert (church-mosque ?i-church-mosque))
)
(defrule 2-bus-religious-n-park-mall
	(cluster2)
	(bus-ter no)
	(religious no)
=>
	(printout t "do you park/mall near by, type 'yes' or 'no'?" crlf)
	(bind ?i-park-mall(read))
	(assert (park-mall ?i-park-mall))
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
	(printout t "do you bus terminal near by, type 'yes' or 'no'?" crlf)
	(bind ?i-bus-ter(read))
	(assert (bus-ter ?i-bus-ter))
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
	(printout t "do you mall near by, type 'yes' or 'no'?" crlf)
	(bind ?i-mall(read))
	(assert (mall ?i-mall))
)
(defrule 3-bus-n-mall-y-mrt
	(cluster3)
	(bus-ter no)
	(mall yes)
=>
	(printout t "do you mrt near by, type 'yes' or 'no'?" crlf)
	(bind ?i-mrt(read))
	(assert (mrt ?i-mrt))
)
(defrule 3-bus-mall-n-mosque
	(cluster3)
	(bus-ter no)
	(mall no)
=>
	(printout t "do you mosque near by, type 'yes' or 'no'?" crlf)
	(bind ?i-mosque(read))
	(assert (mosque ?i-mosque))
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
	(printout t "do you chinese temple near by, type 'yes' or 'no'?" crlf)
	(bind ?i-chinese(read))
	(assert (chinese ?i-chinese))
)
(defrule 3-bus-mall-mosque-n-chinese-y-mrt
	(cluster3)
	(bus-ter no)
	(mall no)
	(mosque no)	
	(chinese yes)
=>
	(printout t "do you mrt near by, type 'yes' or 'no'?" crlf)
	(bind ?i-mrt(read))
	(assert (mrt ?i-mrt))
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
	(printout t "do you happening/calm place in college, type '1' for happening & '2' for calm?" crlf)
	(bind ?i-nus(read))
	(assert (nus ?i-nus))
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
