print ("ЗАДАЧА 1")
library(readxl)
db <- read_excel("DB.xlsx")

print ("ЗАДАЧА 2")
library(dplyr)
summary_table <- db %>%
  group_by(Gender) %>%
  summarise(
    Count = n(),
    Mean_Age = mean(Age, na.rm = TRUE),
    SD_Age = sd(Age, na.rm = TRUE)
  )
print(summary_table)

print ("ЗАДАЧА 3")
correlation <- cor.test(db$SEC, db$Forgiveness, method = "pearson")
print(correlation)

print ("ЗАДАЧА 4")
library(ggplot2)
ggplot(db, aes(x = SEC, y = Curiosity, color = Gender)) +
  geom_point() +
  theme_minimal()

print ("ЗАДАЧА 5")
correlation_curiosity <- cor.test(db$SEC, db$Curiosity, method = "spearman")
print(correlation_curiosity)

print ("ЗАДАЧА 6")
correlation_spirit <- cor.test(db$DASS_21, db$Spirituality, method = "pearson")
print(correlation_spirit)

print ("ЗАДАЧА 7")
library(corrplot)
selected_data <- db %>% select(DASS_21, Spirituality, SEC, Forgiveness)
cor_matrix <- cor(selected_data)
corrplot(cor_matrix, method = "circle")

print ("ЗАДАЧА 8")
model <- lm(DASS_21 ~ Age, data = db)
summary(model)

print ("ЗАДАЧА 9")
predicted_value <- predict(model, newdata = data.frame(Age = 27))
mean_dass <- mean(db$DASS_21, na.rm = TRUE)
print(predicted_value > mean_dass)

print ("ЗАДАЧА 10")
r_squared <- summary(model)$r.squared
print(r_squared)

print ("ЗАДАЧА 11")
plot(model)

print ("ЗАДАЧА 12")
t_test <- t.test(Work ~ Gender, data = db)
print(t_test)