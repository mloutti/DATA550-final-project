FROM rocker/tidyverse

WORKDIR /home/project

RUN apt-get update && apt-get install -y \
  pandoc \
  libnode-dev

RUN mkdir /project
WORKDIR /project

RUN mkdir code
RUN mkdir outputs
RUN mkdir files
RUN mkdir csv-datasets
COPY code code
COPY files files
COPY Makefile .
COPY csv-datasets csv-datasets

COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt = FALSE); renv::snapshot(prompt = FALSE)"

RUN mkdir report

RUN apt-get update && apt-get install -y pandoc

CMD make DATA550_final_project_pt3.html && mv files/DATA550_final_project_pt3.html report






