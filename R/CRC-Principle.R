# CRC system essentials

library(tidyverse)

df <- data.frame(A = c("Costa Rica", "Peru"), B = c("San Jose", "Lima"))

# Each data frame should group columns depending on type 1, type 2 or type 3 SCD
# Let's say, we are only interested in Type 2
# and column A and B are type 2

# Unite columns

df <- df %>%
  add_column( (df %>% unite("AB", A, B, sep = "")) ) %>%
  # Method 1, complete hashing, returns a string
  mutate(md5 = map_chr(AB, function(.x)digest::digest(.x, algo = "md5"))) %>% #otherwise hash entire column
  #Method 2, integer hashing returns an integer
  mutate(digestInt = digest::digest2int(AB)) %>%
  print()
