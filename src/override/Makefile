.DEFAULT_GOAL := all
all: override.json

override.json : override.yaml
	python3 build.py

.PHONY : clean
clean:
	rm -f override.json override.*.json