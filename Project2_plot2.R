## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.
##
## This first line will likely take a few seconds. Be patient!
##
## Read files
if(!exists("NEI")){
  NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./Source_Classification_Code.rds")
}

# Create plot
subsetNEI  <- NEI[NEI$fips=="24510", ]

aggrByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('Project2_plot2.png')
barplot(height=aggrByYear$Emissions, names.arg=aggrByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()