############################################################
## A. ACM Final Analysis - Prepandemic/Pandemic ##
############################################################

## 1. Set working directory


## 2. Import databases "vio.before",  "vio.pandemic", "vio.todo"

load("vio.todo.Rds")
load("vio.pandemic.Rds")
load("vio.before.Rds")


########### Analysis for the period: Prepandemic - "vio.before"

# 3. Subset variables for the MCA

# Select 10 variables for the analysis
vio.before.MCA <- vio.before %>%
  select(
    sexo, activi.cat, antec.vio, 
    sexo.agre, conv.agre, mecanismo.cat, 
    escena.cat, edad.cat, tipo.viol, relacion
  )


# 4. Description of variables
summary(vio.before.MCA)
names(vio.before.MCA)



# 5. Rename variables for better readability in English
vio.before.MCA <- vio.before.MCA %>%
  rename(
    Sex = sexo,
    Activity = activi.cat,
    History.violence = antec.vio,
    Aggressor.sex = sexo.agre,
    Coliving.aggressor = conv.agre,
    Mechanism = mecanismo.cat,
    Location = escena.cat,
    Life.cycle = edad.cat,
    Violence = tipo.viol,
    Relation = relacion
  )


# 6. Translate levels for categorical variables (where needed)

# A. Activity
vio.before.MCA$Activity <- vio.before.MCA$Activity %>%
  fct_recode(
    "Students and civic leaders" = "Civic leaders and students"
  )

# B. History of violence
vio.before.MCA$History.violence <- vio.before.MCA$History.violence %>%
  fct_recode(
    "Yes" = "Sí"
  )

# C. Coliving aggressor
vio.before.MCA$Coliving.aggressor <- vio.before.MCA$Coliving.aggressor %>%
  fct_recode(
    "Yes" = "Sí"
  )

# D. Violence
vio.before.MCA$Violence <- vio.before.MCA$Violence %>% # Typing error 
  fct_recode(
     "Psychological violence" = "Phsychological violence"
  )

# 7. Validate the structure and levels of all variables
summary(vio.before.MCA)

# 8. Save the new dataset for future use
save(vio.before.MCA,file = "vio.before.MCA.Rds")


######### Multiple Correspondence Analysis - Prepandemic/"Before" #######

#  1. Perform MCA with 3 dimensions
res.vio.before.MCA <- MCA(vio.before.MCA, ncp = 3, graph = FALSE)

#   Save the MCA results for future use
save(res.vio.before.MCA,file = "res.vio.before.MCA.Rds")

# 2. Extract eigenvalues
eig.val <- get_eigenvalue(res.vio.before.MCA)

#   Display the eigenvalues (proportion of variance)
head(eig.val)


# 3. Create scree plot
Screeplot.vio.before <- fviz_screeplot(
  res.vio.before.MCA,
  addlabels = TRUE,                 # Add labels to bars
  ylim = c(0, 12)                   # Set y-axis limits
) +
  geom_hline(
    yintercept = 4.9,               # Retained variability threshold
    linetype = 2,                   # Dashed line
    color = "red"
  ) +
  labs(
    title = "Scree Plot - Prepandemic", 
    x = "Dimensions", 
    y = "Percentage of Variance Explained"
  ) +
  theme_minimal()                   # Use a clean theme

# Display the plot
print(Screeplot.vio.before)

#  Save the scree plot to a PDF file
ggsave("Screeplot.vio.prepandemic.pdf", plot = Screeplot.vio.before, width = 8, height = 6)



# 4. Interpretation - Plots of Variables

#  The plot shows the results of the variables:
#  List of coordinates, cos², and the contribution of each variable:


#  Get the MCA results for variables
var <- get_mca_var(res.vio.before.MCA)
print(var)


# Output Explanation:
# "$coord"   : Coordinates for categories
# "$cos2"    : Cos² for categories (quality of representation)
# "$contrib" : Contributions of categories to the dimensions


#   Plotting the variables for Dimensions 1 and 2:

# Plot the variables in the MCA for Dimensions 1 and 2
variables.MCA.vio.DIM.1.2.before <- fviz_mca_var(res.vio.before.MCA, 
                                                      col.var = "blue",  # Set the color for variables
                                                      choice = "mca.cor",       # Plot using correlation
                                                      repel = TRUE,             # Avoid label overlap
                                                      ggtheme = theme_minimal())  # Set a minimal theme

# Add a title to the plot
variables.MCA.vio.DIM.1.2.before <- variables.MCA.vio.DIM.1.2.before + 
  labs(title = "Violence Variables - Prepandemic (Dim 1 vs Dim 2)")

# Display the plot
print(variables.MCA.vio.DIM.1.2.before)


# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.1.2.before.pdf", width = 8, height = 7)



#  Plotting the variables for Dimensions 1 and 3: 

# Plot the variables in the MCA for Dimensions 1 and 3
variables.MCA.vio.DIM.1.3.before <- fviz_mca_var(res.vio.before.MCA, 
                                                      col.var = "blue",  # Set the color for variables
                                                      axes=c(1, 3),             # Dim 1 and Dim 3
                                                      choice = "mca.cor",       # Plot using correlation
                                                      repel = TRUE,             # Avoid label overlap
                                                      ggtheme = theme_minimal())  # Set a minimal theme

