## How have emissions from motor vehicle sources changed from 1999???2008 in Baltimore City?
##
## This first line will likely take a few seconds. Be patient!
##
## Read files
##
if(!exists("NEI")){
  NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./Source_Classification_Code.rds")
}
# merge the two data sets 
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}


## Create plot

library(ggplot2)

subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggrByYear <- aggregate(Emissions ~ year, subsetNEI, sum)



png("Project2_plot5.png", width=840, height=480)
g <- ggplot(aggrByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()