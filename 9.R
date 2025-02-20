print ("ЗАДАЧА 1")
# Загрузка библиотеки для работы с данными
library(readr)
# Загрузка данных из файла sleep.csv
sleep_surv <- read_csv("sleep.csv", col_types = cols(.default = col_factor()))

print ("ЗАДАЧА 2")
# Вывод уровней фактора marital
levels(sleep_surv$marital)

print ("ЗАДАЧА 3")
# Упорядочивание уровней фактора marital
sleep_surv$marital <- factor(sleep_surv$marital, 
                             levels = c("single", "married/defacto", "divorced", "widowed"))

print ("ЗАДАЧА 4")
# Вывод частот значений в столбце edlevel
table(sleep_surv$edlevel)

print ("ЗАДАЧА 5")
# Упорядочивание уровней фактора edlevel
sleep_surv$edlevel <- factor(sleep_surv$edlevel, 
                             levels = c("primary school", "secondary school", 
                                        "trade training/post-secondary training", 
                                        "undergraduate degree", "postgraduate degree"))

# Вывод частот значений в столбце edlevel после упорядочивания
table(sleep_surv$edlevel)

print ("ЗАДАЧА 6")
# Упорядочивание уровней фактора qualslp
sleep_surv$qualslp <- factor(sleep_surv$qualslp, 
                             levels = c("very poor", "poor", "fair", "good", "very good", "excellent"), 
                             ordered = TRUE)

print ("ЗАДАЧА 7")
# Фильтрация данных для курящих людей
sleep_smoke <- subset(sleep_surv, smoke == "yes")

print ("ЗАДАЧА 8")
# Минимальное и максимальное значение качества сна у курящих
min_qualslp <- min(as.numeric(sleep_smoke$qualslp), na.rm = TRUE)
max_qualslp <- max(as.numeric(sleep_smoke$qualslp), na.rm = TRUE)

# Наиболее часто встречающееся значение качества сна у курящих
most_common_qualslp <- names(sort(table(sleep_smoke$qualslp), decreasing = TRUE))[1]

# Вывод результатов
cat("Минимальное значение качества сна у курящих:", min_qualslp, "\n")
cat("Максимальное значение качества сна у курящих:", max_qualslp, "\n")
cat("Наиболее часто встречающееся значение качества сна у курящих:", most_common_qualslp, "\n")

print ("ЗАДАЧА 9")
# Загрузка библиотеки tidyverse
library(dplyr)

# Кодирование значений с частотой ниже 30 как "other"
sleep_surv <- sleep_surv %>%
  mutate(marital = fct_lump_min(marital, min = 30, other_level = "other"))

# Проверка, какие значения превратились в "other"
table(sleep_surv$marital)

print ("ЗАДАЧА 10")
# Преобразование столбца smoke в целочисленный
sleep_surv$smoke <- as.integer(sleep_surv$smoke == "yes")

print ("ЗАДАЧА 11")
# Выгрузка обновлённого датафрейма в файл
write_csv(sleep_surv, "sleep-new.csv")