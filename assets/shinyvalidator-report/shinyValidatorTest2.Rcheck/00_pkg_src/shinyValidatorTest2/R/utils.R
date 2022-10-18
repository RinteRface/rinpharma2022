#  "const customClicker = gremlins.species.clicker({
#      // which mouse event types will be triggered
#      clickTypes: ['click'],
#      // Click only if element has id obs
#      canClick: (element) => element.id === 'obs',
#      // by default, the clicker gremlin shows its action by a red circle
#      // overriding showAction() with an empty function makes the gremlin action invisible
#      showAction: (x, y) => {},
#    });
#
#    gremlins.createHorde({
#      randomizer: new gremlins.Chance(1234), // repeatable
#      species: [customClicker],
#      mogwais: [gremlins.mogwais.alert(),gremlins.mogwais.gizmo()],
#      strategies: [
#        gremlins.strategies.distribution({
#          distribution: [1], // custom
#          delay: 10 // default
#        })
#      ]
#    }).unleash().then(() => {
#      console.log('Gremlins test success')
#   });"

echarts_df <- state.x77 %>%
       as.data.frame() %>%
       tibble::rownames_to_column("State")

make_echart <- function(var) {
  # add the same id as plot output outside shiny
  # to avoid random snapshot id issue
  id <- if (!shiny::isRunning()) "echarts_plot" else NULL
  State <- NULL;
  echarts_df %>%
    e_charts(x = State, elementId = id) %>% # initialize and set x
    e_line_(serie = var) # add a line
}

#' @import ggplot2
make_ggplot <- function(var = "cyl") { # default to mpg
  ggplot(datasets::mtcars, aes_(x = as.name(var))) + geom_histogram(binwidth = 5)
}
