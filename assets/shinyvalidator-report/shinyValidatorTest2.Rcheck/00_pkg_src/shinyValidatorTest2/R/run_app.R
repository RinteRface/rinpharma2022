#' Run example app
#'
#' @return A shiny app object
#' @export
#' @import shiny
run_app <- function() {
  # serve js tools for Monkey test (in case proxy blocks external scripts)
  addResourcePath("gremlins", "inst/shinyValidator-js")
  # DON'T CHANGE (INTERNAL TO SHINYVALIDATOR)
  if (!exists(".enable_reactlog")) .enable_reactlog <- FALSE
  if (!exists(".profile_code")) .profile_code <- FALSE

  if (.enable_reactlog || .profile_code) {
    tmp <- body(app_server)
    start <- length(tmp) + 1 # start just before the closing }
    body(app_server)[[start]] <- substitute(
      onSessionEnded(function() {
        stopApp(reactlog())
      })
    )
  }

  runApp(shinyApp(app_ui, app_server), test.mode = TRUE)
}

globalVariables(c("app_ui", "app_server"))
