# Подключаем необходимые библиотеки
library(readr)  # Для чтения CSV-файлов
library(openxlsx)  # Для записи в Excel-файл

# Функция check_id
check_id <- function(folder_path) {
  # Устанавливаем рабочую папку
  setwd(folder_path)
  
  # Получаем список всех файлов в папке
  files <- list.files()
  
  # Фильтруем только CSV-файлы
  csv_files <- files[endsWith(files, ".csv")]
  
  # Создаем пустой датафрейм для хранения результатов
  result_df <- data.frame(filename = character(), type = integer(), stringsAsFactors = FALSE)
  
  # Проходим по каждому CSV-файлу
  for (file in csv_files) {
    # Читаем файл
    data <- read_csv(file)
    
    # Проверяем, есть ли столбец "ID"
    if ("ID" %in% colnames(data)) {
      type <- 1  # Если есть столбец "ID"
    } else {
      type <- 0  # Если нет столбца "ID"
    }
    
    # Добавляем информацию в датафрейм
    result_df <- rbind(result_df, data.frame(filename = file, type = type, stringsAsFactors = FALSE))
  }
  
  # Сохраняем результат в файл info.xlsx
  write.xlsx(result_df, "info.xlsx", rowNames = FALSE)
  
  # Возвращаем датафрейм для проверки
  return(result_df)
}

# Пример использования функции
folder_path <- "путь_к_вашей_папке"  # Укажите путь к вашей папке
result <- check_id(folder_path)
print(result)