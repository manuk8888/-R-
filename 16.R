print ("Задача 1")
# Загрузка данных
beer <- read.csv("Consumo_cerveja.csv", sep=",", dec=",")

print ("Задача 2")
# Построение модели линейной регрессии
model_beer <- lm(Consumo.de.cerveja..litros. ~ Temperatura.Media..C. + Precipitacao..mm. + Final.de.Semana, data=beer)
summary(model_beer)

print ("Задача 3")
# Добавление столбца Month
beer$Month <- format(as.Date(beer$Data, format="%Y-%m-%d"), "%m")

print ("Задача 4")
# Добавление переменной Month в модель
model_beer_month <- lm(Consumo.de.cerveja..litros. ~ Temperatura.Media..C. + Precipitacao..mm. + Final.de.Semana + Month, data=beer)
summary(model_beer_month)

print ("Задача 5")
# R-квадрат модели
summary(model_beer_month)$r.squared

print ("Задача 6")
# Проверка на мультиколлинеарность
library(car)
vif(model_beer_month)
# Проверка на гетероскедастичность
library(lmtest)
bptest(model_beer_month)
# Проверка на влиятельные наблюдения
influence.measures(model_beer_month)

print ("Задача 7")
# Загрузка данных
diabet <- read.csv("diabetes.csv")

print ("Задача 8")
# Описательные статистики
summary(diabet)
# Удаление строк с невозможными значениями (например, давление = 0)
diabet <- diabet[diabet$BloodPressure != 0, ]

print ("Задача 9")
# Подсчёт строк
table(diabet$Outcome)

print ("Задача 10")
# Построение модели логистической регрессии
model_diabet <- glm(Outcome ~ Glucose + BloodPressure + Insulin + BMI + Age, data=diabet, family=binomial)
summary(model_diabet)

print ("Задача 11")
# Интерпретация коэффициентов
exp(coef(model_diabet))

print ("Задача 12")
# Показатели качества модели
library(pROC)
roc_curve <- roc(diabet$Outcome, predict(model_diabet, type="response"))
auc(roc_curve)
# Другой показатель качества - точность модели
predicted <- ifelse(predict(model_diabet, type="response") > 0.5, 1, 0)
accuracy <- mean(predicted == diabet$Outcome)
accuracy

