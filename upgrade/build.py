from markdown import markdown
import yaml


with open('template.html', mode='r', encoding='utf-8') as f:
    template = f.read()

with open('index.md', mode='r', encoding='utf-8') as f:
    md = f.read()

with open('config.yaml', mode='r', encoding='utf-8') as f:
    cfg = yaml.safe_load(f.read())

content = markdown(text=md)

html = template.replace(r'{{ content }}', content)\
    .replace(r'{{ apple_url }}', cfg['apple_url'])\
    .replace(r'{{ other_url }}', cfg['other_url'])


with open('index.html', mode='w', encoding='utf-8') as f:
    f.write(html)
