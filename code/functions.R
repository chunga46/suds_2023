create_random_sample <- function(seed, data_raw, percent_of_data) {
  # set seed
  set.seed(seed)
  # sampling starts at row 2 because row 1 is an extra header
  random_set <- sample(2:nrow(data_raw),
                       size = ceiling(nrow(data_raw) * percent_of_data))
  random_sam <- data_raw[c(1,random_set),]
  random_sam <- random_sam[-1,]
}

clean_goal_set_data <- function(goal_data) {
  # This makes use of the tidyverse library to nicely clean and select parts of
  # dataset. 
  goal_data |>
    select(
      c(final_grade = `Final Grade (After Review)`,
        interv_type = condition...171)) |>
    # Defined outliers as grades less than 40%
    mutate(
      final_grade = if_else(final_grade < 40, NA, as.integer(final_grade))
    ) |> 
    remove_missing(na.rm = TRUE)
}

plot_histo <- function(goal_data) {
  # used ggstatsbetween library 
  # https://indrajeetpatil.github.io/ggstatsplot/index.html 
  gghistostats(
    data              = goal_data,
    x                 = final_grade,
    title             = "Final Grade Distribution",
    binwith           = 2,
    xlab              = "Final Grade",
    #show no statistical results
    results.subtitle  = FALSE,
    normal.curve      = TRUE,
    normal.curve.args = list(color = "red", size = 1),
  )
}

plot_boxplot <- function(goal_data) {
  # used ggstatsbetween library 
  # https://indrajeetpatil.github.io/ggstatsplot/index.html 
  ggbetweenstats(
    data = goal_data,
    x    = interv_type,
    y    = final_grade,
    type = "parametric",
    # By default, Bayesian Stats also present in figure,
    # but no need for this analysis.
    bf.message = FALSE,
    title= "Distribution of final grades across interventions",
    xlab = "Type of Intervention",
    ylab = "Final Grade"
  )
}

create_sum_table <- function(goal_set_data) {
  # Used gtsummary library to create small summary table
  goal_set_data |> tbl_summary(
    by    = interv_type,
    digits = all_continuous() ~ 2,
    label = list(final_grade ~ "Final Grade",
                 interv_type ~ "Intervention Type"),
    statistic = all_continuous() ~ "{mean} ({sd})",
  ) |>
    modify_header(
      label  = "**Intervention Group**",
      stat_1 = "Plan N = {n}",
      stat_2 = "Woop N = {n}"
    ) 
}