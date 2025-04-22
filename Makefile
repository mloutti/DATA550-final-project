install:
	Rscript -e "renv::restore()"

DATA550_final_project_pt3.html: files/DATA550_final_project_pt3.Rmd code/01makefigure.R code/02maketable.R code/03render_report.R
	Rscript code/01makefigure.R
	Rscript code/02maketable.R
	Rscript code/03render_report.R

.PHONY: clean
	rm -f outputs/*.rds
	rm -f files/DATA550_final_project_pt3.html
