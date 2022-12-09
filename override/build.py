import yaml
import json
from typing import Any, Dict, Set

def open_source():
    with open('override.yaml', mode='r', encoding='utf-8') as f:
        return yaml.safe_load(f.read())

KEYS = ['routeOverride','extraHomeItem','homeItemHide','routeNotice']

def get_current_version() -> str:
    return open_source()['meta']['currentVersion']

def get_versions()->Set[str]:
    # 获取所有的version信息
    source = open_source()
    versions: Set[str] = set()

    # 先将当前版本至少需要加进来
    versions.add(source['meta']['currentVersion'])

    for key in KEYS:
        for item in source[key]:
            if 'version' not in item.keys():
                continue
            for b in item['version']:
                versions.add(b)
    return versions

def filter_by_version(version: str):
    src = open_source()
    for item_key in KEYS:
        src[item_key] = list(filter(lambda x:'version' not in x.keys() or version in x['version'], src[item_key]))

    for item_key in KEYS:
        for i in src[item_key]:
            if 'version' in i.keys():
                del i['version']
    
    route_notice = {}
    for i in src['routeNotice']:
        route_notice[i['route']] = i
        del i['route']
    src['routeNotice'] = route_notice
    del src['meta']
    return src

versions = get_versions()
print(f'当前已检测到的版本: {versions}')

with open(f'override.json', mode='w', encoding='utf-8') as f:
    json.dump(
        obj=filter_by_version(get_current_version()),
        fp=f,
        ensure_ascii=False,
    )

for version in versions:
    with open(f'override.{version}.json', mode='w', encoding='utf-8') as f:
        json.dump(
            obj=filter_by_version(version),
            fp=f,
            ensure_ascii=False,
        )



print('Build override.json successful')
