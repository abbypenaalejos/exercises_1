# EXERCISE 1- SECOND LAB SESSION ----------
#Description: First ession using R & Github. Set everything up. Checked lectures material. 
#Created a new repo on Github. Cloned it to local machine through RStudio

#Step 1: Install packages----
#Don't forget to install packages in the console!
install.packages(c("tidyverse", "gapminder", "pacman"))  
#Step 2: Call the packages to the current project------ 
pacman::p_load(tidyverse, gapminder)
#Step 3: Load your Data into R------
data(gapminder)  
head(gapminder)
# Step 4: Clean your Data
# 4.1.Created a new dataframe called "gapminder_clean". Renamed 2 variables with 
#function "rename", added a new one with function "mutate"
gapminder_clean <- gapminder %>% 
  rename(life_exp = lifeExp, gdp_per_cap = gdpPercap) %>% 
  mutate(gdp = pop * gdp_per_cap)

#EXERCISES --------
# 1. From the exercises_1 repo open up a new branch called “data-manipulation-idea”.
# DONE

# 2. Switch to this branch and create a new script.
# DONE

# 3. Copy the three code chunks from this section into the newly created script.
# DONE
# Next, and using the tidyverse, subset our cleaned df to include only countries in the Americas.
  americancountries <- gapminder_clean %>% 
    filter(continent == "Americas")

# 4. Add a new categorical variable using mutate() that qualifies whether a country is rich or poor! 
# (Hint use the variable gdp_per_cap and ìf_else())

#Here I created new variable "rich_or_poor" for dataframe "gapminder"
gapminder_clean <- gapminder_clean %>% 
  mutate(gapminder_clean, rich_or_poor = ifelse(gdp_per_cap >= 25000, "rich", "poor"))

#Here I created new variable "rich_or_poor" for dataframe american countries
americancountries <-americancountries %>% 
  mutate(americancountries, rich_or_poor = ifelse(gdp_per_cap >= 25000, "rich", "poor"))

#Here I created a subset 
# First grouping the results by country
df <- gapminder_clean %>% 
  group_by(country) 
#Then, summarising the gdp_pe_cap variable in the mean in subset "summary", which contains only 2 variables 
# countries with the mean values for gdp_per_cap 
summary <- df %>% 
  summarise(
    gdp_per_cap = mean(gdp_per_cap))
#Finally added the rich_or_poor variable mutating the average gdp_per_cap per country
summary <- summary %>% 
    mutate(summary, rich_or_poor = ifelse(gdp_per_cap >= 25000, "rich", "poor"))

# 5. Save the script!
# DONE

#Stage your changes and commit them. (Make sure you are commiting them within our “data-manipulation-idea” 
# branch.) Go to your repo online and open a pull request. Review and merge this pull request.
# Delet the now obsolete branch.

