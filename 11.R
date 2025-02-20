print("Задача 1")
psy <- read.csv("Cowles.csv")

print("Задача 2")
summary(psy)

print("Задача 3")
library(ggplot2)
ggplot(psy, aes(x=extraversion)) +
  geom_histogram(binwidth=sd(psy$extraversion), color="black", fill="blue") +
  labs(title="Гистограмма уровня экстраверсии", x="Уровень экстраверсии", y="Частота")

print("Задача 4")
ggplot(psy, aes(x=neuroticism, fill=sex)) +
  geom_density(alpha=0.5) +
  scale_fill_manual(values=c("female"="pink", "male"="blue"), labels=c("Женщины", "Мужчины")) +
  labs(title="Плотность распределения уровня невротизма по полу", x="Уровень невротизма", y="Плотность")

print("Задача 5")
ggplot(psy, aes(x=extraversion, fill=volunteer)) +
  geom_histogram(binwidth=2, color="black") +
  facet_wrap(~volunteer) +
  scale_fill_manual(values=c("no"="red", "yes"="green"), labels=c("Нет", "Да")) +
  labs(title="Гистограммы уровня экстраверсии по участию в волонтёрских мероприятиях", x="Уровень экстраверсии", y="Частота")

print("Задача 6")
ggplot(psy, aes(x=sex, fill=sex)) +
  geom_bar() +
  scale_fill_manual(values=c("female"="pink", "male"="blue")) +
  labs(title="Количество респондентов по полу", x="Пол", y="Количество")

print("Задача 7")
ggplot(psy, aes(x="", fill=volunteer)) +
  geom_bar(width=1) +
  coord_polar("y", start=0) +
  scale_fill_manual(values=c("no"="red", "yes"="green")) +
  labs(title="Доля респондентов, участвующих в волонтёрских мероприятиях")

print("Задача 8")
crimes <- read.csv("Crimes.csv")

print("Задача 9")
library(dplyr)
states_an <- crimes %>% filter(state %in% c("California", "Florida", "Iowa"))

print("Задача 10")
ggplot(states_an, aes(x=year, y=robbery, linetype=state)) +
  geom_line() +
  scale_linetype_manual(values=c("California"="solid", "Florida"="dashed", "Iowa"="dotted")) +
  labs(title="Динамика числа краж по годам", x="Год", y="Число краж")

print("Задача 11")
ggplot(crimes, aes(x=prisoners, y=robbery)) +
  geom_point() +
  labs(title="Связь между числом краж и числом заключённых", x="Число заключённых", y="Число краж")

