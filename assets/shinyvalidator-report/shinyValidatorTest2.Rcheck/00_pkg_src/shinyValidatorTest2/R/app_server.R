#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}. DO NOT REMOVE.
#' @import shiny
#' @import echarts4r
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  output$echarts_plot <- renderEcharts4r({
    Sys.sleep(3)
    make_echart(input$var)
  })

  output$ggplot_plot <- renderPlot({
    make_ggplot(input$col)
  })
}
