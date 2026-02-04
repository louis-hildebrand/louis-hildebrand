all: master-cv.pdf master-cv-fr.pdf

master-cv.pdf: master-cv.tex language/english.tex
	cp language/english.tex language/current.tex
	latexmk -pdf -outdir=bin-en/ master-cv.tex
	cp bin-en/master-cv.pdf master-cv.pdf
	rm language/current.tex

master-cv-fr.pdf: master-cv.tex language/french.tex
	cp language/french.tex language/current.tex
	latexmk -pdf -outdir=bin-fr/ master-cv.tex
	cp bin-fr/master-cv.pdf master-cv-fr.pdf
	rm language/current.tex

.PHONY: clean
clean:
	rm -rf bin/ bin-en/ bin-fr/ language/current.tex
