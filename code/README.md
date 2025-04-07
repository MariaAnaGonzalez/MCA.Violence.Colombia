
# 📁 Code Folder

This folder contains all R scripts used for data preparation, analysis, and export in the study. Scripts are named sequentially to reflect their order of execution.

> ⚠️ **Note**: Due to data confidentiality, the dataset is not included in this repository. However, the code used to process and analyze the data is fully available for transparency and reproducibility.

---

## 🔧 Script Overview

- [`00_setup.R`](./code/00_setup.R): Installs and loads all required R packages.  
- [`01_data_cleaning.R`](./code/01_data_cleaning.R): Imports and prepares the data, including variable recoding and transformations.  
- [`02_data_exploration_and_manipulation.R`](./code/02_data_exploration_and_manipulation.R): Conducts data exploration and variable standardization.  
- [`03_descriptive_analysis.R`](./code/03_descriptive_analysis.R): Performs stratified descriptive analysis by period, sex, and age.  
- [`04_analysis_mca.R`](./code/04_analysis_mca.R): Conducts Multiple Correspondence Analysis (MCA) on pre-pandemic, pandemic, and full datasets.  
- [`05_sensitivity_analysis.R`](./code/05_sensitivity_analysis.R): Conducts robustness checks and sensitivity analyses.  
---

## 📦 Required R Packages

This project uses the following R packages (citations below):

- **Data import & cleaning**: `readxl` [1], `dplyr` [2], `janitor` [3], `lubridate` [4], `forcats` [5], `tidyverse` [6]  
- **Descriptive statistics & tables**: `psych` [7], `Amelia` [8], `kableExtra` [9]  
- **Visualization**: `ggplot2` [10], `ggpubr` [11], `gridExtra`, `patchwork` [12], `plotly` [13], `corrplot` [14], `RColorBrewer` [15], `viridis` [16], `ggrepel` [17], `htmlwidgets` [18]  
- **Multivariate analysis**: `FactoMineR` [19], `factoextra` [20], `FactoInvestigate` [21], `ade4` [22], `ExPosition` [23], `prettyGraphs` [24]  
- **Development tools**: `devtools` [25], `usethis` [26]  

To install all required packages, run the setup script: [`00_setup.R`](./code/00_setup.R)

---

## 🧹 1. Data Cleaning and Preparation

<details>
<summary>Click to expand</summary>

Each annual dataset (2017–2022) underwent a standardized and reproducible data cleaning process. The script included:

- Importing raw data from Excel files using `readxl`
- Initial inspection using `summary()` and `names()`
- Selection of relevant variables based on a predefined protocol
- Renaming variables for consistency across years
- Type conversion for dates, factors, and numerics using `lubridate`, `dplyr`, and `forcats`
- Re-labeling categories using INS dictionaries
- Recoding unknown or inconsistent values
- Systematic handling of missing data
- Exporting cleaned datasets as `.Rds` and `.RData` files

> ⚠️ The same process was applied to all datasets, with slight adjustments for annual structural differences.

See the full procedure in [`01_data_cleaning.R`](./code/01_data_cleaning.R).
</details>

---

## 🧮 2. Data Manipulation and Exploration

<details>
<summary>Click to expand</summary>

This script standardizes variables across years (2017–2022) for analysis. Key steps:

- Date validation (`fech.not`, `fech.hech`)  
- Age grouped into health system-relevant categories  
- Re-labeling of sociodemographic and violence-related variables  
- Creation of thematic groups (e.g., by type of violence, relationship to aggressor)  
- Generation of simplified, analysis-ready variables  
- Export of `.Rds` files

**Time Analysis (2020 Focus)**  
- Binary classification of events by period (`periodo.hecho`, `periodo.not`)  
- Validation of consistency  
- Dataset split into `vio.2020.before` and `vio.2020.pandemic`

**Time Delay Computation (2017–2022)**  
- Calculated `dif.dias` (event-to-notification delay)  
- Computed summary stats (mean, median, SD)  
- Histograms visualized and exported  
- Outlier filtering: negative or >30-day delays

**Final Outputs**  
- `.c` files saved annually (e.g., `vio.2017.c`)  
- Combined histogram plots exported  
- Full-period dataset `vio.todo` created, labeled by period

See full script: [`02_data_exploration_and_manipulation.R`](./code/02_data_exploration_and_manipulation.R)
</details>

---

## 🧾 3. Descriptive Analysis

<details>
<summary><strong>📊 Stratified Analysis by Sex and Pandemic Period</strong></summary>

