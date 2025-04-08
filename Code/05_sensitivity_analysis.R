############################################################
## A. Sensitivity Analysis - Prepandemic/Pandemic         ##
############################################################

# This script evaluates the robustness of the MCA results by comparing the complete case analysis (excluding missing data) to the original model where missing data was treated as an extra category.

# We are going to do a sensitivity analysis of: 
# all observations (including missing data as an extra category) vs . complete cases (excluding missing data)

# Understanding the Purpose of Sensitivity Analysis: 

# Sensitivity analysis aims to answer questions such as:
# - Do the results of the MCA change significantly if I modify or exclude the missing categories? - Examine the stability
# - How does the missing categories help me to understand my data?


## 1. Set working directory

## 2. Import databases "vio.todo.MCA" (from folder:  "Final Analysis") y "vio.todo" (From folder:  "Data manipulation")

load("vio.todo.MCA.Rds")
load("vio.todo.Rds")

## 3. Calculate the overall percentage of missing data

missing_data_percentage <- sum(is.na(vio.todo.MCA)) / 
  (nrow(vio.todo.MCA) * ncol(vio.todo.MCA)) * 100

# Print the overall percentage of missing data

cat("Percentage of missing data:", round(missing_data_percentage, 2), "%\n")

# 4. Calculate the percentage of missing data per column

missing_data_per_column <- colSums(is.na(vio.todo.MCA)) / nrow(vio.todo.MCA) * 100

# Print the missing data per column in a formatted way

cat("Missing data percentage per column:\n")
formatted_missing_data <- format(round(missing_data_per_column, 2), 
                                 digits = 2, scientific = FALSE)
print(formatted_missing_data)

# 5. Check for patterns of missingness

# Generate a missingness map
missmap(vio.todo.MCA,
        main = "Missing Data Map",
        col = c("yellow", "steelblue"),  # Yellow = Missing, Black = Present
        legend = TRUE)

# Optional: Adjust the plot margins for better visualization

par(mar = c(5, 5, 2, 2))  # Margins: bottom, left, top, right


# 6: Listwise Deletion (Omitting Missing Data)

# Remove rows with missing data

vio.todo.MCA.complete <- na.omit(vio.todo.MCA)

# Check the dimensions of the cleaned dataset

cat("Number of rows in the original dataset:", nrow(vio.todo.MCA), "\n")
cat("Number of rows after removing missing data:", nrow(vio.todo.MCA.complete), "\n")


# 7. Describe the patterns of missing data in the complete cases database vs. 
# original analysis (missing data as an extra category) according to the variables: 
# - "Sex"
# - "The type of violence" 
# - "Period"

# A. Description of  the variable "Sex" in the two datasets 

