# REPORT-ASSOCIATED RULES (run within a docker container)
install:
	Rscript -e "renv::restore()"

DATA550_final_project_pt3.html: files/DATA550_final_project_pt3.Rmd code/01makefigure.R code/02maketable.R code/03render_report.R
	Rscript code/01makefigure.R
	Rscript code/02maketable.R
	Rscript code/03render_report.R


.PHONY: clean
	rm -f outputs/*.rds
	rm -f files/DATA550_final_project_pt3.html

# rule to build image
PROJECTFILES = files/DATA550_final_project_pt3.Rmd code/01makefigure.R code/02maketable.R code/03render_report.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

final_project_docker: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t dance4life/final_project .
	touch $@
	
# rule to build the report automatically in our container
	# Rule for MAC Systems:	
report_mac:
		docker run -v $$(pwd)/report:/project/report dance4life/final_project
		
	# Rule for Windows Systems
report_windows:
		docker run -v /$$(pwd)/report:/project/report dance4life/final_project
