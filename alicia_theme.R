library(tidyverse)

theme_bw() +
theme(panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank(),
      panel.spacing = unit(1.5, "lines")) +
theme(axis.text = element_text(size = 12, color = "black")) +
theme(axis.title = element_text(size = 14, color = "black")) +
theme(legend.text = element_text(size = 12, color = "black")) +
theme(legend.title = element_text(size = 14, color = "black")) -> alicia_theme