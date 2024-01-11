#!/usr/bin/env python

from pathlib import Path

basedir = Path("home")
destdir = Path.home()

for candidate in basedir.rglob("*"):
    if candidate.is_file():
        target = (destdir / candidate.relative_to(basedir))
        target.unlink(missing_ok=True)
        target.parent.mkdir(parents=True, exist_ok=True)
        target.symlink_to(candidate.absolute())

