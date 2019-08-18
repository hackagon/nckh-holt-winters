# Process data

# library

# import file
setwd("./csv")
tonghop <- read.csv("tonghop_final.csv", stringsAsFactors = FALSE)

# pre-processing data
tonghop$hoatchat <- tolower(tonghop$hoatchat)
tonghop$hoatchat <- gsub(" ", "_", tonghop$hoatchat)
tonghop$hoatchat <- gsub("-", "_", tonghop$hoatchat)

tonghop$dvt <- tolower(tonghop$dvt)

tonghop$dvt[which(tonghop$dvt == "gói")] <- "goi"
tonghop$dvt[which(tonghop$dvt == "lọ")] <- "lo"
tonghop$dvt[which(tonghop$dvt == "viên sủi")] <- "vien_sui"
tonghop$dvt[which(tonghop$dvt == "viên")] <- "vien"
tonghop$dvt[which(tonghop$dvt == "ống")] <- "ong"
tonghop$dvt[which(tonghop$dvt == "bịch")] <-"tui"
tonghop$dvt[which(tonghop$dvt == "túi")] <- "tui"
tonghop$dvt[which(tonghop$dvt == "túi ")] <- "tui"
tonghop$dvt[which(tonghop$dvt == "hộp")] <- "lo"
tonghop$dvt[which(tonghop$dvt == "bơm tiêm")] <- "bom_tiem"
tonghop$dvt[which(tonghop$dvt == "bình")] <- "binh"

unique(tonghop$dvt)

# export file
write.csv(tonghop, "tonghop_processed.csv")
