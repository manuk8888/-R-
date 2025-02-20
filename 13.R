print ("ЗАДАЧА 1")
# Генерация генеральной совокупности
population <- rchisq(4000, df = 4)
# Построение гистограммы для population
hist(population, col = "lightblue", main = "Гистограмма генеральной совокупности", xlab = "Значения", ylab = "Частота")
# Извлечение 500 случайных выборок и вычисление средних значений
chi_means <- replicate(500, mean(sample(population, 1000)))
# Построение гистограммы для chi_means
hist(chi_means, col = "lightgreen", main = "Гистограмма средних значений выборок", xlab = "Средние значения", ylab = "Частота")
# Сравнение средних значений и стандартных отклонений
mean_population <- mean(population)
mean_chi_means <- mean(chi_means)
sd_population <- sd(population)
sd_chi_means <- sd(chi_means)
cat("Среднее значение генеральной совокупности:", mean_population, "\n")
cat("Среднее значение chi_means:", mean_chi_means, "\n")
cat("Стандартное отклонение генеральной совокупности:", sd_population, "\n")
cat("Стандартное отклонение chi_means:", sd_chi_means, "\n")

print ("ЗАДАЧА 2")
# Загрузка данных
popular <- read.csv("popular.csv")
# Вывод описательных статистик
summary(popular)

print ("ЗАДАЧА 3")
# Установка библиотеки DescTools, если она не установлена
if (!require(DescTools)) install.packages("DescTools")
library(DescTools)
# Построение 99%-ного доверительного интервала для доли страниц, относящихся к гуманитарным наукам
ci_humanities <- BinomCI(sum(popular$domain == "Humanities"), nrow(popular), conf.level = 0.99)
ci_humanities

print ("ЗАДАЧА 4")
# Построение 90%-ного доверительног
‘о интервала для доли страниц, относящихся к техническим наукам
ci_science <- BinomCI(sum(popular$domain == "Science & Technology"), nrow(popular), conf.level = 0.90)
ci_science

print ("ЗАДАЧА 5")
# Построение 95%-ного доверительного интервала для среднего значения индекса исторической популярности
ci1 <- MeanCI(popular$historical_popularity_index[popular$domain == "Humanities"], conf.level = 0.95)
ci2 <- MeanCI(popular$historical_popularity_index[popular$domain == "Science & Technology"], conf.level = 0.95)
ci1
ci2
# Сравнение доверительных интервалов
cat("Доверительный интервал для гуманитарных наук:", ci1, "\n")
cat("Доверительный интервал для технических наук:", ci2, "\n")

print ("ЗАДАЧА 6")
# Создание векторов и датафрейма
x <- c(1, 2)
mns <- c(ci1[["est"]], ci2[["est"]])
low <- c(ci1[["lwr.ci"]], ci2[["lwr.ci"]])
upp <- c(ci1[["upr.ci"]], ci2[["upr.ci"]])
dat <- data.frame(x, mns, low, upp)

print ("ЗАДАЧА 7")
# Установка библиотеки ggplot2, если она не установлена
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)
# Визуализация доверительных интервалов
ggplot(dat, aes(x = x, y = mns, color = as.factor(x))) +
  geom_errorbar(aes(ymin = low, ymax = upp), width = 0.2) + 
  geom_point(size = 4) +
  labs(x = "95% confidence intervals", y = "means") +
  scale_color_manual(values = c("blue", "red"))

print ("ЗАДАЧА 8")
# Проверка гипотезы о равенстве долей
prop.test(x = c(sum(popular$domain == "Humanities"), sum(popular$domain == "Science & Technology")),
          n = c(nrow(popular), nrow(popular)), conf.level = 0.95)


