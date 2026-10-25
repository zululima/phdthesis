SURNAME ?= Taguchi
NUMERALS := I II III IV V VI VII VIII IX X
TEXLIVE_IMAGE ?= texlive/texlive:latest

ifdef DOCKER
LATEXMK = docker run --rm -v "$(CURDIR)":/thesis -v phdthesis-texlive-home:/root -w /thesis $(TEXLIVE_IMAGE) latexmk
else
LATEXMK = latexmk
endif

.PHONY: pdf summary print watch clean

# GitHub Pages serves the copy committed at the root.
pdf:
	$(LATEXMK) thesis.tex
	cp build/thesis.pdf thesis.pdf

summary:
	$(LATEXMK) -jobname=summary thesis.tex

# The printer takes the overview and each article as separate, numbered PDFs.
print: summary
	rm -rf dist && mkdir dist
	cp build/summary.pdf dist/1_$(SURNAME)_thesis.pdf
	@i=0; for r in $(NUMERALS); do \
	  i=$$((i+1)); \
	  if [ -f publications/$$r.pdf ]; then \
	    cp publications/$$r.pdf "dist/$$((i+1))_$(SURNAME)_art$${i}.pdf"; \
	  fi; \
	done
	ls dist

watch:
	latexmk -pvc thesis.tex

clean:
	rm -rf build dist
