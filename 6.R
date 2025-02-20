print ("ЗАДАЧА 1")
# Загрузка библиотек
library(tidyverse)

# Загрузка данных
beasts <- read.csv("beasts.csv")

# Проверка структуры датафрейма
str(beasts)

print ("ЗАДАЧА 2")
beasts <- beasts %>%
  mutate(Dragon = ifelse(Class == "Dragon", 1, 0))

print ("ЗАДАЧА 3")
beasts <- beasts %>%
  mutate(LogSize = log(Size))

print ("ЗАДАЧА 4")
beasts <- beasts %>%
  mutate(Danger = case_when(
    Classification %in% c("XXXX", "XXXXX") ~ "High",
    Classification == "XXX" ~ "Medium",
    Classification %in% c("X", "XX") ~ "Low"
  ))

print ("ЗАДАЧА 5")
beasts <- beasts %>%
  mutate(DangerNum = nchar(Classification))

print ("ЗАДАЧА 6")
dragons <- beasts %>%
  filter(Class == "Dragon")

print ("ЗАДАЧА 7")
dang_yellow <- beasts %>%
  filter(DangerNum >= 4 & Eye == "Yellow")

print ("ЗАДАЧА 8")
AmEu <- beasts %>%
  filter(grepl("North America|South America|Europe", Native))

print ("ЗАДАЧА 9")
eye_summary <- beasts %>%
  group_by(Eye) %>%
  summarise(
    Count = n(),
    Proportion = n() / nrow(beasts)
  )

print ("ЗАДАЧА 10")
classification_summary <- beasts %>%
  group_by(Classification) %>%
  summarise(
    MinSize = min(Size, na.rm = TRUE),
    MeanSize = mean(Size, na.rm = TRUE),
    MaxSize = max(Size, na.rm = TRUE)
  )

print ("ЗАДАЧА 11")
# Загрузка библиотеки stargazer
library(stargazer)

# Создание HTML-таблицы
stargazer(classification_summary, type = "html", out = "fantastic_beasts.htm", title = "Fantastic beasts")