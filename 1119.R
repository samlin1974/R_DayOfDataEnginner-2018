#
install.packages("httr")
install.packages("xml2")

library(httr)
library(xml2)
##https://join.gov.tw/idea/index/search/ENDORSING?page=1
web.url="https://join.gov.tw"
base.url=paste0(web.url,"/idea/index/search/ENDORSING?page=")
doc   <- read_html(base.url)
###
xpath.bonus <- "//*[@id='naviPageForm']/ul/li[2]/span"
totalpage <- xml_text(xml_find_all(doc, xpath.bonus))
totalpage<-sub("1 / ","",totalpage)
# need some string processing to get the number of total page
totalpage<-"5"
n.page<-as.integer(totalpage)

for (i in 1:5){


# NOT run for all pages, takes too much time
#page <- sample(1:n.page, 1)
##
url <- paste0(base.url,i)
#url="https://join.gov.tw/idea/index/search/ENDORSING?page=2"

doc <- read_html(url)

### Set the xpath of info needed
#xpath <- "//*[@id='searchResult']/div/div[1]/h4/a"
xxpath <- "//*[@id='searchResult']/div/div/h4/a"

xx1<-xml_find_all(doc, xxpath)
#
xx2<-xml_attr(xx1,"title")
xx2<-data.frame(matrix(xx2), stringsAsFactors = FALSE)
#
xx5<-paste0(web.url,xml_attr(xx1, "href")) # # Get tag href
xx5<-data.frame(matrix(xx5), stringsAsFactors = FALSE)
#
xx6<-data.frame(
  title=xml_attr(xx1,"title"),
  href=paste0(web.url,xml_attr(xx1, "href")),
  page=i
  )
#article.list<-rbind(xx6)
#colnames(article.list)<-c("case_title","case_url","page")
#View(xx6)
}
#
write.table(article.list, file="/Users/samlin/Documents/df_article_raw.csv",sep=",",row.names=FALSE)
write.table(xx6, file="/Users/samlin/Documents/df_article_raw1.csv",sep=",",row.names=FALSE)


# write your table to file
save <- FALSE
if (save) {
  write.csv(article.list, file="/Users/samlin/Documents/df_article_raw.csv", row.names=FALSE)
}











