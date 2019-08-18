``` r
tonghop <- read.csv("./csv/tonghop_processed.csv")
head(tonghop)
```

    ##   X     ma
    ## 1 1 A.TA01
    ## 2 2 A.TA01
    ## 3 3 A.TE01
    ## 4 4 A.TE01
    ## 5 5 A.TE01
    ## 6 6 A.TE01
    ##                                                                                                                          thuoc
    ## 1 A.T Alugela 20% (12,38g) [Aluminum phosphat](Lô:0018099),Date 130920)'HSX:Nhà máy sản xuất Dược Phẩm An Thiên' 'NSX:Việt Nam
    ## 2 A.T Alugela 20% (12,38g) [Aluminum phosphat](Lô:0018100),Date 071020)'HSX:Nhà máy sản xuất Dược Phẩm An Thiên' 'NSX:Việt Nam
    ## 3        A.T Etoposide inj 100mg/5ml [Etoposid](Lô:0965002),Date 150420)'HSX:Công ty Cổ phần Dược phẩm An Thiên' 'NSX:Việt Nam
    ## 4        A.T Etoposide inj 100mg/5ml [Etoposid](Lô:0965002),Date 150420)'HSX:Công ty Cổ phần Dược phẩm An Thiên' 'NSX:Việt Nam
    ## 5        A.T Etoposide inj 100mg/5ml [Etoposid](Lô:0965002),Date 150420)'HSX:Công ty Cổ phần Dược phẩm An Thiên' 'NSX:Việt Nam
    ## 6        A.T Etoposide inj 100mg/5ml [Etoposid](Lô:0965002),Date 150420)'HSX:Công ty Cổ phần Dược phẩm An Thiên' 'NSX:Việt Nam
    ##       ThuongMai dvt                 hoatchat nhomBD nhomdieutri
    ## 1   A.T Alugela goi aluminum_phosphat_12,38g      2          32
    ## 2   A.T Alugela goi aluminum_phosphat_12,38g      2          32
    ## 3 A.T Etoposide  lo       etoposid_100mg_5ml      2          18
    ## 4 A.T Etoposide  lo       etoposid_100mg_5ml      2          18
    ## 5 A.T Etoposide  lo       etoposid_100mg_5ml      2          18
    ## 6 A.T Etoposide  lo       etoposid_100mg_5ml      2          18
    ##   tondauky_sl tondauky_thanhtien nhaptrongky_sl nhaptrongky_thanhtien
    ## 1           0                  0           1872               1965600
    ## 2           0                  0            104                109200
    ## 3           0                  0            300              27405000
    ## 4         300           27405000              0                     0
    ## 5         224           20462400              0                     0
    ## 6         173           15803550              0                     0
    ##   xuattrongky_sl xuattrongky_thanhtien toncuoiky_sl toncuoiky_thanhtien
    ## 1           1872               1965600            0                   0
    ## 2            104                109200            0                   0
    ## 3              0                     0          300            27405000
    ## 4             76               6942600          224            20462400
    ## 5             51               4658850          173            15803550
    ## 6            142              12971700           31             2831850
    ##   thang  nam
    ## 1    10 2018
    ## 2    10 2018
    ## 3     7 2018
    ## 4     8 2018
    ## 5     9 2018
    ## 6    10 2018
