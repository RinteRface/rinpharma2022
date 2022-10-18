library(ggplot2)
test_that("ggplot OK", {
  vdiffr::expect_doppelganger("ggplot2 histogram", make_ggplot())
})
