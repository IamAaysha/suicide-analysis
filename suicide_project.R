sui<-read.csv("D:\\sucidedataset.csv")
sui<-sui[-9]
sui<-sui[1:1000,]
#statistics
head(sui)
tail(sui)
mean(sui$suicides.100k.pop)
mode(sui$suicides.100k.pop)
median(sui$suicides.100k.pop)
sd(sui$suicides_no)
var(sui$suicides_no)
dim(sui)
length(sui$suicides.100k.pop)
class(sui$suicides.100k.pop)
#plots
hist(sui$suicides.100k.pop,xlab='suicides per 100k',col='blue')
plot(sui$suicides.100k.pop,type='p',xlab='suicides per 100k',col='red')
plot(sui$suicides.100k.pop,type="b",xlab='suicides per 100k',col='blue')
plot(sui$suicides.100k.pop,type='c',xlab='suicides per 100k',col='yellow')
#checking for nullvalues
anyNA(sui)
colSums(is.na(sui))
#preprocessing
str(sui)
#storing string values into an int vector
sui$country=as.factor(sui$country)
sui$sex=as.factor(sui$sex)
sui$age=as.factor(sui$age)
sui$country.year=as.factor(sui$country.year)
sui$gdp_for_year....=as.factor(sui$gdp_for_year....)
sui$generation=as.factor(sui$generation)
#creating dummies
library(fastDummies)
country=dummy_cols(sui$country)[-c(1,2)]
sex=dummy_cols(sui$sex)[-c(1,2)]
age=dummy_cols(sui$age)[-c(1,2)]
country.year=dummy_cols(sui$country.year)[-c(1,2)]
gdp_for_year....=dummy_cols(sui$gdp_for_year....)[-c(1,2)]
generation=dummy_cols(sui$generation)[-c(1,2)]

final=cbind(country,sex,age,country.year,gdp_for_year....,generation,sui$year,sui$suicides_no,sui$population,sui$gdp_per_capita....,sui$suicides.100k.pop)

colnames(final)[4756]='suicides.100k.pop'

final[,4730:4755]=scale(final[,4730:4755])

samp=sample(1:nrow(final),800)
train=final[samp,]
test=final[-samp,]
#regression
model=lm(suicides.100k.pop~country+sui$year+sex+age+sui$suicides_no+sui$population+country.year+gdp_for_year....+sui$gdp_per_capita....+generation,data=sui)
summary(model)
predictors=predict(model,newdata = sui,interval="predict")


a=c(1:1000)
plot(a,predictors[,1])
lines(a,predictors[,1])
plot(a,sui$suicides.100k.pop)
lines(a,sui$suicides.100k.pop)

#rmse
sqrt(mean(((predictors-sui$suicides.100k.pop)**2)))#9.14

