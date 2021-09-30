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
species_counts <- surveys_complete %>%
  count(species_id) %>%
  filter(n >= 30)

surveys_complete <- surveys_complete %>%
  filter(species_id %in% species_counts$species_id)

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
sp <- species_counts$species_id
for (i in 1:nrow(species_counts)) {
  sub <- surveys_complete %>%
    filter (species_id == sp[i])


#Plotting
fig <- ggplot (data = sub,
               mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1)

ggsave (filename = paste0("plots/", sp[i], "_length_weight_scatter.jpg"),
        fig,
        height = 4,
        width = 4,
        units = "in")
}

#Time series plots
surveys_complete %>%
  filter(species_id == "DM") %>%
  group_by(year) %>%
  summarize(mean_weight = mean(weight),
            sd_weight = sd(weight)) %>%
  ggplot(aes(x = year, y = mean_weight)) +
  geom_pointrange(aes (ymin = mean_weight - sd_weight,
                       ymax = mean_weight + sd_weight))

#Challenge
surveys_complete %>%
  filter(genus == "Dipodomys") %>%
  group_by(species_id, year, sex) %>%
  summarize(mean_weight = mean(weight),
            sd_weight = sd(weight)) %>%
  ggplot (aes(x = year, y = mean_weight, color = sex)) +
  geom_pointrange(aes (ymin = mean_weight - sd_weight,
                       ymax = mean_weight + sd_weight)) +
  facet_wrap(vars(species_id), scales = "free_y", nrow = 3)


#Another view
surveys_complete %>%
  filter(genus == "Dipodomys") %>%
  group_by(species_id, year, sex) %>%
  summarize(mean_weight = mean(weight),
            sd_weight = sd(weight)) %>%
  ggplot (aes(x = year, y = mean_weight, color = sex)) +
  geom_pointrange(aes (ymin = mean_weight - sd_weight,
                       ymax = mean_weight + sd_weight)) +
  facet_grid(rows = vars(species_id),
             cols = vars(sex),
             scales = "free_y")


