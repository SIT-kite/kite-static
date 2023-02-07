SECTIONS = \
	about \
	bulletin \
	override \

.DEFAULT_GOAL := all
all: 
	@echo "Build all ......................."
	for dir in $(SECTIONS); do $(MAKE) -C $$dir || exit "$$?"; done
	@echo "Build all finished successfully! ......"
	mkdir -p output/about/
	cp about/index.html output/about/
	cp bulletin/output.json output/
	cp bulletin/output_meta.json output/
	cp override/override.json output/
	cp override/override.*.json output/
	cp version/version.txt output/
	for dir in $(SECTIONS); do $(MAKE) -C $$dir clean || exit "$$?"; done
	@echo "Copy to output dir finished successfully! ......"



.PHONY : clean
clean:
	for dir in $(SECTIONS); do $(MAKE) -C $$dir clean || exit "$$?"; done
	rm -rf output/

installRequirements:
	pip install -r requirements.txt