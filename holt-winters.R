library(dplyr)
library(stringr)
library(plotly)
library(ggplot2)
library(scales)
library(lattice)
library(reshape)
library(forecast)

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

forecast <- predict(hw, n.ahead = 12, prediction.interval = T, level = c(0.8, 0.95))

plot(hw, forecast)

par(mar=c(3,2,0.5,0))
grid <- matrix(c(1:2),nrow=2,ncol=1,byrow=TRUE)
layout(grid, widths=1, respect=FALSE)

fit <- forecast:::forecast.HoltWinters(hw)
plot(fit, main = "", ylim=c(0, 50000))
plot(fit, main = "")
