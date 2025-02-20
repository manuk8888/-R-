print ("ЗАДАЧА 1")

# Создаем переменные с количеством очков
belki <- 15  # Пример значения для команды "Белки"
strelki <- 12  # Пример значения для команды "Стрелки"

# Сравниваем значения и выводим результат
if (belki > strelki) {
  print("Победила команда БЕЛКИ!")
} else if (strelki > belki) {
  print("Победила команда СТРЕЛКИ!")
} else {
  print("Победила дружба!")
}

print ("ЗАДАЧА 2")

# Вектор с температурами
temp <- c(-8, -5, 0, 2, -6, -9, -8, -12, -11, -7)

# Границы нормальной температуры
lower_bound <- -9.8
upper_bound <- -3.7

# Проверка каждого значения температуры
for (t in temp) {
  if (t > upper_bound) {
    cat(t, "Температура выше нормы\n")
  } else if (t < lower_bound) {
    cat(t, "Температура ниже нормы\n")
  } else {
    cat(t, "Температура в норме\n")
  }
}

print ("ЗАДАЧА 3")

# Функция progress
progress <- function(completed, total) {
  # Вычисляем процент выполненных заданий
  percentage <- (completed / total) * 100
  # Округляем до двух знаков после запятой
  rounded_percentage <- round(percentage, 2)
  # Возвращаем результат
  return(rounded_percentage)
}

# Пример использования функции
completed_assignments <- 7
total_assignments <- 10
result <- progress(completed_assignments, total_assignments)
cat("Процент выполненных заданий:", result, "%\n")

print ("ЗАДАЧА 4")

assessment <- function(profit) {
  result <- numeric(length(profit))  # Создаем вектор нулей той же длины, что и profit
  for (i in seq_along(profit)) {
    if (profit[i] > 0) {
      result[i] <- 1
    } else {
      result[i] <- 0
    }
  }
  return(result)
}

# Пример использования:
profit <- c(-100, 150, 3500, 720, 0, -350)
result <- assessment(profit)
print(result)  # [1] 0 1 1 1 0 0

print ("ЗАДАЧА 5")

assessment_ifelse <- function(profit) {
  return(ifelse(profit > 0, 1, 0))
}

# Пример использования:
profit <- c(-100, 150, 3500, 720, 0, -350)
result <- assessment_ifelse(profit)
print(result)  # [1] 0 1 1 1 0 0

print ("ЗАДАЧА 6")

addrs <- list("Адрес: улица Высокая, дом 5",
              "Адрес: ул. Речников, дом 10",
              "Адрес: Ул. Педагогическая, дом 12",
              "Адрес: Улица Новая Басманная, дом 9")

addrs_new <- lapply(addrs, function(addr) {
  # Удаляем "Адрес: " и приводим к нужному формату
  addr <- gsub("Адрес: ", "", addr)
  addr <- gsub("улица", "Ул.", addr)
  addr <- gsub("ул.", "Ул.", addr)
  addr <- gsub("Улица", "Ул.", addr)
  return(addr)
})

# Пример использования:
print(addrs_new)
# [[1]]
# [1] "Ул. Высокая, дом 5"
# [[2]]
# [1] "Ул. Речников, дом 10"
# [[3]]
# [1] "Ул. Педагогическая, дом 12"
# [[4]]
# [1] "Ул. Новая Басманная, дом 9"

print ("Задача 7")

my_median <- function(x) {
  x_sorted <- sort(x)  # Упорядочиваем вектор по возрастанию
  n <- length(x_sorted)
  
  if (n %% 2 == 1) {
    # Если число элементов нечётное
    median_value <- x_sorted[(n + 1) / 2]
  } else {
    # Если число элементов чётное
    median_value <- (x_sorted[n / 2] + x_sorted[n / 2 + 1]) / 2
  }
  
  return(median_value)
}

# Пример использования:
x1 <- c(3, 4, 9, 8, 2)
x2 <- c(6, 7, 2, 0, 9, 3)

print(my_median(x1))  # [1] 4
print(my_median(x2))  # [1] 4.5
