# ANOVA 


## dataset import

install.packages("palmerpenguins")
library(palmerpenguins)


df <- penguins
colnames(df)

# find unique values
unique(df$species)
# for island
unique(df$island)

# for t.test
t.test(df$bill_length_mm~df$sex)
 
# barplot
library(ggplot2)
ggplot(df, aes(sex, bill_length_mm))+geom_boxplot()
ggplot(df, aes(sex, bill_length_mm, fill = sex))+geom_boxplot()

library(tidyverse)
data <- df %>%
  select(species, flipper_length_mm)

# summarize 
summary(data)
# piping operator used for sub-grouping
library(dplyr)

data %>%
  group_by(species) %>%
  summarize(mean_flipper = mean(flipper_length_mm, na.rm = TRUE))




ggplot(data) +
  aes(species, flipper_length_mm, col = species)+
  geom_jitter() + theme(legend.position = "none")


ggplot(data) +
  aes(species, flipper_length_mm, col = species)+
  geom_jitter() + theme(legend.position = "top")

# normal distribution not applied all the data
shapiro.test(data$flipper_length_mm)

# use pipeline operator for normalization
data %>% 
  group_by(species) %>%
  summarize(shapiro_pvalue = shapiro.test(flipper_length_mm)$p.value)

# first 2 are normal 3rd one is not normal


s_w <- shapiro.test(data$flipper_length_mm)

summary(s_w)


## anova
res_aov <- aov(df$flipper_length_mm~ df$species)

summary(res_aov)

## check degree of freedom, mean square, F value, 


# 1. check normalization by histogram and qqnorm plot
hist(res_aov$residuals)
qqnorm(res_aov$residuals)
# check Shapiro test
shapiro.test(res_aov$residuals)

# 2. Homogeneous test (Leven Test)

install.packages("car")
library(car)
leveneTest(flipper_length_mm ~ species, data= df)



install.packages("lattice")
library(lattice)


library(ggplot2)
ggplot(data) +
  aes(species, flipper_length_mm, fill = species)+
  geom_boxplot()


#calculate mean and sd for plots and AOV figures 
# , 2 for round off upto 2 digit
aggregate(flipper_length_mm ~ species,  data = data, 
          function(x) round(c(mean = mean(x), sd(x)), 2))


# another way
library(dplyr)

data %>%
  group_by(species) %>%
  summarise(
    mean = mean(flipper_length_mm, na.rm = TRUE),
    sd   = sd(flipper_length_mm, na.rm = TRUE)
  )

# store it in df1
df1


## post_HOC test
install.packages("multcomp", dependencies = TRUE)
library(glht)
# ANOVA 
oneway.test(flipper_length_mm ~ species, data = df, var.equal = TRUE )
library(multcomp)

# another way of ANOVA
res_aov <- aov(flipper_length_mm ~ species, data= df)
summary(res_aov)


library(multcomp)

# make sure it's a factor
df$species <- as.factor(df$species)

# run ANOVA
res_aov <- aov(flipper_length_mm ~ species, data = df)

# post-hoc Tukey test
post_test <- glht(res_aov, linfct = mcp(species = "Tukey"))
summary(post_test)


## 
plot(post_test)

plot(TukeyHSD(res_aov))


## Dunnet test
res_aov <- aov(flipper_length_mm ~ species, data = data)
summary(res_aov)
dun <-glht(res_aov,
           linfct = mcp(species = "Dunnet"))
summary(dun)

## two way ANOVA
library(ggplot2)
library(ggthemes)
library(multcompView)
library(tidyverse)


df <- ToothGrowth
# let convert the df as factor
df$dose <- as.factor(df$dose)

# calculate the two way anova

anova <- aov(len ~ supp*dose, data=df)
summary(anova)


## tukeyHSD
tukey <- TukeyHSD(anova)
tukey


# Get letters
letters <- multcompLetters4(anova, tukey)

# Extract into a data frame
letters <- as.data.frame.list(letters$`supp:dose`)
letters

