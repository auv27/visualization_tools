library(tidyverse)
library(viridis)

# Code to create a nice figure using the output from preacher interaction utilities (http://quantpsy.org/interact/mlr2.htm)
# This will create a regions of significance figure for a 2-way interaction

# These equations are example data pulled from preacher utility output
z1=-420  #supply lower bound for z
z2=420   #supply upper bound for z
z <- seq(z1,z2,length=1000)
fz <- c(z,z)
y1 <- (0.4781+0.0057*z)+(2.1044*sqrt(0.0597+(2*z*-0.0001)+((z^2)*0.000003)))
y2 <- (0.4781+0.0057*z)-(2.1044*sqrt(0.0597+(2*z*-0.0001)+((z^2)*0.000003)))
fy <- c(y1,y2)
fline <- (0.4781+0.0057*z)

# Pull these variables into a data.frame
df <- data.frame(z = c(z), fz = c(fz), 
                y1 = c(y1), y2 = c(y2), 
                fy = c(fy), fline = c(fline))

# Set significance colors for figure (optional)
# Settings pulled from Preacher utilities output
df <- df %>%
  mutate(linecolor = ifelse(fz <= -335.48 | fz >= 12.67, "sig", "insig"))

# Create figure
ggplot(df, aes(fz, fy, color = linecolor)) +
  geom_line(alpha=.5) +
  # Nice package for colorblind friendly visualizations
  scale_color_viridis_d(begin = .3, end = .7) +
  stat_smooth(method = "lm", se = FALSE, color = "black") +
  labs(y = "Title Y",
       x = "Title X") +  
  theme(plot.title = element_text(hjust = 0)) +
  # Set lines for significance boundaries
  geom_vline(xintercept = -335.4841, linetype = "dashed") +
  geom_vline(xintercept = 12.67, linetype = "dashed") +
  geom_hline(yintercept = 0) +
  # Create a line segment visualizing observed data range
  geom_segment(aes(x = min(-351.555290),xend = max(413.370407),y = 0,yend = 0),
               colour = "black", size = 2) +
  # Annotate boundary lines
  annotate("text", x = -270, y = 5.5,
           label = "paste(x, \" = -335.48 \")", parse = TRUE) +
  annotate("text", x = 75, y = 5.5,
           label = "paste(x, \" = 12.67 \")", parse = TRUE) +
  # Remove legend
  theme(legend.position = "none")

