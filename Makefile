KITE_PATH = /var/kite
KITE_STATIC = ${KITE_PATH}/web
PYTHON = python

buildAbout:
	cd about 
	python build.py
	cd ..

updateAbout: buildAbout
	cd about/index.html ${KITE_STATIC}/about/index.html

buildBulletin:
	cd bulletin
	python build.py
	cd ..

updateBulletin: buildBulletin
	cp bulletin.json ${KITE_STATIC}/bulletin/bulletin.json

buildOverride:
	cd override
	python build.py
	cd ..

updateOverride: buildOverride
	cp override.json ${KITE_STATIC}/override.json

updateUpgradePage:
	cp -r upgrade/ ${KITE_STATIC}/upgrade/

updateVersion:
	cp version/version.txt ${KITE_STATIC}/version.txt


release: updateAbout updateBulletin updateOverride updateUpgradePage updateVersion