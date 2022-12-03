include ../common.mk

.DEFAULT_GOAL := all
all: index.html

index.html: index.md
	${PYTHON} build.py

.PHONY : clean
clean:
	rm index.html

.PHONY : install
install: all
	cp index.html ${KITE_STATIC}/about.html