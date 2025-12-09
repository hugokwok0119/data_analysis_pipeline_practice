.PHONY: clean scratch # put all phony target at the top

results/isles.dat: wordcount.py data/isles.txt
	python scripts/wordcount.py --input_file=data/isles.txt --output_file=results/isles.dat

results/abyss.dat: wordcount.py data/abyss.txt
	python scripts/wordcount.py --input_file=data/abyss.txt --output_file=results/abyss.dat

results/last.dat: wordcount.py data/last.txt
	python scripts/wordcount.py --input_file=data/last.txt --output_file=results/last.dat

results/sierra.dat: wordcount.py data/sierra.txt
	python scripts/wordcount.py --input_file=data/sierra.txt --output_file=results/sierra.dat

results/figure/isles.png: plotcount.py results/isles.dat
	python scripts/plotcount.py --input_file=results/isles.dat --output_file=results/figure/isles.png

results/figure/abyss.png: plotcount.py results/abyss.dat
	python scripts/plotcount.py --input_file=results/abyss.dat --output_file=results/figure/abyss.png

results/figure/last.png: plotcount.py results/last.dat
	python scripts/plotcount.py --input_file=results/last.dat --output_file=results/figure/last.png

results/figure/sierra.png: plotcount.py results/sierra.dat
	python scripts/plotcount.py --input_file=results/sierra.dat --output_file=results/figure/sierra.png

report/report.html: report.qmd results/figure/isles.png results/figure/abyss.png results/figure/last.png results/figure/last.png
	quarto render report.qmd --output report.html

clean:
	rm -f results/figure/*
	rm -f results/*.dat
	rm -f report/*.html
	rm -rf report/count_report_files

scratch:
	make clean
	make results/isles.dat
	make results/abyss.dat
	make results/last.dat
	make results/sierra.dat
	make results/figure/isles.png
	make results/figure/abyss.png
	make results/figure/last.png
	make results/figure/sierra.png

all:
	make scratch
	make report/report.html