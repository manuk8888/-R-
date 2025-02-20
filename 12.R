print ("Задача 1")
health <- read.csv("global_health.csv")

print ("Задача 2")
library(dplyr)
h19 <- health %>% filter(Period == 2019)

print ("Задача 3")
library(psych)
describeBy(h19$First.Tooltip, h19$Dim1)

print ("Задача 4")
library(ggplot2)
ggplot(h19, aes(x=First.Tooltip, fill=Dim1)) +
  geom_density(alpha=0.5) +
  labs(title="Плотность распределения продолжительности жизни по полу", x="Продолжительность жизни", y="Плотность")

print ("Задача 5")
hh <- h19 %>% pivot_wider(names_from = Dim1, values_from = First.Tooltip)

print ("Задача 6")
outliers <- boxplot.stats(hh$Female)$out
if(length(outliers) == 0) {
  print("Нетипичных значений нет")
} else {
  print(outliers)
}

print ("Задача 7")
boxplot(hh$Male, main="Ящик с усами для продолжительности жизни мужчин", ylab="Продолжительность жизни")
outliers_male <- boxplot.stats(hh$Male)$out
if(length(outliers_male) > 0) {
  print(hh %>% filter(Male %in% outliers_male) %>% select(Location, Male))
}

print ("Задача 8")
correlation <- cor(hh$Female, hh$Male, method="pearson")
print(correlation)

print ("Задача 9")
correlation <- cor(hh$Female, hh$Male, method="pearson")
print(correlation)

print ("Задача 10")
# Загрузка необходимых библиотек
library(tidyverse)
# Загрузка данных из файлов
alc <- read_csv("global_alcohol.csv")
doc <- read_csv("global_doctors.csv")
# Фильтрация данных за 2015 год
alc16 <- alc %>% filter(Period == 2015)
doc16 <- doc %>% filter(Period == 2015)

print ("Задача 11")
alc16 <- alc16 %>% filter(Dim1 == "Both sexes")

print ("Задача 12")
# Загрузка данных из файла global_health.csv
health <- read_csv("global_health.csv")
# Фильтрация данных за 2015 год
health16 <- health %>% filter(Period == 2015)
# Объединение датасетов
combined_data <- health16 %>%
  left_join(alc16, by = c("Location", "Period", "Dim1")) %>%
  left_join(doc16, by = c("Location", "Period"))
# Просмотр итогового датафрейма
head(combined_data)

print ("Задача 13")
small <- combined %>% select(Location, `Both sexes`, First.Tooltip.x, First.Tooltip.y)
colnames(small) <- c("Location", "Life_Expectancy", "Alcohol_Consumption", "Doctors_Per_10000")

print ("Задача 14")
library(corrplot)
cor_matrix <- cor(small %>% select(-Location))
corrplot(cor_matrix, method="circle")





