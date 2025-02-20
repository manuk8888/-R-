# Загрузка необходимых библиотек
library(shiny)
library(ggplot2)

# Загрузка данных
titanic_data <- read.csv("Titanic.csv")

# Определение пользовательского интерфейса
ui <- fluidPage(
  titlePanel("Анализ данных Титаника"),
  
  # Первая строка с выпадающими меню для выбора показателей
  fluidRow(
    column(6, selectInput("cat_var", "Выберите категориальный показатель:",
                          choices = c("Survived", "Pclass", "Sex"))),
    column(6, selectInput("num_var", "Выберите числовой показатель:",
                          choices = c("Age", "Fare")))
  ),
  
  # Вторая строка с выпадающими меню для выбора цветов
  fluidRow(
    column(6, selectInput("color1", "Выберите цвет для первого графика:",
                          choices = c("blue", "red", "green", "purple"))),
    column(6, selectInput("color2", "Выберите цвет для второго графика:",
                          choices = c("blue", "red", "green", "purple")))
  ),
  
  # Третья строка с графиками
  fluidRow(
    mainPanel(
      splitLayout(cellWidths = c("50%", "50%"), 
                  plotOutput("barPlot"), 
                  plotOutput("histPlot"))
    )
  )
)

# Определение серверной логики
server <- function(input, output) {
  
  # Столбиковая диаграмма для категориального показателя
  output$barPlot <- renderPlot({
    ggplot(titanic_data, aes_string(x = input$cat_var)) +
      geom_bar(fill = input$color1) +
      labs(title = paste("Распределение по", input$cat_var),
           x = input$cat_var, y = "Количество") +
      theme_minimal()
  })
  
  # Гистограмма для числового показателя
  output$histPlot <- renderPlot({
    ggplot(titanic_data, aes_string(x = input$num_var)) +
      geom_histogram(fill = input$color2, bins = 30) +
      labs(title = paste("Распределение по", input$num_var),
           x = input$num_var, y = "Количество") +
      theme_minimal()
  })
}

# Запуск приложения
shinyApp(ui = ui, server = server)