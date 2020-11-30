library(tidyverse)

# This saves basic settings to standardize across figures for a manuscript
# Use source() to read this theme in at the beginning of a script
# Then theme_set() to make these settings standard for all figures in script
# Reduces the amount of times code needs to be repeated to create figures

basic_theme <- theme_bw() +
theme(panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank(),
      panel.spacing = unit(1.5, "lines")) +
theme(axis.text = element_text(size = 12, color = "black")) +
theme(axis.title = element_text(size = 14, color = "black")) +
theme(legend.text = element_text(size = 12, color = "black")) +
theme(legend.title = element_text(size = 14, color = "black"))