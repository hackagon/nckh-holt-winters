``` r
tonghop <- read.csv("./csv/tonghop_processed.csv")
# hoatchat_dvt
tonghop$hoatchat_dvt <- paste(tonghop$hoatchat, tonghop$dvt, sep = "_")

# biet duoc
bietduoc_index <- which(tonghop$nhomBD == 1) 
bietduoc_df <- tonghop[bietduoc_index, ]
bietduoc_aggregate_df <- aggregate(xuattrongky_sl ~ hoatchat_dvt, bietduoc_df,FUN = sum)
bietduoc_aggregate_df$xuattrongky_thanhtien <- aggregate(xuattrongky_thanhtien ~ hoatchat_dvt, bietduoc_df,FUN = sum)$xuattrongky_thanhtien
bietduoc_sl_thuoc <- nrow(bietduoc_aggregate_df)
bietduoc_coso_thuoc_sd <- sum(bietduoc_aggregate_df$xuattrongky_sl)
bietduoc_cp <- sum(bietduoc_aggregate_df$xuattrongky_thanhtien)

# generic
generic_index <- which(tonghop$nhomBD == 2) 
generic_df <- tonghop[generic_index, ]
generic_aggregate_df <- aggregate(xuattrongky_sl ~ hoatchat_dvt, generic_df,FUN = sum)
generic_aggregate_df$xuattrongky_thanhtien <- aggregate(xuattrongky_thanhtien ~ hoatchat_dvt, generic_df,FUN = sum)$xuattrongky_thanhtien
generic_sl_thuoc <- nrow(generic_aggregate_df)
generic_coso_thuoc_sd <- sum(generic_aggregate_df$xuattrongky_sl)
generic_cp <- sum(generic_aggregate_df$xuattrongky_thanhtien)

# tong so luong thuoc theo bietduoc/generic
tong_sl_thuoc <- bietduoc_sl_thuoc + generic_sl_thuoc
tong_coso_thuoc_sd <- bietduoc_coso_thuoc_sd + generic_coso_thuoc_sd
tong_cp <- bietduoc_cp + generic_cp

bietduoc_phantram <- bietduoc_sl_thuoc / tong_sl_thuoc
generic_phantram <- generic_sl_thuoc / tong_sl_thuoc
bietduoc_coso_sd_phantram <- bietduoc_coso_thuoc_sd / tong_coso_thuoc_sd
generic_coso_sd_phantram <- generic_coso_thuoc_sd / tong_coso_thuoc_sd
```

