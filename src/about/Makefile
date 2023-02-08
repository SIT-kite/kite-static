.DEFAULT_GOAL := all
all: index.html

index.html: index.md template.html
	python3 build.py

.PHONY : clean
clean:
	rm -f index.html