% ------------------------------------------------------
% CSUN Thesis CLS (CSUNthesis.cls)
% ------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CSUNthesis}[2025]
\LoadClass[12pt,oneside,letterpaper]{book}

% --- metadata commands -----------------------------------------------------
\makeatletter
\newcommand\@thesistitle{}
\newcommand\@authorname{}
\newcommand\@degreetype{}
\newcommand\@degreemonth{}
\newcommand\@degreeyear{}
\newcommand\@department{}
\newcommand\@university{}
\newcommand\@advisor{}
\newcommand\@committeeOne{}
\newcommand\@committeeTwo{}

\newcommand\thesistitle[1]{\gdef\@thesistitle{#1}}
\newcommand\authorname[1]{\gdef\@authorname{#1}}
\newcommand\degreetype[1]{\gdef\@degreetype{#1}}
\newcommand\degreemonth[1]{\gdef\@degreemonth{#1}}
\newcommand\degreeyear[1]{\gdef\@degreeyear{#1}}
\newcommand\department[1]{\gdef\@department{#1}}
\newcommand\university[1]{\gdef\@university{#1}}
\newcommand\advisor[1]{\gdef\@advisor{#1}}
\newcommand\committeeInternalOne[1]{\gdef\@committeeOne{#1}}
\newcommand\committeeInternalTwo[1]{\gdef\@committeeTwo{#1}}
\makeatother


% right after you've loaded the class:
\newcommand\abbreviationstext{}      % placeholder
\newcommand\abstracttext{}       % avoid clash with \abstract



% Document Options and Packages
\RequirePackage{etoolbox}
\DeclareOption{dsingle}{\toggletrue{SingleSpace}}
\DeclareOption{ddouble}{\togglefalse{SingleSpace}}
\newtoggle{SingleSpace}
\togglefalse{SingleSpace}
\ProcessOptions\relax

\iftoggle{SingleSpace}{
    \newcommand{\dnormalspacing}{1}
    \newcommand{\dcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{2.0}
    \newcommand{\dcompressedspacing}{1.0}
}

\RequirePackage[letterpaper, margin=1in]{geometry}

\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

\RequirePackage{enumerate} % only once

\RequirePackage{ragged2e} 
\justifying
\setlength{\parindent}{0.5in}

\RequirePackage{microtype, graphicx, fancyhdr, titlesec, titling, lettrine, verbatim, pdfpages}
\RequirePackage{amsmath, amssymb, amsfonts, amsthm, mathrsfs, amscd, mathtools}
\RequirePackage{color, xcolor}
\RequirePackage[labelfont={bf,rm,small},
                textfont={rm,small},
                labelsep=colon,
                justification=RaggedRight,
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
\RequirePackage{float}

% Caption formatting
\captionsetup{width=5in}
\captionsetup[figure]{font={stretch=1.5}}
\captionsetup[table]{font={stretch=1.5}}

% School color (cyan)
\definecolor{SchoolColor}{rgb}{0.1686, 0.7333, 0.8078} % HEX #2BBBCE
\definecolor{chaptergrey}{rgb}{0.3176, 0.6667, 0.8392} % corrected normalized 81/255,170/255,214/255

% Header and page style
\setlength{\headheight}{1pt}
\pagestyle{plain}

% Titlesec settings
\RequirePackage{titlesec}
\setcounter{secnumdepth}{3}

\titleformat{\chapter}[display]
  {\centering\normalfont\fontsize{12pt}{14pt}\selectfont}
  {\MakeUppercase{Chapter \thechapter}}{0.25em}{\MakeUppercase}

\titleformat{\section}[display]
  {\normalfont\bfseries\normalsize\fontsize{12pt}{14pt}\selectfont}
  {\thesection}{1em}{}

\titleformat{\subsection}[block]
  {\normalfont\bfseries\normalsize\fontsize{12pt}{14pt}\selectfont}{\thesubsection}{1em}{}

\titleformat{\subsubsection}[block]
  {\normalfont\itshape\fontsize{12pt}{14pt}\selectfont}{\thesubsubsection}{1em}{}

\titlespacing*{\chapter}{0pt}{0pt}{24pt}
\titlespacing*{\section}{0pt}{12pt}{6pt}
\titlespacing*{\subsection}{0pt}{10pt}{5pt}
\titlespacing*{\subsubsection}{0pt}{8pt}{4pt}

\justifying

\titleformat*{\paragraph}{\normalfont\rmfamily\small\bfseries}
\titleformat*{\subparagraph}{\normalfont\rmfamily\small\bfseries}

\RequirePackage{chngcntr}
\counterwithout{footnote}{chapter}

% TOC, LOF, LOT formatting
\RequirePackage[titles]{tocloft}
\RequirePackage[titletoc]{appendix}

\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

\setlength{\cftbeforechapskip}{10pt}
\setlength{\cftbeforesecskip}{6pt}
\setlength{\cftbeforefigskip}{6pt}
\setlength{\cftbeforetabskip}{6pt}

\renewcommand{\cftchapfont}{\normalfont\normalsize}
\renewcommand{\cftsecfont}{\normalfont\normalsize}
\renewcommand{\cftsubsecfont}{\normalfont\normalsize}
\renewcommand{\cftsubsubsecfont}{\normalfont\normalsize}
\renewcommand{\cftchapafterpnum}{\normalfont\normalsize}
\renewcommand{\cftsecafterpnum}{\normalfont\normalsize}
\renewcommand{\cftsubsecafterpnum}{\normalfont\normalsize}
\renewcommand{\cftsubsubsecafterpnum}{\normalfont\normalsize}
\renewcommand{\cftfigfont}{\normalsize}
\renewcommand{\cfttabfont}{\normalsize}

\renewcommand{\cftfigaftersnum}{.}
\renewcommand{\cfttabaftersnum}{.}
   
% List names
\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\listtablename}{List of Tables}

% Table of Contents page fix
\pretocmd{\tableofcontents}{\cleardoublepage}{}{}
\apptocmd{\tableofcontents}{}{}{}

% Section numbering in appendices or elsewhere if needed
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References
\renewcommand\bibname{References}
\RequirePackage[square,comma,numbers,sort&compress]{natbib}
\renewcommand{\bibnumfmt}[1]{[#1]}

% Paragraph style section environment
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

% Bibliography environment (aligned numbers)
\makeatletter
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}%
           \leftmargin\labelwidth
           \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax
           \itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}%
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}%
     \endlist}
\makeatother

\RequirePackage{float}


% ---------- FRONT MATTER (title-abstract) ----------

\renewcommand{\maketitle}{%
  \thispagestyle{empty}
  \begin{center}
    {\MakeUppercase{California State University, Northridge}\par}
    \vspace*{\fill}\vspace{0.5in}
    {Facing Physiological Constraints: Interactive Effects of Ocean Acidification and Warming on The Energetics of an Intertidal Gastropod, Tegula funebralis \par}
    \vspace{1in}
    A thesis submitted in partial fulfillment of the\\
    requirements for the degree of Master of Science in Biology\\
    \vspace{1in}
    By\\
    Robert J. Dellinger \\                  
    \vspace{1.5in}
    August 2024
  \end{center}
  \clearpage
}

\newcommand{\copyrightpage}{%
  \clearpage
  \thispagestyle{plain}
  \phantomsection
  \addcontentsline{toc}{chapter}{Copyright}
  \pdfbookmark[1]{Copyright}{Copyright}
  \vspace*{\fill}
  \begin{center}
    \small ©\ Robert J. Dellinger 2024\\
    Typeset in \LaTeXe.
  \end{center}
  \clearpage
}

\newcommand{\signaturepage}{%
  \clearpage
  \thispagestyle{plain}
  \phantomsection
  \addcontentsline{toc}{chapter}{Signature Page}
  \pdfbookmark[1]{Signature Page}{SignaturePage}
  \noindent
  The thesis of Robert J. Dellinger is approved:
  \vspace{10em}

  \begin{flushleft}
    \begin{tabular}{@{}p{3in}@{\hspace{1in}}p{1in}@{}}
      \rule{3in}{0.4pt} & \rule{1in}{0.4pt}\\
      Dr.~Peter J.~Edmunds & Date
    \end{tabular}

    \vspace{10em}

    \begin{tabular}{@{}p{3in}@{\hspace{1in}}p{1in}@{}}
      \rule{3in}{0.4pt} & \rule{1in}{0.4pt}\\
      Dr.~Kerry J.~Nickols & Date
    \end{tabular}

    \vspace{10em}

    \begin{tabular}{@{}p{3in}@{\hspace{1in}}p{1in}@{}}
      \rule{3in}{0.4pt} & \rule{1in}{0.4pt}\\
      Dr.~Nyssa J.~Silbiger, Chair & Date
    \end{tabular}
  \end{flushleft}

  \vfill
  \begin{center}
    California State University, Northridge
  \end{center}
  \clearpage
}


\newcommand{\dedicationpage}{
  \clearpage
  \phantomsection
  \pdfbookmark[1]{Dedication}{Dedication}
  \addcontentsline{toc}{chapter}{Dedication}
  \pagestyle{plain}
  \vspace*{\fill}
  \hfill
  \begin{center}
    \begin{minipage}{\dimexpr\textwidth - 2.5in}
      \begin{spacing}{1.5}
        $dedication$
      \end{spacing}
    \end{minipage}
  \end{center}
  \vspace*{\fill}
  \clearpage
}

\newcommand{\acknowledgments}{
  \clearpage
  \phantomsection
  \pdfbookmark[1]{Acknowledgments}{Acknowledgments}
  \addcontentsline{toc}{chapter}{Acknowledgments}
  \chapter*{Acknowledgments}
  \pagestyle{plain}
  \begin{spacing}{1.5}
    $acknowledgements$
  \end{spacing}
}

\renewcommand{\contentsname}{Table of Contents}

\newcommand{\contentspage}{%
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{Table of Contents}
    \pdfbookmark[1]{Table of Contents}{TableOfContents}
    \chapter*{Table of Contents}
    \begin{spacing}{1.5}
        \tableofcontents
    \end{spacing}
    \clearpage
}

\newcommand{\abbreviationspage}{%
  \phantomsection
  \addcontentsline{toc}{chapter}{List of Abbreviations} 
  \pdfbookmark[1]{List of Abbreviations}{Abbreviations} 
  \pagestyle{plain}%
  \begin{spacing}{1.5}\normalsize
    \noindent\leavevmode          
    \@abbreviations
  \end{spacing}%
  \clearpage
}

\newcommand{\abstractpage}{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{Abstract}
  \pdfbookmark[1]{Abstract}{Abstract}
  \chapter*{Abstract}
  \pagestyle{plain}
  \begin{center}
    {Facing Physiological Constraints: Interactive Effects of Ocean Acidification and Warming on The Energetics of an Intertidal Gastropod, Tegula funebralis \par} \vspace{2em} By \\ \vspace{0.5em} {\leavevmode\@authorname}
    \vspace{0.5em} \\ Master of Science in Biology \vspace{2em}
    \normalsize
    $abstract$
  \end{center}
  \begin{spacing}{2}
  \end{spacing}
  \newpage
}

% patch List of Tables
\usepackage{etoolbox}
\pretocmd{\listoftables}{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\listtablename}%
}{}{}

% patch List of Figures
\pretocmd{\listoffigures}{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\listfigurename}%
}{}{}


\renewcommand{\mainmatter}{
    \setcounter{chapter}{0}
    \doublespace
        \pagenumbering{arabic}
    \setcounter{page}{1}
}


\providecommand{\backmatter}{
    \clearpage
    \addcontentsline{toc}{chapter}{References}
    \bibliographystyle{unsrt}
    \begin{spacing}{\dcompressedspacing}
        \bibliography{dissertation}
    \end{spacing}
    \clearpage
    \begin{appendices}
        \justifying
        \include{appendix} % Ensure appendix text is inside this file
    \end{appendices}
}