# Process data

# library
library(dplyr)
library(stringr)

# import file
setwd("/home/hackagon/nckh-holt-winters/csv")
tonghop <- read.csv("tonghop_final.csv", stringsAsFactors = FALSE)
nhomdieutri <- read.csv("nhomdieutri.csv", stringsAsFactors = FALSE)

# pre-processing data
tonghop$hoatchat <- tolower(tonghop$hoatchat)
tonghop$hoatchat <- gsub(" ", "_", tonghop$hoatchat)
tonghop$hoatchat <- gsub("-", "_", tonghop$hoatchat)

tonghop$dvt <- tolower(tonghop$dvt)

tonghop$dvt[which(tonghop$dvt == "gói")] <- "goi"
tonghop$dvt[which(tonghop$dvt == "lọ")] <- "lo"
tonghop$dvt[which(tonghop$dvt == "viên sủi")] <- "vien_sui"
tonghop$dvt[which(tonghop$dvt == "viên")] <- "vien"
tonghop$dvt[which(tonghop$dvt == "ống")] <- "lo"
tonghop$dvt[which(tonghop$dvt == "ong")] <- "lo"
tonghop$dvt[which(tonghop$dvt == "bịch")] <-"tui"
tonghop$dvt[which(tonghop$dvt == "túi")] <- "tui"
tonghop$dvt[which(tonghop$dvt == "túi ")] <- "tui"
tonghop$dvt[which(tonghop$dvt == "hộp")] <- "lo"
tonghop$dvt[which(tonghop$dvt == "bơm tiêm")] <- "bom_tiem"
tonghop$dvt[which(tonghop$dvt == "bình")] <- "binh"


# hoat chat
tonghop$hoatchat <- gsub("sulfamethoxazol_trimethoprim", tonghop$hoatchat,replacement = "sulfamethoxazole_trimethoprim")
tonghop$hoatchat[which(tonghop$hoatchat == "sulfamethoxazol_trimethoprim")] <- "sulfamethoxazole_trimethoprim"
tonghop$hoatchat[which(tonghop$hoatchat == "sulfamethoxazole_trimethoprim")] <- "sulfamethoxazole_trimethoprim"
tonghop$nhomdieutri[which(str_detect(tonghop$hoatchat, "domperidon") )] <- 33
tonghop$nhomdieutri[which(str_detect(tonghop$hoatchat, "spiramycin_metronidazo") )] <- 8
tonghop$nhomdieutri[which(str_detect(tonghop$hoatchat, "succimer") )] <- 4

nhomdieutri_moi <- rep(0, nrow(tonghop))
i<-1
while(i <= nrow(nhomdieutri)){
  index <- which(tonghop$nhomdieutri == nhomdieutri$Nhom_loai_1[i])
  nhomdieutri_moi[index] = nhomdieutri$Nhom_loai_2[i]
  
  i <- i + 1
}
tonghop$nhomdieutri_moi <- nhomdieutri_moi

# hoatchat_dvt
tonghop$hoatchat_dvt <- paste(tonghop$hoatchat, tonghop$dvt, sep = "_")
tonghop$hoatchat_dvt[which(tonghop$hoatchat_dvt == "albumin_200_lo")] <- "albumin_200_chai"
tonghop$hoatchat_dvt[which(tonghop$hoatchat_dvt == "clinoleic_100_chai")] <- "clinoleic_100_tui"
tonghop$hoatchat_dvt[which(tonghop$hoatchat_dvt == "deferasirox_125_lo")] <- "deferasirox_125_vien"
tonghop$hoatchat_dvt[which(tonghop$hoatchat_dvt == "metronidazol_500_lo")] <- "metronidazol_500_chai"
tonghop$hoatchat_dvt[which(tonghop$hoatchat_dvt == "midazolam_5mg_1ml_vien")] <- "midazolam_5mg_1ml_lo"
tonghop$hoatchat_dvt[which(tonghop$hoatchat_dvt == "pegfilgrastim_6mg_0,6ml_lo")] <- "pegfilgrastim_6mg_0,6ml_bom_tiem"
tonghop$hoatchat_dvt[which(tonghop$hoatchat_dvt == "paracetamol_1000mg_lo")] <- "paracetamol_1000mg_chai"
tonghop$hoatchat_dvt[which(tonghop$hoatchat_dvt == "ciclosporin_100mg_ml_vien")] <- "ciclosporin_100mg_ml_chai"
tonghop$hoatchat_dvt[which(tonghop$hoatchat_dvt == "ciclosporin_25mg_ml_vien")] <- "ciclosporin_25mg_ml_chai"
tonghop$hoatchat_dvt[which(tonghop$hoatchat_dvt == "vitamin_c_500_lo")] <- "vitamin_c_500_vien"
tonghop$hoatchat_dvt[which(tonghop$hoatchat_dvt == "azithromycin_200mg_5ml_chai")] <- "azithromycin_200mg_5ml_lo"
tonghop$hoatchat_dvt[which(tonghop$hoatchat_dvt == "zoledronic_acid_4mg_chai")] <- "zoledronic_acid_4mg_lo"


tonghop$ThuongMai <- tonghop$ThuongMai %>%
  gsub(pattern = " ", replacement = "_") %>%
  tolower()
tonghop$ThuongMai[923] <- "aminoplasmal_b.braun_5%_e_250"

tonghop$xuattrongky_sl[which(is.na(tonghop$xuattrongky_sl))] <- 0
tonghop$xuattrongky_thanhtien[which(is.na(tonghop$xuattrongky_thanhtien))] <- 0

# export file
write.csv(tonghop, "tonghop_processed.csv")

