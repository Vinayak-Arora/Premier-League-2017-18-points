library(dplyr)
library(ggplot2)
library(plotly)
library(shiny)

save_in <- "C://Program Files//RStudio//"
file_name <- "points.csv"
pts <- read.csv(paste(save_in, file_name,sep = ""))

file_name <- "premclean.csv"
matchData <- read.csv(paste(save_in, file_name,sep = ""))

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

server <- function(input, output, session) {
  
  #get selectize "selectTeams" input
  steams <- reactive ({
    tm <- as.vector(input$selectTeams)
    return(tm)
  })
  
  # accumulative lines for each frame manipulation
  output$coolplot <- renderPlotly({
    accumulate_by <- function(dat, var) {
      var <- lazyeval::f_eval(var, dat)
      lvls <- plotly:::getLevels(var)
      dats <- lapply(seq_along(lvls), function(x) {
        cbind(dat[var %in% lvls[seq(1, x)], ], frame = lvls[[x]])
      })
      dplyr::bind_rows(dats)
    }
    pts <- pts %>%
      accumulate_by(~Matchday)
    
    #get ggplot animation 
    p <- ggplot(pts[pts$Team %in% as.vector(steams()) , ], aes(x = Matchday, y = Points, colour = Team, frame = Matchday, key = Team)) +
      geom_line(aes(group = Team, ids = Team, frame = frame))
    p <- ggplotly(p)
  })
  
  #To get the match info when a point on the graph is clicked
  output$matchInfo <- renderPrint({
    d <- event_data("plotly_click")
    x <- matchData[ (matchData$HomeTeam == d$key | matchData$AwayTeam == d$key) & matchData$Matchday == (d$pointNumber + 1) , ]
    cat("Match Day info:\n")
    print(x)
  })
}

shinyApp(ui = ui, server = server)
