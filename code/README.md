# 📁 Code Folder

This folder contains all R scripts used for data preparation, analysis, and export in the study. Scripts are named sequentially to reflect their order of execution.

> ⚠️ **Note**: Due to data confidentiality, the dataset is not included in this repository. However, the code used to process and analyze the data is fully available for transparency and reproducibility.

---

## 🔧 Script Overview

- [`00_setup.R`](./code/00_setup.R): Installs and loads all required R packages.
- [`01_data_cleaning.R`](./code/01_data_cleaning.R): Imports and prepares the data, including variable recoding and transformations.
- [`02_data_exploration_and_manipulation.R`](./code/02_data_exploration_and_manipulation.R): Performs summary statistics and descriptive analyses.
- [`03_descriptive_analysis.R`](./code/03_descriptive_analysis.R): Performs summary statistics and stratified descriptive analyses.
- [`04_analysis_mca.R`](./code/04_analysis_mca.R): Conducts Multiple Correspondence Analysis (MCA).
- [`05_tables_export.R`](./code/05_tables_export.R): Generates and exports tables for the manuscript.
- [`06_graphs_export.R`](./code/06_graphs_export.R): Creates and exports relevant visualizations.

---

## 📦 Required R Packages

The following R packages are used in this project (see citations below):

- **Data import & cleaning**: `readxl` [1], `dplyr` [2], `janitor` [3], `lubridate` [4], `forcats` [5], `tidyverse` [6]  
- **Descriptive statistics & tables**: `psych` [7], `Amelia` [8], `kableExtra` [9]  
- **Visualization**: `ggplot2` [10], `ggpubr` [11], `gridExtra`, `patchwork` [12], `plotly` [13], `corrplot` [14], `RColorBrewer` [15], `viridis` [16], `ggrepel` [17], `htmlwidgets` [18]  
- **Multivariate analysis**: `FactoMineR` [19], `factoextra` [20], `FactoInvestigate` [21], `ade4` [22], `ExPosition` [23], `prettyGraphs` [24]  
- **Development tools**: `devtools` [25], `usethis` [26]  

To install all required packages, run the setup script: [`00_setup.R`](./code/00_setup.R)

---

## 🧹 1. Data Cleaning and Preparation

<details>
<summary>Initials</summary>

Each annual dataset (2017–2022) underwent a standardized and reproducible data cleaning process, implemented in a consistent R script. The procedure included:

- Importing raw data from Excel files with `readxl`
- Initial inspection using functions like `summary()` and `names()`
- Selection of relevant variables based on a predefined protocol
- Renaming variables to ensure consistency across years
- Type conversion for dates, categorical, and numerical variables using `lubridate`, `dplyr`, and `forcats`
- Re-labeling categories according to official coding dictionaries from the INS
- Recoding unknown or inconsistent values
- Systematic handling of missing data
- Exporting the cleaned datasets as `.Rds` and `.RData` files

> ⚠️ The same procedure was applied to all yearly datasets (2017–2022), with small adjustments for structural differences between years.

You can explore the full cleaning procedure in the script [`01_data_cleaning.R`](./code/01_data_cleaning.R).
</details>

---

## 🧮 2. Data Manipulation and Exploration

<details>
<summary>Standard Variable Transformation</summary>

This script performs a standardized transformation and aggregation of variables for the 2017–2022 datasets. While the previous script (`01_data_cleaning.R`) focused on raw data cleaning and recoding, this step prepares the dataset for analysis through:

- Temporal validation of notification and event dates (`fech.not`, `fech.hech`)
- Categorization of age into meaningful age groups according to national health standards
- Re-labeling and grouping of sociodemographic variables
- Thematic grouping of violence-related variables
- Creation of simplified secondary variables
- Export of cleaned datasets

</details>

<details>
<summary>Time Analysis (2020 Focus)</summary>

This section focuses on temporal segmentation of the 2020 dataset:

- Creation of binary classification variables (`periodo.hecho` and `periodo.not`)
- Validation and consistency checks
- Splitting and merging into `vio.2020.before` and `vio.2020.pandemic`

</details>

<details>
<summary>Time Delay Computation (2017–2022)</summary>

For each year:

- Computed time difference (`dif.dias`) between event and notification
- Summary statistics and delay distribution histograms
- Filtering of negative or long-delay cases for inspection

</details>

<details>
<summary>Final Outputs</summary>

- Enriched datasets saved as `.c` files (e.g., `vio.2017.c`)
- Export of yearly and combined histograms
- Unified dataset `vio.todo` created with pandemic/prepandemic labels

> ✅ Consistent naming and structure were maintained for reproducibility.

