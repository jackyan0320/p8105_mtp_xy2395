
# 24-hour activity “profiles”
# heatmap 
motion_data %>% 
  group_by(day_num, hour) %>%
  summarize(mean_activity = mean(activity)) %>% 
  ggplot(aes(y = hour, x = day_num, fill = mean_activity)) +
  geom_tile(color = "black") +
  viridis::scale_color_viridis(
    name = "Day of the Week", 
    discrete = FALSE
  )
# scatterplot

motion_data %>% 
  group_by(day_num, hour) %>% 
  summarize(hour_activity = sum(activity)) %>% 
  ggplot(aes(x = hour, y = hour_activity)) +
  geom_boxplot() 

motion_data %>% 
  group_by(day_num, hour) %>% 
  summarize(hour_activity = sum(activity)) %>% 
  ggplot(aes(y = hour, x = hour_activity)) +
  geom_density_ridges() 
