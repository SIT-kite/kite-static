from markdown import markdown

with open('template.html', mode='r', encoding='utf-8') as f:
    template = f.read()

with open('index.md', mode='r', encoding='utf-8') as f:
    md = f.read()

content = markdown(text=md)

html = template.replace(r'{{ content }}', content)

with open('index.html', mode='w', encoding='utf-8') as f:
    f.write(html)