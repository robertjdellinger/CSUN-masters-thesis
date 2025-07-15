
# CSUN Master’s Thesis — Robert J. Dellinger

**Facing Physiological Constraints: Interactive Effects of Ocean Acidification and Warming on the Energetics of an Intertidal Gastropod, _Tegula funebralis_**  
Department of Biology  
California State University, Northridge  
Master of Science in Biology — August 2024

## Full PDF 

[![View Thesis PDF](https://img.shields.io/badge/PDF-Thesis-blue?logo=adobeacrobatreader&logoColor=white)](https://github.com/robertjdellinger/CSUN-masters-thesis/blob/main/_book/thesis.pdf)

---

## Project Description

This thesis explores how ocean acidification and warming jointly constrain the metabolic energy budgets of _Tegula funebralis_, a key California intertidal gastropod.  

It combines:
- A meta-synthesis of marine physiological responses to climate change (Chapter 1)
- A mesocosm experiment on _Tegula funebralis_ (Chapter 2)

Built using [`bookdown`](https://bookdown.org/) / [`thesisdown`](https://github.com/ismayc/thesisdown) and a custom [`CSUNthesis.cls`](CSUNthesis.cls) file adapted to meet CSUN Department of Biology formatting requirements.

---

## File structure

```text
CSUN-masters-thesis/
├── index.Rmd             # Title, abstract, dedication, acknowledgments
├── 01-chap1.Rmd          # Chapter 1: Lit review
├── 02-chap2.Rmd          # Chapter 2: Experimental write-up
├── 03-references.Rmd     # Bibliography
├── 04-appendix.Rmd       # Appendix A & B (figures + tables)
│
├── CSUNthesis.cls        # Custom LaTeX thesis class (CSUN Biology)
├── template.tex          # LaTeX template for thesisdown/bookdown
├── preamble.tex          # LaTeX preamble (packages, formatting)
├── backmatter.tex        # Content added after main matter (e.g., bios)
│
├── _bookdown.yml         # Bookdown config (order of chapters etc.)
├── _output.yml           # PDF output settings
├── CSUNthesis.Rproj      # RStudio project file
│
├── bib/                  # Bibliographic .bib files
├── csl/                  # Citation style files (.csl)
├── figures/              # All chapter and appendix figures
├── thesis_files/         # Bookdown output
├── thesis_cache/         # knitr cache
├── _bookdown_files/      # Intermediate bookdown files
└── _book/                # Compiled bookdown output (PDF/HTML)
```
---

## Requirements

You’ll need:

- [R](https://cran.r-project.org/)
- [RStudio](https://www.rstudio.com/)
- [`tinytex`](https://yihui.org/tinytex/)
- [`thesisdown`](https://github.com/ismayc/thesisdown)
- [`bookdown`](https://bookdown.org/)

### Install dependencies:

```r
install.packages(c("bookdown", "tinytex"))
tinytex::install_tinytex()
remotes::install_github("ismayc/thesisdown")
```

---

### Rendering Instructions

To build the PDF version of the thesis:

bookdown::render_book("index.Rmd", output_format = "thesisdown::thesis_pdf")

This will create a PDF in the _book/ directory.

---

## Citation

```bibtex
@mastersthesis{dellinger2024thesis,
  title = {Facing Physiological Constraints: Interactive Effects of Ocean Acidification and Warming on the Energetics of an Intertidal Gastropod, Tegula funebralis},
  author = {Robert J. Dellinger},
  school = {California State University, Northridge},
  year = {2024},
  type = {Master’s Thesis},
  address = {Northridge, CA},
}
```
---

## License

All text and figures © 2024 Robert J. Dellinger.
Code and configuration under the MIT License.

