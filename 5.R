print ("Задача 1")

# Загрузка данных из файла flats.csv
flats <- read.csv("flats.csv")
# Открытие датафрейма в отдельном окне RStudio
View(flats)

print ("Задача 2")

# Вывод первых строк датафрейма
head(flats)
# Вывод последних строк датафрейма
tail(flats)
# Вывод структуры датафрейма
str(flats)
# Проверка типов данных (убедимся, что числовые столбцы имеют тип numeric)
sapply(flats, class)

print ("Задача 3")

# Вывод описательных статистик для всех столбцов
summary(flats)
# Анализ различий между медианой и средним значением
# Например, для цены (price)
mean_price <- mean(flats$price)
median_price <- median(flats$price)
cat("Средняя цена:", mean_price, "\nМедианная цена:", median_price, "\n")
# Разброс цен
min_price <- min(flats$price)
max_price <- max(flats$price)
cat("Минимальная цена:", min_price, "\nМаксимальная цена:", max_price, "\n")
# Проверка на наличие нетипичных значений (например, отрицательных цен)
if (any(flats$price < 0)) {
  cat("Обнаружены отрицательные цены на квартиры.\n")
} else {
  cat("Отрицательных цен на квартиры не обнаружено.\n")
}

print ("Задача 4")

# Добавление столбца priceru (цена в тысячах рублей)
flats$priceru <- flats$price * 78 / 1000
# Вывод первых строк для проверки
head(flats)

print ("Задача 5")

# Сохранение максимальной цены в переменную pricemax
pricemax <- max(flats$priceru)
# Фильтрация строки с самой дорогой квартирой
most_expensive <- flats[flats$priceru == pricemax, ]
# Вывод характеристик самой дорогой квартиры
print(most_expensive)

print ("Задача 6")

# Сохранение минимальной цены в переменную pricemin
pricemin <- min(flats$priceru)
# Фильтрация строки с самой дешёвой квартирой
cheapest <- flats[flats$priceru == pricemin, ]
# Вывод характеристик самой дешёвой квартиры
print(cheapest)

print ("Задача 7")

# Средняя жилая площадь
mean_livesp <- mean(flats$livesp)
# Фильтрация квартир
flats1 <- flats[flats$walk == 1 & flats$livesp > mean_livesp, ]
# Вывод первых строк для проверки
head(flats1)

print ("Задача 8")

# Фильтрация квартир
flats2 <- flats[flats$priceru < 5000 | flats$priceru > 35000, ]
# Вывод первых строк для проверки
head(flats2)

print ("Задача 9")

# Добавление столбца ratio
flats$ratio <- flats$livesp / flats$totsp
# Вывод первых строк для проверки
head(flats)

print ("Задача 10")

# Фильтрация квартир с ratio > 0.8
high_ratio_flats <- flats[flats$ratio > 0.8, ]
# Вывод первых строк для проверки
head(high_ratio_flats)
# Проверка, являются ли такие квартиры самыми дорогими
most_expensive_high_ratio <- high_ratio_flats[high_ratio_flats$priceru == max(high_ratio_flats$priceru), ]
print(most_expensive_high_ratio)

print ("Задача 11")

# Выбор столбцов totsp, livesp, kitsp
space <- flats[, c("totsp", "livesp", "kitsp")]
# Переименование столбцов
colnames(space) <- c("total", "live", "kitchen")
# Вывод первых строк для проверки
head(space)