include ../common.mk

.DEFAULT_GOAL := all
all: output.json

output.json: index.yaml
	${PYTHON} build.py

.PHONY : clean
clean:
	rm output.json

.PHONY : install
install: all
	cp output.json ${KITE_BULLETIN_JSON}