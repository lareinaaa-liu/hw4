library(lubridate)
library(quantmod)
library(visdat)
library(dplyr)
library(readr)

getSymbols(c('GOOG','ZM','TSLA','DJI','AAPL','FB','AMZN','MSFT','USO',
             'SPY'),from='2020-03-01',to='2020-06-01')


stocks=as.xts(data.frame(GOOG[,'GOOG.Close'],ZM[,'ZM.Close'],
                         AMZN[,'AMZN.Close'],AAPL[,'AAPL.Close'],
                         MSFT[,'MSFT.Close'],TSLA[,'TSLA.Close'],
                         USO[,'USO.Close'],DJI[,'DJI.Close'],
                         FB[,'FB.Close'],SPY[,'SPY.Close']))
n_miss(stocks)

n_complete(stocks)

miss_var_summary(stocks)

miss_case_summary(stocks)

miss_var_table(stocks)
miss_case_table(stocks)

vis_dat(stocks)
vis_miss(stocks)
vis_miss(stocks,cluster = TRUE)

write.zoo(stocks,'hhhstocks.cvs',index.name = 'Date',sep=',')
stocks=read.csv('hhhstocks.cvs')

splitByWeeks=split(stocks$Date,week(stocks$Date))
