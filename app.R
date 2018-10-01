library(dplyr)
library(ggplot2)
library(plotly)
library(shiny)
pts <- read.csv("D://RStudio//Prem18//points.csv")
matchData <- read.csv("D://RStudio//Prem18//premclean.csv")

teams <- as.factor(pts$Team) %>%
          unique() %>%
            as.vector()

ui <- fluidPage(titlePanel("Premier League 2017/18 Matchday Record"),
                sidebarLayout(
                  sidebarPanel(
                    fluidRow(
                      selectizeInput("selectTeams", "Choose Teams :", teams, selected = teams, multiple = TRUE, options = NULL)
                    )
                  ),
                  # output plot
                  mainPanel(
                    fluidRow(
                      column(width = 10, plotlyOutput("coolplot", height = 750))
                    ) ,
                    fluidRow(
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
  
  output$matchInfo <- renderPrint({
    d <- event_data("plotly_click")
    x <- matchData[ (matchData$HomeTeam == d$key | matchData$AwayTeam == d$key) & matchData$Matchday == (d$pointNumber + 1) , ]
    cat("Match Day info:\n")
    print(x)
  })
}

shinyApp(ui = ui, server = server)


#reference -- https://github.com/ropensci/plotly/issues/957
#reference -- https://plot.ly/r/cumulative-animations/