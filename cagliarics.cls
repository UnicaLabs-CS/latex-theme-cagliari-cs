%% Class with recommanded format for a UNICA Computer Science thesis

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cagliarics}[2016/07/10 Cagliari CS]

%% Font size
\DeclareOption{12pt}{
  \PassOptionsToClass{\CurrentOption}{book}
}

%% Fallback
\DeclareOption*{
  \ClassWarning{myclass}{Unknown option '\CurrentOption'}
}

%% Execute default options
\ExecuteOptions{12pt}

%% Process given options
\ProcessOptions\relax

%% Load base class
\LoadClass[a4paper]{book}

%% Additional packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[pagestyles]{titlesec}
\RequirePackage{multicol}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage[a4paper,width=150mm,top=25mm,bottom=30mm,left=25mm,right=25mm]{geometry}
\RequirePackage[nottoc,notlot,notlof]{tocbibind}

%% Styles
\fancypagestyle{unica}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyhead[LE,RO]{\nouppercase{\leftmark}}
    \fancyfoot[LE,RO]{\thepage}
}
\fancypagestyle{plain}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[LE,RO]{\thepage}
}
\pagestyle{unica}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}

%% Commands
% metadata
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\candidate}[1]{\def\@candidate{#1}}
\newcommand{\candidateNo}[1]{\def\@candidateNo{#1}}
\newcommand{\academicYear}[1]{\def\@academicYear{#1}}
% chapters
\let\stdchapter\chapter
\def\nostarchapter[#1]#2{\stdchapter[{#1}]{#2} \pagestyle{unica}}
\def\starchapter#1{\stdchapter*{{#1}} \pagestyle{plain}}
\renewcommand*\chapter{\@ifstar{\starchapter}{\@dblarg\nostarchapter}}

%% Class code
\graphicspath{ {media/} }

\newcommand{\frontPage}{
    \begin{titlepage}
        \begin{center}
            \vspace*{1cm}
            \includegraphics[width=3cm]{Logo_UNICA.png} \\[4ex]
            \textsc{\LARGE \textbf{Università degli Studi di Cagliari}} \\[2ex]
            \textsc{\large \textbf{Facoltà di Scienze}} \\[2ex]
            Corso di Laurea in Informatica

            \vfill
            {\LARGE \textbf{\@title}}
            \vfill

    	    \begin{minipage}{.45\textwidth}
                \begin{flushleft}
                    \centering
    		        \textbf{Docente di riferimento:} \\
    		        Prof. \@supervisor \\
                    ~
                \end{flushleft}
            \end{minipage}
            \begin{minipage}{.45\textwidth}
                \begin{flushright}
                    \centering
                    \textbf{Candidato:} \\
                    \@candidate \\
                    (matr. \@candidateNo)
                \end{flushright}
    	    \end{minipage}

            \vfill
            \textsc{Anno Accademico \@academicYear}
            \vspace{1cm}

        \end{center}
    \end{titlepage}
}

\endinput
