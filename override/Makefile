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
	cp override.json ${KITE_OVERRIDE_JSON}