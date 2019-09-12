library(ggplot2)

# What is your name? Megan

# When is your birthdate? 06/26
# Format "Month/date". For example for date "January 9th", we write "01/09"
my_name <- NULL
my_bd <- NULL




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