library(ggplot2)
library(scales)
library(dplyr)

data <- data.frame("osoby" = c("1", "2", "3", "4", "5 i wiecej"),
                   "procent" = c(44.7, 31, 13.4, 6.7, 4.3))

data %>% mutate(procent = procent/100) -> data
data

my_corrected_plot <- function(data){
  ggplot(data, aes(x = osoby, y = procent)) + 
    geom_bar(fill = 'navyblue', stat = 'identity') +
    scale_y_continuous(labels=scales::percent) +
    geom_text(label=percent(data$procent,.01), vjust = -0.5) +
    ggtitle("Gospodarstwa, kt�rych wszyscy cz�onkowie przebywaj� za granic�") +
    xlab("liczba os�b w gospodarstwie domowym") + ylab("procent") +
    theme_bw()
}
my_corrected_plot(data)

data2 <- data.frame("osoby" = c("1", "2", "3", "4", "5 i wiecej"),
                   "procent" = c(91.8, 5.9, 1.5, 0.5, 0.3))

data2 %>% mutate(procent = procent/100) -> data2
data2

my_corrected_plot2 <- function(data){
  ggplot(data, aes(x = osoby, y = procent)) + 
    geom_bar(fill = 'navyblue', stat = 'identity') +
    scale_y_continuous(labels=scales::percent) +
    geom_text(label=percent(data2$procent,.01), vjust = -0.5) +
    ggtitle("Gospodarstwa, w kt�rych cz�� cz�onk�w przebywa za granic�") +
    xlab("liczba os�b w gospodarstwie domowym") + ylab("procent") +
    theme_bw()
}
my_corrected_plot2(data2)
