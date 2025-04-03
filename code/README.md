# Code Folder

This folder contains all R scripts used for data preparation, analysis, and export in the study. Scripts are named sequentially to reflect their order of execution.

> Note: Due to data confidentiality, the dataset is not included in this repository. However, the code used to process and analyze the data is fully available for transparency and reproducibility.

---

## Script Overview

- `00_setup.R`: Installs and loads all required R packages.
- `01_data_cleaning.R`: Imports and prepares the data, including variable recoding and transformations.
- `02_data_exploration_and_manipulation.R`: Performs summary statistics and descriptive analyses.
- `03_analysis_mca.R`: Conducts Multiple Correspondence Analysis (MCA).
- `04_tables_export.R`: Generates and exports tables for the manuscript.
- `05_graphs_export.R`: Creates and exports relevant visualizations.

---

<details>
<summary><strong>1. Data Cleaning and Preparation</strong></summary>

Each annual dataset (2017–2022) underwent a standardized and reproducible data cleaning process. The procedure included:

- Importing raw data from Excel files with `readxl`
- Initial inspection using functions like `summary()` and `names()`
- Selection of relevant variables based on a predefined protocol
- Renaming variables to ensure consistency across years
- Type conversion for dates, categorical, and numerical variables using `lubridate`, `dplyr`, and `forcats`
- Re-labeling categories according to official coding dictionaries from the INS
- Recoding unknown or inconsistent values
- Systematic handling of missing data
- Exporting the cleaned datasets as `.Rds` and `.RData` files

> The same procedure was applied to all yearly datasets (2017–2022), with minor structural adjustments as needed.

You can explore the full cleaning procedure in the script [`01_data_cleaning.R`](./code/01_data_cleaning.R)

</details>

---

<details>
<summary><strong>2. Data Manipulation and Exploration</strong></summary>

<details>
<summary>Step A: Standard Variable Transformation</summary>

- Temporal validation of notification and event dates (`fech.not`, `fech.hech`)
- Categorization of age into standardized groups
- Re-labeling and re-grouping of:
  - Sociodemographic and vulnerability variables
  - Social security and ethnic background
  - Department of occurrence into regional groups
- Grouping key variables thematically:
  - Type and mechanism of violence
  - Place and context of the event
  - Survivor activity and relationship to aggressor
- Handling of missing values and creation of interpretable formats
- Output saved as `.Rds` files (e.g., `vio.2017.b`)

</details>

<details>
<summary>Step B: Time Analysis (2020 Focus)</summary>

- Created binary variables:
  - `periodo.hecho` based on `fech.hech`
  - `periodo.not` based on `fech.not`
- Labeled events as "Prepandemic" or "Pandemic"
- Ensured no missing or conflicting values
- Split the 2020 data into `vio.2020.before` and `vio.2020.pandemic` and merged with other years

</details>

<details>
<summary>Step C: Time Delay Computation (2017–2022)</summary>

- Calculated `dif.dias`: the difference in days between event and notification
- Summary statistics for each year: min, max, mean, median, SD
- Histograms exported as PNG and PDF files
- Filtered for:
  - Negative time differences (data inconsistencies)
  - Delays over 30 days for further inspection

</details>

<details>
<summary>Final Outputs</summary>

- Saved `.Rds` and `.RData` files for each year (e.g., `vio.2017.c`)
- Generated:
  - `histo.dif.dates.all.png`
  - `histo.dif.dates.all.pdf`
- Created a `periodo` variable for all years (Pandemic or Prepandemic)
- Merged all yearly datasets into `vio.todo` for full-period analysis

> The same procedure was applied across all years with script names like `02_data_manipulation_2018.R`.

</details>

</details>

---

<details>
<summary><strong>Package Citations</strong></summary>

