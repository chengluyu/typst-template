# Typst Template

This is a Typst slide template for my PQE.

## Features

- Scala 3 syntax highlight.
- MLscript syntax highlight.

## Usage

- Install typst-lsp in VSCode.
- Instlal typst-preview for live preview in VSCode.
- Enable this settings in your VSCode's settings.json.
  ```json
  { "typst-lsp.exportPdf": "onPinnedMainSave" }
  ```
  So, typst-lsp will only compile PDF files when pinned tab is saved.

Also

## Requirements

- Typst 0.10 (already includes [Polylux][polylux])

[polylux](https://github.com/andreasKroepelin/polylux)

You may need to install the following fonts.

- [STIX Two Math](https://github.com/stipub/stixfonts) for equations
- [Fira Code](https://github.com/tonsky/FiraCode) for inline code and code block
