include ../common.mk

.DEFAULT_GOAL := all
all: output.json output_meta.json

output.json: index.yaml src build.py
	${PYTHON} build.py

output_meta.json: output.json

.PHONY : clean
clean:
	rm output.json

.PHONY : install
install: all
	cp output.json ${KITE_BULLETIN_JSON}
	cp output_meta.json ${KITE_BULLETIN_META_JSON}