# Add a title to the plot
variables.MCA.vio.DIM.1.3.before <- variables.MCA.vio.DIM.1.3.before + 
  labs(title = "Violence Variables - Prepandemic (Dim 1 vs Dim 3)")

# Display the plot
print(variables.MCA.vio.DIM.1.3.before)



# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.1.3.before.pdf", width = 8, height = 7)



#  Plotting the variables for Dimensions 2 and 3: 

variables.MCA.vio.DIM.2.3.before <- fviz_mca_var(res.vio.before.MCA, 
                                                      col.var = "blue",  # Set the color for variables
                                                      axes=c(2, 3),             # Dim 2 and Dim 3
                                                      choice = "mca.cor",       # Plot using correlation
                                                      repel = TRUE,             # Avoid label overlap
                                                      ggtheme = theme_minimal())  # Set a minimal theme

# Add a title to the plot
variables.MCA.vio.DIM.2.3.before <- variables.MCA.vio.DIM.2.3.before + 
  labs(title = "Violence Variables - Prepandemic (Dim 2 vs Dim 3)")


# Display the plot
print(variables.MCA.vio.DIM.2.3.before)


# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.2.3.before.pdf",width = 8, height = 7)


#  Combining the three MCA Plots 

variables.MCA.vio.before.todo <- variables.MCA.vio.DIM.1.2.before +
  variables.MCA.vio.DIM.1.3.before + 
  variables.MCA.vio.DIM.2.3.before +
  plot_layout(ncol = 1, nrow = 3)

# Display the combined plot
print(variables.MCA.vio.before.todo)


# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.todo.before.pdf", width = 9, height = 10)


# 5.  # Plot MCA variable's categories 

# Extract eigenvalues to calculate the percentage of variance explained
eig <- get_eigenvalue(res.vio.before.MCA)

# Calculate percentages for the first two dimensions
dim1_var <- round(eig[1, "variance.percent"], 1)  # Variance for Dimension 1
dim2_var <- round(eig[2, "variance.percent"], 1)  # Variance for Dimension 2

# Create a data frame of variable coordinates with row names
var_coords <- as.data.frame(res.vio.before.MCA$var$coord)
var_coords$label <- rownames(var_coords)

# Add a flag for bold labels
var_coords$bold <- ifelse(
  var_coords$label %in% c("Negligence & abandonment", "Sexual violence", "Psychological violence", "Physical violence"),
  TRUE,  # Mark these labels for bold formatting
  FALSE  # Leave others as normal
)

# Create the base MCA plot without default labels
categorias.MCA.vio.before.todo <- fviz_mca_var(
  res.vio.before.MCA,
  col.var = "black",              # Color categories by their contribution
  gradient.cols = viridis(3),     # Adjust Colorblind friendly palette
  repel = TRUE,                   # Avoid label overlap (for points, not text)
  ggtheme = theme_minimal(),      # Use a clean and modern theme
  label = "none"                  # Suppress default labels
) +
  labs(
    title = "MCA Categories - Prepandemic", # Title
    x = paste0("Dimension 1 (", dim1_var, "%)"),  # Add percentage to x-axis label
    y = paste0("Dimension 2 (", dim2_var, "%)")   # Add percentage to y-axis label
  ) +
  theme(
    plot.title = element_text(size = 18),
    axis.title = element_text(size = 16),
    axis.text = element_text(size = 14)
  )

# Add all labels with custom formatting using geom_text_repel
categorias.MCA.vio.before.todo <- categorias.MCA.vio.before.todo +
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

# Display the plot
print(categorias.MCA.vio.before.todo)


# Save the base plot
ggsave("categorias.MCA.vio.before.todo.pdf", plot = categorias.MCA.vio.before.todo, width = 16, height = 8.5)

# Extract specific viridis colors
viridis_colors <- viridisLite::viridis(5)  # Generate a set of 5 colors
purple_light <- viridis_colors[1]         # Light purple
green <- viridis_colors[4]                # Green
yellow <- viridis_colors[5]               # Yellow


# Add quadrant shading with specific viridis colors
categorias.MCA.vio.before.todo.quadrant <- categorias.MCA.vio.before.todo +
  annotate("rect", xmin = -Inf, xmax = 0, ymin = 0, ymax = Inf, fill = purple_light, alpha = 0.1) + # Top-left: Purple
  annotate("rect", xmin = 0, xmax = Inf, ymin = 0, ymax = Inf, fill = green, alpha = 0.1) +        # Top-right: Green
  annotate("rect", xmin = 0, xmax = Inf, ymin = -Inf, ymax = 0, fill = yellow, alpha = 0.1)        # Bottom-right: Yellow

# Display the base plot
print(categorias.MCA.vio.before.todo.quadrant)

# Save the updated plot
ggsave("categorias.MCA.vio.before.todo.quadrant.pdf", plot = categorias.MCA.vio.before.todo.quadrant, width = 16, height = 8.5)


### We are going to create a 3D Graph of the variable categories 

# Extract coordinates for variable categories
mca_var_coords <- res.vio.before.MCA$var$coord

# Extract eigenvalues to calculate the percentage of variance explained
eig <- get_eigenvalue(res.vio.before.MCA)

