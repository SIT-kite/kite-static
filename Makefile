SECTIONS = \
	src/about \
	src/bulletin \
	src/override \
	src/version \

.DEFAULT_GOAL := all
all: 
	@echo "Build all ......................."
	for dir in $(SECTIONS); do $(MAKE) -C $$dir || exit "$$?"; done
	@echo "Build all finished successfully! ......"
	mkdir -p output/

	mkdir -p output/about/
	cp src/about/index.html output/about/

	cp src/bulletin/output.json output/
	cp src/bulletin/output_meta.json output/

	cp src/override/override.json output/
	cp src/override/override.*.json output/

	mkdir -p output/version/
	cp src/version/version.json output/version/
	cp src/version/message.html output/version/

	for dir in $(SECTIONS); do $(MAKE) -C $$dir clean || exit "$$?"; done
	@echo "Copy to output dir finished successfully! ......"



.PHONY : clean
clean:
	for dir in $(SECTIONS); do $(MAKE) -C $$dir clean || exit "$$?"; done
	rm -rf output/

installRequirements:
	pip install -r requirements.txt