BINDIR := bin
LIBDIR := lib
MANDIR := man
WIKIDIR := wiki

MANPAGES := $(addprefix $(MANDIR)/,example-shellm.1 example_shellm.3)
WIKIPAGES := $(addprefix $(WIKIDIR)/,bin/example-shellm.md lib/example_shellm.md)

all : doc

install :
	@./install.sh "${PREFIX:-/usr/local}"

$(MANDIR)/%.1 : $(BINDIR)/%
	@shellman --format man $< > $@

$(MANDIR)/%.3 : $(LIBDIR)/%.sh
	@shellman --format man $< > $@

$(WIKIDIR)/bin/%.md : $(BINDIR)/%
	@shellman --format markdown $< > $@

$(WIKIDIR)/lib/%.md : $(LIBDIR)/%.sh
	@shellman --format markdown $< > $@

man : $(MANPAGES)

wiki : $(WIKIPAGES)

doc : man wiki
