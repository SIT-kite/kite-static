import yaml
import json
from typing import *

bulletin_index: Optional[List[Dict[str, Any]]] = None

with open('index.yaml', mode='r', encoding='utf-8') as f:
    bulletin_index = yaml.safe_load(f.read())

if bulletin_index is None:
    # TODO: red color
    print('Build Failed!!!')
    exit(0)

for post in bulletin_index:
    title = post['title']

    # 若不填写文件路径的默认行为
    if 'file' not in post.keys():
        post['file'] = f'src/{title}.md'
    
    try:
        with open(post['file'], mode='r', encoding='utf-8') as f:
            post['content'] = f.read()
    except FileNotFoundError:
        post['content'] = None

    del post['file']

with open('output.json', mode='w', encoding='utf-8') as f:
    json.dump(
        obj=bulletin_index, 
        fp=f,
        ensure_ascii=False,
    )

print('Build Successfull!!!')