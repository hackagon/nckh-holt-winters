# Process data

# library
library(dplyr)

# import file
setwd("./csv")
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

unique(tonghop$dvt)

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

# export file
write.csv(tonghop, "tonghop_processed.csv")

