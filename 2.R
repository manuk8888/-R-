print ("ЗАДАЧА 1")

# Векторы
ID <- 100:108
GENDER <- c(1, 2, 2, 1, 2, 1, 1, 1)
YEAR <- c("1983", " 1988", "1975 ", "1980", "1977 ", "1992", "1994", "1983 ")

# Проверка типов
print(paste("Тип вектора ID:", class(ID)))
print(paste("Тип вектора GENDER:", class(GENDER)))
print(paste("Тип вектора YEAR:", class(YEAR)))

# Преобразуем GENDER в факторный тип
GENDER <- factor(GENDER, levels = c(1, 2), labels = c("женский", "мужской"))

# Преобразуем YEAR в целочисленный тип
# Сначала удаляем лишние пробелы с помощью trimws, затем преобразуем в числа
YEAR <- as.integer(trimws(YEAR))

# Проверяем типы после преобразования
print(paste("Тип вектора GENDER после преобразования:", class(GENDER)))
print(paste("Тип вектора YEAR после преобразования:", class(YEAR)))

print(ID)
print(GENDER)
print(YEAR)


print ("ЗАДАЧА 2")

# Создаем датафрейм goods_export
goods_export <- data.frame(
  Партнёр_1 = c("Канада", "Канада", "Нидерланды", "Нидерланды", "США", "США"),
  Партнёр_2 = c("Нидерланды", "США", "Канада", "США", "Канада", "Нидерланды"),
  Экспорт = c(3905228446, 336531873909, 4862948109, 29807484356, 292338433401, 51225636600)
)

# Создаем датафрейм goods_import
goods_import <- data.frame(
  Партнёр_1 = c("Канада", "Канада", "Нидерланды", "Нидерланды", "США", "США"),
  Партнёр_2 = c("Нидерланды", "США", "Канада", "США", "Канада", "Нидерланды"),
  Импорт = c(3515239399, 229687088046, 2249551077, 42262861193, 326628559104, 30883263358)
)

# Выводим датафреймы
print(goods_export)
print(goods_import)

# Создаем матрицу export_mat
export_mat <- matrix(0, nrow = 3, ncol = 3, dimnames = list(c("Канада", "Нидерланды", "США"), c("Канада", "Нидерланды", "США")))

# Заполняем матрицу export_mat данными из goods_export
export_mat["Канада", "Нидерланды"] <- goods_export$Экспорт[1]
export_mat["Канада", "США"] <- goods_export$Экспорт[2]
export_mat["Нидерланды", "Канада"] <- goods_export$Экспорт[3]
export_mat["Нидерланды", "США"] <- goods_export$Экспорт[4]
export_mat["США", "Канада"] <- goods_export$Экспорт[5]
export_mat["США", "Нидерланды"] <- goods_export$Экспорт[6]

# Создаем матрицу import_mat
import_mat <- matrix(0, nrow = 3, ncol = 3, dimnames = list(c("Канада", "Нидерланды", "США"), c("Канада", "Нидерланды", "США")))

# Заполняем матрицу import_mat данными из goods_import
import_mat["Канада", "Нидерланды"] <- goods_import$Импорт[1]
import_mat["Канада", "США"] <- goods_import$Импорт[2]
import_mat["Нидерланды", "Канада"] <- goods_import$Импорт[3]
import_mat["Нидерланды", "США"] <- goods_import$Импорт[4]
import_mat["США", "Канада"] <- goods_import$Импорт[5]
import_mat["США", "Нидерланды"] <- goods_import$Импорт[6]

# Выводим матрицы
print(export_mat)
print(import_mat)

diff_mat <- export_mat - import_mat
print(diff_mat)

log_export_mat <- log10(export_mat + 1)  # +1 для избежания логарифма от 0
log_import_mat <- log10(import_mat + 1)

print(log_export_mat)
print(log_import_mat)

L_data <- list(
  source = "COMTRADE, https://comtrade.un.org/",
  year = "2019",
  countries = c("Канада", "Нидерланды", "США"),
  export = goods_export,
  import = goods_import,
  export_mat = export_mat,
  import_mat = import_mat
)

print(L_data)

# Третья страна в векторе countries
print(L_data$countries[3])

# Объём экспорта из Нидерландов в Канаду
print(L_data$export_mat["Нидерланды", "Канада"])

# Объём импорта из США в Канаду
print(L_data$import_mat["США", "Канада"])

L_data[[length(L_data) + 1]] <- format(Sys.Date(), "%d.%m.%Y")
names(L_data)[length(L_data)] <- "date"

print(L_data)