KITE_PATH = /var/kite
KITE_STATIC = ${KITE_PATH}/web

buildUpgradePage:
	

updateUpgradePage:
	cp -r upgrade/ ${KITE_STATIC}/upgrade/

updateOverride:
	cp override.json ${KITE_STATIC}/override.json

updateVersion:
	cp version.txt ${KITE_STATIC}/version.txt

buildBulletin:
	python scripts/build_bulletin.py -o ./bulletin/bulletin.json ./bulletin/index.yaml

updateNotice: buildBulletin
	cp ./bulletin/bulletin.json ${KITE_STATIC}/bulletin/bulletin.json

release: updateUpgradePage updateVersion