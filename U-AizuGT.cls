%%
%% IMPORTANT NOTICE:
%%
%% You are *not* allowed to modify this file.
%% You are *not* allowed to distribute this file.
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{U-AizuGT}[
2011/12/08 Ver 1.1.1 University of Aizu Graduation Thesis format]

\newif\if@ams
\@amsfalse
\DeclareOption{ams}{\@amstrue}
\newif\if@proofmode
\@proofmodefalse
\DeclareOption{proof}{\@proofmodetrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\if@proofmode%
\LoadClass[12pt,a4paper]{article}
\renewcommand{\baselinestretch}{2}
\else
\LoadClass[10pt,a4paper,twocolumn]{article}
\fi
%%
%% Setting text area
%%
\headsep=15pt     % 25pt  -> 15pt
\topmargin=11.5mm   % 17pt  -> 10pt -> 11.5mm
\textheight=210mm % 598pt -> 630pt -> 650pt -> 210mm
\textwidth=160mm  % 452pt -> 460pt -> 160mm
\columnsep=20pt   % 10pt -> 20pt

\oddsidemargin=0.43cm  
\evensidemargin=0.43cm  

\newif\if@receveddate
\@receveddatefalse
\def\received#1#2{\def\@rmonth{#1}\def\@ryear{#2}\@receveddatetrue}
\gdef\@received{\ifcase\@rmonth\or
  January\or February\or March\or April\or May\or June\or July\or August\or
  September\or October\or November\or December\fi
  ,\space\number\@ryear}
\newcount\@year \@year = \year
\ifnum\month > 8
    \advance\@year by 1
\fi
\gdef\@rauto{\ifcase\month\or
    March\or March\or March\or August\or August\or August\or August\or
    August\or March\or March\or March\or March\fi
    ,\space\number\@year}

%%
%% Using Times-Roman font family
%%
\RequirePackage{times}
\if@ams%
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\fi
\RequirePackage{txfonts}

%%
%% magic words
%%
\@ifundefined{kanjiskip}{}{%
    \DeclareFontShape{JY1}{mc}{m}{sl}{<->ssub*mc/m/n}{}
    \DeclareFontShape{JY1}{mc}{m}{it}{<->ssub*mc/m/n}{}
    \DeclareFontShape{JT1}{mc}{m}{sl}{<->ssub*mc/m/n}{}
    \DeclareFontShape{JT1}{mc}{m}{it}{<->ssub*mc/m/n}{}
    \DeclareFontShape{JY1}{gt}{m}{sl}{<->ssub*gt/m/n}{}
    \DeclareFontShape{JY1}{gt}{m}{it}{<->ssub*gt/m/n}{} 
    \DeclareFontShape{JT1}{gt}{m}{sl}{<->ssub*gt/m/n}{}
    \DeclareFontShape{JT1}{gt}{m}{it}{<->ssub*gt/m/n}{}
}

%%
%% Header
%%
\pagestyle{headings}
\pagenumbering{arabic}

\renewcommand{\sectionmark}[1]{\markboth{\@studentid}{\@studentid}
  \if@receveddate\else\let\@received\@rauto\fi}
\let\@mkboth\@gobbletwo
\let\@oddfoot\@empty
\let\@evenfoot\@empty
\def\@oddhead{{\slshape\small
    University of Aizu, Graduation
    Thesis. \@received}\hfill\leftmark\hfill{\rm\thepage}}
\def\@evenhead{{\slshape\small
    University of Aizu, Graduation
    Thesis. \@received}\hfill\rightmark\hfill{\rm\thepage}}

%%
%% title
%%
\def\studentid#1{\gdef\@studentid{#1}}
\gdef\@studentid{\@latex@warning@no@line{%
    No \noexpand\studentid given}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\gdef\@supervisor{\@latex@warning@no@line{%
    No \noexpand\supervisor given}}
\gdef\@author{\@latex@warning@no@line{%
    No \noexpand\author given}}

\renewcommand{\maketitle}{\par
  \begingroup
     \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
      \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      \long\def\@makefntext##1{\parindent 1em\noindent
              \hb@xt@1.8em{%
                  \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
       \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\studentid\relax
  \global\let\supervisor\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
    {\huge \@title \par}%
    \vskip 0.5em%
    \hrule height .15mm%
    \vskip 0.5em%
    {\Large
      \@author\hspace{10mm}%
      \@studentid\hfill{\small Supervised by }\@supervisor}%
  \par \vskip 0.5em}

\renewcommand{\section}{\@startsection {section}{1}{\z@}%
  {-1.3ex}{1.5ex}{\normalfont\Large\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
  {-1.05ex}{0.7ex}{\normalfont\large\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
  {-1.05ex}{0.7ex}{\normalfont\normalsize\bfseries}}
\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
  {1.05ex}{-1em}{\normalfont\normalsize\bfseries}}
\renewcommand{\subparagraph}{\@startsection{subparagraph}{5}{\parindent}%
  {1.05ex}{-1em}{\normalfont\normalsize\bfseries}}

\endinput
%%
%% End of file `GT.cls'
