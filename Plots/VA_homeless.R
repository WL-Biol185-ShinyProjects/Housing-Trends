library(readxl)

X2010_2015_PIT_Counts_by_State <- read_excel("Data/Homelessness/2010_2015_PIT_Counts_by_State.xlsx")

X2010_2015_PIT_Counts_by_State %>% ggplot(aes(X2010_2015_PIT_Counts_by_State$Year, X2010_2015_PIT_Counts_by_State$Total_Homeless)) + geom_line() + labs(title="Homelessness in Virginia", subtitle="(Point in Time 2010-2015)",
                                                                                                                                                        x ="Year", y = "People (Counts)", caption  = "2015 Annual Homeless Assessment Report (AHAR)")

