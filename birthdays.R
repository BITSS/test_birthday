library(ggplot2)
library(magrittr)


# What is your name? 
# When is your birthdate? Only Month and day.
# Format "Month/date". For example for date "January 9th", we write "01/09"
my_name <- "Emma"
my_bd <- "01/22"


# Format "Month/date". For example for date "January 9th", we write "01/09"
my_name[1] <- "Catlin"
my_bd[1] <- "03/05"
my_name[2] <- "matt"
my_bd[2] <- "03/15"
my_name[3] <- "Hasibe"
my_bd[3] <- "04/12"
my_name[4] <- "Grace" 
my_bd[4] <- "05/18"
my_name[5] <- "Apollo" 
my_bd[5] <- "03/23"
my_name[5] <- "Daniela" 
my_bd[5] <- "02/18"
my_name[6] <- "Megan" 
my_bd[6] <- "06/26"
my_name[7] <- "Jessica" 
my_bd[7] <- "10/07"
my_name[8] <- "YOUR NAME HERE" 
my_bd[8] <- "MONTH/DAY HERE"

# When done, save, commit, push and make your first pull request.
###################################
df <- data.frame("names" = my_name ,
                 "birthdate" = as.Date(my_bd
                                       , "%m/%d") )
# Sort by date
df <- df[order(df$birthdate) , ]

same_bday <- df$birthdate[duplicated(df$birthdate)]

df %>% ggplot(mapping = aes(x = reorder(names, as.numeric(birthdate)),
                            y = birthdate ) ) +
        geom_point() +
        xlab("Names") +
        ylab("Birthdates") +
        labs(title = "Figure 1: Birthday of Participants",
             subtitle = "Anybody with the same birthday?")+
        geom_hline(yintercept = same_bday, color = "red", show.legend=T)