You can explore the full procedure in the script [`02_data_exploration_and_manipulation.R`](./code/02_data_exploration_and_manipulation.R).
</details>

---

## 🧾 3. Descriptive Analysis

<details>
<summary>Description by Sex and Period</summary>

Stratified descriptive summaries were performed for each sex and pandemic period using:

- `describe()` for continuous variables
- `tabyl()` + `adorn_pct_formatting()` for categorical summaries

Datasets analyzed:

- `vio.before.female`, `vio.before.male`
- `vio.pandemic.female`, `vio.pandemic.male`

Variables include age, gender identity, occupation, type of violence, and more.

> ✅ Outputs were saved for further stratification by age group.

</details>

<details>
<summary>Description by Age Cohort</summary>

Further stratification was performed into:

- Children (0–17): Early childhood, Childhood, Adolescence
- Adults (18+): Youth, Adulthood, Older adult

Each sex-period combination was split and described. Factor levels were cleaned and summaries exported.

> ✅ This allows deeper insight into how violence patterns differ by age, sex, and pandemic timing.

You can explore the full procedure in the script [`03_descriptive_analysis.R`](./code/03_descriptive_analysis.R).
</details>

---

# 🎯 4. Final Analysis: Multiple Correspondence Analysis (MCA) 

This section summarizes the complete MCA process performed on three datasets:
- `vio.before`: Prepandemic period
- `vio.pandemic`: Pandemic period
- `vio.todo`: Combined dataset (2017–2022)

The analysis includes variable selection, cleaning and recoding, MCA execution, visualization (2D and 3D), and export of results.

---

## 📁 A. Data Preparation for MCA

### Variable Selection and Renaming - Quality Control 

For each dataset (`before`, `pandemic`, `todo`):
- Selected 10–11 variables: `sexo`, `activi.cat`, `antec.vio`, `sexo.agre`, `conv.agre`, `mecanismo.cat`, `escena.cat`, `edad.cat`, `tipo.viol`, `relacion` (+ `periodo` for `todo`)
- Renamed variables into English for clarity (e.g., `sexo` → `Sex`, `tipo.viol` → `Violence`)
- Translated categorical levels (e.g., "Sí" → "Yes")
- Corrected typos in levels (e.g., "Phsychological" → "Psychological")

---

## 📊 B. MCA Execution

###  MCA per Dataset

- Used `MCA(..., ncp = 3)` from the `FactoMineR` package
- Extracted eigenvalues using `get_eigenvalue()`
- Saved MCA objects for future use

###  Scree Plots

Generated scree plots with `fviz_screeplot()`:
- Added red dashed line at 4.9% for retained variability threshold
- Saved as `.pdf` (e.g., `Screeplot.vio.prepandemic.pdf`)

---

## 📈 C. Variable Category Plots

###  2D MCA Variable Plots

Generated biplots for variable categories using `fviz_mca_var()` for:
- Dim 1 vs 2
- Dim 1 vs 3
- Dim 2 vs 3

Combined into a vertical layout using `patchwork::plot_layout()` and saved (e.g., `variables.MCA.vio.DIM.todo.before.pdf`)

###  Enhanced Variable Plots with Labels

- Added custom labels using `geom_text_repel()`
- Highlighted key labels in bold (e.g., "Sexual violence")
- Used `viridis` palette for quadrant shading
- Exported with suffix `.quadrant.pdf`

###  3D MCA Plot of Variable Categories

- Used `plotly::plot_ly()` for interactive 3D scatter plots
- Colored points and labeled axes by explained variance
- Saved as `.html` (e.g., `3D_MCA_Categories_with_Quadrants.html`)

---

## 👤 D. Individual Records Plot (by Violence Type)

###  2D Individual Plot

- Colored individuals by `Violence` type
- Added ellipses per group with `fviz_mca_ind()`
- Used `viridis_d` palette for clarity

###  3D Individual Plot

- Created 3D scatter plot of individuals grouped by `Violence` using `plot_ly()`
- Added color legend with hover info
- Exported as `.html` (e.g., `3D_MCA_individuals_todo.html`)

---

## 💾 E. Saved Outputs

