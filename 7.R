# Загрузка необходимых библиотек
library(googlesheets4)
library(dplyr)
library(tidyr)

# Задача 1: Загрузите данные с листа Rental файла Texas Rental и сохраните их в датафрейм rental.
rental <- read_sheet("https://docs.google.com/spreadsheets/d/your_spreadsheet_id", sheet = "Rental")

# Задача 2: Преобразуйте столбец average_rate_per_night в целочисленный тип.
rental$average_rate_per_night <- as.integer(gsub("\\$", "", rental$average_rate_per_night))

# Задача 3: Замените значения Studio в столбце bedrooms_count на 0 и преобразуйте тип в целочисленный.
rental$bedrooms_count[rental$bedrooms_count == "Studio"] <- 0
rental$bedrooms_count <- as.integer(rental$bedrooms_count)

# Задача 4: Разбейте столбец date_of_listing на month_listing и year_listing.
rental <- rental %>%
  separate(date_of_listing, into = c("month_listing", "year_listing"), sep = " ", convert = TRUE)

# Задача 5: Загрузите данные с листа Texas файла Texas Rental и сохраните их в датафрейм texas.
texas <- read_sheet("https://docs.google.com/spreadsheets/d/your_spreadsheet_id", sheet = "Texas")

# Задача 6: Проверьте тип столбца population и исправьте, если необходимо.
texas$population <- as.numeric(texas$population)

# Задача 7: Объедините датафреймы rental и texas.
final <- merge(rental, texas, by = "city", all.x = TRUE)

# Задача 8: Удалите строки с пропущенными значениями в датафрейме final.
final <- na.omit(final)

# Задача 9: Выберите 10 самых крупных по численности населения городов.
top_cities <- final %>%
  distinct(city, .keep_all = TRUE) %>%
  arrange(desc(population)) %>%
  head(10) %>%
  select(city)

# Задача 10: Сгруппируйте строки по названию города и сформируйте таблицу с минимальной и максимальной средней ценой аренды.
texas_sum <- final %>%
  filter(city %in% top_cities$city) %>%
  group_by(city) %>%
  summarise(min_rate = min(average_rate_per_night), max_rate = max(average_rate_per_night))

# Задача 11: Измените структуру таблицы texas_sum в long format.
texas_sum_long <- texas_sum %>%
  pivot_longer(cols = c(min_rate, max_rate), names_to = "rate_type", values_to = "rate_value")

# Вывод результатов
print(texas_sum_long)