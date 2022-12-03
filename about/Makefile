include ../common.mk

.DEFAULT_GOAL := all
all: index.html

index.html: index.md
	${PYTHON} build.py

.PHONY : clean
clean:
	rm index.md