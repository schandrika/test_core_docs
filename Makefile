# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

docs/test-agent-docs:
	git submodule init; \
	git submodule update; \
	ln -s ../submodules/test_agent_docs/docs/source ./source/test-agent-docs
	@echo
	@echo "Documentation of test-agent-docs initialized."

.PHONY: deps
deps: docs/test-agent-docs

.PHONY: html
html: deps  ## Build html
	@$(SPHINXBUILD) "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O) 
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html."

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
