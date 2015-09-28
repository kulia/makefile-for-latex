TEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error
PRE =  $(TEX) -ini -job-name="preamble" "&pdflatex preamble.tex\dump"
BIB = bibtex

 

.PHONY: all view

all: main.pdf

force: 
	touch src/main.tex
	make

view:
	open main.pdf

main.pdf: src/main.tex
	$(TEX) src/main.tex

main.bbl main.blg: src/main.bib src/main.aux
	$(BIB) src/main

main.aux: src/main.tex
	$(TEX) src/main.tex

main.bib: src/main.tex
	$(TEX) src/main.tex

preamble.fmt: src/preamble.tex
	$(PRE) src/preamble.tex

clean:
	rm -f *.acn *.acr *.alg *.aux *.bbl *.bcf *.blg *.dvi *.fdb_latexmk *.fls *.glg *.glo *.gls *.idx *.ilg *.ind *.ist *.lof *.log *.lot *.maf *.mtc *.mtc0 *.nav *.nlo *.out *.pdfsync *.ps *.run.xml *.snm *.synctex.gz *.toc *.vrb *.xdy *.tdo *.brf 
clean-all:
	make clean
	rm -f *.pdf 