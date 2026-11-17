
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

