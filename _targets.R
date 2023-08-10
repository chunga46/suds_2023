source("code/packages.R")
source("code/functions.R")

tar_plan(
  # Load raw data
  tar_file_read(
    goal_set_data_raw,
    "insert xlsx file",
    read_excel(!!.x, skip = 1)
  ),
  # Take random sample of data
  sample = create_random_sample(seed=3, goal_set_data_raw, .1),
  
  # Clean data
  goal_set_data = clean_goal_set_data(sample),
  
  # Plot Histogram
  grade_dist= plot_histo(goal_set_data),
  
  group_diffs = plot_boxplot(goal_set_data),
  
  # Draw Summary Table
  sum_table = create_sum_table(goal_set_data),
  
  # Generate report
  tar_quarto(
    goal_set_report,
    path = "goal_set_report.qmd"
  )
)