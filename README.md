# Premier-League-2017-18-points
This visualisation in R using shiny package shows line charts for each team corresponding to the points they had on each match day. <br>
You can select any number of the 20 teams who participated in Premier League 2017-18 season.

Dataset - <br>
File named "prem.csv" is the initial data.
Kindly save it in the desired folder in your computer.

Information on each uploaded file -
(Please execute the files in order)

1. clean.R -- <br>
Contains the code to clean the initial dataset "prem.csv" by removing redundant columns, adding simple columns and performing general data manipulations.

2. points_table.R -- <br>
Contains code to create a new .csv file which will contain the points all (20) teams had on each match day (38, in total).

3. app.R <br>
Shiny app code to visualise the data obtained from points_table.R <br>
Overlapping line charts for each time. <br>
A slider input to change to different match day frames. <br>
Selectize input to select or deselect teams' data to be visualised. <br>
A "Match Information" section to show the following data for the point (match) clicked on - <br> <br>
Div = League Division <br>
Date = Match Date (dd/mm/yy) <br>
HomeTeam = Home Team <br>
AwayTeam = Away Team <br>
FTHG and HG = Full Time Home Team Goals <br>
FTAG and AG = Full Time Away Team Goals <br>
FTR and Res = Full Time Result (H=Home Win, D=Draw, A=Away Win) <br>
HTHG = Half Time Home Team Goals <br>
HTAG = Half Time Away Team Goals <br>
HTR = Half Time Result (H=Home Win, D=Draw, A=Away Win) <br> 
Match Statistics (where available) --- <br>
Attendance = Crowd Attendance <br>
Referee = Match Referee <br>
HS = Home Team Shots<br>
AS = Away Team Shots<br>
HST = Home Team Shots on Target <br>
AST = Away Team Shots on Target<br>
HHW = Home Team Hit Woodwork<br>
AHW = Away Team Hit Woodwork<br>
HC = Home Team Corners<br>
AC = Away Team Corners<br>
HF = Home Team Fouls Committed<br>
AF = Away Team Fouls Committed<br>
HFKC = Home Team Free Kicks Conceded <br>
AFKC = Away Team Free Kicks Conceded <br>
HO = Home Team Offsides<br>
AO = Away Team Offsides<br>
HY = Home Team Yellow Cards<br>
AY = Away Team Yellow Cards<br>
HR = Home Team Red Cards<br>
AR = Away Team Red Cards<br>
HBP = Home Team Bookings Points (10 = yellow, 25 = red)<br>
ABP = Away Team Bookings Points (10 = yellow, 25 = red)<br>


Please change the following variables in each file -
1. save_in <-  corresponding to the file directory in your computer
2. file_name <- corresponding to the file name in your computer

Note - 
In the Premier League 2017/18 season :
1. A team got 3 points from a win.
2. A team got 1 point from a draw.
3. A team got 0 point from a loss.
