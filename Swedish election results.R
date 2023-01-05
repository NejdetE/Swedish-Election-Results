pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, cowplot, ggvis, 
               httr, lubridate, plotly, rio, rmarkdown, shiny, 
               stringr, tidyr, car, stargazer, L1pack, lmtest, LadR,
               AER, mfx, ggforce, dynlm, prais, ggdist, distributional, 
               forecast, fpp2, tseries, FinTS, rugarch, xts, AICcmodavg, 
               MuMIn, plotly, officer, gganimate, gifski, magick, 
               htmlwidgets, modelsummary, gtsummary, esquisse, 
               kableExtra, gt, sas7bdat, ggtext, patchwork, imager)

#Two ways of coding the same thing slightly different results
library(readxl)
Elec_res <- read_excel("C:/Users/nejde/Desktop/Valresultat riksdagen.xlsx")
View(Elec_res)
str(Elec_res)

#1
Elec_res %>% 
  ggplot() +
  geom_line(aes(År, `Socialdemokraterna (S)`), colour = "red", size=1.5, alpha = 0.85) +
  geom_line(aes(År, `Moderaterna (M)`), colour = "light blue", size=1.5, alpha = 0.85) +
  geom_line(aes(År, `Sverigedemokraterna (SD)`), colour = "yellow", size=1.5, alpha = 0.85) +
  geom_line(aes(År, `Miljöpartiet (MP)`), colour = "dark green", size=1.5, alpha = 0.85) +
  geom_line(aes(År, `Centerpartiet (C)`), colour = "green", size=1.5, alpha = 0.85) +
  geom_line(aes(År, `Kristdemokraterna (KD)`), colour = "dark blue", size=1.5, alpha = 0.85) +
  geom_line(aes(År, `Liberalerna (L)`), colour = "blue", size=1.5, alpha = 0.85) +
  geom_line(aes(År, `Vänsterpartiet (V)`), colour = "dark red", size=1.5, alpha = 0.85) +
    labs(title = "Swedish election results",
         subtitle = "Election results through time for parties currently in parliament",
         x = "Year", 
         y = "Political Parties",
         caption = "Source: SCB Historisk statistik över valåren 1910-2014.") +
    theme(plot.title = element_text(face = "bold", size = 20), 
          plot.subtitle = element_text(face = "italic", size = 15)) +
    theme_fivethirtyeight() +
    theme(axis.title = element_text())

#2
Elec_new <- gather(Elec_res, key = Party, value = Result,
                   c("Socialdemokraterna (S)", "Moderaterna (M)",
                     "Sverigedemokraterna (SD)","Miljöpartiet (MP)",
                     "Centerpartiet (C)","Kristdemokraterna (KD)",
                     "Liberalerna (L)","Vänsterpartiet (V)",))
Elec_new %>% 
  ggplot(aes(År, Result, group = Party, colour = Party)) +
  geom_line(size = 1.15) + 
       labs(title = "Swedish election results",
       subtitle = "Election results through time for parties currently in parliament",
       x = "Year", 
       y = "Voter share",
       caption = "Source: SCB Historisk statistik över valåren 1910-2014.") +
  theme_fivethirtyeight() +
  theme(plot.title = element_text(size = 22.5),
        plot.subtitle = element_text(size = 15, face = "italic"),
        axis.title = element_text(size = 14),
        axis.text = element_text(size = 11.5),
        legend.position = "right",
        legend.direction = "vertical") +
  scale_colour_manual(values = c("light green", "light blue", "dark blue", "green",
                      "blue", "red", "yellow", "dark red"))
