####Learning for loops####

# # for (item in list_of_items){
#   do_something (inten)
# }

volumes <- c(1.6, 3, 8)

for (volume in volumes) {
  print (2.65 * volume ^ 0.9)
}

#adding more lines
for (volume in volumes) {
  mass <- 2.65 * volume ^ 0.9
  mass_lb <- mass * 2.2
  print(mass_lb)
}

#Use of indices 
for (i in 1:length (volumes)) {
  mass <- 2.65 * volumes [i] ^ 0.9
  print(mass)
}

#Creating vector
masses <- vector(mode = "numeric", length = length(volumes))
for (i in 1:length (volumes)) {
  mass <- 2.65 * volumes [i] ^ 0.9
  masses[i] <- mass
}


##Exercise 1
#Q1: This prints numbers 1 through 5 as is, modifying it to print each of the 
# numbers multiplied by 3

for (i in 1:5) {
  i <- i * 3
  print(i)
}

#Q2: Complete code to print out name of each bird

birds = c(‘robin’, ‘woodpecker’, ‘blue jay’, ‘sparrow’)

for (i in 1:length(birds)){
  print(birds[i])
}


#Download Zip file
download.file("http://www.datacarpentry.org/semester-biology/data/locations.zip
", "locations.zip", mode = "wb")

#unzip
unzip("locations.zip")

#Listing the files in directory
list.files()

data_files<- list.files(pattern = "locations-*", full.name = TRUE)

results <- c()

for (i in 1:length(data_files)) {
  data <- read.csv(data_files[i])
  count <- nrow(data)
  results[i] <- count
}





####Learning if statements####

# if(the conditonal statement is TRUE) {
#   do something
# }

x <- 4 
if (x > 5) {
  x <- x ^ 2
}

veg_type <- "tree"
volume <- 16
if (veg_type == "tree") {
  mass <- 2.6 * volume ^ 0.9
}

##Exercise

age_class <- "seedling"
if (age_class == "seedling") {
  y <- 10
} else if (age_class == "seedling") {
  y <- 5
} else {
  y <- 0
}

#Q1: Complete the statements so that age_class is sampling return a y of 10,
#and age_class of seedling sets y to 5 if age_class,
#if age_class is neither, return y to 0