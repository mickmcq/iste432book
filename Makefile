rerun    = "Rerun to get cross-references right"
basename = book
latex    = xelatex
option   = -jobname $(basename) '\input{preamble-basic.tex}'
texdir   = '/usr/local/texlive/texmf-local/tex/'
pandir   = ~/.pandoc/templates/

all : $(basename).tex
	cp -p preamble-basic.tex $(texdir)
	cp -p titlessectionstoc.tex $(texdir)
	cp -p figuresettings.tex $(texdir)
	cp -p listsettings.tex $(texdir)
	cp -p colorsettings.tex $(texdir)
	cp -p listingssettings.tex $(texdir)
	cp -p tikzsettings.tex $(texdir)
	cp -p fontsettings-fbb.tex $(texdir)
	cp -p dbnotation.tex $(texdir)
	cp -p widths.tex $(texdir)
	cp -p miscsettings.tex $(texdir)
	cp -p pandocSyntax.tex $(texdir)
	$(latex) $(option) || true
	grep -q $(rerun) $(basename).log \
	     && $(latex) $(option) \
	     || true

$(basename).tex : $(basename)-content.md
	cp -p pandocNotes.latex $(pandir)
	pandoc                           \
	  -t latex                       \
	  --bibliography $(basename).bib \
	  --template pandocNotes         \
	     $(basename)-content.md      \
	  -o $(basename).tex

$(basename)-content.md : 0*.md 1*.md node-intro.md
	cat                              \
	  01intro-content.md             \
	  02dbreview-content.md          \
	  03datainput-content.md         \
	  04singleMulti-content.md       \
	  05integrity-content.md         \
	  06patterns-content.md          \
	  07layered-content.md           \
	  08exceptions-content.md        \
	  09authenticAuthoriz-content.md \
	  10performance-content.md       \
	  11testing-content.md           \
	  12help-content.md              \
	  14architecture-content.md      \
	  15conclusion-content.md        \
	  16appendices-intro.md          \
	  node-intro.md                  \
	  17appendices-content.md        \
	  > $(basename)-content.md

clean :
	rm $(basename)-content.md *.log *.aux *.out *~
