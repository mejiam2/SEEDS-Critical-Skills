####9/23/2021####

#Learning how to create functions

# funtion_name <- function(inputs) {
#   output_value <- do_something(inputs)
#   return(output_value)  
# }

calc_shrub_vol <- function(length, width, height) {
  area <- length * width
  volume <- area * height
  return(volume)
}

calc_shrub_vol(1, 2.5, 2)

#To create data frame
# NAME-OF-DATA <- data.frame (lengths = c(1, 2, 3), widths = c(1, 2, 3), heights = c(1, 2, 3))


###Exercise###
get_mass_from_length_theropoda <- function(length){
  mass <- 0.73 * length ^ 3.63
  return(mass)
}


# Q1: Get mass of the 16 m long dinosaur
get_mass_from_length_theropoda(16)
# Q2: Turn a and b into arguments in function, then run for dinosaur that is 26 m in length, a = 214.44, b = 1.46
get_mass_from_length_theropoda <- function(length, a, b){
  mass <- a * length ^ b
  return(mass)
}
get_mass_from_length_theropoda(26, 214.44, 1.46)


#You can have a function in a function