This section presents descriptive statistics stratified by:

- **Sex**: Female / Male  
- **Pandemic period**: Prepandemic / Pandemic  

###  Steps:

- Datasets were split:  
  `vio.before.female`, `vio.before.male`, `vio.pandemic.female`, `vio.pandemic.male`

- **Continuous variables**: Summarized with `describe()` (e.g., age, time delay)

- **Categorical variables**: Summarized with `tabyl()` + `adorn_percentages()` (e.g., occupation, violence type)


</details>

<details>
<summary><strong>📊 Descriptive Analysis by Age Cohorts</strong></summary>

Survivors were grouped into official age cohorts:

- **Children**: 0–5 (early), 6–11 (childhood), 12–17 (adolescence)  
- **Adults**: 18–26 (youth), 27–59 (adulthood), 60+ (older adults)


###  Steps:

- Each **sex × period** subgroup was split by age group

- Frequencies and distributions were recalculated

- Factor levels were cleaned and harmonized across years

- Tables were exported for reporting and annexes


See the full script: [`03_descriptive_analysis.R`](./code/03_descriptive_analysis.R)
</details>

---

## 🎯 4. Multiple Correspondence Analysis (MCA)

<details>
<summary><strong>🧪 Dataset Preparation and Variable Recoding</strong></summary>

###  Datasets:

- `vio.before.MCA`: Prepandemic  
- `vio.pandemic.MCA`: Pandemic  
- `vio.todo.MCA`: Combined (includes `Period` variable)

###  Preprocessing:

- Selected 10–11 categorical variables (e.g., `Sex`, `Activity`, `Violence`, `Relation`, etc.)

- Translated variable names to English

- Recoded values:
  - `"Sí"` → `"Yes"`  
  - `"Phsychological"` → `"Psychological"`  
  - `"Civic leaders and students"` → `"Students and civic leaders"`

- Saved final datasets as `.Rds` files

</details>

<details>
<summary><strong>📈 MCA Execution and Scree Plots</strong></summary>

###  Execution:

- Ran `MCA(..., ncp = 3)` using `FactoMineR`

- Extracted eigenvalues via `get_eigenvalue()`

###  Scree Plots:

- Created using `fviz_screeplot()`  
- Red dashed threshold line at **4.9%**  
- Exported as `.pdf` (e.g., `Screeplot.vio.todo.pdf`)

</details>

<details>
<summary><strong>📌 Variable Category Visualization</strong></summary>

###  2D Plots:

- Used `fviz_mca_var()` to plot:
  - Dim 1 vs 2  
  - Dim 1 vs 3  
  - Dim 2 vs 3

- Combined with `patchwork::plot_layout()`

- Labeled key categories with `geom_text_repel()` (e.g., `"Sexual violence"`)

- Shaded quadrants with `viridisLite::viridis()` palette (color blind friendly palette)

- Saved as `.pdf` (e.g., `categorias.MCA.vio.before.todo.quadrant.pdf`)

###  3D Plots:

- Created with `plotly::plot_ly()`  
- Labeled axes with variance explained  
- Saved as `.html` (e.g., `3D_MCA_Categories_with_Todo.html`)

</details>

<details>
<summary><strong>👤 Plots of Individual Records by Violence Type</strong></summary>

###  2D Plots:

- Colored by `Violence` group  
- Added confidence ellipses (95%) with `fviz_mca_ind()`

- Used `viridis_d` color scale  (color blind friendly palette)
- Saved as `.pdf` (e.g., `individuals.pandemic.vio.pdf`)

###  3D Plots:

- Built with `plot_ly()`  
- Grouped by `Violence` type  
- Interactive format saved as `.html` (e.g., `3D_MCA_individuals_prepandemic.html`)


See full script: [`04_analysis_mca.R`](./code/04_analysis_mca.R)

✅ Both the descriptive and MCA analyses were structured to maintain consistency across prepandemic, pandemic, and combined datasets, enabling valid comparisons over time.


</details>


## 🧪 5. Sensitivity Analysis

<details>
<summary>Click to expand</summary>

This script contains robustness checks and alternative specifications for key analytical decisions:

- Re-categorization of age groups or violence types  
- Inclusion/exclusion of missing or outlier cases  
- Validation of MCA results using reduced or expanded variable sets  
- Cross-validation with other multivariate techniques if applicable

See full script: [`05_sensitivity_analysis.R`](./code/05_sensitivity_analysis.R)
</details>

---
