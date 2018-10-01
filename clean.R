prem <- read.csv("D://RStudio//Prem18//prem.csv", stringsAsFactors = FALSE)
result <- 0
prem$Result <- result
prem[prem$FTHG > prem$FTAG,"Result"] <- prem[prem$FTHG > prem$FTAG, "HomeTeam"]
prem[prem$FTHG < prem$FTAG,"Result"] <- prem[prem$FTHG < prem$FTAG, "AwayTeam"]
prem[prem$FTHG == prem$FTAG,"Result"] <- "Draw" 
prem$Div <- NULL
matchday <- seq(from = 1, to = 380, by = 1)
matchday <- ceiling(matchday/10)
prem$Matchday <- matchday
write.csv(prem, "D://RStudio//Prem18//premclean.csv")