# 📁 Code Folder

This folder contains all R scripts used for data preparation, analysis, and export in the study.

> ⚠️ **Note**: Due to data confidentiality, the dataset is not included in this repository. However, the code used to process and analyze the data is available here for transparency and reproducibility.

## Script Overview

- `00_setup.R`: Installs and loads all required R packages.
- `01_data_cleaning.R`: Imports and prepares data, including recoding and variable transformations.
- `02_data_exploration.R`: Summary statistics and descriptive analysis.
- `03_analysis_mca.R`: Multiple Correspondence Analysis (MCA).
- `04_tables_export.R`: Generation of tables for the manuscript.
- `05_graphs_export.R`: Visualization of key results.

### 📦 Required R Packages

The following R packages are used in this project:

- **Data import & cleaning**: `readxl`, `dplyr`, `janitor`, `lubridate`, `forcats`, `tidyverse`
- **Descriptive statistics**: `psych`, `Amelia`, `kableExtra`
- **Visualization**: `ggplot2`, `ggpubr`, `gridExtra`, `patchwork`, `plotly`, `corrplot`, `RColorBrewer`, `viridis`, `ggrepel`, `htmlwidgets`
- **Multivariate analysis**: `FactoMineR`, `factoextra`, `FactoInvestigate`, `ade4`, `ExPosition`, `prettyGraphs`
- **Development tools**: `devtools`, `usethis`

To install all required packages, use the script [`00_setup.R`](./00_setup.R).
