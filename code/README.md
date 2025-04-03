# 📁 Code Folder

This folder contains all R scripts used for data preparation, analysis, and export in the study. Scripts are named sequentially to reflect their order of execution.

> ⚠️ **Note**: Due to data confidentiality, the dataset is not included in this repository. However, the code used to process and analyze the data is fully available for transparency and reproducibility.

---

## 🔧 Script Overview

- 00_setup.R: Installs and loads all required R packages.
- 01_data_cleaning.R: Imports and prepares the data, including variable recoding and transformations.
- 02_data_exploration_and_manipulation.R: Performs summary statistics and descriptive analyses.
- 03_analysis_mca.R: Conducts Multiple Correspondence Analysis (MCA).
- 04_tables_export.R: Generates and exports tables for the manuscript.
- 05_graphs_export.R: Creates and exports relevant visualizations.

---

## 📦 Required R Packages

The following R packages are used in this project (see citations below):

- **Data import & cleaning**: readxl [1], dplyr [2], janitor [3], lubridate [4], forcats [5], tidyverse [6]  
- **Descriptive statistics & tables**: psych [7], Amelia [8], kableExtra [9]  
- **Visualization**: ggplot2 [10], ggpubr [11], gridExtra, patchwork [12], plotly [13], corrplot [14], RColorBrewer [15], viridis [16], ggrepel [17], htmlwidgets [18]  
- **Multivariate analysis**: FactoMineR [19], factoextra [20], FactoInvestigate [21], ade4 [22], ExPosition [23], prettyGraphs [24]  
- **Development tools**: devtools [25], usethis [26]  

To install all required packages, run the setup script: [00_setup.R](./code/00_setup.R)

---

## 🧹 1. Data Cleaning and Preparation

Each annual dataset (2017–2022) underwent a standardized and reproducible data cleaning process, implemented in a consistent R script. The procedure included:

- **Importing raw data** from Excel files with readxl
- **Initial inspection** using functions like summary() and names()
- **Selection of relevant variables** based on a predefined protocol
- **Renaming variables** to ensure consistency across years
- **Type conversion** for dates, categorical, and numerical variables using lubridate, dplyr, and forcats
- **Re-labeling categories** according to official coding dictionaries from the INS
- **Recoding unknown or inconsistent values**
- **Systematic handling of missing data**
- **Exporting the cleaned datasets** as .Rds and .RData files

> ⚠️ The same procedure was applied to all yearly datasets (2017–2022), with small adjustments for structural differences between years.

You can explore the full cleaning procedure in the script [01_data_cleaning.R](./code/01_data_cleaning.R).


## 🧮 2. Data Manipulation and Exploration

<details>
<summary>🔹 Step A: Standard Variable Transformation</summary>

This script performs a standardized transformation and aggregation of variables for the 2017–2022 datasets. While the previous script (01_data_cleaning.R) focused on raw data cleaning and recoding based on the original dictionary, this step prepares the dataset for analysis through:

- **Temporal validation** of notification and event dates (fech.not, fech.hech)
- **Categorization of age** into meaningful age groups according to national health standards
- **Re-labeling and re-grouping** of:
  - Sociodemographic variables (e.g., sex, nationality, occupation)
  - Social security status
  - Ethnic background
  - Belonging to "vulnerable" or priority populations
  - Departmental origin (dep.ocu) into regional planning groups
- **Thematic groupings** of key variables:
  - Type of violence (tipo.viol)
  - Mechanism of aggression (mecanismo.cat)
  - Location of aggression (escena.cat)
  - Survivor activity (activi.cat)
  - Aggressor relationship (relacion)
- **Missing values handling** and creation of interpretable labels for statistical analysis
- **Creation of secondary variables** that simplify or condense granular data into analytic-friendly formats (e.g., ocup.cat, v.sexual.cat)

Cleaned and manipulated datasets are saved in .Rds format at the end of each script (e.g., vio.2017.b).

</details>

---

<details>
<summary>🔹 Step B: Time Analysis (2020 Focus)</summary>

This component adds a temporal dimension to the 2020 dataset by distinguishing between pre-pandemic and pandemic periods:

- **Creation of binary classification variables**:
  - periodo.hecho: Based on the event date (fech.hech) — labeled as "Prepandemic" or "Pandemic"
  - periodo.not: Based on the notification date (fech.not) — same classification
- **Validation of these variables**: Checked for consistency and absence of missing values
- **Comparison of both period variables** to ensure overlap and alignment
- The 2020 dataset was then split into vio.2020.before and vio.2020.pandemic, and merged accordingly with previous and later years.

</details>

---

<details>
<summary>🔹 Step C: Time Delay Computation (2017–2022)</summary>

For each year, the following steps were performed:

- Computation of the time difference (dif.dias) between the date of the event and the date of notification
- **Summary statistics**: min, max, mean, median, SD, range
- **Visualization**: Yearly histograms were created and saved in PNG and PDF formats to visualize the distribution of reporting delays
- Filtering of outliers:
  - Cases with **negative time differences** (possible date inconsistencies)
  - Cases with **delays over 30 days**, for further descriptive analysis

</details>

---

<details>
<summary>🔹 Final Outputs</summary>

- Yearly datasets enriched with the new variable dif.dias were saved as .Rds and .RData files (e.g., vio.2017.c, vio.2022.c)
- Combined histograms summarizing delay distributions were exported as:
  - histo.dif.dates.all.png
  - histo.dif.dates.all.pdf
- A new classification variable periodo was added to label all records as "Pandemic" or "Prepandemic"
- All datasets were **merged into a single unified dataset** (vio.todo) for full-period comparative analysis

> ✅ The same structure was applied to all yearly datasets (2017–2022) using similarly named scripts (e.g., 02_data_manipulation_2018.R) to ensure full reproducibility and consistency across years.

</details>





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
