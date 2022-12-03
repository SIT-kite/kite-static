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
	cd index.html ${KITE_STATIC}/about/index.html