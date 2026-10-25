# Doctoral thesis

Akira Taguchi. Dual-Use by Design: Benefits, Harms, and Governance in
Decentralized Freedom Technologies. The university and the supervising
professor are not settled yet. The research plan and the programmes under
consideration are in [`PLAN.md`](PLAN.md).

The latest draft is at
[lambdakilo.github.io/phdthesis/thesis.pdf](https://lambdakilo.github.io/phdthesis/thesis.pdf),
served by GitHub Pages from the `thesis.pdf` committed on `main`.

## Format

An article-based thesis: an overview of six chapters followed by Publications
I to III. Every programme in the plan accepts this form, and the number of
articles is agreed with the supervising professor.

The layout and the draft title pages are placeholders. They change to the
chosen university's rules once a supervisor has agreed.

The overview states the research problem, goals, methods and key findings,
assesses the significance for the discipline, lists the publications,
describes the author's own contribution to each, and states the thesis's
specific scientific contribution. Chapters 1 to 6 and the front matter cover
these.

## Build

Needs TeX Live with LuaLaTeX, biber and latexmk (MacTeX on macOS), or Docker.

Full thesis with the publications appended, to `build/thesis.pdf`, copied to
`thesis.pdf` at the root for GitHub Pages:

```sh
make
```

The same in Docker, with no local TeX:

```sh
make DOCKER=1
```

The overview alone, to `build/summary.pdf`:

```sh
make summary
```

The print files, numbered, to `dist/`:

```sh
make print
```

Rebuild on every save (local TeX only):

```sh
make watch
```

## Files

| Path | Content |
|---|---|
| `metadata.tex` | Title, author, school, supervisor, series number |
| `preamble/layout.tex` | Fonts, sizes and margins, a placeholder until the university is settled |
| `frontmatter/` | Draft title and abstract pages, preface, list of publications, author's contribution, abbreviations |
| `chapters/` | The overview |
| `publications/list.tex` | The publications, once: feeds the list and the appended part |
| `publications/I.pdf` ... | The articles; a placeholder page stands in until each exists |
| `initials/initials.pdf` | The university's uniform title and abstract pages, once exported |
| `references.bib` | Bibliography, author-year style |
| `thesis.pdf` | The latest full build, committed for GitHub Pages |
| `PROMPTS.md` | Every prompt behind the commits, with its commit, generated from the commit messages |

## Before printing

The steps depend on the university and its printer, so they are written once
those are settled. These hold either way:

- **Title and abstract pages.** Export the university's uniform pages to PDF
  as `initials/initials.pdf`, and they replace the draft pages.
- **Series number and ISBNs.** Add them to the title pages and to
  `\SeriesNumber` in `metadata.tex`.
- **Published articles.** Check each publisher's terms for including the
  article in the thesis.
- **Print files.** `make print` writes the overview and each article as
  separate, numbered PDFs. Rename them if the printer asks for other names.
- **Accessibility.** This build makes an untagged PDF, so ask the printer
  early whether it is accepted for the electronic version.

## License

Prose, meaning the thesis text in `chapters/`, `frontmatter/` apart from
`frontmatter/initials.tex`, `metadata.tex`, `publications/list.tex` and
`references.bib`, the figures in `figures/`, the built `thesis.pdf`,
`PLAN.md`, `PROMPTS.md`, `CLAUDE.md` and this README, is licensed under
Creative Commons Attribution-ShareAlike 4.0 International. See
[`LICENSE-CC-BY-SA-4.0`](LICENSE-CC-BY-SA-4.0).

Everything else is licensed under the GNU Affero General Public License,
version 3 or (at your option) any later version. See [`LICENSE`](LICENSE).

The articles in `publications/` and the title and abstract pages in
`initials/` keep the terms of their publishers and of the university, also
where they appear in `thesis.pdf`.
