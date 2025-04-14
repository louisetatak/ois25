# visualize/visualize.R

# Installer les packages nécessaires si non installés
if (!requireNamespace("plotly", quietly = TRUE)) {
  install.packages("plotly")
}

# Charger la bibliothèque
library(plotly)

# Générer des données aléatoires pour une visualisation 3D
set.seed(123)
n <- 200
data <- data.frame(
  x = rnorm(n),
  y = rnorm(n),
  z = rnorm(n),
  group = sample(LETTERS[1:3], n, replace = TRUE)
)

# Créer une visualisation interactive 3D avec plotly
fig <- plot_ly(
  data, x = ~x, y = ~y, z = ~z,
  color = ~group,
  colors = c('#636EFA', '#EF553B', '#00CC96')
) %>%
  add_markers(size = 2) %>%
  layout(
    title = "Nuage de points 3D interactif",
    scene = list(
      xaxis = list(title = "X"),
      yaxis = list(title = "Y"),
      zaxis = list(title = "Z")
    )
  )

# Afficher la figure dans le navigateur
fig