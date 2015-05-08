## NOTE - The code herein assumes that each .png plot is to be created from scratch. i.e. that the data
## must be subsetted and transformed fresh for each plot. Hence the repetition.

#enable packages required for code
require(sqldf)

#read in the full data file
bigdata <- read.table("~/Dropbox/Data Science Specialisation/4.ExploratoryDataAnalysis/Course_Proj_1/household_power_consumption.txt",
                      header=TRUE, sep=";")

#read in required data
smallData <- read.csv.sql("~/Dropbox/Data Science Specialisation/4.ExploratoryDataAnalysis/Course_Proj_1/household_power_consumption.txt", 
                          sql='select * from file where Date="1/2/2007" or Date="2/2/2007"', header=TRUE, sep=";")

# Convert Date to class(date)
smallData$Date <- as.Date(smallData$Date, "%d/%m/%Y")
#Join Date and Time to create Date/Time
smallData$dateTime <- paste(smallData$Date, smallData$Time, sep=" ")
#convert "date and time" to class(POSIX*)
smallData$Time <- strptime(smallData$dateTime, format="%Y-%m-%d %H:%M:%S",tz="UTC")


# Width and height are in pixels
#create png #1
png("png1.png", width=480, height=480)
hist(smallData$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

# end of code.