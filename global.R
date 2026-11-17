
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

