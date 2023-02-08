.DEFAULT_GOAL := all
all: output.json output_meta.json output_mock_api.json

output.json: index.yaml src build.py
	python3 build.py

output_meta.json: output.json

output_mock_api.json: output.json

.PHONY : clean
clean:
	rm -f output.json output_meta.json output_mock_api.json