# Calculate percentages for the first three dimensions
dim1_var <- round(eig[1, "variance.percent"], 1)  # Variance for Dimension 1
dim2_var <- round(eig[2, "variance.percent"], 1)  # Variance for Dimension 2
dim3_var <- round(eig[3, "variance.percent"], 1)  # Variance for Dimension 3


# Create a data frame for plotly
df_3d <- data.frame(
  x = mca_var_coords[, 1],        # Coordinates for Dimension 1
  y = mca_var_coords[, 2],        # Coordinates for Dimension 2
  z = mca_var_coords[, 3],        # Coordinates for Dimension 3
  category = rownames(mca_var_coords)  # Variable category names
)


# Create the 3D scatter plot
cat.MCA.vio.before.3d <- plot_ly(
  data = df_3d,
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
    title = "3D MCA Plot of Variable Categories - Prepandemic",
    scene = list(
      xaxis = list(title = paste0("Dimension 1 (", dim1_var, "%)")),  # Add percentage to x-axis label
      yaxis = list(title = paste0("Dimension 2 (", dim2_var, "%)")),  # Add percentage to y-axis label
      zaxis = list(title = paste0("Dimension 3 (", dim3_var, "%)"))   # Add percentage to z-axis label
    )
  )


# Display the graph 

cat.MCA.vio.before.3d

# Save the 3D plot as an interactive HTML file
saveWidget(cat.MCA.vio.before.3d, "3D_MCA_Categories_with_Quadrants.html", selfcontained = TRUE)



# 6. Plots of Individuals/records Based on the Type of Violence

# The plot shows the results by categories of the variables from cat.MCA.vio.before, representing individuals based on categories of violence.
# Create confidence ellipses based on the type of violence for individuals.


# Convert the "Tipo_de_violencia3" column into a factor (double quality check)
grp <- as.factor(vio.before.MCA$Violence)

# Check the levels of the factor to confirm correctness
print(levels(grp))


# Graph

