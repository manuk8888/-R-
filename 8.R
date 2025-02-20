print ("ЗАДАЧА 1")
travel <- read.csv("travel-times.csv")

print ("ЗАДАЧА 2")
travel <- travel[, !names(travel) %in% c("Comments")]

print ("ЗАДАЧА 3")
travel[travel == "" | travel == "-"] <- NA

print ("ЗАДАЧА 4")
# Количество ячеек с пропущенными значениями
total_na_cells <- sum(is.na(travel))
# Количество строк с пропущенными значениями
rows_with_na <- sum(rowSums(is.na(travel)) > 0)
total_na_cells
rows_with_na

print ("ЗАДАЧА 5")
library(VIM)
# Матрица пропущенных значений
aggr(travel, numbers = TRUE, sortVars = TRUE)
# График пропущенных значений
matrixplot(travel)

print ("ЗАДАЧА 6")
# Для столбца FuelEconomy
mean_fuel <- mean(travel$FuelEconomy, na.rm = TRUE)
median_fuel <- median(travel$FuelEconomy, na.rm = TRUE)
# Заполнение пропусков
if (abs(mean_fuel - median_fuel) > 5) {
  travel$FuelEconomy[is.na(travel$FuelEconomy)] <- median_fuel
} else {
  travel$FuelEconomy[is.na(travel$FuelEconomy)] <- mean_fuel
}

print ("ЗАДАЧА 7")
melb <- read.csv("melb_data.csv")

print ("ЗАДАЧА 8")
# Матрица пропущенных значений
aggr(melb, numbers = TRUE, sortVars = TRUE)
# График пропущенных значений
matrixplot(melb)

print ("ЗАДАЧА 9")
melb$Car <- na.locf(melb$Car)

print ("ЗАДАЧА 10")
mean_building_area <- mean(melb$BuildingArea, na.rm = TRUE)
melb$BuildingArea[is.na(melb$BuildingArea)] <- mean_building_area

print ("ЗАДАЧА 11")
median_year_built <- median(melb$YearBuilt, na.rm = TRUE)
melb$YearBuilt[is.na(melb$YearBuilt)] <- median_year_built