# mean and sd
df_mean <- df %>%
  group_by(supp:dose) %>%
  summarise(len_mean=mean(len), sd(len)) %>%
  arrange(desc(len_mean))

# for viewing data
tibble(df_mean)


## add letters
df_mean$letters <- letters$letters..supp.dose..Letters
df_mean

_______________________________________________________
library(dplyr)
library(multcomp)
library(multcompView)
library(ggplot2)

# 1️⃣ Make sure supp and dose are factors
df$supp <- as.factor(df$supp)
df$dose <- as.factor(df$dose)  # categorical dose

# 2️⃣ Run ANOVA
res_aov <- aov(len ~ supp:dose, data = df)

# 3️⃣ Tukey post-hoc
tukey <- TukeyHSD(res_aov)

# 4️⃣ Get letters
letters <- multcompLetters4(res_aov, tukey)
letters_df <- as.data.frame.list(letters$`supp:dose`)
letters_df$group <- rownames(letters_df)

# 5️⃣ Compute mean and sd per group
df_mean <- df %>%
  group_by(supp, dose) %>%
  summarise(len_mean = mean(len),
            len_sd = sd(len),
            .groups = "drop") %>%
  mutate(group = interaction(supp, dose)) %>%
  left_join(letters_df, by = "group")

# 6️⃣ Plot
ggplot(df_mean, aes(x = dose, y = len_mean, fill = supp)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_errorbar(aes(ymin = len_mean - len_sd,
                    ymax = len_mean + len_sd),
                width = 0.2,
                position = position_dodge(0.9)) +
  geom_text(aes(label = Letters, 
                y = len_mean + len_sd + 1),
            position = position_dodge(0.9),
            vjust = 0) +
  labs(x = "Dose", y = "Mean Length", fill = "Supplement") +
  theme_minimal()
________________________________________________________________________________

# draw
p <- ggplot(df_mean) +
  aes(dose, len_mean, group=) + 
  geom_bar(stat = 'identity')

###
ggplot(df_mean) +
  aes(dose, len_mean, group=supp) + 
  geom_bar(stat = 'identity', position = position_dodge(0.9))
## add fill
ggplot(df_mean) +
  aes(dose, len_mean, fill=supp) + 
  geom_bar(stat = 'identity', position = position_dodge(0.9))
## add standard bar 
ggplot(df_mean, aes(x = factor(dose), y = len_mean, group = supp, fill = supp)) +
  geom_bar(stat = "identity", position = position_dodge(0.9)) +
  geom_errorbar(aes(ymin = len_mean - len_sd,
                    ymax = len_mean + len_sd),
                width = 0.2,
                position = position_dodge(0.9)) +
  geom_text(aes(label = Letters, y = len_mean + len_sd + 1),
            position = position_dodge(0.9),
            vjust = 0) +
  scale_fill_manual(values=c("blue", "red"))
  labs(x = "Dose", y = "Length(mm)", title = "TootGrowth Publication Ready Plot")
  ggsave("Plot.pdf", p.width = 10, height = 8, units = "in")
____________________________________________________________
# Create plot object
p <- ggplot(df_mean, aes(x = factor(dose), y = len_mean, group = supp, fill = supp)) +
  geom_bar(stat = "identity", position = position_dodge(0.9)) +
  geom_errorbar(aes(ymin = len_mean - len_sd,
                    ymax = len_mean + len_sd),
                width = 0.2,
                position = position_dodge(0.9)) +
  geom_text(aes(label = Letters, y = len_mean + len_sd + 1),
            position = position_dodge(0.9),
            vjust = 0) +
  scale_fill_manual(values = c("blue", "red")) +
  labs(x = "Dose", y = "Length (mm)", 
       title = "ToothGrowth Publication Ready Plot",
       fill = "Supplement") +
  theme_minimal()

# Display plot
print(p)

# Save plot as PDF
ggsave("Plot.pdf", plot = p, width = 10, height = 8, units = "in")