# Plot individuals with only the color legend for "Violence Type"
individuals.before.vio <- fviz_mca_ind(
  res.vio.before.MCA, 
  label = "var",              # Add labels for variables
  habillage = grp,            # Color individuals by "Violence Type"
  addEllipses = TRUE,         # Add ellipses for group separation
  ellipse.level = 0.95,       # Confidence level for ellipses
  pointsize = 3,              # Adjust point size for clarity
  ggtheme = theme_minimal()   # Use a clean theme
) +
  labs(
    title = "Reports by Type of Violence - Prepandemic"
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
print(individuals.before.vio)


# Save the plot
ggsave("individuals.before.vio.pdf", plot = individuals.before.vio, width = 13 , height = 8)



# Now the same graph but in 3D

# Extract 3D coordinates for individuals
coords <- res.vio.before.MCA$ind$coord  # Coordinates of individuals

# Create a data frame with individual coordinates and grouping
df_3d <- data.frame(
  Dim1 = coords[, 1],  # Dimension 1
  Dim2 = coords[, 2],  # Dimension 2
  Dim3 = coords[, 3],  # Dimension 3
  Group = grp          # Grouping variable (Violence Type)
)

# Create an interactive 3D scatter plot
individuals.prepandemic.3d <- plot_ly(
  data = df_3d,
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
    title = "3D MCA Plot of Individuals - Prepandemic",
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
individuals.prepandemic.3d


# Save the 3D plot as an interactive HTML file
saveWidget(individuals.prepandemic.3d, "3D_MCA_individuals_prepandemic.html", selfcontained = TRUE)



#################################################

########### Analysis for the period: Pandemic

#################################################


# 3. Subset variables for the MCA

# Select 10 variables for the analysis
vio.pandemic.MCA <- vio.pandemic %>%
  select(
    sexo, activi.cat, antec.vio, 
    sexo.agre, conv.agre, mecanismo.cat, 
    escena.cat, edad.cat, tipo.viol, relacion
  )


# 4. Description of variables
summary(vio.pandemic.MCA)
names(vio.pandemic.MCA)



# 5. Rename variables for better readability in English
vio.pandemic.MCA <- vio.pandemic.MCA %>%
  rename(
    Sex = sexo,
    Activity = activi.cat,
    History.violence = antec.vio,
    Aggressor.sex = sexo.agre,
    Coliving.aggressor = conv.agre,
    Mechanism = mecanismo.cat,
    Location = escena.cat,
    Life.cycle = edad.cat,
    Violence = tipo.viol,
    Relation = relacion
  )


# 6. Translate levels for categorical variables (where needed)

# A. Activity
vio.pandemic.MCA$Activity <- vio.pandemic.MCA$Activity %>%
  fct_recode(
    "Students and civic leaders" = "Civic leaders and students"
  )

# B. History of violence
vio.pandemic.MCA$History.violence <- vio.pandemic.MCA$History.violence %>%
  fct_recode(
    "Yes" = "Sí"
  )

# C. Coliving aggressor
vio.pandemic.MCA$Coliving.aggressor <- vio.pandemic.MCA$Coliving.aggressor %>%
  fct_recode(
    "Yes" = "Sí"
  )

# D. Violence
vio.pandemic.MCA$Violence <- vio.pandemic.MCA$Violence %>% # Typing error 
  fct_recode(
    "Psychological violence" = "Phsychological violence"
  )


# 7. Validate the structure and levels of all variables
summary(vio.pandemic.MCA)


# 8. Save the new dataset for future use
save(vio.pandemic.MCA, file = "vio.pandemic.MCA.Rds")


######### Multiple Correspondence Analysis - Pandemic #######

#  1. Perform MCA with 3 dimensions
res.vio.pandemic.MCA <- MCA(vio.pandemic.MCA, ncp = 3, graph = FALSE)

#   Save the MCA results for future use
save(res.vio.pandemic.MCA, file = "res.vio.pandemic.MCA.Rds")

# 2. Extract eigenvalues
eig.val <- get_eigenvalue(res.vio.pandemic.MCA)

#   Display the eigenvalues (proportion of variance)
head(eig.val)


# 3. Create scree plot
Screeplot.vio.pandemic <- fviz_screeplot(
  res.vio.pandemic.MCA,
  addlabels = TRUE,                 # Add labels to bars
  ylim = c(0, 12)                   # Set y-axis limits
) +
  geom_hline(
    yintercept = 4.9,               # Retained variability threshold
    linetype = 2,                   # Dashed line
    color = "red"
  ) +
  labs(
    title = "Scree Plot - Pandemic", 
    x = "Dimensions", 
    y = "Percentage of Variance Explained"
  ) +
  theme_minimal()                   # Use a clean theme

# Display the plot
print(Screeplot.vio.pandemic)

#  Save the scree plot to a PDF file
ggsave("Screeplot.vio.pandemic.pdf", plot = Screeplot.vio.pandemic, width = 8, height = 6)



# 4. Interpretation - Plots of Variables

#  The plot shows the results of the variables:
#  List of coordinates, cos², and the contribution of each variable:


#  Get the MCA results for variables
var <- get_mca_var(res.vio.pandemic.MCA)
print(var)


# Output Explanation:
# "$coord"   : Coordinates for categories
# "$cos2"    : Cos² for categories (quality of representation)
# "$contrib" : Contributions of categories to the dimensions


#   Plotting the variables for Dimensions 1 and 2:

# Plot the variables in the MCA for Dimensions 1 and 2
variables.MCA.vio.DIM.1.2.pandemic <- fviz_mca_var(res.vio.pandemic.MCA, 
                                                   col.var= "brown1", # Set the color for variables
                                                   choice = "mca.cor",       # Plot using correlation
                                                   repel = TRUE,             # Avoid label overlap
                                                   ggtheme = theme_minimal())  # Set a minimal theme

# Add a title to the plot
variables.MCA.vio.DIM.1.2.pandemic <- variables.MCA.vio.DIM.1.2.pandemic + 
  labs(title = "Violence Variables - Pandemic (Dim 1 vs Dim 2)")

# Display the plot
print(variables.MCA.vio.DIM.1.2.pandemic)


# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.1.2.pandemic.pdf", width = 8, height = 7)



#  Plotting the variables for Dimensions 1 and 3: 

# Plot the variables in the MCA for Dimensions 1 and 3
variables.MCA.vio.DIM.1.3.pandemic <- fviz_mca_var(res.vio.pandemic.MCA, 
                                                   col.var = "brown1",  # Set the color for variables
                                                   axes=c(1, 3),             # Dim 1 and Dim 3
                                                   choice = "mca.cor",       # Plot using correlation
                                                   repel = TRUE,             # Avoid label overlap
                                                   ggtheme = theme_minimal())  # Set a minimal theme

# Add a title to the plot
variables.MCA.vio.DIM.1.3.pandemic <- variables.MCA.vio.DIM.1.3.pandemic + 
  labs(title = "Violence Variables - Pandemic (Dim 1 vs Dim 3)")

# Display the plot
print(variables.MCA.vio.DIM.1.3.pandemic)



# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.1.3.pandemic.pdf", width = 8, height = 7)



#  Plotting the variables for Dimensions 2 and 3: 

variables.MCA.vio.DIM.2.3.pandemic <- fviz_mca_var(res.vio.pandemic.MCA, 
                                                   col.var = "brown1",  # Set the color for variables
                                                   axes=c(2, 3),             # Dim 2 and Dim 3
                                                   choice = "mca.cor",       # Plot using correlation
                                                   repel = TRUE,             # Avoid label overlap
                                                   ggtheme = theme_minimal())  # Set a minimal theme

# Add a title to the plot
variables.MCA.vio.DIM.2.3.pandemic <- variables.MCA.vio.DIM.2.3.pandemic + 
  labs(title = "Violence Variables - Pandemic (Dim 2 vs Dim 3)")


# Display the plot
print(variables.MCA.vio.DIM.2.3.pandemic)


# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.2.3.pandemic.pdf",width = 8, height = 7)



#  Combining the three MCA Plots 

variables.MCA.vio.pandemic.todo <- variables.MCA.vio.DIM.1.2.pandemic +
  variables.MCA.vio.DIM.1.3.pandemic + 
  variables.MCA.vio.DIM.2.3.pandemic +
  plot_layout(ncol = 1, nrow = 3)

# Display the combined plot
print(variables.MCA.vio.pandemic.todo)


# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.todo.pandemic.pdf", width = 9, height = 10)


# 5.  # Plot MCA variable's categories 

# Extract eigenvalues to calculate the percentage of variance explained
eig <- get_eigenvalue(res.vio.pandemic.MCA)

# Calculate percentages for the first two dimensions
dim1_var <- round(eig[1, "variance.percent"], 1)  # Variance for Dimension 1
dim2_var <- round(eig[2, "variance.percent"], 1)  # Variance for Dimension 2

# Create a data frame of variable coordinates with row names
var_coords <- as.data.frame(res.vio.pandemic.MCA$var$coord)  # Use the correct MCA object here
var_coords$label <- rownames(var_coords)

# Add a flag for bold labels
var_coords$bold <- ifelse(
  var_coords$label %in% c("Negligence & abandonment", "Sexual violence", "Psychological violence", "Physical violence"),
  TRUE,  # Mark these labels for bold formatting
  FALSE  # Leave others as normal
)

# Create the base MCA plot WITHOUT default labels
categorias.MCA.vio.pandemic.todo <- fviz_mca_var(
  res.vio.pandemic.MCA,
  col.var = "black",              # Color categories by their contribution
  gradient.cols = viridis(3),     # Adjust Colorblind friendly palette
  repel = TRUE,                   # Avoid label overlap for points (but not text)
  ggtheme = theme_minimal(),      # Use a clean and modern theme
  label = "none"                  # Suppress default labels
) +
  labs(
    title = "MCA Categories - Pandemic",
    x = paste0("Dimension 1 (", dim1_var, "%)"),  # Add percentage to x-axis label
    y = paste0("Dimension 2 (", dim2_var, "%)")   # Add percentage to y-axis label
  ) +
  theme(
    plot.title = element_text(size = 18),
    axis.title = element_text(size = 16),
    axis.text = element_text(size = 14)
  )

# Add custom labels with geom_text_repel (no doubling now)
categorias.MCA.vio.pandemic.todo <- categorias.MCA.vio.pandemic.todo +
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

# Display the final plot
print(categorias.MCA.vio.pandemic.todo)

# Save the base plot
ggsave("categorias.MCA.vio.pandemic.todo.pdf", plot = categorias.MCA.vio.pandemic.todo, width = 16, height = 8.5)


# Extract specific viridis colors
viridis_colors <- viridisLite::viridis(5)  # Generate a set of 5 colors
purple_light <- viridis_colors[1]         # Light purple
green <- viridis_colors[4]                # Green
yellow <- viridis_colors[5]               # Yellow


# Add quadrant shading with specific viridis colors
categorias.MCA.vio.pandemic.todo.quadrant <- categorias.MCA.vio.pandemic.todo +
  annotate("rect", xmin = -Inf, xmax = 0, ymin = -Inf, ymax = 0, fill = purple_light, alpha = 0.1) +  # Bottom-left: purple
  annotate("rect", xmin = 0, xmax = Inf, ymin = 0, ymax = Inf, fill  =  yellow, alpha = 0.1) +   # Top-right: Yellow
  annotate("rect", xmin = 0, xmax = Inf, ymin = -Inf, ymax = 0, fill = green, alpha = 0.1)     # Bottom-right: green

# Display the base plot
print(categorias.MCA.vio.pandemic.todo.quadrant)

# Save the updated plot
ggsave("categorias.MCA.vio.pandemic.todo.quadrant.pdf", plot = categorias.MCA.vio.pandemic.todo.quadrant, width = 16, height = 8.5)


### We are going to create a 3D Graph of the variable categories 

# Extract coordinates for variable categories
mca_var_coords <- res.vio.pandemic.MCA$var$coord

# Extract eigenvalues to calculate the percentage of variance explained
eig <- get_eigenvalue(res.vio.pandemic.MCA)

# Calculate percentages for the first three dimensions
dim1_var <- round(eig[1, "variance.percent"], 1)  # Variance for Dimension 1
dim2_var <- round(eig[2, "variance.percent"], 1)  # Variance for Dimension 2
dim3_var <- round(eig[3, "variance.percent"], 1)  # Variance for Dimension 3


# Create a data frame for plotly
df_3d <- data.frame(
  x = mca_var_coords[, 1],        # Coordinates for Dimension 1
  y = mca_var_coords[, 2],        # Coordinates for Dimension 2
  z = mca_var_coords[, 3],        # Coordinates for Dimension 3
  category = rownames(mca_var_coords)  # Variable category names
)


# Create the 3D scatter plot
cat.MCA.vio.pandemic.3d <- plot_ly(
  data = df_3d,
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
    title = "3D MCA Plot of Variable Categories - Pandemic",
    scene = list(
      xaxis = list(title = paste0("Dimension 1 (", dim1_var, "%)")),  # Add percentage to x-axis label
      yaxis = list(title = paste0("Dimension 2 (", dim2_var, "%)")),  # Add percentage to y-axis label
      zaxis = list(title = paste0("Dimension 3 (", dim3_var, "%)"))   # Add percentage to z-axis label
    )
  )


# Display the graph 

cat.MCA.vio.pandemic.3d

# Save the 3D plot as an interactive HTML file
saveWidget(cat.MCA.vio.pandemic.3d, "3D_MCA_Categories_with_Pandemic.html", selfcontained = TRUE)



# 6. Plots of Individuals/records Based on the Type of Violence

# The plot shows the results by categories of the variables from cat.MCA.vio.pandemic, representing individuals based on categories of violence.
# Create confidence ellipses based on the type of violence for individuals.


# Convert the "Tipo_de_violencia3" column into a factor (double quality check)
grp <- as.factor(vio.pandemic.MCA$Violence)

# Check the levels of the factor to confirm correctness
print(levels(grp))


# Graph

# Plot individuals with only the color legend for "Violence Type"
individuals.pandemic.vio <- fviz_mca_ind(
  res.vio.pandemic.MCA, 
  label = "var",              # Add labels for variables
  habillage = grp,            # Color individuals by "Violence Type"
  addEllipses = TRUE,         # Add ellipses for group separation
  ellipse.level = 0.95,       # Confidence level for ellipses
  pointsize = 3,              # Adjust point size for clarity
  ggtheme = theme_minimal()   # Use a clean theme
) +
  labs(
    title = "Reports by Type of Violence - Pandemic"
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
print(individuals.pandemic.vio)


# Save the plot
ggsave("individuals.pandemic.vio.pdf", plot = individuals.pandemic.vio, width = 13 , height = 8)



# Now the same graph but in 3D

# Extract 3D coordinates for individuals
coords <- res.vio.pandemic.MCA$ind$coord  # Coordinates of individuals

# Create a data frame with individual coordinates and grouping
df_3d <- data.frame(
  Dim1 = coords[, 1],  # Dimension 1
  Dim2 = coords[, 2],  # Dimension 2
  Dim3 = coords[, 3],  # Dimension 3
  Group = grp          # Grouping variable (Violence Type)
)

# Create an interactive 3D scatter plot
individuals.pandemic.3d <- plot_ly(
  data = df_3d,
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
    title = "3D MCA Plot of Individuals - Pandemic",
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
individuals.pandemic.3d


# Save the 3D plot as an interactive HTML file
saveWidget(individuals.pandemic.3d, "3D_MCA_individuals_pandemic.html", selfcontained = TRUE)



##################################################################################################################
# Now we run the same analysis for the dataframe containing all registries : Prepandemic & Pandemic : "vio.todo" #
##################################################################################################################


# 3. Subset variables for the MCA

# Select 11 variables for the analysis (we add the variable: periodo)
vio.todo.MCA <- vio.todo %>%
  select(
    sexo, activi.cat, antec.vio, 
    sexo.agre, conv.agre, mecanismo.cat, 
    escena.cat, edad.cat, tipo.viol, relacion, periodo, 
  )


# 4. Description of variables
summary(vio.todo.MCA)
names(vio.todo.MCA)



# 5. Rename variables for better readability in English
vio.todo.MCA <- vio.todo.MCA %>%
  rename(
    Sex = sexo,
    Activity = activi.cat,
    History.violence = antec.vio,
    Aggressor.sex = sexo.agre,
    Coliving.aggressor = conv.agre,
    Mechanism = mecanismo.cat,
    Location = escena.cat,
    Life.cycle = edad.cat,
    Violence = tipo.viol,
    Relation = relacion, 
    Period = periodo,
  )


# 6. Translate levels for categorical variables (where needed)

# A. Activity
vio.todo.MCA$Activity <- vio.todo.MCA$Activity %>%
  fct_recode(
    "Students and civic leaders" = "Civic leaders and students"
  )

# B. History of violence
vio.todo.MCA$History.violence <- vio.todo.MCA$History.violence %>%
  fct_recode(
    "Yes" = "Sí"
  )

# C. Coliving aggressor
vio.todo.MCA$Coliving.aggressor <- vio.todo.MCA$Coliving.aggressor %>%
  fct_recode(
    "Yes" = "Sí"
  )

# D. Violence
vio.todo.MCA$Violence <- vio.todo.MCA$Violence %>% # Typing error 
  fct_recode(
    "Psychological violence" = "Phsychological violence"
  )



# 7. Validate the structure and levels of all variables
summary(vio.todo.MCA)

# 8. Save the new dataset for future use
save(vio.todo.MCA, file = "vio.todo.MCA.Rds")



######### Multiple Correspondence Analysis - Todo #######

#  1. Perform MCA with 3 dimensions
res.vio.todo.MCA <- MCA(vio.todo.MCA, ncp = 3, graph = FALSE)

#   Save the MCA results for future use
save(res.vio.todo.MCA, file = "res.vio.todo.mca.Rds")

# 2. Extract eigenvalues
eig.val <- get_eigenvalue(res.vio.todo.MCA)

#   Display the eigenvalues (proportion of variance)
head(eig.val)


# 3. Create scree plot
Screeplot.vio.todo <- fviz_screeplot(
  res.vio.todo.MCA,
  addlabels = TRUE,                 # Add labels to bars
  ylim = c(0, 12)                   # Set y-axis limits
) +
  geom_hline(
    yintercept = 4.9,               # Retained variability threshold
    linetype = 2,                   # Dashed line
    color = "red"
  ) +
  labs(
    title = "Scree Plot - Prepandemic & Pandemic", # Title 
    x = "Dimensions", 
    y = "Percentage of Variance Explained"
  ) +
  theme_minimal()                   # Use a clean theme

# Display the plot
print(Screeplot.vio.todo)

#  Save the scree plot to a PDF file
ggsave("Screeplot.vio.todo.pdf", plot = Screeplot.vio.todo, width = 8, height = 6)



# 4. Interpretation - Plots of Variables

#  The plot shows the results of the variables:
#  List of coordinates, cos², and the contribution of each variable:


#  Get the MCA results for variables
var <- get_mca_var(res.vio.todo.MCA)
print(var)


# Output Explanation:
# "$coord"   : Coordinates for categories
# "$cos2"    : Cos² for categories (quality of representation)
# "$contrib" : Contributions of categories to the dimensions


#   Plotting the variables for Dimensions 1 and 2:

# Plot the variables in the MCA for Dimensions 1 and 2
variables.MCA.vio.DIM.1.2.todo <- fviz_mca_var(res.vio.todo.MCA, 
                                               col.var= "green4", # Set the color for variables
                                               choice = "mca.cor",       # Plot using correlation
                                               repel = TRUE,             # Avoid label overlap
                                               ggtheme = theme_minimal())  # Set a minimal theme

# Add a title to the plot
variables.MCA.vio.DIM.1.2.todo <- variables.MCA.vio.DIM.1.2.todo + 
  labs(title = "Violence Variables - Prepandemic & Pandemic (Dim 1 vs Dim 2)")

# Display the plot
print(variables.MCA.vio.DIM.1.2.todo)


# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.1.2.todo.pdf", width = 8, height = 7)



#  Plotting the variables for Dimensions 1 and 3: 

# Plot the variables in the MCA for Dimensions 1 and 3
variables.MCA.vio.DIM.1.3.todo <- fviz_mca_var(res.vio.todo.MCA, 
                                               col.var = "green4",  # Set the color for variables
                                               axes=c(1, 3),             # Dim 1 and Dim 3
                                               choice = "mca.cor",       # Plot using correlation
                                               repel = TRUE,             # Avoid label overlap
                                               ggtheme = theme_minimal())  # Set a minimal theme

# Add a title to the plot
variables.MCA.vio.DIM.1.3.todo <- variables.MCA.vio.DIM.1.3.todo + 
  labs(title = "Violence Variables - Prepandemic & Pandemic (Dim 1 vs Dim 3)")

# Display the plot
print(variables.MCA.vio.DIM.1.3.todo)



# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.1.3.todo.pdf", width = 8, height = 7)



#  Plotting the variables for Dimensions 2 and 3: 

variables.MCA.vio.DIM.2.3.todo <- fviz_mca_var(res.vio.todo.MCA, 
                                               col.var = "green4",  # Set the color for variables
                                               axes=c(2, 3),             # Dim 2 and Dim 3
                                               choice = "mca.cor",       # Plot using correlation
                                               repel = TRUE,             # Avoid label overlap
                                               ggtheme = theme_minimal())  # Set a minimal theme

# Add a title to the plot
variables.MCA.vio.DIM.2.3.todo <- variables.MCA.vio.DIM.2.3.todo + 
  labs(title = "Violence Variables - Todo (Dim 2 vs Dim 3)")


# Display the plot
print(variables.MCA.vio.DIM.2.3.todo)


# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.2.3.todo.pdf",width = 8, height = 7)



#  Combining the three MCA Plots 

variables.MCA.vio.todo.todo <- variables.MCA.vio.DIM.1.2.todo +
  variables.MCA.vio.DIM.1.3.todo + 
  variables.MCA.vio.DIM.2.3.todo +
  plot_layout(ncol = 1, nrow = 3)

# Display the combined plot
print(variables.MCA.vio.todo.todo)


# Save the plot as a PDF
ggsave("variables.MCA.vio.DIM.todo.todo.pdf", width = 9, height = 10)


# 5.  # Plot MCA variable's categories 

# Extract eigenvalues to calculate the percentage of variance explained
eig <- get_eigenvalue(res.vio.todo.MCA)

# Calculate percentages for the first two dimensions
dim1_var <- round(eig[1, "variance.percent"], 1)  # Variance for Dimension 1
dim2_var <- round(eig[2, "variance.percent"], 1)  # Variance for Dimension 2

# Create a data frame of variable coordinates with row names
var_coords <- as.data.frame(res.vio.todo.MCA$var$coord)
var_coords$label <- rownames(var_coords)

# Add a flag for bold labels
var_coords$bold <- ifelse(
  var_coords$label %in% c("Negligence & abandonment", "Sexual violence", "Psychological violence", "Physical violence"),
  TRUE, # Mark these labels for bold formatting
  FALSE # Leave others as normal
)


# Create the base MCA plot WITHOUT default labels
categorias.MCA.vio.todo.todo <- fviz_mca_var(
  res.vio.todo.MCA,
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
categorias.MCA.vio.todo.todo <- categorias.MCA.vio.todo.todo +
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
print(categorias.MCA.vio.todo.todo)

# Save the base plot
ggsave("categorias.MCA.vio.todo.todo.pdf", plot = categorias.MCA.vio.todo.todo, width = 16, height = 8.5)

# Extract specific viridis colors
viridis_colors <- viridisLite::viridis(5)  # Generate a set of 5 colors
purple_light <- viridis_colors[1]         # Light purple
green <- viridis_colors[4]                # Green
yellow <- viridis_colors[5]               # Yellow


# Add quadrant shading with specific viridis colors
categorias.MCA.vio.todo.todo.quadrant <- categorias.MCA.vio.todo.todo +
  annotate("rect", xmin = -Inf, xmax = 0, ymin = 0 , ymax = Inf, fill = purple_light, alpha = 0.1) +  # Top-left: purple
  annotate("rect", xmin = 0, xmax = Inf, ymin = 0, ymax = Inf, fill  =  green, alpha = 0.1) +   # Top-right: Green
  annotate("rect", xmin = 0, xmax = Inf, ymin = -Inf, ymax = 0, fill = yellow, alpha = 0.1)     # Bottom-right: Yellow

# Display the base plot
print(categorias.MCA.vio.todo.todo.quadrant)

# Save the updated plot
ggsave("categorias.MCA.vio.todo.todo.quadrant.pdf", plot = categorias.MCA.vio.todo.todo.quadrant, width = 16, height = 8.5)



### We are going to create a 3D Graph of the variable categories 

# Extract coordinates for variable categories
mca_var_coords <- res.vio.todo.MCA$var$coord

# Extract eigenvalues to calculate the percentage of variance explained
eig <- get_eigenvalue(res.vio.todo.MCA)

# Calculate percentages for the first three dimensions
dim1_var <- round(eig[1, "variance.percent"], 1)  # Variance for Dimension 1
dim2_var <- round(eig[2, "variance.percent"], 1)  # Variance for Dimension 2
dim3_var <- round(eig[3, "variance.percent"], 1)  # Variance for Dimension 3


# Create a data frame for plotly
df_3d <- data.frame(
  x = mca_var_coords[, 1],        # Coordinates for Dimension 1
  y = mca_var_coords[, 2],        # Coordinates for Dimension 2
  z = mca_var_coords[, 3],        # Coordinates for Dimension 3
  category = rownames(mca_var_coords)  # Variable category names
)


# Create the 3D scatter plot
cat.MCA.vio.todo.3d <- plot_ly(
  data = df_3d,
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
    title = "3D MCA Plot of Variable Categories - Prepandemic & Pandemic", # Add the title
    scene = list(
      xaxis = list(title = paste0("Dimension 1 (", dim1_var, "%)")),  # Add percentage to x-axis label
      yaxis = list(title = paste0("Dimension 2 (", dim2_var, "%)")),  # Add percentage to y-axis label
      zaxis = list(title = paste0("Dimension 3 (", dim3_var, "%)"))   # Add percentage to z-axis label
    )
  )


# Display the graph 

cat.MCA.vio.todo.3d

# Save the 3D plot as an interactive HTML file
saveWidget(cat.MCA.vio.todo.3d, "3D_MCA_Categories_with_Todo.html", selfcontained = TRUE)



# 6. Plots of Individuals/records Based on the Type of Violence

# The plot shows the results by categories of the variables from cat.MCA.vio.todo, representing individuals based on categories of violence.
# Create confidence ellipses based on the type of violence for individuals.


# Convert the "Tipo_de_violencia3" column into a factor (double quality check)
grp <- as.factor(vio.todo.MCA$Violence)

# Check the levels of the factor to confirm correctness
print(levels(grp))


# Graph

# Plot individuals with only the color legend for "Violence Type"
individuals.todo.vio <- fviz_mca_ind(
  res.vio.todo.MCA, 
  label = "var",              # Add labels for variables
  habillage = grp,            # Color individuals by "Violence Type"
  addEllipses = TRUE,         # Add ellipses for group separation
  ellipse.level = 0.95,       # Confidence level for ellipses
  pointsize = 3,              # Adjust point size for clarity
  ggtheme = theme_minimal()   # Use a clean theme
) +
  labs(
    title = NULL, # Remove the title 
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
print(individuals.todo.vio)


# Save the plot
ggsave("individuals.todo.vio.pdf", plot = individuals.todo.vio, width = 13 , height = 8)


# Now the same graph but in 3D

# Extract 3D coordinates for individuals
coords <- res.vio.todo.MCA$ind$coord  # Coordinates of individuals

# Create a data frame with individual coordinates and grouping
df_3d <- data.frame(
  Dim1 = coords[, 1],  # Dimension 1
  Dim2 = coords[, 2],  # Dimension 2
  Dim3 = coords[, 3],  # Dimension 3
  Group = grp          # Grouping variable (Violence Type)
)

# Create an interactive 3D scatter plot
individuals.todo.3d <- plot_ly(
  data = df_3d,
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
    title = "Reports by Type of Violence - Prepandemic & Pandemic", 
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
individuals.todo.3d


# Save the 3D plot as an interactive HTML file
saveWidget(individuals.todo.3d, "3D_MCA_individuals_todo.html", selfcontained = TRUE)

#######################################################################
                                  The End
#######################################################################


