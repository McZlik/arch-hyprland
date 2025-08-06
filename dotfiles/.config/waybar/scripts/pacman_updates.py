#!/usr/bin/env python3
import subprocess
import json

try:
    updates = subprocess.check_output(["pacman", "-Qu"]).decode("utf-8").strip().splitlines()
    count = len(updates)
except subprocess.CalledProcessError:
    count = 0

if count == 0:
    cls = "up-to-date"
elif count < 20:
    cls = "caution"
elif count < 100:
    cls = "warning"
elif count > 100:
    cls = "critical"

print(json.dumps({
    "text": f"{count}",
    "class": cls,
    "tooltip": f"{count} package(s) can be updated"
}))
