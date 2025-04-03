
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
- [`06_tables_export.R`](./code/06_tables_export.R): Generates and exports tables for the manuscript.  
- [`07_graphs_export.R`](./code/07_graphs_export.R): Creates and exports visualizations.  

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
<summary>Click to expand</summary>

Stratified by sex and period:

- `describe()` for continuous variables  
- `tabyl()` + `adorn_pct_formatting()` for categorical summaries  
- Analyzed: `vio.before.female`, `vio.before.male`, `vio.pandemic.female`, `vio.pandemic.male`  
- Output saved for cohort analysis

**By Age Cohort**  
- Children (0–17): early childhood, childhood, adolescence  
- Adults (18+): youth, adulthood, older adult  
- Subgroups stratified by sex and period. Factor levels cleaned, summaries exported.

See the full script: [`03_descriptive_analysis.R`](./code/03_descriptive_analysis.R)
</details>

---

## 🎯 4. Final Analysis: Multiple Correspondence Analysis (MCA)

<details>
<summary>Click to expand</summary>

Conducted on:  
- `vio.before` (Prepandemic)  
- `vio.pandemic` (Pandemic)  
- `vio.todo` (Combined)

**Data Preparation**  
- Selected 10–11 categorical variables  
- Renamed to English (e.g., `sexo` → `Sex`)  
- Re-labeled levels (e.g., `"Sí"` → `"Yes"`)  
- Corrected typos

**MCA Execution**  
- `MCA(..., ncp = 3)` used  
- `get_eigenvalue()` extracted eigenvalues  
- Scree plots via `fviz_screeplot()`  
- Red line at 4.9% threshold

**Variable Category Plots (2D & 3D)**  
- Biplots: 1–2, 1–3, 2–3 dimensions  
- Labels added via `geom_text_repel()`  
- Quadrant shading with `viridis`  
- `plotly()` for interactive 3D  

**Individual Record Plots**  
- Colored by `Violence` type  
- Ellipses for group separation  
- Interactive 3D versions exported as `.html`

**Saved Outputs**

| Type       | Prepandemic              | Pandemic                  | Combined                   |
|------------|---------------------------|----------------------------|-----------------------------|
| Dataset    | `vio.before.MCA.Rds`      | `vio.pandemic.MCA.Rds`     | `vio.todo.MCA.Rds`          |
| Results    | `res.vio.before.MCA.Rds`  | `res.vio.pandemic.MCA.Rds` | `res.vio.todo.MCA.Rds`      |
| Screeplot  | `Screeplot.vio.prepandemic.pdf` | `Screeplot.vio.pandemic.pdf` | `Screeplot.vio.todo.pdf`     |
| Plots (2D) | `variables.MCA.vio.DIM.*`  | `variables.MCA.vio.DIM.*`  | `variables.MCA.vio.DIM.*`   |
| Plots (3D) | `3D_MCA_Categories_with_Quadrants.html` | `3D_MCA_Categories_with_Pandemic.html` | `3D_MCA_Categories_with_Todo.html` |
| Indiv (2D) | `individuals.before.vio.pdf` | `individuals.pandemic.vio.pdf` | `individuals.todo.vio.pdf` |
| Indiv (3D) | `3D_MCA_individuals_prepandemic.html` | `3D_MCA_individuals_pandemic.html` | `3D_MCA_individuals_todo.html` |

See full script: [`04_analysis_mca.R`](./code/04_analysis_mca.R)
</details>

---

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
