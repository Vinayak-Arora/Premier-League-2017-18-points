# Premier-League-2017-18-points
This visualisation in R using shiny package shows line charts for each team corresponding to the points they had on each match day.
You can select any number of the 20 teams who participated in Premier League 2017-18 season.

Dataset -
File named "prem.csv" is the initial data.
Kindly save it in the desired folder in your computer.

Information on each uploaded file -
(Please execute the files in order)

1. clean.R --
Contains the code to clean the initial dataset "prem.csv" by removing redundant columns, adding simple columns and performing general data manipulations.

2. points_table.R --
Contains code to create a new .csv file which will contain the points all (20) teams had on each match day (38, in total).

3. app.R
Shiny app code to visualise the data obtained from points_table.R
Overlapping line charts for each time.
A slider input to change to different match day frames.
Selectize input to select or deselect teams' data to be visualised.
A "Match Information" section to show the following data for the point (match) clicked on -

Div = League Division.
Date = Match Date (dd/mm/yy).
HomeTeam = Home Team.
AwayTeam = Away Team.
FTHG and HG = Full Time Home Team Goals.
FTAG and AG = Full Time Away Team Goals.
FTR and Res = Full Time Result (H=Home Win, D=Draw, A=Away Win)
HTHG = Half Time Home Team Goals
HTAG = Half Time Away Team Goals
HTR = Half Time Result (H=Home Win, D=Draw, A=Away Win)

Match Statistics (where available)
Attendance = Crowd Attendance
Referee = Match Referee
HS = Home Team Shots
AS = Away Team Shots
HST = Home Team Shots on Target
AST = Away Team Shots on Target
HHW = Home Team Hit Woodwork
AHW = Away Team Hit Woodwork
HC = Home Team Corners
AC = Away Team Corners
HF = Home Team Fouls Committed
AF = Away Team Fouls Committed
HFKC = Home Team Free Kicks Conceded
AFKC = Away Team Free Kicks Conceded
HO = Home Team Offsides
AO = Away Team Offsides
HY = Home Team Yellow Cards
AY = Away Team Yellow Cards
HR = Home Team Red Cards
AR = Away Team Red Cards
HBP = Home Team Bookings Points (10 = yellow, 25 = red)
ABP = Away Team Bookings Points (10 = yellow, 25 = red)

--x--

Please change the following variables in each file -
save_in <-  corresponding to the file directory in your computer
file_name <- corresponding to the file name in your computer

Note - 
In the Premier League 2017/18 season :
A team got 3 points from a win.
A team got 1 point from a draw.
A team got 0 point from a loss.
