context("resample")

test_that("resample", {
  task = mlr_tasks$get("iris")
  learner = mlr_learners$get("classif.dummy")
  resampling = mlr_resamplings$get("cv")
  resampling$par_vals = list(folds = 3)
  rr = resample(task, learner, resampling)

  expect_resample_result(rr)
  expect_number(rr$aggregated)
})

test_that("resample with multiple measures", {
  task = mlr_tasks$get("iris")
  task$measures = mlr_measures$mget(c("mmce", "acc"))
  learner = mlr_learners$get("classif.dummy")
  resampling = mlr_resamplings$get("cv")
  resampling$par_vals = list(folds = 3)
  rr = resample(task, learner, resampling)

  expect_resample_result(rr)
})