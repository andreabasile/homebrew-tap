"""Sets version, sha256 and (optionally) url of a cask; used by update-cask.yml."""
import re
import sys

path, version, sha256, url = sys.argv[1:5]
text = open(path).read()
text = re.sub(r'^(\s*)version ".*"', rf'\g<1>version "{version}"', text, count=1, flags=re.M)
text = re.sub(r'^(\s*)sha256 ".*"', rf'\g<1>sha256 "{sha256}"', text, count=1, flags=re.M)
if url:
    # Keep the #{version} interpolation the casks use.
    template = url.replace(version, "#{version}")
    text = re.sub(r'^(\s*)url ".*"', lambda m: f'{m.group(1)}url "{template}"', text, count=1, flags=re.M)
open(path, "w").write(text)
print(text)
