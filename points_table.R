library(dplyr)
prem <- read.csv("D://RStudio//Prem18//premclean.csv", stringsAsFactors = FALSE)
points <- data.frame("Matchday" = seq(from = 0, to = 38, by = 1), stringsAsFactors = FALSE)
teams <- as.factor(prem$HomeTeam) %>%
          unique() %>%
            sort() %>%
              as.vector()
points[ , teams] <- 0

for(md in 1:38) {
  #make a vector of the teams that drew  
  drawteam <- prem[(prem$Matchday == md) & (prem$Result == "Draw") , "HomeTeam"]
  drawteam <- c(drawteam, prem[(prem$Matchday == md) & (prem$Result == "Draw") , "AwayTeam"])
  # increment 1 point to the previous matchday for each team that drew
  points[md == points$Matchday, unique(drawteam)] <- points[(md-1) == points$Matchday, unique(drawteam)] + 1
  #make a vector of the teams that won
  winteam <- prem[(prem$Matchday == md) & (prem$Result!= "Draw") , "Result"]
  # increment 3 points for each team to the previous matchday that won
  points[md == points$Matchday, unique(winteam)] <- points[(md-1) == points$Matchday, unique(winteam)] + 3
  if(intersect(drawteam, winteam) %>%
      length()!=0) {
    points[md == points$Matchday, intersect(drawteam, winteam)] <- points[md == points$Matchday, intersect(drawteam, winteam)] + 1
  }
  #increment points for teams who played multiple matches on a single matchday
  points[md == points$Matchday, drawteam[duplicated(drawteam)]] <- points[md == points$Matchday, drawteam[duplicated(drawteam)]] + 1
  points[md == points$Matchday, winteam[duplicated(winteam)]] <- points[md == points$Matchday, winteam[duplicated(winteam)]] + 3
  #make a vector of the teams that lost
  loseteam <- setdiff(teams, c(winteam, drawteam))
  # increment 0 point for each team to the previous matchday that won
  points[md == points$Matchday, loseteam] <- points[(md-1) == points$Matchday, loseteam]
}

points <- points[points$Matchday!= 0,]

write.csv(points, "D://RStudio//Prem18//points_table.csv")

ptable <- data.frame("Matchday" = rep(1:38, each=20), 
                     "Team" = rep(teams, times = 38),
                     stringsAsFactors = FALSE)
pts <- 1
ptable$Points <- pts

for(md in 1:38) {
  ptable[ptable$Matchday ==md , "Points"] <- as.numeric(points[md == points$Matchday, c(-1)])
}

write.csv(ptable, "D://RStudio//Prem18//points.csv")
