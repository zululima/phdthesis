# Doctoral thesis

LaTeX thesis built with LuaLaTeX, biber and latexmk. Setup a person does once
by hand, such as installing TeX or exporting the university's title pages, is in
`README.md`.

## Build and verify

Build in Docker when there is no local TeX:

```sh
make DOCKER=1
```

Build the overview alone:

```sh
make summary DOCKER=1
```

A build passes when latexmk exits 0 and the log of the job it built has no
undefined references. After the thesis build, this prints nothing:

```sh
grep -i "undefined" build/thesis.log
```

After the overview build, which `make print` runs too:

```sh
grep -i "undefined" build/summary.log
```

After a change to `preamble/`, `thesis.tex`, `frontmatter/` or a list or float
in `chapters/`, also look at the pages: a third font, stray italics or drifting
labels leave nothing in the log. Neither macOS nor the TeX Live image ships
poppler or mutool, so `tools/pages.swift` renders with PDFKit, one PNG per page
and sheets of 32:

```sh
swift tools/pages.swift build/thesis.pdf build/pages
```

Read the sheets, then the changed pages at full size. Text uses only the two
families `preamble/layout.tex` sets.

`\DocumentMetadata` turns on LaTeX's new list code, which rejects enumitem's
keys, so the PDF language is set through hyperref instead.

## Rules

- `publications/list.tex` is the only list of publications. The front matter
  and the appended part both read it.
- Sizes, fonts and margins in `preamble/layout.tex` are a placeholder until the
  university is settled. Then they follow its printer's spec; check the spec
  before changing them.
- Name a supervisor, an advisor or a university as the thesis's own in the
  repository only once they have agreed. Until then `metadata.tex` and the
  README say "to be decided", and candidates stay out of the public files.
- `make` copies the PDF to `thesis.pdf` at the root, which GitHub Pages serves
  from `main` at https://zululima.github.io/phdthesis/thesis.pdf. Rebuild it
  and commit it with every change to what the PDF shows.
- British English in the text.
- Prose is CC BY-SA 4.0 and everything else AGPL-3.0-or-later. A new prose
  file outside the paths the README's License section names gets added there.
