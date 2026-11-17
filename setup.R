
# ============================================================
# BowlingScores3 - Project Setup
# Purpose: Create project directory structure and initialize
#          renv package management.
# ============================================================



# 1. Create directory structure ------------------------------

directories <- c(
  "R",
  "modules",
  "data",
  "www",
  "www/images",
  "www/css",
  "tests",
  "tests/testthat",
  "docs"
)

for (dir in directories) {
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
}

# 2. Create starter files ------------------------------------

files <- c(
  "global.R",
  "ui.R",
  "server.R",
  ".gitignore",
  "README.md",
  "data/.gitkeep",
  "docs/development_log.md"
)

# Only create files if they don't already exist
for (file in files) {
  if (!file.exists(file)) {
    file.create(file)
  }
}

# 3. Create global.R -----------------------------------------

global_code <- '
# BowlingScores3
# Global configuration and package loading

library(shiny)
library(bslib)
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(DT)

# Source application functions
# source("R/data_processing.R")
# source("R/score_analytics.R")

options(
  shiny.maxRequestSize = 20 * 1024^2
)
'

writeLines(global_code, "global.R")

# 4. Create ui.R ---------------------------------------------

ui_code <- '
# BowlingScores3
# User Interface

ui <- page_sidebar(

  theme = bs_theme(
    bootswatch = "darkly",
    primary = "#21869B",
    base_font = font_google("Lato")
  ),

  title = "Bowling Scores 3",

  sidebar = sidebar(
    h4("Bowling Filters"),
    p("Filters coming soon.")
  ),

  tabsetPanel(

    tabPanel(
      "Dashboard",
      h3("Bowling Performance Dashboard")
    ),

    tabPanel(
      "Scores",
      h3("Bowling Scores")
    ),

    tabPanel(
      "AI Analyst",
      h3("Bowling AI Analyst")
    )

  )
)
'

writeLines(ui_code, "ui.R")

# 5. Create server.R -----------------------------------------

server_code <- '
# BowlingScores3
# Server Logic

server <- function(input, output, session) {

  # Initialize application modules here

}
'

writeLines(server_code, "server.R")

# 6. Create .gitignore ---------------------------------------

gitignore_code <- '
# R files
.Rhistory
.RData
.Ruserdata
.Rproj.user/

# Local bowling data
data/*
!data/.gitkeep

# Credentials
.Renviron
.env
.env.*
!.env.example
secrets/

# renv
renv/library/
renv/staging/
renv/python/

# Deployment
rsconnect/

# OS files
.DS_Store
Thumbs.db

# Temporary files
*.tmp
*.log
'

writeLines(gitignore_code, ".gitignore")

# 7. Initialize renv -----------------------------------------

if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}

renv::init(bare = TRUE)

# Install initial application dependencies
packages <- c(
  "shiny",
  "bslib",
  "dplyr",
  "tidyr",
  "ggplot2",
  "plotly",
  "DT",
  "lubridate",
  "shinychat",
  "ellmer",
  "testthat"
)

install.packages(packages)

# Record package environment
renv::snapshot()

# 8. Create project documentation ---------------------------

log_file <- "docs/development_log.md"

if (file.info(log_file)$size == 0) {
  writeLines(
    c(
      "# BowlingScores3 Development Log",
      "",
      "## Project Initialization",
      "",
      paste("Initialized:", Sys.Date()),
      "",
      "Project structure created and renv initialized."
    ),
    log_file
  )
}

# 9. Display project structure ------------------------------

cat("\nBowlingScores3 project initialized!\n\n")

cat("Project location:", getwd(), "\n\n")

cat("Directories:\n")
print(directories)

cat("\nInitial packages installed and renv snapshot recorded.\n")
