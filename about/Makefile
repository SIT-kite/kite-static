include ../common.mk

.DEFAULT_GOAL := all
all: index.html

index.html: index.md template.html
	${PYTHON} build.py

.PHONY : clean
clean:
	rm index.html

.PHONY : install
install: all
	cp index.html ${KITE_ABOUT_HTML}