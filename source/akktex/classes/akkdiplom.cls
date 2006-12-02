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
\RequirePackage{ifthen}
\RequirePackage{akkconditional}
\RequirePackage{akkgerman}

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
\LoadClass[a4paper]{article}

\RequirePackage{akktex}

% ---------------------------------------------------------
% definition of the abstract: use original paragraph values
% ---------------------------------------------------------
\let \akk@orig@abstract    \abstract
\let \akk@orig@endabstract \endabstract
\renewenvironment {abstract} {%
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
    \renewcommand \maketitle \relax%
}
% ---------------------------------------------------------

% \akk@startsection{<name>}{<ebene>}{<einzug>}{<einziehen?>}{<vorabstand>}{<eingebettet?>}{<nachabstand>}{stil}
\newcommand \kapitel       {\akk@startsection {kapitel}       {1} {0pt} {false} {\akk@@beforesectionskip}       {false} {\akk@@aftersectionskip}       {\normalfont\Large\bfseries}}
\newcommand \teilkapitel   {\akk@startsection {teilkapitel}   {2} {0pt} {false} {\akk@@beforesubsectionskip}    {false} {\akk@@aftersubsectionskip}    {\normalfont\large\bfseries}}
\newcommand \abschnitt     {\akk@startsection {abschnitt}     {3} {0pt} {false} {\akk@@beforesubsubsectionskip} {false} {\akk@@aftersubsubsectionskip} {\normalfont\normalsize\bfseries}}
\newcommand \teilabschnitt {\akk@startsection {teilabschnitt} {4} {0pt} {false} {\akk@@beforeparagraphskip}     {false} {\akk@@afterparagraphskip}     {\normalfont\bfseries}}

\makeatother
