SRC := master-cv.tex
SRC += cv-parts/academic-experience/*.tex
SRC += cv-parts/courses/*.tex
SRC += cv-parts/education/*.tex
SRC += cv-parts/industry-experience/*.tex
SRC += cv-parts/projects/*.tex
SRC += cv-parts/publications/*.tex

all: master-cv.pdf master-cv-fr.pdf

master-cv.pdf: $(SRC) language/english.tex
	cp language/english.tex language/current.tex
	latexmk -pdf -outdir=bin-en/ master-cv.tex
	cp bin-en/master-cv.pdf master-cv.pdf
	rm language/current.tex

master-cv-fr.pdf: $(SRC) language/french.tex
	cp language/french.tex language/current.tex
	latexmk -pdf -outdir=bin-fr/ master-cv.tex
	cp bin-fr/master-cv.pdf master-cv-fr.pdf
	rm language/current.tex

.PHONY: clean
clean:
	rm -rf bin/ bin-en/ bin-fr/ language/current.tex master-cv.pdf master-cv-fr.pdf
