# dependencies
library(XML)
library(utils)
library(RCurl)
library(curl)


# setting the directory
getwd()
setwd("/Users/anni/Documents/WHK/newspaperarchive")

# file for download
one_day <- "hh_echo/01_01_1929.xml"


# download: alle Seiten einer Abendausgabe (01.01.1929)

for (i in 1:20) {
  urls_day <- sprintf("https://img.sub.uni-hamburg.de/kitodo/PPN1754726119_19290101/%08d.xml", i)
  url_e <- url.exists(urls_day)
  if (url_e == TRUE) {
    download.file(urls_day, one_day, mode = "wb")
  }
}


# urls for downloading one month

times <- expand.grid(days = 1:31, pages = 1:20)
urls_month <- sprintf(
  "https://img.sub.uni-hamburg.de/kitodo/PPN1754726119_192901%02d/%08d.xml",
  times$days, times$pages
)

one_month <- "hh_echo/01_1929.xml"


# urls for downloading an entire year

times <- expand.grid(months = 1:12, days = 1:31, pages = 1:20)
urls_year <- sprintf(
  "https://img.sub.uni-hamburg.de/kitodo/PPN1754726119_1929%02d%02d/%08d.xml",
  times$months, times$days, times$pages
)

one_year <- "hh_echo/1929.xml"


# is this working?
# hallooo
