# Copilot project instructions — CSUN Master’s Thesis (bookdown/thesisdown)

Purpose: Help AI coding agents work productively in this R + LaTeX thesis repo built with bookdown/thesisdown and a custom CSUN thesis class.

## Big picture
- This is a bookdown/thesisdown project that compiles R Markdown chapters to a PDF using a custom LaTeX class (`CSUNthesis.cls`).
- Source of truth for chapter order is `_bookdown.yml` (`rmd_files`). Main entry is `index.Rmd` (front matter + LaTeX front matter), then `01-chap1.Rmd`, `02-chap2.Rmd`, `03-references.Rmd`, `04-appendix.Rmd`.
- Output is a single PDF: `_book/thesis.pdf`. Build uses pdflatex with natbib.

## Build workflow (what to run)
- Install in R: `bookdown`, `tinytex`, and `thesisdown` (via remotes). TinyTeX must be present for LaTeX packages.
- Build PDF in R: `bookdown::render_book("index.Rmd", output_format = "thesisdown::thesis_pdf")`
- Build settings live in `index.Rmd` YAML (not an `_output.yml`): `latex_engine: pdflatex`, `includes: in_header: preamble.tex, after_body: backmatter.tex`, `citation_package: natbib`.
- Output will be written to `_book/`. Caches: `thesis_cache/`, `_bookdown_files/`, `thesis_files/`.

## Repo conventions that matter
- Chapter files are numbered (`01-`, `02-`, …). When adding a chapter, create `NN-name.Rmd` and add to `_bookdown.yml:rmd_files`.
- Front matter (title page, dedication, acknowledgments, TOC, lists) is written as raw LaTeX in `index.Rmd` and/or controlled by `CSUNthesis.cls` and `template.tex`. Don’t “fix” formatting via Markdown—use the class/preamble.
- Figures are inserted via raw LaTeX inside R chunks using `cat()` and `here::here(...)` to resolve paths. Store assets under `figures/chapterX/` and reference with `\includegraphics{...}`. Label with `\label{fig:...}` and reference with `\ref{fig:...}`.
- Knitr defaults: chunks are generally `echo=FALSE`. Keep computational code hidden unless explicitly needed for reproducibility.
- Citations: bibliography at `bib/references.bib` with `csl/apa.csl`. Use Pandoc citations `[@key]` in prose or natbib commands in raw LaTeX. The build uses natbib.
- Math and chemistry: prefer LaTeX equations with labels; chemistry uses `mhchem` (e.g., `\ce{CO2 + H2O <=> H+ + HCO3-}`).

## Integration points and files to know
- `CSUNthesis.cls`: controls CSUN formatting (title page, spacing, captions, TOC/LOF/LOT, references heading). Avoid changes unless you’re fixing formatting.
- `preamble.tex`: packages, code highlighting macros, floats, chemistry, spacing; add package-level tweaks here.
- `template.tex`: Pandoc template bridging YAML to LaTeX class; generally leave as-is.
- `index.Rmd`: YAML metadata and all front matter blocks using raw LaTeX (`\frontmatter`, `\mainmatter`, etc.).

## Common pitfalls (and how to avoid them)
- Missing LaTeX packages: install TinyTeX (`tinytex::install_tinytex()`) and let it auto-install packages on first build.
- Figure paths: always use `here::here("figures", "chapterN", "file.png")` inside the LaTeX `\includegraphics` you emit with `cat()`.
- Chapter order not updating: ensure `_bookdown.yml:rmd_files` matches your new files and that file names are unique.
- Citation errors: check `bib/references.bib` keys; using natbib-style commands requires the packages set in `preamble.tex` and `index.Rmd` YAML.

## Safe changes AI agents can make
- Add or edit chapter `.Rmd` files; update `_bookdown.yml:rmd_files` accordingly.
- Add figures under `figures/chapterX/` and insert with the existing LaTeX + `here::here` pattern used in `01-chap1.Rmd` and `02-chap2.Rmd`.
- Update bibliography entries in `bib/references.bib` and cite with `[@key]`.
- Adjust LaTeX packages or macros in `preamble.tex` when required for compilation (be minimal and reversible).

Examples in-repo:
- Figure pattern: see `01-chap1.Rmd` chunk `fig_1_1_atmospheric_co2` and `\label{fig:atmospheric_co2}`; cross-reference with `Figure~\ref{fig:atmospheric_co2}`.
- Equation labeling: see `01-chap1.Rmd` `\begin{equation} ... \label{eq:arrhenius} ... \end{equation}` and later references.
