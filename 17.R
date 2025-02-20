# Загрузка необходимых библиотек
library(plotly)
library(dplyr)

# Задача 1: Загрузка данных
wine <- read.csv("winemag-data.csv")

# Задача 2: Выбор строк, соответствующих винам из Франции
wine_fr <- wine %>% filter(country == "France")

# Задача 3: Построение диаграммы рассеивания для французских вин
plot_ly(wine_fr, x = ~points, y = ~price, type = "scatter", mode = "markers",
        marker = list(size = 10, color = 'rgba(255, 182, 193, .9)')) %>%
  layout(title = "Связь между баллами и ценой для французских вин",
         xaxis = list(title = "Баллы"),
         yaxis = list(title = "Цена (USD)"))

# Задача 4: Диаграмма рассеивания с цветом, зависящим от провинции
plot_ly(wine_fr, x = ~points, y = ~price, color = ~province, type = "scatter", mode = "markers",
        marker = list(size = 10)) %>%
  layout(title = "Связь между баллами и ценой для французских вин по провинциям",
         xaxis = list(title = "Баллы"),
         yaxis = list(title = "Цена (USD)"))

# Задача 5: Фильтрация вин из Италии, Испании и Франции с баллами более 90
wine_90plus <- wine %>% filter(country %in% c("Italy", "Spain", "France") & points > 90)

# Задача 6: Интерактивная визуализация с выпадающими меню
# Создание отдельных датафреймов для каждой страны
wine_italy <- wine_90plus %>% filter(country == "Italy")
wine_spain <- wine_90plus %>% filter(country == "Spain")
wine_france <- wine_90plus %>% filter(country == "France")

# Создание интерактивной визуализации
plot_ly() %>%
  add_trace(data = wine_italy, x = ~price, type = "histogram", name = "Италия", marker = list(color = 'red')) %>%
  add_trace(data = wine_spain, x = ~price, type = "histogram", name = "Испания", marker = list(color = 'blue')) %>%
  add_trace(data = wine_france, x = ~price, type = "histogram", name = "Франция", marker = list(color = 'green')) %>%
  layout(title = "Распределение цен на вина с баллами > 90",
         xaxis = list(title = "Цена (USD)"),
         yaxis = list(title = "Количество"),
         updatemenus = list(
           list(
             type = "dropdown",
             buttons = list(
               list(method = "restyle",
                    args = list("visible", list(TRUE, FALSE, FALSE)),
                    label = "Италия"),
               list(method = "restyle",
                    args = list("visible", list(FALSE, TRUE, FALSE)),
                    label = "Испания"),
               list(method = "restyle",
                    args = list("visible", list(FALSE, FALSE, TRUE)),
                    label = "Франция")
             ),
             direction = "down",
             showactive = TRUE
           ),
           list(
             type = "dropdown",
             buttons = list(
               list(method = "restyle",
                    args = list("marker.color", list("red")),
                    label = "Красный"),
               list(method = "restyle",
                    args = list("marker.color", list("blue")),
                    label = "Синий"),
               list(method = "restyle",
                    args = list("marker.color", list("green")),
                    label = "Зеленый"),
               list(method = "restyle",
                    args = list("marker.color", list("purple")),
                    label = "Фиолетовый"),
               list(method = "restyle",
                    args = list("marker.color", list("orange")),
                    label = "Оранжевый")
             ),
             direction = "down",
             showactive = TRUE
           )
         ))