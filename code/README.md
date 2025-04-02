# 📁 Code Folder

This folder contains all R scripts used for data preparation, analysis, and export in the study. Scripts are named sequentially to reflect their order of execution.

> ⚠️ **Note**: Due to data confidentiality, the dataset is not included in this repository. However, the code used to process and analyze the data is available here for transparency and reproducibility.

---

## 🔧 Script Overview

- `00_setup.R`: Installs and loads all required R packages.
- `01_data_cleaning.R`: Imports and prepares data, including recoding and variable transformations.
- `02_data_exploration.R`: Performs summary statistics and descriptive analyses.
- `03_analysis_mca.R`: Runs the Multiple Correspondence Analysis (MCA).
- `04_tables_export.R`: Generates and exports tables for the manuscript.
- `05_graphs_export.R`: Creates and exports relevant visualizations.

---

## 📦 Required R Packages

The following R packages are used in this project (see citations below):

- **Data import & cleaning**: `readxl` [1], `dplyr` [2], `janitor` [3], `lubridate` [4], `forcats` [5], `tidyverse` [6]
- **Descriptive statistics & tables**: `psych` [7], `Amelia` [8], `kableExtra` [9]
- **Visualization**: `ggplot2` [10], `ggpubr` [11], `gridExtra`, `patchwork` [12], `plotly` [13], `corrplot` [14], `RColorBrewer` [15], `viridis` [16], `ggrepel` [17], `htmlwidgets` [18]
- **Multivariate analysis**: `FactoMineR` [19], `factoextra` [20], `FactoInvestigate` [21], `ade4` [22], `ExPosition` [23], `prettyGraphs` [24]
- **Development tools**: `devtools` [25], `usethis` [26]

To install all required packages, use the setup script [`00_setup.R`](./00_setup.R).

---

## 🧹 Data Cleaning and Preparation

Each annual dataset (2017–2022) underwent a standardized and reproducible data cleaning process, implemented in individual R scripts. The procedure included:

- **Data import** from Excel files using `readxl`
- **Initial inspection** using `summary()` and `names()`  
- **Selection of relevant variables** based on a pre-defined protocol  
- **Renaming of variables** for clarity and consistency across years  
- **Type conversion** (e.g., dates, factors, numeric) using `lubridate`, `dplyr`, and `forcats`  
- **Labeling of categorical variables** based on official INS coding dictionaries  
- **Identification and recoding of unknown or inconsistent categories**  
- **Systematic handling of missing data**  
- **Export of cleaned datasets** in `.Rds` and `.RData` formats

> ⚠️ The exact same procedure was applied to all yearly datasets (2017 to 2022), with minor adjustments to account for structural variations across years.

Scripts are organized and documented for full transparency and reproducibility [`01_data_cleaning.R`](./01_data_cleaning.R).




## 📚 Package Citations

[1] Wickham H, Romain F, Henry L, Müller K. *readxl: Read Excel Files.* https://CRAN.R-project.org/package=readxl  
[2] Wickham H, François R, Henry L, Müller K. *dplyr: A Grammar of Data Manipulation.* https://CRAN.R-project.org/package=dplyr  
[3] Firke S. *janitor: Simple Tools for Examining and Cleaning Dirty Data.* https://CRAN.R-project.org/package=janitor  
[4] Grolemund G, Wickham H (2011). *Dates and Times Made Easy with lubridate.* Journal of Statistical Software, 40(3), 1–25. https://www.jstatsoft.org/article/view/v040i03  
[5] Henry L, Wickham H. *forcats: Tools for Working with Categorical Variables (Factors).* https://CRAN.R-project.org/package=forcats  
[6] Wickham H, Averick M, Bryan J, et al. (2019). *Welcome to the tidyverse.* Journal of Open Source Software, 4(43), 1686. https://doi.org/10.21105/joss.01686  
[7] Revelle W. *psych: Procedures for Psychological, Psychometric, and Personality Research.* https://CRAN.R-project.org/package=psych  
[8] Honaker J, King G, Blackwell M (2011). *Amelia II: A Program for Missing Data.* Journal of Statistical Software, 45(7), 1–47. https://www.jstatsoft.org/article/view/v045i07  
[9] Zhu H. *kableExtra: Construct Complex Table with 'kable' and Pipe Syntax.* https://CRAN.R-project.org/package=kableExtra  
[10] Wickham H (2016). *ggplot2: Elegant Graphics for Data Analysis.* Springer. https://ggplot2.tidyverse.org  
[11] Kassambara A. *ggpubr: 'ggplot2' Based Publication Ready Plots.* https://CRAN.R-project.org/package=ggpubr  
[12] Wilke CO. *patchwork: The Composer of Plots.* https://CRAN.R-project.org/package=patchwork  
[13] Sievert C (2020). *Interactive Web-Based Data Visualization with R, plotly, and shiny.* Chapman and Hall/CRC. https://plotly-r.com  
[14] Wei T, Simko V. *corrplot: Visualization of a Correlation Matrix.* https://CRAN.R-project.org/package=corrplot  
[15] Neuwirth E. *RColorBrewer: ColorBrewer Palettes.* https://CRAN.R-project.org/package=RColorBrewer  
[16] Garnier S. *viridis: Colorblind-Friendly Color Maps for R.* https://CRAN.R-project.org/package=viridis  
[17] Slowikowski K. *ggrepel: Automatically Position Non-Overlapping Text Labels.* https://CRAN.R-project.org/package=ggrepel  
[18] Vaidyanathan R et al. *htmlwidgets: HTML Widgets for R.* https://CRAN.R-project.org/package=htmlwidgets  
[19] Husson F, Josse J, Le S, Mazet J. *FactoMineR: Multivariate Exploratory Data Analysis.* https://CRAN.R-project.org/package=FactoMineR  
[20] Kassambara A, Mundt F. *factoextra: Extract and Visualize Multivariate Results.* https://CRAN.R-project.org/package=factoextra  
[21] Husson F, Josse J, Pages J. *FactoInvestigate: Automatic Description of Factorial Analysis.* https://CRAN.R-project.org/package=FactoInvestigate  
[22] Dray S, Dufour A-B (2007). *The ade4 Package: Implementing the Duality Diagram.* Journal of Statistical Software, 22(4), 1–20. https://www.jstatsoft.org/article/view/v022i04  
[23] Beaton D, Dunlop A. *ExPosition: Exploratory Analysis with Positioning.* https://CRAN.R-project.org/package=ExPosition  
[24] Beaton D, Fatt C. *prettyGraphs: Pretty Graphs for Multivariate Analyses.* https://CRAN.R-project.org/package=prettyGraphs  
[25] Wickham H, Chang W. *devtools: Tools to Make Developing R Packages Easier.* https://CRAN.R-project.org/package=devtools  
[26] Wickham H, Bryan J. *usethis: Automate Package and Project Setup.* https://CRAN.R-project.org/package=usethis  
