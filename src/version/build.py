import yaml
import json
from typing import Optional, List, Dict, Any
import hashlib

version_index: Optional[Dict[str, Any]] = None

with open('index.yaml', mode='r', encoding='utf-8') as f:
    version_index = yaml.safe_load(f.read())

if version_index is None:
    # TODO: red color
    print('Build Failed!!!')
    exit(0)

version: Dict[str, str] = version_index['version']
message: str = version_index['message']

with open('version.json', mode='w', encoding='utf-8') as f:
    json.dump(version, f)

with open('message.html', mode='w', encoding='utf-8') as f:
    f.write(message)
