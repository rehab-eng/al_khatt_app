import re
import pathlib
text = pathlib.Path('lib/features/ui_gallery/presentation/screens/agent_ui_screen.dart').read_text(encoding='utf-8')
texts = re.findall(r"Text\(\n\s*'([^']*)'", text)
for t in texts[:3]:
    print(t)
    print([hex(ord(c)) for c in t[:6]])
