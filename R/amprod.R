#' Amazon product data
#'
#'@details List of datasets per category
#'
#'
#'@examples
#' 1 = "Books"
#' 2 = "Electronics"
#' 3 = "Movies and TV"
#' 4 = "CDs and Vinyl"
#' 5 = "Clothing Shoes and Jewelry"
#' 6 = "Home and Kitchen"
#' 7 = "Kindle Store"
#' 8 = "Sports and Outdoors"
#' 9 = "Cell Phones and Accessories"
#' 10 = "Health and Personal Care"
#' 11 = "Toys and Games"
#' 12 = "Video Games"
#' 13 = "Tools and Home Improvement"
#' 14 = "Beauty"
#' 15 = "Apps for Android"
#' 16 = "Office Products"
#' 17 = "Pet Supplies"
#' 18 = "Automotive"
#' 19 = "Grocery and Gourmet Food"
#' 20 = "Patio Lawn and Garden"
#' 21 = "Baby"
#' 22 = "Digital Music"
#' 23 = "Musical Instruments"
#' 24 = "Amazon Instant Video"
#'
#'
#'@export
#'
amprodlist <- list(

  "1" = "Books",
  "2" = "Electronics",
  "3" = "Movies and TV",
  "4" = "CDs and Vinyl",
  "5" = "Clothing, Shoes and Jewelry",
  "6" = "Home and Kitchen",
  "7" = "Kindle Store",
  "8" = "Sports and Outdoors",
  "9" = "Cell Phones and Accessories",
  "10" = "Health and Personal Care",
  "11" = "Toys and Games",
  "12" = "Video Games",
  "13" = "Tools and Home Improvement",
  "14" = "Beauty",
  "15" = "Apps for Android",
  "16" = "Office Products",
  "17" = "Pet Supplies",
  "18" = "Automotive",
  "19" = "Grocery and Gourmet Food",
  "20" = "Patio, Lawn and Garden",
  "21" = "Baby",
  "22" = "Digital Music",
  "23" = "Musical Instruments",
  "24" = "Amazon Instant Video"
)


amdata <- function(number){

  n <- ifelse(number >= 0 & number < 25, number, 23)
  df <- data.frame(nb=1:24, dt=c("Books",
                                 "Electronics",
                                 "Movies_and_TV",
                                 "CDs_and_Vinyl",
                                 "Clothing_Shoes_and_Jewelry",
                                 "Home_and_Kitchen",
                                 "Kindle_Store",
                                 "Sports_and_Outdoors",
                                 "Cell_Phones_and_Accessories",
                                 "Health_and_Personal_Care",
                                 "Toys_and_Games",
                                 "Video_Games",
                                 "Tools_and_Home_Improvement",
                                 "Beauty",
                                 "Apps_for_Android",
                                 "Office_Products",
                                 "Pet_Supplies",
                                 "Automotive",
                                 "Grocery_and_Gourmet_Food",
                                 "Patio_Lawn_and_Garden",
                                 "Baby",
                                 "Digital_Music",
                                 "Musical_Instruments",
                                 "Amazon_Instant_Video"))
  rs <- sqldf::sqldf(paste0("select dt from df where nb = ",n))
  rs
}


#' Amazon product data
#'
#'@param number it refers to the number of the dataset you would like to use \code{\link{amprodlist}()}
#'
#'@examples
#' str(amprodlist)
#'
#'@export
#'
amprod <- function(number, version = 14, envir = parent.frame()) {

  options(warn = -1)
  def_path <- "http://snap.stanford.edu/data/amazon/productGraph/categoryFiles/reviews_"
  set_path <- paste0(def_path, amdata(number)$dt,"_5.json")

  download.file(paste0(set_path,".gz"), destfile = "temp.gz")
  input <- readLines(gzfile("temp.gz"),-1L)
  unlink("temp.gz")

  newformat <- plyr::ldply(lapply(input, function(x) t(unlist(rjson::fromJSON(x)))))

  closeAllConnections()
  assign("data", newformat, envir = envir)
  invisible(newformat)

}
