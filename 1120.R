#
install.packages("httr")
install.packages("xml2")

#https://join.gov.tw/idea/detail/30adfc78-b171-460c-baf7-1595764ba098
#https://join.gov.tw/idea/detail/31881a2f-9ca7-4494-91d5-ca6681a5810d
#/html/body/div[16]/div[1]/h5/button[1]


library(httr)
library(xml2)
web.url="https://join.gov.tw"
url<-"https://join.gov.tw/idea/detail/31881a2f-9ca7-4494-91d5-ca6681a5810d"
doc <- read_html(url)

### Set the xpath of info needed
#xpath <- "//*[@id='searchResult']/div/div[1]/h4/a"
yypath <- "/html/body/div/div/h5/button[1]"

yy1<-xml_find_all(doc, yypath)
#
yy2<-xml_attr(yy1,"title")
yy2<-data.frame(matrix(yy2), stringsAsFactors = FALSE)
#
yy5<-paste0(web.url,xml_attr(yy1, "href")) # # Get tag href
#yy5<-data.frame(matrix(yy5), stringsAsFactors = FALSE)
#
yy6<-data.frame(
  #title=xml_attr(xx1,"title"),
  href=paste0(web.url,xml_attr(yy1, "href"))
  )
#article.list<-rbind(xx6)
#colnames(article.list)<-c("case_title","case_url","page")
#View(xx6)