| Type       | Prepandemic              | Pandemic                  | Combined                   |
|------------|---------------------------|----------------------------|-----------------------------|
| Dataset    | `vio.before.MCA.Rds`      | `vio.pandemic.MCA.Rds`     | `vio.todo.MCA.Rds`          |
| Results    | `res.vio.before.MCA.Rds`  | `res.vio.pandemic.MCA.Rds` | `res.vio.todo.MCA.Rds`      |
| Screeplot  | `Screeplot.vio.prepandemic.pdf` | `Screeplot.vio.pandemic.pdf` | `Screeplot.vio.todo.pdf`     |
| Plots (2D) | `variables.MCA.vio.DIM.*`  | `variables.MCA.vio.DIM.*`  | `variables.MCA.vio.DIM.*`   |
| Plots (3D) | `3D_MCA_Categories_with_Quadrants.html` | `3D_MCA_Categories_with_Pandemic.html` | `3D_MCA_Categories_with_Todo.html` |
| Indiv (2D) | `individuals.before.vio.pdf` | `individuals.pandemic.vio.pdf` | `individuals.todo.vio.pdf` |
| Indiv (3D) | `3D_MCA_individuals_prepandemic.html` | `3D_MCA_individuals_pandemic.html` | `3D_MCA_individuals_todo.html` |

---

✅ The MCA workflow ensures full transparency, visual interpretability, and analytical consistency across prepandemic, pandemic, and full datasets.




## 📚 Package Citations

<details>
<summary>Click to expand</summary>

[1] Wickham H, Romain F, Henry L, Müller K. *readxl: Read Excel Files.* https://CRAN.R-project.org/package=readxl  
[2] Wickham H, François R, Henry L, Müller K. *dplyr: A Grammar of Data Manipulation.* https://CRAN.R-project.org/package=dplyr  
[3] Firke S. *janitor: Simple Tools for Examining and Cleaning Dirty Data.* https://CRAN.R-project.org/package=janitor  
[4] Grolemund G, Wickham H (2011). *Dates and Times Made Easy with lubridate.* https://www.jstatsoft.org/article/view/v040i03  
[5] Henry L, Wickham H. *forcats: Tools for Working with Categorical Variables (Factors).* https://CRAN.R-project.org/package=forcats  
[6] Wickham H, Averick M, Bryan J, et al. (2019). *Welcome to the tidyverse.* https://doi.org/10.21105/joss.01686  
[7] Revelle W. *psych: Procedures for Psychological, Psychometric, and Personality Research.* https://CRAN.R-project.org/package=psych  
[8] Honaker J, King G, Blackwell M. *Amelia II: A Program for Missing Data.* https://www.jstatsoft.org/article/view/v045i07  
[9] Zhu H. *kableExtra: Construct Complex Table with 'kable'.* https://CRAN.R-project.org/package=kableExtra  
[10] Wickham H. *ggplot2: Elegant Graphics for Data Analysis.* https://ggplot2.tidyverse.org  
[11] Kassambara A. *ggpubr: 'ggplot2' Based Publication Ready Plots.* https://CRAN.R-project.org/package=ggpubr  
[12] Wilke CO. *patchwork: The Composer of Plots.* https://CRAN.R-project.org/package=patchwork  
[13] Sievert C. *Interactive Web-Based Data Visualization with R.* https://plotly-r.com  
[14] Wei T, Simko V. *corrplot: Visualization of a Correlation Matrix.* https://CRAN.R-project.org/package=corrplot  
[15] Neuwirth E. *RColorBrewer: ColorBrewer Palettes.* https://CRAN.R-project.org/package=RColorBrewer  
[16] Garnier S. *viridis: Colorblind-Friendly Color Maps for R.* https://CRAN.R-project.org/package=viridis  
[17] Slowikowski K. *ggrepel: Automatically Position Non-Overlapping Text Labels.* https://CRAN.R-project.org/package=ggrepel  
[18] Vaidyanathan R et al. *htmlwidgets: HTML Widgets for R.* https://CRAN.R-project.org/package=htmlwidgets  
[19] Husson F, Josse J, Le S, Mazet J. *FactoMineR: Multivariate Exploratory Data Analysis.* https://CRAN.R-project.org/package=FactoMineR  
[20] Kassambara A, Mundt F. *factoextra: Extract and Visualize Multivariate Results.* https://CRAN.R-project.org/package=factoextra  
[21] Husson F, Josse J, Pages J. *FactoInvestigate.* https://CRAN.R-project.org/package=FactoInvestigate  
[22] Dray S, Dufour A-B. *The ade4 Package.* https://www.jstatsoft.org/article/view/v022i04  
[23] Beaton D, Dunlop A. *ExPosition: Exploratory Analysis with Positioning.* https://CRAN.R-project.org/package=ExPosition  
[24] Beaton D, Fatt C. *prettyGraphs.* https://CRAN.R-project.org/package=prettyGraphs  
[25] Wickham H, Chang W. *devtools.* https://CRAN.R-project.org/package=devtools  
[26] Wickham H, Bryan J. *usethis.* https://CRAN.R-project.org/package=usethis  

</details>
