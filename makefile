all:
	pdflatex main.tex
	pdflatex main.tex

clean:
	rm -f *.aux	*.dye *.log	*.toc *.pdf
