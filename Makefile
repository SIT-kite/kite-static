include common.mk

buildAbout:
	cd about && ${PYTHON} build.py

updateAbout: buildAbout
	cd about/index.html ${KITE_STATIC}/about/index.html

buildBulletin:
	cd bulletin && ${PYTHON} build.py

updateBulletin: buildBulletin
	cp bulletin.json ${KITE_STATIC}/bulletin/bulletin.json

buildOverride:
	cd override && ${PYTHON} build.py

updateOverride: buildOverride
	cp override.json ${KITE_STATIC}/override.json

updateUpgradePage:
	cp -r upgrade/ ${KITE_STATIC}/upgrade/

updateVersion:
	cp version/version.txt ${KITE_STATIC}/version.txt


all: updateAbout updateBulletin updateOverride updateUpgradePage updateVersion