[1] Wickham H, Romain F, Henry L, Müller K. *readxl: Read Excel Files.* https://CRAN.R-project.org/package=readxl  
[2] Wickham H, François R, Henry L, Müller K. *dplyr: A Grammar of Data Manipulation.* https://CRAN.R-project.org/package=dplyr  
[3] Firke S. *janitor: Simple Tools for Examining and Cleaning Dirty Data.* https://CRAN.R-project.org/package=janitor  
[4] Grolemund G, Wickham H. *Dates and Times Made Easy with lubridate.* https://www.jstatsoft.org/article/view/v040i03  
[5] Henry L, Wickham H. *forcats: Tools for Working with Categorical Variables (Factors).* https://CRAN.R-project.org/package=forcats  
[6] Wickham H, Averick M, Bryan J, et al. *Welcome to the tidyverse.* Journal of Open Source Software, 4(43), 1686. https://doi.org/10.21105/joss.01686  
[7] Revelle W. *psych: Procedures for Psychological, Psychometric, and Personality Research.* https://CRAN.R-project.org/package=psych  
[8] Honaker J, King G, Blackwell M. *Amelia II: A Program for Missing Data.* Journal of Statistical Software, 45(7), 1–47. https://www.jstatsoft.org/article/view/v045i07  
[9] Zhu H. *kableExtra: Construct Complex Table with 'kable' and Pipe Syntax.* https://CRAN.R-project.org/package=kableExtra  
[10] Wickham H. *ggplot2: Elegant Graphics for Data Analysis.* Springer. https://ggplot2.tidyverse.org  
[11] Kassambara A. *ggpubr: 'ggplot2' Based Publication Ready Plots.* https://CRAN.R-project.org/package=ggpubr  
[12] Wilke CO. *patchwork: The Composer of Plots.* https://CRAN.R-project.org/package=patchwork  
[13] Sievert C. *Interactive Web-Based Data Visualization with R, plotly, and shiny.* Chapman and Hall/CRC. https://plotly-r.com  
[14] Wei T, Simko V. *corrplot: Visualization of a Correlation Matrix.* https://CRAN.R-project.org/package=corrplot  
[15] Neuwirth E. *RColorBrewer: ColorBrewer Palettes.* https://CRAN.R-project.org/package=RColorBrewer  
[16] Garnier S. *viridis: Colorblind-Friendly Color Maps for R.* https://CRAN.R-project.org/package=viridis  
[17] Slowikowski K. *ggrepel: Automatically Position Non-Overlapping Text Labels.* https://CRAN.R-project.org/package=ggrepel  
[18] Vaidyanathan R et al. *htmlwidgets: HTML Widgets for R.* https://CRAN.R-project.org/package=htmlwidgets  
[19] Husson F, Josse J, Le S, Mazet J. *FactoMineR: Multivariate Exploratory Data Analysis.* https://CRAN.R-project.org/package=FactoMineR  
[20] Kassambara A, Mundt F. *factoextra: Extract and Visualize Multivariate Results.* https://CRAN.R-project.org/package=factoextra  
[21] Husson F, Josse J, Pages J. *FactoInvestigate: Automatic Description of Factorial Analysis.* https://CRAN.R-project.org/package=FactoInvestigate  
[22] Dray S, Dufour A-B. *The ade4 Package: Implementing the Duality Diagram.* Journal of Statistical Software, 22(4), 1–20. https://www.jstatsoft.org/article/view/v022i04  
[23] Beaton D, Dunlop A. *ExPosition: Exploratory Analysis with Positioning.* https://CRAN.R-project.org/package=ExPosition  
[24] Beaton D, Fatt C. *prettyGraphs: Pretty Graphs for Multivariate Analyses.* https://CRAN.R-project.org/package=prettyGraphs  
[25] Wickham H, Chang W. *devtools: Tools to Make Developing R Packages Easier.* https://CRAN.R-project.org/package=devtools  
[26] Wickham H, Bryan J. *usethis: Automate Package and Project Setup.* https://CRAN.R-project.org/package=usethis  

</details>
