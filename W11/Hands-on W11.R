## Hands-on 1
library(gapminder)
library(tidyverse)
library(ggrepel)
library(socviz)

# Considering American Sociological Association Section Membership dataset (asasec), For 2013 show the relatioship between members and revenues and also cosider different colors for having journal. Use the linear prediction line.
p0 <- ggplot(data = subset(asasec, Year == 2013),
             mapping = aes(x = Members, y = Revenues, label = Sname))

p1 <- p0 + geom_smooth(method = "lm", se = FALSE, color = "gray80") +
  geom_point(mapping = aes(color = Journal)) 

p1


## Hands-on 2
# Lebel those outliers with revenue bigger than $10,000

p2 <- p1 + 
  geom_text_repel(data=subset(asasec, Year == 2013 & Revenues > 10000), size = 2)

p2

p3 <- p2 + labs(x="Membership",
                y="Revenues",
                color = "Section has own Journal",
                title = "ASA Sections",
                subtitle = "2014 Calendar year.",
                caption = "Source: ASA annual report.")

p3

p4 <- p3 + scale_y_continuous(labels = scales::dollar) +
  theme(legend.position = "bottom")
p4


## Hands-on 3
# Revise the code below to use *Accent* for color
p <- ggplot(data = organdata,
            mapping = aes(x = roads, y = donors, color = world))
p + geom_point(size = 1.5) + scale_color_brewer(palette = "Accent") +
  theme(legend.position = "top")


## Hands-on 4
# Find Lehigh university and Rutgers University color codes and dispaly it here 
lehigh_and_rutgers_colors <- c("#653019", "#FED141", "#CC0033", "#ffffff")
color_comp(lehigh_and_rutgers_colors)