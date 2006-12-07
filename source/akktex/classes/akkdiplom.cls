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
\ProvidesClass{akkdiplom}[2006/12/02 v1.0.0 by Igor Akkerman (c) 2006 Class for typesetting german thesis works (Diplomarbeit).]
%=====================================================================================================================================

\makeatletter

% Initialisierungsteil
\RequirePackage{akkcommand}
\RequirePackage{akkconditional}
\RequirePackage{akksection}
\RequirePackage{fancyhdr}

\AtBeginDocument{}

% Deklaration von Optionen
\DeclareOption {10pt}     {\PassOptionsToClass   {10pt}     {book}}
\DeclareOption {11pt}     {\PassOptionsToClass   {11pt}     {book}}
\DeclareOption {12pt}     {\PassOptionsToClass   {12pt}     {book}}
\DeclareOption {draft}    {\PassOptionsToClass   {draft}    {book}}
\DeclareOption {final}    {\PassOptionsToClass   {final}    {book}}

\DeclareOption {widepage} {\PassOptionsToPackage {widepage} {akktex}}
\DeclareOption {longpage} {\PassOptionsToPackage {longpage} {akktex}}

\DeclareOption* {\OptionNotUsed} % don't forward unknown options

% Ausfuehrung von Optionen
\ProcessOptions

% Laden von Paketen
\LoadClass[a4paper]{book}
\RequirePackage{akkgerman}
\RequirePackage{akkparskip}

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

% section numbers until level 3
\setcounter{secnumdepth}{3}

% Section definitions
\akk@newsectiontype{kapitel} {
	\akk@sectiontype@level              {1}
	\akk@sectiontype@beforeheadingskip  {3.5ex \@plus  1ex \@minus .2ex}
	\akk@sectiontype@afterheadingskip   {2.3ex \@plus .2ex}
	\akk@sectiontype@headingindentation {0pt}
	\akk@sectiontype@indentfirstpar     {false}
	\akk@sectiontype@embeddedpar        {false}
	\akk@sectiontype@headingstyle       {\normalfont\Large\bfseries\underline}
	\akk@sectiontype@tocline            {\@dottedtocline{2}{1.5em}{2.3em}}
	\akk@sectiontype@counterformat      {\fbox{\Huge\bfseries\thekapitel}\quad}%
}

\akk@newsectiontype {teilkapitel} {
	\akk@sectiontype@level              {2}
	\akk@sectiontype@beforeheadingskip  {3.25ex \@plus  1ex \@minus .2ex}
	\akk@sectiontype@afterheadingskip   { 1.5ex \@plus .2ex}
	\akk@sectiontype@headingindentation {0pt}
	\akk@sectiontype@indentfirstpar     {false}
	\akk@sectiontype@embeddedpar        {false}
	\akk@sectiontype@headingstyle       {\normalfont\large\bfseries}
	\akk@sectiontype@parenttype         {kapitel}
	\akk@sectiontype@tocline            {\@dottedtocline{3}{3.8em}{3.2em}}
}

\akk@newsectiontype {abschnitt} {
	\akk@sectiontype@level              {3}
	\akk@sectiontype@beforeheadingskip  {3.25ex \@plus  1ex \@minus .2ex}
	\akk@sectiontype@afterheadingskip   { 1.5ex \@plus .2ex}
	\akk@sectiontype@headingindentation {0pt}
	\akk@sectiontype@indentfirstpar     {false}
	\akk@sectiontype@embeddedpar        {false}
	\akk@sectiontype@headingstyle       {\normalfont\normalsize\bfseries}
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
	\akk@sectiontype@headingstyle       {\normalfont\normalsize\bfseries}
	\akk@sectiontype@parenttype         {abschnitt}
%	\akk@sectiontype@tocline            {\@dottedtocline{5}{10em}{5em}}
}

\pagestyle{fancy}
\lhead{}

\makeatother
