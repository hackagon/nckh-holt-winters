**3.1.1 Dac diem cac thuoc su dung theo phan loai thuoc biet duoc va generic tai benh vien TMHH giai doan 2014 - 2018**

-   Mo ta dac diem cua cac thuoc su dung theo phan loai thuoc biet duoc va generic trong 5 nam tu 2014 - 2018

``` r
knitr::kable(bietduoc_generic_df, format="html", 
             col.names = c("Phan loai", "SL thuoc", "% thuoc", "Co so", "% co so", "Chi phi", "% chi phi"))
```

<table>
<thead>
<tr>
<th style="text-align:left;">
Phan loai
</th>
<th style="text-align:right;">
SL thuoc
</th>
<th style="text-align:right;">
% thuoc
</th>
<th style="text-align:right;">
Co so
</th>
<th style="text-align:right;">
% co so
</th>
<th style="text-align:right;">
Chi phi
</th>
<th style="text-align:right;">
% chi phi
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Biet duoc
</td>
<td style="text-align:right;">
119
</td>
<td style="text-align:right;">
0.2505263
</td>
<td style="text-align:right;">
5456878
</td>
<td style="text-align:right;">
0.2394903
</td>
<td style="text-align:right;">
884460995826
</td>
<td style="text-align:right;">
0.7653241
</td>
</tr>
<tr>
<td style="text-align:left;">
Generic
</td>
<td style="text-align:right;">
356
</td>
<td style="text-align:right;">
0.7494737
</td>
<td style="text-align:right;">
17328502
</td>
<td style="text-align:right;">
0.7605097
</td>
<td style="text-align:right;">
271207487971
</td>
<td style="text-align:right;">
0.2346759
</td>
</tr>
</tbody>
</table>
-   Mo ta tang giam biet duoc qua cac nam

``` r
knitr::kable(bietduoc_nam, format="html", 
             col.names = c("nam", "co so", "chi phi", "so luong"))
```

<table>
<thead>
<tr>
<th style="text-align:right;">
nam
</th>
<th style="text-align:right;">
co so
</th>
<th style="text-align:right;">
chi phi
</th>
<th style="text-align:right;">
so luong
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
2014
</td>
<td style="text-align:right;">
965981
</td>
<td style="text-align:right;">
102665064145
</td>
<td style="text-align:right;">
79
</td>
</tr>
<tr>
<td style="text-align:right;">
2015
</td>
<td style="text-align:right;">
1030140
</td>
<td style="text-align:right;">
126993019966
</td>
<td style="text-align:right;">
80
</td>
</tr>
<tr>
<td style="text-align:right;">
2016
</td>
<td style="text-align:right;">
961507
</td>
<td style="text-align:right;">
171503068884
</td>
<td style="text-align:right;">
79
</td>
</tr>
<tr>
<td style="text-align:right;">
2017
</td>
<td style="text-align:right;">
1228850
</td>
<td style="text-align:right;">
213542305364
</td>
<td style="text-align:right;">
82
</td>
</tr>
<tr>
<td style="text-align:right;">
2018
</td>
<td style="text-align:right;">
1270400
</td>
<td style="text-align:right;">
269757537467
</td>
<td style="text-align:right;">
87
</td>
</tr>
</tbody>
</table>
-   Mo ta tang giam generic qua cac nam

``` r
knitr::kable(generic_nam, format="html", 
             col.names = c("nam", "co so", "chi phi", "so luong"))
```

<table>
<thead>
<tr>
<th style="text-align:right;">
nam
</th>
<th style="text-align:right;">
co so
</th>
<th style="text-align:right;">
chi phi
</th>
<th style="text-align:right;">
so luong
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
2014
</td>
<td style="text-align:right;">
3524865
</td>
<td style="text-align:right;">
44364976151
</td>
<td style="text-align:right;">
266
</td>
</tr>
<tr>
<td style="text-align:right;">
2015
</td>
<td style="text-align:right;">
3221844
</td>
<td style="text-align:right;">
47108981914
</td>
<td style="text-align:right;">
233
</td>
</tr>
<tr>
<td style="text-align:right;">
2016
</td>
<td style="text-align:right;">
4027946
</td>
<td style="text-align:right;">
61974161254
</td>
<td style="text-align:right;">
236
</td>
</tr>
<tr>
<td style="text-align:right;">
2017
</td>
<td style="text-align:right;">
3289890
</td>
<td style="text-align:right;">
58332264306
</td>
<td style="text-align:right;">
222
</td>
</tr>
<tr>
<td style="text-align:right;">
2018
</td>
<td style="text-align:right;">
3263957
</td>
<td style="text-align:right;">
59427104346
</td>
<td style="text-align:right;">
212
</td>
</tr>
</tbody>
</table>
