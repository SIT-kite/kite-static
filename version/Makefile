.DEFAULT_GOAL := all
all: version.json message.html

version.json : index.yaml
	python3 build.py

message.html : version.json

.PHONY : clean
clean:
	rm -f version.json message.html