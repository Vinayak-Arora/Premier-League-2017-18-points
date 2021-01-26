#library(dplyr)
#library(ggplot2)
#library(plotly)
#library(shiny)

#save_in <- "C://Program Files//RStudio//"
#file_name <- "points.csv"
#pts <- read.csv(paste(save_in, file_name,sep = ""))
pts <- read.csv("points.csv")

#file_name <- "premclean.csv"
#matchData <- read.csv(paste(save_in, file_name,sep = ""))
matchData <- read.csv("premClean.csv")

teams <- as.factor(pts$Team) %>%
          unique() %>%
            as.vector()

ui <- fluidPage(titlePanel("Premier League 2017/18 Matchday Record"),
                sidebarLayout(
                  sidebarPanel(
                    fluidRow(
                      #Names of all 20 teams to be selected from
                      #By default, all teams are selected
                      selectizeInput("selectTeams", "Choose Teams :", teams, selected = teams, multiple = TRUE, options = NULL)
                    )
                  ),
                  mainPanel(
                    fluidRow(
                      column(width = 10, plotlyOutput("coolplot", height = 750))
                    ) ,
                    fluidRow(
                      #A section that displays match info whenever a point on the graph is clicked on
                      verbatimTextOutput("matchInfo")
                    )
                  )
                )
              )

