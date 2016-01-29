TEXFILES	= proposal.tex 

all: clean proposal.pdf
ps: figseps proposal.ps

figspdf:
	cd figs; make pdf

figseps:
	cd figs; make eps

proposal.ps: $(TEXFILES) 
	latex proposal.tex
	dvips -t letter -o proposal.ps proposal.dvi

proposal.pdf: $(TEXFILES) 
	pdflatex proposal.tex
#	bibtex proposal
#	pdflatex proposal.tex
#	pdflatex proposal.tex
#	test -f /www/newPapers/12-04/proposal.pdf && cp -f proposal.pdf /www/newPapers/12-04 && chmod g+rw /www/newPapers/12-04/proposal.pdf || true

clean:
	rm -f *.ilg *.aux *.log *.dvi *.idx *.toc *.lof *.lot
	rm -f *.blg *.bbl *~
	rm -f *.ps
	rm -f *.gz
	rm -f proposal.pdf

view:
	/usr/X11R6/bin/gv proposal.ps &
