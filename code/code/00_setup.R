# 00_setup.R – Package Setup and Loading

# Vector of required packages
required_packages <- c(
  # Data import & wrangling
  "readxl", "lubridate", "dplyr", "janitor", "forcats", "tidyverse",
  
  # Descriptive statistics & tables
  "psych", "Amelia", "kableExtra",
  
  # Data visualization
  "ggplot2", "ggpubr", "gridExtra", "patchwork", "plotly",
  "corrplot", "RColorBrewer", "viridis", "ggrepel", "htmlwidgets",
  
  # MCA & multivariate analysis
  "FactoMineR", "factoextra", "FactoInvestigate", 
  "ade4", "ExPosition", "prettyGraphs",
  
  # Devtools and packaging
  "devtools", "usethis"
)

# Install missing packages
installed <- required_packages %in% rownames(installed.packages())
if (any(!installed)) {
  install.packages(required_packages[!installed])
}

# Load all packages
invisible(lapply(required_packages, library, character.only = TRUE))
