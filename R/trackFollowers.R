# infos: https://rtweet.info/

library(rtweet)
setwd("C:/Daten/CloudStation/ourFuture/SoMeAn")

Accounts <- c(# organisation
               "gndforeurope"
             ,  "gerechte1komma5"
             , "_GermanZero"
             , "klima_allianz"
             , "oekoinstitut"
             , "greenpeace_de"
             , "amnesty"
             , "Avaaz"
      # persons
             , "Luisamneubauer"
             , "beyond_ideology" # maya göpel
             , "rahmstorf" # climate scientist
             , "Vquaschning" # energy scientist # "German greta"
             , "TiloJung"
             , "nicosemsrott"
             , "wozukunft"
             , "adam_tooze"
             , "maike_wilhelm"
             , "BohnFriedrich"
             , "12062020olympia"
                    
)


follower <- readRDS("data/follower.rds")
#not nice should be better programmed:
 if(ncol(follower)-1!=length(Accounts)){
   add <- (ncol(follower)):length(Accounts)
   follower <- cbind(follower, NA)
   colnames(follower)[ncol(follower)] <- Accounts[length(Accounts)]
 }

 followers <- c(NA,lookup_users(Accounts)$followers_count)
 follower <- rbind(follower,followers)
 follower[nrow(follower),1] <- date()
saveRDS(follower, "data/follower.rds") 

growthRate <- (follower[2:nrow(follower),2:ncol(follower)]/follower[1:(nrow(follower)-1),2:ncol(follower)]-1)*100

plot(1,1,col="white", ylim=c(-1,15),xlim=c(1,nrow(growthRate)))
for( i in 1:ncol(growthRate)){
  lines(growthRate[,i])
}
     