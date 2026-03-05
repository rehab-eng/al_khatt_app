import re
import pathlib
text = pathlib.Path('lib/features/ui_gallery/presentation/screens/agent_ui_screen.dart').read_text(encoding='utf-8')
first = re.search(r"Text\(\n\s*'([^']*)'", text)
if first:
    s = first.group(1)
    print([hex(ord(c)) for c in s[:10]])
    print(len(s))
else:
    print('no text')
