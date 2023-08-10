# Reframing Reproducibility Project 
This is a project for the Summer Undergraduate Data Science 2023 program at the University of Toronto.
*For an in depth discussion on analysis, please check [https://andrewychung.quarto.pub/suds_2023/goal_set_report.html](url)

### Disclaiminer: 
1. Due to security issues, the dataset was not provided in the code. The code will not run. I have instead attached screenshot figure you can view in fig/plots.
2. If you want to learn how to use targets and quarto, here are the resources I used to get started.
   [https://quarto.org/docs/get-started/hello/rstudio.html](url)
   [https://books.ropensci.org/targets/](url)
   [https://carpentries-incubator.github.io/targets-workshop/index.html](url)
   [https://ucsbcarpentry.github.io/Reproducible-Publications-with-RStudio-Quarto/](url)
   
4. I had intended to have all files related to generating a report in a report folder like the figure below, but ran into issues running _target.R I was not able to fix how _target.R wants to be in the same directory when rendering the report.
.
├── data/
│   └── "xlsx file"
├── code/
│   ├── functions.R
│   └── packages.R
├── output/
│   ├── fig/
│   │   ├── decisions.jpg
│   │   └── targets_flow.png
│   └── plots/
│       ├── grade_dist.png
│       ├── group_diff.png
│       └── sum_table.png
├── _targets
├── _targets.R
├── report/
│   ├── goal_set_report_files/
│   │   └── "Contains copy of used photos files here"
│   ├── goal_set_report.html
│   ├── goal_set_report.qmd
│   └── references.bib
└── suds-project.Rproj
