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

updateAbout: buildAbout
	cd about/index.html ${KITE_STATIC}/about/index.html

buildBulletin: bulletin/index.yaml
	cd bulletin && ${PYTHON} build.py

updateBulletin: buildBulletin
	cp bulletin.json ${KITE_STATIC}/bulletin/bulletin.json

buildOverride: override/override.yaml
	cd override && ${PYTHON} build.py

updateOverride: buildOverride
	cp override.json ${KITE_STATIC}/override.json

updateUpgradePage:
	cp -r upgrade/ ${KITE_STATIC}/upgrade/

updateVersion:
	cp version/version.txt ${KITE_STATIC}/version.txt

installRequirements:
	pip install -r requirements.txt

all: updateAbout updateBulletin updateOverride updateUpgradePage updateVersion