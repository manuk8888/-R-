print ("Задача 1")
marketing <- read.csv("marketing.csv")

print ("Задача 2")
library(dplyr)
promotion_counts <- marketing %>% group_by(Promotion) %>% summarise(count = n())
print(promotion_counts)

print ("Задача 3")
library(ggplot2)
ggplot(marketing, aes(x=MarketSize)) +
  geom_bar() +
  labs(title="Количество фирм по размеру бизнеса", x="Размер бизнеса", y="Количество фирм")

print ("Задача 4")
ggplot(marketing, aes(x=as.factor(Promotion), y=SalesInThousands, fill=as.factor(Promotion))) +
  geom_boxplot() +
  labs(title="Ящики с усами для числа продаж по типам продвижения", x="Тип продвижения", y="Число продаж (тыс.)")

print ("Задача 5")
one_two <- marketing %>% filter(Promotion %in% c(1, 2))

print ("Задача 6")
# Проверка нормальности распределения
shapiro.test(one_two$SalesInThousands[one_two$Promotion == 1])
shapiro.test(one_two$SalesInThousands[one_two$Promotion == 2])
# Проверка равенства средних
t.test(SalesInThousands ~ Promotion, data = one_two)

print ("Задача 7")
# Проверка нормальности распределения
shapiro.test(marketing$SalesInThousands)
# Проверка равенства средних
anova_result <- aov(SalesInThousands ~ as.factor(Promotion), data = marketing)
summary(anova_result)

print ("Задача 8")
lib_int <- read.csv("library-ab-interact.csv")
lib_serv <- read.csv("library-ab-services.csv")

print ("Задача 9")
lib_int <- lib_int %>% mutate(Name = case_when(
  Name == "FIND" ~ "FIND",
  Name == "REQUEST" ~ "REQUEST",
  Name == "INTERACT" ~ "INTERACT",
  TRUE ~ "OTHER"
))
lib_serv <- lib_serv %>% mutate(Name = case_when(
  Name == "FIND" ~ "FIND",
  Name == "REQUEST" ~ "REQUEST",
  Name == "SERVICES" ~ "SERVICES",
  TRUE ~ "OTHER"
))

print ("Задача 10")
# Круговая диаграмма для lib_int
ggplot(lib_int, aes(x="", y=No..clicks, fill=Name)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  labs(title="Процент кликов на заголовки (INTERACT)")
# Круговая диаграмма для lib_serv
ggplot(lib_serv, aes(x="", y=No..clicks, fill=Name)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  labs(title="Процент кликов на заголовки (SERVICES)")

print ("Задача 11")
# Сравнение кликов на INTERACT и SERVICES
interact_clicks <- lib_int %>% filter(Name == "INTERACT") %>% pull(No..clicks)
services_clicks <- lib_serv %>% filter(Name == "SERVICES") %>% pull(No..clicks)
# Проверка гипотезы
t.test(interact_clicks, services_clicks)

