include common.mk

buildAbout: about/index.md
	cd about && ${PYTHON} build.py

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