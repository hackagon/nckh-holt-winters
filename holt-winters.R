library(dplyr)
library(stringr)
library(plotly)
library(ggplot2)
library(scales)
library(lattice)
library(reshape)

phanloai <- tonghop %>%
  filter(nam == 2018) %>%
  filter(xuattrongky_thanhtien != 0) %>%
  group_by(hoatchat_dvt) %>%
  summarise(
    nhomdieutri = head(nhomdieutri_moi, 1),
    cp_thuoc = sum(xuattrongky_thanhtien, na.rm = TRUE),
    cs_thuoc = sum(xuattrongky_sl, na.rm = TRUE),
    sl_thuoc = n_distinct(ThuongMai)) %>%
  arrange(desc(cp_thuoc)) %>%
  mutate(cp_thuoc_percent = cp_thuoc*100/sum(cp_thuoc)) %>%
  mutate(cp_thuoc_percent_tichluy = cumsum(cp_thuoc)*100/sum(cp_thuoc)) %>%
  mutate(phanloai_cp = ifelse(cp_thuoc_percent_tichluy < 67, "A", ifelse(cp_thuoc_percent_tichluy < 80, "B", "C"))) %>%
  arrange(desc(cs_thuoc)) %>%
  mutate(cs_thuoc_percent = cs_thuoc*100/sum(cs_thuoc)) %>%
  mutate(cs_thuoc_percent_tichluy = cumsum(cs_thuoc)*100/sum(cs_thuoc)) %>%
  mutate(phanloai_cs = ifelse(cs_thuoc_percent_tichluy < 67, "A", ifelse(cs_thuoc_percent_tichluy < 80, "B", "C"))) %>%
  filter(phanloai_cs != "C" | phanloai_cp != "C") %>%
  mutate(phanloai = str_c(phanloai_cs, phanloai_cp, sep = "")) %>%
  group_by(nhomdieutri) %>%
  arrange(
    nhomdieutri,
    desc(cs_thuoc_percent)) %>%
  select(c("hoatchat_dvt", "nhomdieutri", "sl_thuoc", "cs_thuoc", "cs_thuoc_percent", "cp_thuoc", "cp_thuoc_percent", "phanloai"))

phanloai$phanloai[which(phanloai$phanloai  == "CA")] <- "AC"
phanloai$phanloai[which(phanloai$phanloai  == "CB")] <- "BC"
phanloai$phanloai[which(phanloai$phanloai  == "BA")] <- "AB"

phanloai <- phanloai %>%
  arrange(desc(cs_thuoc))


thuoc <- tonghop %>%
  filter(hoatchat_dvt == "deferasirox_250_vien") %>%
  select(c("xuattrongky_sl", "nam", "thang")) %>%
  mutate(date = as.Date(str_c(nam, thang, "01", sep = "-"))) %>%
  group_by(date) %>%
  summarise(coso = sum(xuattrongky_sl)) %>%
  arrange(date)  

coso_thuoc <- as.ts(thuoc$coso)
coso_date <- ts(coso_thuoc, start=c(2014, 1), frequency = 12)
hw <- HoltWinters(coso_date)
plot(hw)

forecast <- predict(hw, n.ahead = 12, prediction.interval = T, level = 0.8)
plot(hw, forecast)


HWplot<-function(ts_object,  n.ahead=4,  CI=.95,  error.ribbon='green', line.size=1){
  
  hw_object<-HoltWinters(ts_object)
  
  forecast<-predict(hw_object,  n.ahead=n.ahead,  prediction.interval=T,  level=CI)
  
  
  for_values<-data.frame(time=round(time(forecast),  3),  value_forecast=as.data.frame(forecast)$fit,  dev=as.data.frame(forecast)$upr-as.data.frame(forecast)$fit)
  
  fitted_values<-data.frame(time=round(time(hw_object$fitted),  3),  value_fitted=as.data.frame(hw_object$fitted)$xhat)
  
  actual_values<-data.frame(time=round(time(hw_object$x),  3),  Actual=c(hw_object$x))
  
  
  graphset<-merge(actual_values,  fitted_values,  by='time',  all=TRUE)
  graphset<-merge(graphset,  for_values,  all=TRUE,  by='time')
  graphset[is.na(graphset$dev),  ]$dev<-0
  
  graphset$Fitted<-c(rep(NA,  NROW(graphset)-(NROW(for_values) + NROW(fitted_values))),  fitted_values$value_fitted,  for_values$value_forecast)
  
  
  graphset.melt<-melt(graphset[, c('time', 'Actual', 'Fitted')], id='time')
  
  p<-ggplot(graphset.melt,  aes(x=time,  y=value)) + geom_ribbon(data=graphset, aes(x=time, y=Fitted, ymin=Fitted-dev,  ymax=Fitted + dev),  alpha=.2,  fill=error.ribbon) + geom_line(aes(colour=variable), size=line.size) + geom_vline(x=max(actual_values$time),  lty=2) + xlab('Time') + ylab('Value') + opts(legend.position='bottom') + scale_colour_hue('')
  return(p)
  
}