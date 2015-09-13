#first we're going to load all our data set on mydata
mydata  <- read.table("household_power_consumption.txt",header = T, sep = ";")
#cast Date attr to real Date type
mydata$Date = as.Date(mydata$Date,format = "%d/%m/%Y")
#Now re are take just the example for 01 and 02
mydata.sample = subset(mydata, mydata$Date==as.Date("2007-02-01") | mydata$Date==as.Date("2007-02-02"))
mydata.sample$Global_active_power <- as.numeric(as.character(mydata.sample$Global_active_power))
#call function to create a new png file
png("Plot1.png",width = 480,height = 480)
#Draw our hist
hist( mydata.sample$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
#close png draw
dev.off()