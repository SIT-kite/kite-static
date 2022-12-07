include ../common.mk

.DEFAULT_GOAL := all
all: index.html

index.html: index.md template.html config.yaml
	${PYTHON} build.py

.PHONY : clean
clean:
	rm index.html

.PHONY : install
install: index.html index.css
	cp index.css ${KITE_UPGRADE_DIR}/index.css
	cp index.html ${KITE_UPGRADE_DIR}/index.html
