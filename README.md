# amprod

Amazon product data

This dataset contains product reviews and metadata from Amazon, including 142.8 million reviews spanning May 1996 - July 2014.

This dataset includes reviews (ratings, text, helpfulness votes), product metadata (descriptions, category information, price, brand, and image features), and links (also viewed/also bought graphs).

##Files

"Small" subsets for experimentation

If you're using this data for a class project (or similar) please consider using one of these smaller datasets below before requesting the larger files. To obtain the larger files you will need to contact me to obtain access.

K-cores (i.e., dense subsets): These data have been reduced to extract the k-core, such that each of the remaining users and items have k reviews each.

Ratings only: These datasets include no metadata or reviews, but only (user,item,rating,timestamp) tuples. Thus they are suitable for use with mymedialite (or similar) packages.

## Installation

You can install amprod from github with:

```R
# install.packages("devtools")
devtools::install_github("jmcimula/amprod")
```

## Key functions

* `amprod()`: it loads and accesses amazon product data plus customer experience. Also, it assigns the dataset to the .GlobalEnv

## Example 

``` r
library(amprod)

## Musical Instruments
amprod(23)
head(data[,c(1,2,4,5,7,8,9)])
```

```r
#      reviewerID       asin helpful1 helpful2 overall                               summary unixReviewTime
#1 A2IBPI20UZIR0U 1384719342        0        0       5                                  good     1393545600
#2 A14VAT5EAX3D9S 1384719342       13       14       5                                  Jake     1363392000
#3 A195EZSQDW3E21 1384719342        1        1       5                  It Does The Job Well     1377648000
#4 A2C00NNG1ZQQG2 1384719342        0        0       5         GOOD WINDSCREEN FOR THE MONEY     1392336000
#5  A94QU4C90B1AX 1384719342        0        0       5 No more pops when I record my vocals.     1392940800
#6 A2A039TZMZHH9Y B00004Y2UT        0        0       5                        The Best Cable     1356048000
```

``` r
## Amazon Instant Video
amprod(24) 
head(data[,c(1,2,4,5,7,8,9)])
```

``` r
> head(data[,c(1,2,4,5,7,8,9)])
      reviewerID       asin helpful1 helpful2 overall                                            summary unixReviewTime
1 A11N155CW1UV02 B000H00VBQ        0        0       2                         A little bit boring for me   1399075200
2 A3BC8O2KCL29V2 B000H00VBQ        0        0       5                              Excellent Grown Up TV   1346630400
3  A60D5HQFOTSOM B000H00VBQ        0        1       1                              Way too boring for me   1381881600
4 A1RJPIGRSNX4PW B000H00VBQ        0        0       4                        Robson Green is mesmerizing   1383091200
5 A16XRPF40679KG B000H00VBQ        1        1       5                     Robson green and great writing   1234310400
6 A1POFVVXUZR3IQ B000H00VBQ       12       12       5 I purchased the series via streaming and loved it!   1318291200
```

The `amprodlist()` object contains a list of datasets per category:

``` r
str(amprodlist)
```

``` r
## List of 24
##  $ 1 : chr "Books"
##  $ 2 : chr "Electronics"
##  $ 3 : chr "Movies and TV"
##  $ 4 : chr "CDs and Vinyl"
##  $ 5 : chr "Clothing, Shoes and Jewelry"
##  $ 6 : chr "Home and Kitchen"
##  $ 7 : chr "Kindle Store"
##  $ 8 : chr "Sports and Outdoors"
##  $ 9 : chr "Cell Phones and Accessories"
##  $ 10: chr "Health and Personal Care"
##  $ 11: chr "Toys and Games"
##  $ 12: chr "Video Games"
##  $ 13: chr "Tools and Home Improvement"
##  $ 14: chr "Beauty"
##  $ 15: chr "Apps for Android"
##  $ 16: chr "Office Products"
##  $ 17: chr "Pet Supplies"
##  $ 18: chr "Automotive"
##  $ 19: chr "Grocery and Gourmet Food"
##  $ 20: chr "Patio, Lawn and Garden"
##  $ 21: chr "Baby"
##  $ 22: chr "Digital Music"
##  $ 23: chr "Musical Instruments"
##  $ 24: chr "Amazon Instant Video"
```

This dataset includes reviews (ratings, text, helpfulness votes), product metadata (descriptions, category information, price, brand, and image features), and links (also viewed/also bought graphs).

![alt tag](https://github.com/jmcimula/cv/blob/master/img.PNG)

