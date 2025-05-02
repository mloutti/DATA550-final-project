DATA 550 Final Project
================
Megan Louttit
2025-04-01

# DATA 550 Final Project

## Project Description

This project builds a report that analyzes attendance data collected
from fathers who participated in an ECD parenting program in six
communities near Mwanza, Tanzania. The project includes code for
generating a figure of the attendance trends throughout the program in
each community. Additionally, the code produces a table that analyzes
the impacts of the type of job that fathers worked and their baseline
interest in the program on their attendance at sessions.

## Code for Generating Report

The following documents are in the “code” folder within the directory:

1.  The R script titled “01makefigure.R” creates the report’s figure.

2.  The R script titled “02maketable.R” runs two logistic regression
    models. The first analyzes the association between the type of job
    that fathers worked and their attendance at sessions, and the second
    analyzes the association between fathers’ baseline interest in the
    program and their attendance at sessions. The code also creates the
    report’s table.

3.  The R script title “03render_report.R” renders the final R Markdown
    report.

The following documents are in the “files” folder within the directory:

1.  The file titled “DATA550_final_project_pt3.Rmd” is the report’s R
    markdown file.

## Generating the Report

The Makefile includes directions on how to generate the report. To compile the report locally,
run “make DATA550_final_project_pt3.html-local” in the terminal window.

## Setting up the R Package Environment
This project uses [`renv`] to manage package dependencies. To install the 
required packages, run "make install".

## How to Build the Docker Image
The docker image for this project is publicly available at:
https://hub.docker.com/repository/docker/dance4life/final_project/tags/image/sha256-8ca1d4f01df5862157aabdefe07aa52e755b4893ffcab1115731e6049216ac3e

To build the Docker Image, run the "make final_project_docker" rule. This rule 
is specified in the Makefile and builds the entire Docker Image, including downloading
the image from the Docker Hub repository, installing necessary packages, mounting the report
directory, and creating a directory setup in the container.

## How to Run the Automated Version of the Image
There are two different rules for running the automated version of the Docker Image
depending on whether the image is run on a Mac OS System or a Windows System. 
If the image is being built on a Mac OS System, run "make report_mac".
If the image is being built on a Windows OS System, run "make report_windows".

