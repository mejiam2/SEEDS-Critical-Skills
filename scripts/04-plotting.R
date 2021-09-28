# Plotting with ggplot

# library packages
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
surveys <- read_csv("data_raw/portal_data_joined.csv")

#Filter to complete survey data
surveys_complete <- surveys %>%
  filter(!is.na(weight),
         !is.na(hindfoot_length),
         !is.na(sex))

#Extract most common species
species_count <- surveys %>%
  count(species_id) %>%
  filter(n >= 30)

surveys_complete <- surveys_complete %>%
  filter(species_id %in% species_count$species_id)

#Plotting
  # ggplot (data = DATA, mapping = aes()) + 
  # geom_point()

ggplot(data = surveys_complete,
       mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, aes(color = species_id))

#Boxplot
ggplot(data = surveys_complete,
       aes(x = species_id, y = weight)) +
  geom_jitter(alpha = 0.1) +
  geom_boxplot(alpha = 0.1, color = "purple")

#Weight - hindfoot_length correlation for each species