``` r
bietduoc_generic_df <- data.frame(matrix(nrow = 2))
bietduoc_generic_df$phan_loai <- c("Biet duoc", "Generic")
bietduoc_generic_df$sl_thuoc <- c(bietduoc_sl_thuoc, generic_sl_thuoc)
bietduoc_generic_df$thuoc_phantram <- c(bietduoc_phantram, generic_phantram)
bietduoc_generic_df$coso_thuoc_sd <- c(bietduoc_coso_thuoc_sd, generic_coso_thuoc_sd)
bietduoc_generic_df$coso_thuoc_sd_phantram <- c(bietduoc_coso_sd_phantram, generic_coso_sd_phantram)

bietduoc_aggregate_df
```

    ##                          hoatchat_dvt xuattrongky_sl xuattrongky_thanhtien
    ## 1           acid_amin_7,58%_200ml_tui           1436          1.533091e+08
    ## 2                 albendazol_200_vien           9870          7.246396e+07
    ## 3        aluminum_phosphat_12,38g_goi          25870          9.703742e+07
    ## 4           aluminum_phosphat_16g_goi          29910          1.064106e+08
    ## 5           aminoplasmal_10%_250_chai           1177          1.097124e+08
    ## 6           aminoplasmal_10%_500_chai            750          1.077798e+08
    ## 7            aminoplasmal_5%_250_chai           1262          9.064986e+07
    ## 8            aminoplasmal_5%_500_chai           1370          1.515885e+08
    ## 9                    amlodipin_5_vien         218013          1.655373e+09
    ## 10      amox_clavulanac_250_31.25_goi          17383          1.936847e+08
    ## 11       amox_clavulanac_500_125_vien         130326          1.553065e+09
    ## 12             atorvastatin_10mg_vien          19847          3.163810e+08
    ## 13               atorvastatin_20_vien          14968          2.571605e+08
    ## 14               atorvastatin_40_vien              0          0.000000e+00
    ## 15        azithromycin_200mg_5ml_chai             25          2.876937e+06
    ## 16          azithromycin_200mg_5ml_lo             85          9.858980e+06
    ## 17              azithromycin_500_vien            868          7.796376e+07
    ## 18                  bisoprolol_5_vien          11095          4.366992e+07
    ## 19                  bortezomib_1mg_lo           2150          1.407328e+10
    ## 20                bortezomib_3,5mg_lo           2590          5.933690e+10
    ## 21                 ceftazidim_1000_lo          21703          1.627242e+09
    ## 22                 cefuroxim_250_vien           5367          7.066192e+07
    ## 23                 cefuroxim_500_vien           5210          1.281087e+08
    ## 24          ciclosporin_100mg_ml_chai            474          1.594869e+09
    ## 25          ciclosporin_100mg_ml_vien          71640          4.820942e+09
    ## 26           ciclosporin_25mg_ml_vien         200163          3.390360e+09
    ## 27             ciclosporin_50mg_ml_lo           4825          3.055576e+08
    ## 28            ciclosporin_50mg_ml_ong           3090          1.956833e+08
    ## 29               ciprofloxacin_200_lo          29228          7.218147e+09
    ## 30               ciprofloxacin_400_lo            325          9.230130e+07
    ## 31             ciprofloxacin_500_vien         173103          2.408382e+09
    ## 32                 clindamycin_150_lo            254          2.661920e+07
    ## 33                clindamycin_150_ong            195          2.043600e+07
    ## 34                   cytarabin_500_lo            542          9.956960e+07
    ## 35                deferasirox_125_ong              0          0.000000e+00
    ## 36               deferasirox_125_vien          28506          2.745042e+09
    ## 37               deferasirox_250_vien         736773          1.418988e+11
    ## 38                 deferoxamin_500_lo         247772          3.620345e+10
    ## 39                  enoxaparin_60_ong           1943          2.198752e+08
    ## 40                 entecavir_500_vien          25473          2.035165e+09
    ## 41                  ertapenem_1000_lo            865          4.600157e+08
    ## 42            erythropoietin_10000_lo             91          1.046500e+08
    ## 43           erythropoietin_10000_ong           1532          1.761800e+09
    ## 44             erythropoietin_2000_lo            149          4.022984e+07
    ## 45            erythropoietin_2000_ong            392          1.058396e+08
    ## 46                 esomeprazol_10_goi           4681          1.051165e+08
    ## 47                esomeprazol_20_vien          23016          5.168473e+08
    ## 48                  esomeprazol_40_lo          20313          3.119264e+09
    ## 49                esomeprazol_40_vien          96219          2.160694e+09
    ## 50     filgrastim_30mu_0,5ml_bom_tiem           1338          9.499800e+08
    ## 51           filgrastim_30mu_0,5ml_lo          12264          1.343204e+10
    ## 52                gabapentin_300_vien           4995          5.652312e+07
    ## 53                 ganciclovir_500_lo           1787          1.321079e+09
    ## 54                 gliclazide_30_vien         103562          2.790614e+08
    ## 55                 gliclazide_60_vien            131          7.152600e+05
    ## 56        hyoscin_butylbromid_10_vien            507          5.741287e+05
    ## 57         hyoscin_butylbromid_20_ong            822          6.845430e+06
    ## 58                  imatinib_100_vien         740406          2.993091e+11
    ## 59   imipenem_+_cilastatin_500_500_lo         167130          5.972674e+10
    ## 60                 indapamid_1,5_vien          59500          1.877409e+08
    ## 61             insulin_glargin_100_lo            392          1.979716e+08
    ## 62               itraconazol_100_vien          93278          1.701316e+09
    ## 63            itraconazol_10mg_ml_tui             17          3.927000e+07
    ## 64                levofloxacin_250_lo          12456          1.502178e+09
    ## 65              levofloxacin_500_chai            237          3.578700e+07
    ## 66                levofloxacin_500_lo           9469          1.695988e+09
    ## 67              levofloxacin_500_vien            525          1.918875e+07
    ## 68                levofloxacin_750_lo           2000          6.500000e+08
    ## 69                   melphalan_2_vien              0          0.000000e+00
    ## 70                  melphalan_20_vien              2          1.999998e+04
    ## 71                    melphalan_50_lo            189          1.795500e+09
    ## 72                   melphalan_50_ong             67          6.365000e+08
    ## 73           methylprednisolon_125_lo          24786          1.876548e+09
    ## 74          methylprednisolon_16_vien         713757          2.620916e+09
    ## 75           methylprednisolon_4_vien         406860          3.999433e+08
    ## 76     methylprednisolone_40mg_1ml_lo          44193          1.478767e+09
    ## 77        moxifloxacin_400_250ml_chai             17          6.247500e+06
    ## 78              moxifloxacin_400_vien             20          1.050000e+06
    ## 79              mycophenolat_250_vien           2040          5.616327e+07
    ## 80              mycophenolat_500_vien           6451          3.553326e+08
    ## 81        nhu_dich_lipid_10%_250_chai             79          1.128120e+07
    ## 82        nhu_dich_lipid_10%_500_chai             48          8.958600e+06
    ## 83                  nifedipin_10_vien             30          6.759002e+04
    ## 84                  nifedipin_30_vien              1          9.453990e+03
    ## 85                 nilotinib_200_vien         189673          1.341813e+11
    ## 86               palonosetron_0,25_lo             31          5.166150e+07
    ## 87                pantoprazol_20_vien           1750          2.607491e+07
    ## 88                  pantoprazol_40_lo           3124          4.561020e+08
    ## 89                pantoprazol_40_vien           1286          2.378959e+07
    ## 90            paracetamol_1000mg_chai           3000          1.431898e+08
    ## 91              paracetamol_1000mg_lo           4369          2.085321e+08
    ## 92                paracetamol_150_goi            235          6.123917e+05
    ## 93               paracetamol_150_vien             10          2.304960e+04
    ## 94               paracetamol_500_vien            752          1.931113e+06
    ## 95                 paracetamol_80_goi            132          2.742890e+05
    ## 96          paracetamol_tramadol_vien          71100          5.687268e+08
    ## 97   pegfilgrastim_6mg_0,6ml_bom_tiem              8          1.097048e+08
    ## 98        pegfilgrastim_6mg_0,6ml_ong             13          1.782704e+08
    ## 99   perindopril__arginin_5_1,25_vien           1200          7.800000e+06
    ## 100               perindopril_10_vien           6221          4.807010e+07
    ## 101                perindopril_5_vien          74429          3.920793e+08
    ## 102 piperacillin_tazobactam_4g_500_lo          71668          8.527552e+09
    ## 103                   propofol_10_ong            140          1.654352e+07
    ## 104           rituximab_100mg_10ml_lo           1023          8.154141e+09
    ## 105           rituximab_500mg_50ml_lo            868          2.863992e+10
    ## 106       salbutamol_100mcg_lieu_binh             65          4.964635e+06
    ## 107                salbutamol_2,5_ong           4071          1.980622e+07
    ## 108        sevofluran_100%_250ml_chai          20750          2.970238e+08
    ## 109             spironolacton_25_vien         295313          5.832432e+08
    ## 110               tacrolimus_0,5_vien          10107          3.700677e+08
    ## 111                 tacrolimus_1_vien          21664          1.189765e+09
    ## 112                  tacrolimus_5_ong             11          5.137000e+07
    ## 113                teicoplanin_400_lo            868          3.732400e+08
    ## 114               teicoplanin_400_ong            620          2.665995e+08
    ## 115                  tigecyclin_50_lo             45          3.289500e+07
    ## 116            trimetazidin_35mg_vien          67380          1.709409e+08
    ## 117         valganciclovir_450mg_vien            120          6.997284e+07
    ## 118          zoledronic_acid_4mg_chai            982          6.349496e+09
    ## 119            zoledronic_acid_4mg_lo           1655          1.070103e+10
