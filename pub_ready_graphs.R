# library
library("tidyverse")
install.packages("ggpubr")
library(ggpubr)


df <- ToothGrowth

# plot
ggboxplot(df, x="dose", y="len")

ggboxplot(df, x="dose", y="len",
          color = "dose")
# add jitter
ggboxplot(df, x="dose", y="len",
          color = "dose", add = "jitter")
# shape = dose
ggboxplot(df, x="dose", y="len",
          color = "dose", add = "jitter", shape = "dose")
# labels
ggboxplot(df, x="dose", y="len",
          color = "dose", add = "jitter",
          shape = "dose", xlab = "Dose",
          ylab = "Length", legend.title = "Dose")
# pallete
p <- ggboxplot(df, x="dose", y="len",
          color = "dose", add = "jitter",
          shape = "dose", xlab = "Dose",
          ylab = "Length", legend.title = "Dose",
          palette = c("red", "green", "blue"));p
# add p and p: at the end to save the plot

## comparision
my_comparisons <- list(c("0.5", "1"),
                       c("0.5", "2"),
                       c("1", "2"))

p + stat_compare_means(comparisions = my_comparisons)

# show label
p + stat_compare_means(comparisions = my_comparisons, 
                       label = "p.signif")

# show label , ylim is used for scaling
p + stat_compare_means(comparisions = my_comparisons, 
                       label = "p.signif") +
  stat_compare_means(label.y = 50)+ ylim(0, 60)

## 
library(ggpubr)

# Base boxplot with facets and jitter
p2 <- ggboxplot(ToothGrowth,
                x = "supp", y = "len",
                color = "supp", palette = "npg",
                add = "jitter",
                facet.by = "dose", short.panel.labs = FALSE)

# Add p-values only (without method name)
p2 <- p2 + stat_compare_means(
  aes(label = paste0("p = ", ..p.format..))
)

p2



df <- PlantGrowth
install.packages(ggpubfigs)
devtools::install_github("JLSteenwyk/ggpubfigs")
library(ggpubfigs)










