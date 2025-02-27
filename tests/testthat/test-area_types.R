library(testthat)
library(fingertipsR)

context("Area types")

test_that("the area_types function returns data frame", {
        skip_on_cran()
        expect_is(area_types(), "data.frame")

})

test_that("area_type brings 0 row table for specific condition", {
        skip_on_cran()
        expect_equal(nrow(area_types("County")), 0)

})

test_that("area_types filter for text beings same number as records as filtering for AreaTypeID", {
        skip_on_cran()
        expect_equal(area_types(c("gov","ward")), area_types(AreaTypeID = c(8, 6)))

})

test_that("area_types returns 4 column table", {
        skip_on_cran()
        expect_equal(ncol(area_types(ProfileID = 156)), 4)

})

test_that("area_type warning working correctly", {
        skip_on_cran()
        expect_warning(area_types(AreaTypeName = "gov", AreaTypeID = 102),
                       "AreaTypeName used when both AreaTypeName and AreaTypeID are entered")
})

context("Area types by indicator")
test_that("the indicator_areatypes function returns two column table", {
        skip_on_cran()
        expect_equal(ncol(indicator_areatypes()), 2)

})

test_that("indicator_areatypes works for filter on IndicatorID = 108", {
        skip_on_cran()
        expect_equal(ncol(indicator_areatypes(108)), 2)

})

test_that("indicator_areatypes works for filter on AreaTypeID = 201", {
        skip_on_cran()
        expect_equal(ncol(indicator_areatypes(AreaTypeID = 201)), 2)

})

test_that("indicator_areatypes throws error when multiple IndicatorIDs provided", {
        skip_on_cran()
        expect_error(indicator_areatypes(c(108, 20)), "Length of IndicatorID must be 0 or 1")

})

test_that("indicator_areatypes throws error when multiple AreaTypeIDs provided", {
        skip_on_cran()
        expect_error(indicator_areatypes(AreaTypeID = c(108, 20)), "Length of AreaTypeID must be 0 or 1")
})

context("category_types works correctly")
test_that("category_types returns data frame", {
        skip_on_cran()
        expect_is(category_types(), "data.frame")

})

test_that("category_types returns 5 column table", {
        skip_on_cran()
        expect_equal(ncol(category_types()), 5)
})

context("nearest_neighbours works for AreaTypeID = 102")
test_that("nearest_neighbours returns character vector", {
          skip_on_cran()
          expect_equal(nearest_neighbours("E09000001", 302), character())
})

test_that("nearest_neighbours works for AreaTypeID = 101", {
        skip_on_cran()
        expect_is(nearest_neighbours(AreaCode = "E06000007", AreaTypeID = 101), "character")

})

test_that("nearest_neighbours works for AreaTypeID = 102", {
        skip_on_cran()
        expect_is(nearest_neighbours(AreaCode = "E06000007", AreaTypeID = 102), "character")

})

test_that("nearest_neighbours works for AreaTypeID = 201", {
        skip_on_cran()
        expect_is(nearest_neighbours(AreaCode = "E06000007", AreaTypeID = 201), "character")

})

test_that("nearest_neighbours works for AreaTypeID = 202", {
        skip_on_cran()
        expect_is(nearest_neighbours(AreaCode = "E06000007", AreaTypeID = 202), "character")

})

test_that("nearest_neighbours works for AreaTypeID = 301", {
        skip_on_cran()
        expect_is(nearest_neighbours(AreaCode = "E06000007", AreaTypeID = 301), "character")

})

test_that("nearest_neighbours works for AreaTypeID = 302", {
        skip_on_cran()
        expect_is(nearest_neighbours(AreaCode = "E06000007", AreaTypeID = 302), "character")

})


test_that("nearest_neighbours works for AreaTypeID = 152", {
        skip_on_cran()
        expect_is(nearest_neighbours(AreaCode = "E38000002", AreaTypeID = 152), "character")

})

test_that("nearest_neighbours works for AreaTypeID = 154", {
        skip_on_cran()
        expect_is(nearest_neighbours(AreaCode = "E38000002", AreaTypeID = 154), "character")

})

test_that("nearest_neighbours works for AreaTypeID = 166", {
        skip_on_cran()
        expect_is(nearest_neighbours(AreaCode = "E38000004", AreaTypeID = 166), "character")

})

test_that("nearest_neighbours error for incorrect AreaTypeID", {
        skip_on_cran()
        expect_error(expect_is(nearest_neighbours(AreaCode = "E12000001", AreaTypeID = 6), "AreaTypeID not found. Use function `list_areatypeids()` to see available AreaTypeIDs."))
})

test_that("nearest_neighbours error for incorrect AreaCode to AreaTypeID", {
        skip_on_cran()
        expect_error(nearest_neighbours(AreaCode = "E07000033", AreaTypeID = 152), "E07000033 not in AreaTypeID = 152")

})


#test_that("nearest_neighbours error for non-specified measure for AreaTypeID 102", {
#        skip_on_cran()
#        expect_error(nearest_neighbours(AreaCode = "E10000007", AreaTypeID = 102), "If using AreaTypeID = 102, you must specify measure \\(CIPFA or CSSN\\)")
#
#})


#test_that("nearest_neighbours error for incorrectly spelt measure for AreaTypeID", {
#        skip_on_cran()
#        expect_error(nearest_neighbours(AreaCode = "E10000007", AreaTypeID = 102, measure = "CIPPA"), "Measure must be either CIPFA or CSSN")
#
#})


