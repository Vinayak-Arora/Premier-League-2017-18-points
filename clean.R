library(dplyr)
save_in <- "C://Program Files//RStudio//"
file_name <- "prem.csv"
prem <- read.csv(paste(save_in, file_name, sep = ""), stringsAsFactors = FALSE)

#Remove redundant column Div
prem$Div <- NULL

result <- 0
#Add results column
prem$Result <- result

#If the home team scored more goals than the away team, result = "HomeTeam"
prem[prem$FTHG > prem$FTAG,"Result"] <- prem[prem$FTHG > prem$FTAG, "HomeTeam"]
#If the away team scored more goals than the home team, result = "AwayTeam"
prem[prem$FTHG < prem$FTAG,"Result"] <- prem[prem$FTHG < prem$FTAG, "AwayTeam"]
#If both teams scored equal number of goals
prem[prem$FTHG == prem$FTAG,"Result"] <- "Draw" 

matchday <- seq(from = 1, to = 380, by = 1)
matchday <- ceiling(matchday/10)
prem$Matchday <- matchday

file_name <- "premclean.csv"
write.csv(prem, paste(save_in, file_name, sep = ""))
