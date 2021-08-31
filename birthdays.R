library(ggplot2)
library(magrittr)

# What is your name? My name is Apollo

# When is your birthdate? Only Month and day. My birtdate is 23rd March
# Format "Month/date". For example for date "January 9th", we write "01/09"
my_name <- NULL
my_bd <- NULL


# Format "Month/date". For example for date "January 9th", we write "01/09"
my_name[3] <- "Hasibe"
my_bd[3] <- "04/12"
my_name[1] <- "Catlin"
my_bd[1] <- "03/05"
my_name[2] <- "matt"
my_bd[2] <- "03/15"
my_name[4] <- "Grace" 
my_bd[4] <- "05/18"
my_name[5] <- "Apollo" 
my_bd[5] <- "03/23"



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
