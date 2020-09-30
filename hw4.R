install.packages('car')
library(naniar)
library(lubridate)
library(VIM)

df <- read.csv('/Users/lareina/Desktop/big_five_stocks.csv')

df <- data.frame(df)

# randomly introduce missingness
df[df <= 100.00] <- NA

df$X = wday(as.character(df$X))

#replace NA with every Fri
df[df == 6] <- NA

summary(df)

#KNN imputation
df1 <- kNN(df, variable = c(df$open,df$close), k=7)

