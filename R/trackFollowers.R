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
                    
)


readRDS("data/follower.rds")
 followers <- c(NA,lookup_users(Accounts)$followers_count)
 follower <- rbind(follower,followers)
 follower[nrow(follower),1] <- date()
saveRDS(follower, "data/follower.rds") 
