#!/usr/bin/env python3
"""Fail on non-ASCII characters that are not on the allowlist below.

The allowlist is everything the deck used when the hook was added; it is a
snapshot to be audited down, not a set of approved characters.
"""

import sys
import unicodedata

ALLOWED = set(
    "─"  # BOX DRAWINGS LIGHT HORIZONTAL - ASCII art rules
    "—–"  # EM DASH, EN DASH
    "→↔↗↘"  # RIGHTWARDS, LEFT RIGHT, NE, SE ARROW
    "·•◆…"  # MIDDLE DOT, BULLET, BLACK DIAMOND, ELLIPSIS
    "×÷≠≈≤≥"  # MULTIPLICATION .. GREATER-THAN OR EQUAL
    "‘’“”"  # curly quotes
    "°¾¢"  # DEGREE, THREE QUARTERS, CENT
    "\U0001f916\U0001f4a5\U0001f9e0"  # robot, collision, brain
)


def main(paths: list[str]) -> int:
    bad = False
    for path in paths:
        with open(path, encoding="utf-8") as handle:
            for lineno, line in enumerate(handle, 1):
                for ch in line:
                    if ord(ch) > 127 and ch not in ALLOWED:
                        name = unicodedata.name(ch, "unnamed")
                        print(f"{path}:{lineno}: U+{ord(ch):04X} {name}")
                        bad = True
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
