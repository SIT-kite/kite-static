include ../common.mk

.DEFAULT_GOAL := all
all: override.json

override.json : override.yaml
	${PYTHON} build.py

.PHONY : clean
clean:
	rm override.json

.PHONY : install
install: all
	cd override.json ${KITE_STATIC}/override.json