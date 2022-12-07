import yaml
import json
from typing import Optional, List, Dict, Any
import hashlib

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
    
    if 'top' not in post.keys():
        post['top'] = False

    try:
        with open(post['file'], mode='r', encoding='utf-8') as f:
            post['content'] = f.read()
    except FileNotFoundError:
        post['content'] = None

    del post['file']

output_json_content = json.dumps(
    obj=bulletin_index,
    ensure_ascii=False,
)
with open('output.json', mode='w', encoding='utf-8') as f:
    f.write(output_json_content)

with open('output_meta.json', mode='w', encoding='utf-8') as f:
    output_json_md5 = hashlib.md5(output_json_content.encode('utf-8')).digest().hex()
    f.write(json.dumps(
        obj={
            'hash': output_json_md5,
            'head_title': bulletin_index[0]['title']
        },
        ensure_ascii=False,
    ))

print('Build Successfull!!!')