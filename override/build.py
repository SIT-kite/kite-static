import yaml
import json

with open('override.yaml', mode='r', encoding='utf-8') as f:
    src = f.read()

override = yaml.safe_load(src)

with open('override.json', mode='w', encoding='utf-8') as f:
    json.dump(
        obj=override, 
        fp=f, 
        ensure_ascii=False,
    )

print('Build override.json successful')