tabyl(vio.todo.MCA.complete$Sex, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

tabyl(vio.todo.MCA$Sex, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# B. Description of  the variable "Type of Violence"

tabyl(vio.todo.MCA.complete$Violence, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

tabyl(vio.todo.MCA$Violence, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

# C. Description of  the variable "Period"

tabyl(vio.todo.MCA.complete$Period, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)

tabyl(vio.todo.MCA$Period, show_na = TRUE)%>%
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 1)


# 8. Describe the "Type of violence" according to "Sex" in the complete cases database and the original dataset simultaneously

## A. Built two tables - one for complete cases the other one for the original dataset 

# Function to describe Type of Violence by Sex
describe_violence_by_sex <- function(data, Sex, Violence) {
  # Cross-tabulate Sex and Violence
  abs_table <- table(data[[Sex]], data[[Violence]])
  
  # Calculate Percentages (row-wise)
  percent_table <- prop.table(abs_table, margin = 1) * 100
  
  # Combine Absolute and Percentage Tables
  result <- as.data.frame.matrix(cbind(
    abs_table, 
    round(percent_table, 1)
  ))
  
  # Rename Columns for Better Understanding
  colnames(result) <- c(paste0(colnames(abs_table), " (Abs)"), 
                        paste0(colnames(percent_table), " (%)"))
  
  # Add a Row Name Column for Sex
  result <- result %>%
    tibble::rownames_to_column(var = "Sex")
  
  return(result)
}

# Apply the Function to Both Datasets
table_complete <- describe_violence_by_sex(vio.todo.MCA.complete, "Sex", "Violence")
table_full <- describe_violence_by_sex(vio.todo.MCA, "Sex", "Violence")

# Merge the Two Tables for Comparison
comparison_table <- list(
  "Complete Cases" = table_complete,
  "Original Dataset" = table_full
)

# Print Tables Side-by-Side (Plain Output Example)
cat("Comparison of Violence by Sex in Complete Cases vs Original Dataset:\n")
print(comparison_table$`Complete Cases`)
cat("\n")
print(comparison_table$`Original Dataset`)



### B. Graph - Stacked bar chart

# Combine both datasets for plotting
table_complete <- table_complete %>% mutate(Dataset = "Complete Cases")
table_full <- table_full %>% mutate(Dataset = "Original Dataset")
combined_data <- bind_rows(table_complete, table_full)

# Pivot to long format for ggplot2
long_data <- combined_data %>%
  pivot_longer(cols = ends_with("(%)"), names_to = "Type of Violence", values_to = "Percentage") %>%
  mutate(`Type of Violence` = gsub(" \\(%.+\\)", "", `Type of Violence`))


# Extract specific viridis colors
viridis_colors <- viridis(5)  # Generate a set of 5 colors
purple_light <- viridis_colors[1]         # Light purple
green <- viridis_colors[4]                # Green
yellow <- viridis_colors[5]               # Yellow
blue <- viridis_colors[3]                 # Blue 


# Assign colors to each type of violence
custom_colors <- c(
  "Physical violence (%)" = purple_light,
  "Negligence & abandonment (%)" = green,
  "Sexual violence (%)" = yellow,
  "Psychological violence (%)" = blue
)

# Check the custom colors to verify
print(custom_colors)


# Manually specify the desired order of Type of Violence
long_data$`Type of Violence` <- factor(
  long_data$`Type of Violence`,
  levels = c("Psychological violence (%)", "Sexual violence (%)",
             "Negligence & abandonment (%)",  
             "Physical violence (%)") # Replace with your desired order

)


# Make the graph 

sensi.stacked.bar.vio.sex <- ggplot(long_data, aes(x = Sex, y = Percentage, fill = `Type of Violence`)) +
  geom_bar(stat = "identity", position = "stack") +  # Stacked bars
  geom_text(aes(label = round(Percentage, 1), 
                color = `Type of Violence` == "Physical violence (%)"),  # Condition for text color
            position = position_stack(vjust = 0.5),  # Center labels
            size = 3,                                # Bigger text size
            fontface = "bold") +                     # Bold text
  scale_fill_manual(values = custom_colors) +        # Use your custom colors
  scale_color_manual(values = c("TRUE" = "white", "FALSE" = "#333333"), guide = "none") +  # Map conditions to colors
  facet_wrap(~ Dataset) +                            # Separate by dataset
  theme_minimal() +
  labs(
    title = "Comparison of Violence Types by Sex",
    x = "Sex",
    y = "Percentage",
    fill = "Type of Violence"
  )

# Print the plot
print(sensi.stacked.bar.vio.sex)


#  Save the plot to a PDF file
ggsave("sensi.stacked.bar.vio.sex.pdf", plot = sensi.stacked.bar.vio.sex, width = 8, height = 6)



######### Multiple Correspondence Analysis - Complete Cases #######

#  1. Perform MCA with 3 dimensions
res.vio.todo.MCA.complete <- MCA(vio.todo.MCA.complete, ncp = 3, graph = FALSE)

#   Save the MCA results for future use
save(res.vio.todo.MCA.complete, file = "res.vio.todo.MCA.complete.Rds")

# 2. Extract eigenvalues
eig.val <- get_eigenvalue(res.vio.todo.MCA.complete)

#   Display the eigenvalues (proportion of variance)
head(eig.val)


# 3. Create scree plot
Screeplot.vio.complete <- fviz_screeplot(
  res.vio.todo.MCA.complete,
  addlabels = TRUE,                 # Add labels to bars
  ylim = c(0, 12)                   # Set y-axis limits
) +
  geom_hline(
    yintercept = 4.9,               # Retained variability threshold
    linetype = 2,                   # Dashed line
    color = "red"
  ) +
  labs(
    title = "Scree Plot - Prepandemic & Pandemic (Complete Case Analysis)", # Title 
    x = "Dimensions", 
    y = "Percentage of Variance Explained"
  ) +
  theme_minimal()                   # Use a clean theme

# Display the plot
print(Screeplot.vio.complete)

#  Save the scree plot to a PDF file
ggsave("Screeplot.vio.todo.pdf", plot = Screeplot.vio.todo.complete, width = 8, height = 6)




# 4. Interpretation - Plots of Variables

#  The plot shows the results of the variables:
#  List of coordinates, cos², and the contribution of each variable:


#  Get the MCA results for variables
var <- get_mca_var(res.vio.todo.MCA.complete)
print(var)


# Output Explanation:
# "$coord"   : Coordinates for categories
# "$cos2"    : Cos² for categories (quality of representation)
# "$contrib" : Contributions of categories to the dimensions


#   Plotting the variables for Dimensions 1 and 2:

# Plot the variables in the MCA for Dimensions 1 and 2
variables.MCA.vio.DIM.1.2.complete <- fviz_mca_var(res.vio.todo.MCA.complete, 
                                               col.var= "blueviolet", # Set the color for variables
                                               choice = "mca.cor",       # Plot using correlation
                                               repel = TRUE,             # Avoid label overlap
                                               ggtheme = theme_minimal())  # Set a minimal theme

# Add a title to the plot
variables.MCA.vio.DIM.1.2.complete <- variables.MCA.vio.DIM.1.2.complete + 
  labs(title = "Violence Variables - Prepandemic & Pandemic (Dim 1 vs Dim 2) - Complete Case Analysis")

# Display the plot
print(variables.MCA.vio.DIM.1.2.complete)


# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.1.2.complete.pdf", width = 8, height = 7)



#  Plotting the variables for Dimensions 1 and 3: 

# Plot the variables in the MCA for Dimensions 1 and 3
variables.MCA.vio.DIM.1.3.complete <- fviz_mca_var(res.vio.todo.MCA.complete, 
                                               col.var = "blueviolet",  # Set the color for variables
                                               axes=c(1, 3),             # Dim 1 and Dim 3
                                               choice = "mca.cor",       # Plot using correlation
                                               repel = TRUE,             # Avoid label overlap
                                               ggtheme = theme_minimal())  # Set a minimal theme

# Add a title to the plot
variables.MCA.vio.DIM.1.3.complete  <- variables.MCA.vio.DIM.1.3.complete  + 
  labs(title = "Violence Variables - Prepandemic & Pandemic (Dim 1 vs Dim 3) - Complete Case Analysis")

# Display the plot
print(variables.MCA.vio.DIM.1.3.complete)



# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.1.3.complete.pdf", width = 8, height = 7)



#  Plotting the variables for Dimensions 2 and 3: 

variables.MCA.vio.DIM.2.3.complete <- fviz_mca_var(res.vio.todo.MCA.complete, 
                                               col.var = "blueviolet",  # Set the color for variables
                                               axes=c(2, 3),             # Dim 2 and Dim 3
                                               choice = "mca.cor",       # Plot using correlation
                                               repel = TRUE,             # Avoid label overlap
                                               ggtheme = theme_minimal())  # Set a minimal theme

# Add a title to the plot
variables.MCA.vio.DIM.2.3.complete <- variables.MCA.vio.DIM.2.3.complete + 
  labs(title = "Violence Variables - Prepandemic & Pandemic (Dim 2 vs Dim 3) - Complete Case Analysis")


# Display the plot
print(variables.MCA.vio.DIM.2.3.complete)


# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.1.3.complete.pdf",width = 8, height = 7)


#  Combining the three MCA Plots 

variables.MCA.vio.complete.todo <- variables.MCA.vio.DIM.1.2.complete +
  variables.MCA.vio.DIM.1.3.complete + 
  variables.MCA.vio.DIM.2.3.complete +
  plot_layout(ncol = 1, nrow = 3)

# Display the combined plot
print(variables.MCA.vio.complete.todo)


# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.todo.todo.pdf", width = 9, height = 10)


# 5.  # Plot MCA variable's categories 

# Extract eigenvalues to calculate the percentage of variance explained
eig <- get_eigenvalue(res.vio.todo.MCA.complete)

# Calculate percentages for the first two dimensions
dim1_var <- round(eig[1, "variance.percent"], 1)  # Variance for Dimension 1
dim2_var <- round(eig[2, "variance.percent"], 1)  # Variance for Dimension 2

# Create a data frame of variable coordinates with row names
var_coords <- as.data.frame(res.vio.todo.MCA.complete$var$coord)
var_coords$label <- rownames(var_coords)

# Add a flag for bold labels
var_coords$bold <- ifelse(
  var_coords$label %in% c("Negligence & abandonment", "Sexual violence", "Psychological violence", "Physical violence"),
  TRUE, # Mark these labels for bold formatting
  FALSE # Leave others as normal
)


# Create the base MCA plot WITHOUT default labels
categorias.MCA.vio.todo.complete <- fviz_mca_var(
  res.vio.todo.MCA.complete,
  col.var = "black",              # Color categories by their contribution
  gradient.cols = viridis(3),     # Adjust Colorblind friendly palette
  repel = TRUE,                   # Avoid label overlap for points (but not text)
  ggtheme = theme_minimal(),      # Use a clean and modern theme
  label = "none"                  # Suppress default labels
) +
  labs(
    title = NULL, # Remove the title
    x = paste0("Dimension 1 (", dim1_var, "%)"),  # Add percentage to x-axis label
    y = paste0("Dimension 2 (", dim2_var, "%)")   # Add percentage to y-axis label
  ) +
  theme(
    plot.title = element_text(size = 18),
    axis.title = element_text(size = 16),
    axis.text = element_text(size = 14)
  )

# Add custom labels with geom_text_repel (no doubling now)
categorias.MCA.vio.todo.complete <- categorias.MCA.vio.todo.complete +
  geom_text_repel(
    data = var_coords,
    aes(
      x = `Dim 1`,   # Adjust based on your column names
      y = `Dim 2`,   # Adjust based on your column names
      label = label,
      fontface = ifelse(bold, "bold", "plain") # Bold for flagged labels, plain for others
    ),
    size = 4,              # Adjust text size
    color = "black",        # Set label color
    max.overlaps = Inf,     # Ensure no labels are dropped
    box.padding = 0.5,      # Adjust distance between text and points
    point.padding = 0.5,    # Adjust distance between overlapping text
    segment.color = "grey", # Add connecting lines for repelled labels
    segment.size = 0.3      # Line size for connecting lines
  )


# Display the base plot
print(categorias.MCA.vio.todo.complete)

# Save the base plot
ggsave("categorias.MCA.vio.todo.complete.pdf", plot = categorias.MCA.vio.todo.complete, width = 16, height = 8.5)

# Extract specific viridis colors
viridis_colors <- viridisLite::viridis(5)  # Generate a set of 5 colors
purple_light <- viridis_colors[1]         # Light purple
green <- viridis_colors[4]                # Green
yellow <- viridis_colors[5]               # Yellow


# Add quadrant shading with specific viridis colors
categorias.MCA.vio.todo.complete.quadrant <- categorias.MCA.vio.todo.complete +
  annotate("rect", xmin = -Inf, xmax = 0, ymin = 0 , ymax = Inf, fill = purple_light, alpha = 0.1) +  # Top-left: purple
  annotate("rect", xmin = 0, xmax = Inf, ymin = 0, ymax = Inf, fill  =  yellow, alpha = 0.1) +   # Top-right: Yellow
  annotate("rect", xmin = 0, xmax = Inf, ymin = -Inf, ymax = 0, fill = green, alpha = 0.1)     # Bottom-right: Green

# Display the base plot
print(categorias.MCA.vio.todo.complete.quadrant)

# Save the updated plot
ggsave("categorias.MCA.vio.todo.complete.quadrant.pdf", plot = categorias.MCA.vio.todo.complete.quadrant, width = 16, height = 8.5)




### We are going to create a 3D Graph of the variable categories 

# Extract coordinates for variable categories
mca_var_coords <- res.vio.todo.MCA.complete$var$coord

# Extract eigenvalues to calculate the percentage of variance explained
eig <- get_eigenvalue(res.vio.todo.MCA.complete)

# Calculate percentages for the first three dimensions
dim1_var <- round(eig[1, "variance.percent"], 1)  # Variance for Dimension 1
dim2_var <- round(eig[2, "variance.percent"], 1)  # Variance for Dimension 2
dim3_var <- round(eig[3, "variance.percent"], 1)  # Variance for Dimension 3


# Create a data frame for plotly
df_3d.complete <- data.frame(
  x = mca_var_coords[, 1],        # Coordinates for Dimension 1
  y = mca_var_coords[, 2],        # Coordinates for Dimension 2
  z = mca_var_coords[, 3],        # Coordinates for Dimension 3
  category = rownames(mca_var_coords)  # Variable category names
)


# Create the 3D scatter plot
cat.MCA.vio.todo.complete.3d <- plot_ly(
  data = df_3d.complete,
  x = ~x,
  y = ~y,
  z = ~z,
  text = ~category,                # Hover information (category names)
  type = "scatter3d",
  mode = "markers+text",           # Show points and labels
  marker = list(size = 5, color = 'steelblue'),  # Marker properties
  textposition = 'top center'      # Position of labels
) %>%
  layout(
    title = "3D MCA Plot of Variable Categories - Prepandemic & Pandemic (Complete Case Analysis)", # Add the title
    scene = list(
      xaxis = list(title = paste0("Dimension 1 (", dim1_var, "%)")),  # Add percentage to x-axis label
      yaxis = list(title = paste0("Dimension 2 (", dim2_var, "%)")),  # Add percentage to y-axis label
      zaxis = list(title = paste0("Dimension 3 (", dim3_var, "%)"))   # Add percentage to z-axis label
    )
  )


# Display the graph 

cat.MCA.vio.todo.complete.3d

# Save the 3D plot as an interactive HTML file
saveWidget(cat.MCA.vio.todo.complete.3d, "3D_MCA_Categories_with_Todo.Complete.html", selfcontained = TRUE)


# 6. Plots of Individuals/records Based on the Type of Violence

# The plot shows the results by categories of the variables from cat.MCA.vio.todo.complete, representing individuals based on categories of violence.
# Create confidence ellipses based on the type of violence for individuals.


# Convert the "Tipo_de_violencia3" column into a factor (double quality check)
grp <- as.factor(vio.todo.MCA.complete$Violence)

# Check the levels of the factor to confirm correctness
print(levels(grp))


# Graph

# Plot individuals with only the color legend for "Violence Type"
individuals.todo.vio.complete <- fviz_mca_ind(
  res.vio.todo.MCA.complete, 
  label = "var",              # Add labels for variables
  habillage = grp,            # Color individuals by "Violence Type"
  addEllipses = TRUE,         # Add ellipses for group separation
  ellipse.level = 0.95,       # Confidence level for ellipses
  pointsize = 3,              # Adjust point size for clarity
  ggtheme = theme_minimal()   # Use a clean theme
) +
  labs(
    title = "Reports by Type of Violence - Prepandemic & Pandemic (Complete Case Analysis)", # Add the title 
  ) +
  scale_color_viridis_d(
    option = "D", 
    name = "Violence Type"    # Label the color legend as "Violence Type"
  ) +
  guides(
    shape = "none",           # Explicitly remove the shape legend
    fill = "none",            # Remove any fill legend that may appear
    size = "none",            # Remove any size legend that may appear
    color = guide_legend("Violence Type")  # Retain only the color legend
  ) +
  theme(
    legend.position = "right", # Place legend on the right
    legend.title = element_text(size = 14),  # Adjust legend title font size
    legend.text = element_text(size = 12) # Adjust legend text font size
  )

# Display the plot
print(individuals.todo.vio.complete)


# Save the plot
ggsave("individuals.todo.vio.complete.pdf", plot = individuals.todo.vio.complete, width = 13 , height = 8)



# Now the same graph but in 3D

# Extract 3D coordinates for individuals
coords <- res.vio.todo.MCA.complete$ind$coord  # Coordinates of individuals

# Create a data frame with individual coordinates and grouping
df_3d.complete <- data.frame(
  Dim1 = coords[, 1],  # Dimension 1
  Dim2 = coords[, 2],  # Dimension 2
  Dim3 = coords[, 3],  # Dimension 3
  Group = grp          # Grouping variable (Violence Type)
)

# Create an interactive 3D scatter plot
individuals.todo.3d.complete <- plot_ly(
  data = df_3d.complete,
  x = ~Dim1,
  y = ~Dim2,
  z = ~Dim3,
  color = ~Group,                 # Color individuals by group
  colors = viridis::viridis_pal(option = "D")(length(unique(grp))),  # Colorblind-friendly palette
  type = "scatter3d",
  mode = "markers",               # Display points only
  marker = list(size = 5)         # Adjust marker size
) %>%
  layout(
    title = "Reports by Type of Violence - Prepandemic & Pandemic (Complete Case Analysis)", 
    scene = list(
      xaxis = list(title = paste0("Dimension 1 (", dim1_var, "%)")),  # Add percentage to x-axis label
      yaxis = list(title = paste0("Dimension 2 (", dim2_var, "%)")),  # Add percentage to y-axis label
      zaxis = list(title = paste0("Dimension 3 (", dim3_var, "%)"))   # Add percentage to z-axis label
    ),
    legend = list(
      title = list(text = "Violence Type"),  # Set legend title
      orientation = "h",                     # Horizontal legend
      x = 0.5,                               # Center the legend
      xanchor = "center",
      y = -0.1                               # Place legend below the plot
    )
  )

# Display the interactive 3D plot
individuals.todo.3d.complete 


# Save the 3D plot as an interactive HTML file
saveWidget(individuals.todo.3d.complete , "3D_MCA_individuals_todo.complete.html", selfcontained = TRUE)

#######################################################################
                          The End
#######################################################################
