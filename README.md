# BMP5203 -- Decision-Making in Business & AI

Guest lecture for **BMP5203 Competitive Strategy, Digitisation, and AI** (NUS).
Presenter: Dr Gaurav Manek.

90-minute talk. Option A from `spec/SLIDES.md`: tools for judging firms, then a hinge (MBA-student disease / Chesterton's Fence), then how to put AI in without actioning a data bug.

## Build

```bash
typst compile --root . slides.typ
```

Typst 0.15+, Touying 0.7.4, metropolis theme. Same helpers as `../agentic-ai-tutorial` (`common.typ`).

## Layout

```text
slides.typ            entry + theme
common.typ            gblock / lblock / bars / stubs
sections/             one file per act, with its images in a folder of the same name
figures/              CeTZ diagrams (not committed as PNG)
spec/                 lecture options and the slide contract
```

Source PPTX is gitignored. The conversion map for the old deck is `OUTLINE.md`; the new deck's contract is `spec/OUTLINE.md`.
