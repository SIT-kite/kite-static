include common.mk

SECTIONS = \
	about \
	bulletin \
	override \

.DEFAULT_GOAL := all

all: 
	@echo "Build all ......................."
	for dir in $(SECTIONS); do $(MAKE) -C $$dir || exit "$$?"; done
	@echo "Build all finished successfully! ......"


.PHONY : clean
clean:
	for dir in $(SECTIONS); do $(MAKE) -C $$dir clean || exit "$$?"; done


.PHONY : install
install:
	for dir in $(SECTIONS); do $(MAKE) -C $$dir install || exit "$$?"; done

installRequirements:
	pip install -r requirements.txt