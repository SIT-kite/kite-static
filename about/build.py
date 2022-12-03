from markdown import markdown

with open('index.md', mode='r', encoding='utf-8') as f:
    md = f.read()

html = markdown(text=md)

with open('index.html', mode='w', encoding='utf-8') as f:
    f.write(html)