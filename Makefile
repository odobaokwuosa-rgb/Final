final.html: final.Rmd code/03_render_report.R output
	Rscript code/03_render_report.R

.PHONY: setup output clean
setup:
	Rscript code/01_setup.R

output: setup
	Rscript code/02_make_output.R
	
clean:
	rm -f output/*.rds data/*.rds final.html