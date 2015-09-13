#first we're going to load all our data set on mydata
mydata  <- read.table("household_power_consumption.txt",header = T, sep = ";")
#cast Date attr to real Date type
mydata$Date = as.Date(mydata$Date,format = "%d/%m/%Y")
#Now we are take just the example Thursday, Friday and Saturday
mydata.sample = subset(mydata, mydata$Date==as.Date("2007-02-01") | mydata$Date==as.Date("2007-02-02"))
#Join date and time
p <- paste(as.character(mydata.sample$Date),as.character(mydata.sample$Time),sep = " ")
#newformat
new_format <- strptime(p,format = "%Y-%m-%d %H:%M")
mydata.sample$Time  <- new_format
mydata.sample$Global_active_power <- as.numeric(as.character(mydata.sample$Global_active_power))

#call function to create a new png file
png("Plot2.png",width = 480,height = 480)

###Draw
plot(mydata.sample$Time,mydata.sample$Global_active_power, type = "l",ylab = "Globa Active Power (kilowatts)",xlab = "")

#close png draw
dev.off()