%=====================================================================================================================================
% Class akktecdoc by Igor Akkerman (c) 2006
% Class for typesetting german thesis works (Diplomarbeit).
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License (latest version).
%
% The latest version of this license can be found at
%     http://www.latex-project.org/lppl.txt
%
% This file may only be distributed together with the full 'AkkTeX' bundle.
%=====================================================================================================================================
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{akkdiplom}[2006/12/10 v1.0.0 by Igor Akkerman (c) 2006 Class for typesetting german thesis works (Diplomarbeit).]
%=====================================================================================================================================

\makeatletter

% Initialisierungsteil (leer)

% Deklaration von Optionen
\DeclareOption {10pt}     {\PassOptionsToClass   {10pt}     {report}}
\DeclareOption {11pt}     {\PassOptionsToClass   {11pt}     {report}}
\DeclareOption {12pt}     {\PassOptionsToClass   {12pt}     {report}}
\DeclareOption {draft}    {\PassOptionsToClass   {draft}    {report}}
\DeclareOption {final}    {\PassOptionsToClass   {final}    {report}}

\DeclareOption {widepage} {\PassOptionsToPackage {widepage} {akktex}}
\DeclareOption {longpage} {\PassOptionsToPackage {longpage} {akktex}}

\DeclareOption* {\OptionNotUsed} % don't forward unknown options

% Ausfuehrung von Optionen
\ProcessOptions

% Laden von Paketen
\LoadClass[a4paper]{report}
%\LoadClass[a4paper,twoside,openright]{report}
%\LoadClass[a4paper,twoside,openright,clearpageempty]{scrreprt}
\RequirePackage{akkcommand}
\RequirePackage{akkconditional}
\RequirePackage{akksection}

\RequirePackage{akktex}
\RequirePackage{akkgerman}

\RequirePackage{fancyhdr}
\RequirePackage[palatino,nogrey]{quotchap}
\RequirePackage{nextpage}

% ---------------------------------------------------------
% definition of the abstract: use original paragraph values
% ---------------------------------------------------------
\let \akk@orig@abstract    \abstract
\let \akk@orig@endabstract \endabstract
\forcenewenvironment {abstract} {%
    \akk@setoriginalvalues%
    \akk@orig@abstract%
}{%
    \akk@orig@endabstract%
    \akk@setdefaultvalues%
}
% ---------------------------------------------------------

% ---------------------------------------------------------
% definition of the \maketitle command
% ---------------------------------------------------------
\newcommand \akk@maketitle {%
    \normalsize%
    \begin{center}%
        \begin{Huge}%
            \bfseries%
            \@title\makebox[0pt]{\phantom{Mg}}%
            \\%
        \end{Huge}%
        \vspace{2.5ex}%
        \begin{Large}%
            \bfseries%
            \begin{tabular}[t]{c}%
                \@author\makebox[0pt]{\phantom{Mg}}%
            \end{tabular}%
            \\%
        \end{Large}%
        \ifbooltrue{akk@datetitle} {%
            \vspace{3ex}%
            \begin{large}%\bfseries%
                \@date\\%
            \end{large}%
        }%
        \vspace{2ex}%
    \end{center}%
    \forcenewcommand \maketitle \relax%
}
% ---------------------------------------------------------

\newboolean{intitle}

% section numbers until level 3
\setcounter{secnumdepth}{3}

\let\kapitel\chapter

\akk@newsectiontype {teilkapitel} {
	\akk@sectiontype@level              {2}
	\akk@sectiontype@beforeheadingskip  {3.25ex \@plus  1ex \@minus .2ex}
	\akk@sectiontype@afterheadingskip   { 1.5ex \@plus .2ex}
	\akk@sectiontype@headingindentation {0pt}
	\akk@sectiontype@indentfirstpar     {false}
	\akk@sectiontype@embeddedpar        {false}
	\akk@sectiontype@headingstyle       {\normalfont\large\bfseries\intitletrue}
	\akk@sectiontype@parenttype         {chapter}
	\akk@sectiontype@tocline            {\@dottedtocline{3}{3.8em}{3.2em}}
	\akk@sectiontype@mark               {\akk@diplom@teilkapitelmark}
}
\newcommand \akk@diplom@teilkapitelmark[1] {\markright{\theteilkapitel\quad #1}}

\akk@newsectiontype {abschnitt} {
	\akk@sectiontype@level              {3}
	\akk@sectiontype@beforeheadingskip  {3.25ex \@plus  1ex \@minus .2ex}
	\akk@sectiontype@afterheadingskip   { 1.5ex \@plus .2ex}
	\akk@sectiontype@headingindentation {0pt}
	\akk@sectiontype@indentfirstpar     {false}
	\akk@sectiontype@embeddedpar        {false}
	\akk@sectiontype@headingstyle       {\normalfont\normalsize\bfseries\intitletrue}
	\akk@sectiontype@parenttype         {teilkapitel}
	\akk@sectiontype@tocline            {\@dottedtocline{4}{7.0em}{4.1em}}
}

\akk@newsectiontype {teilabschnitt} {
	\akk@sectiontype@level              {4}
	\akk@sectiontype@beforeheadingskip  { 2ex \@plus  1ex \@minus .2ex}
	\akk@sectiontype@afterheadingskip   {.3ex \@plus .2ex}
	\akk@sectiontype@headingindentation {0pt}
	\akk@sectiontype@indentfirstpar     {false}
	\akk@sectiontype@embeddedpar        {false}
	\akk@sectiontype@headingstyle       {\normalfont\normalsize\bfseries\intitletrue}
	\akk@sectiontype@parenttype         {abschnitt}
	\akk@sectiontype@tocline            {\@dottedtocline{5}{10em}{5em}}
}

% header settings
\pagestyle{fancy}                   % using fancy headers
\fancyhf{}                          % clear header and footer
\fancyhead[LE,RO]{\textbf\thepage}  % page numbers at the header extremities
\fancyhead[RE]{\textbf\leftmark}    % chapter title on the even pages
\fancyhead[LO]{\textbf\rightmark}   % section title on the odd pages
\renewcommand\headrulewidth{0.8pt}  % fat header line (default: 0.4pt)

% remove headers from empty pages
\let\akk@orig@cleardoublepage\cleardoublepage
\renewcommand \cleardoublepage {\newpage{\pagestyle{empty}\akk@orig@cleardoublepage}} 

% chapter mark (must be defined below some other command, which one???)
\renewcommand \chaptermark[1] {\markboth{\thechapter\hspace{1.5em}#1}{}}
\renewcommand \sectfont \bfseries % bold chapter heading

\makeatother
