library(tidyverse)
install.packages("renv")
renv::snapshot
library(RColorBrewer)
library(renv)


data(iris)
head(iris)


#### Data manipulation

iris %>% 
  group_by(Species) %>% 
  summarize_all(mean)


filter(iris, Petal.Length > 2)



### ggplots

#### lengght vs. width
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  labs(title = "Sepal Length vs. Sepal Width",
       x = "Sepal Length in cm",
       y = "Sepal Width in cm") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5),   
        axis.title.x = element_text(hjust = 0.5),  
        axis.title.y = element_text(hjust = 0.5))




### average petal length per species

average_petal_length <- iris %>%
  group_by(Species) %>%
  summarize(Average_Petal_Length = mean(Petal.Length))


ggplot(average_petal_length, aes(x = Species, y = Average_Petal_Length, fill = Species)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Petal Length by Species",
       x = "Species",
       y = "Average Petal Length (cm)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(hjust = 0.5), 
        axis.title.y = element_text(hjust = 0.5))  

renv::snapshot()
