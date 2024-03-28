
# starts: -----------------------------------------------------------------
# test 1
context("db")

test_that("instantiation works", {
  idswb <- etl("idswb")
  expect_true("etl_idswb" %in% class(idswb))
  expect_true("etl" %in% class(idswb))
  expect_true("src" %in% class(idswb))
  expect_true("src_dbi" %in% class(idswb))
  expect_true("src_sql" %in% class(idswb))
})


# ends: -------------------------------------------------------------------


