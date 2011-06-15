%%  Hazel hacked this script to remove the () in Supervisor(s) as she
% does have two main supervisors
% reinstated  ``this thesis is accepted'' and removed vertical spacing
% so it looks like the sample title page in 2009 guidelines
% changed thesis to dissertation and changed capitalisation to match
% 2009 guidelines
%
% unbthesis v1.0
% By Wendy (WenXiang) Yang <wyang@unb.ca>
% Version 1.0 released 2005/11/10
%-------------------------- identification ---------------------
%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unbthesis}[2005/11/10 v1.0 UNB LaTex Thesis class]
%-------------------------- Declaration of options -----------------------
%This class uses a report standard class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax \LoadClass{article}
%-----------------------Package loading---------------------------------
\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{amssymb}
\usepackage{setspace}
%%-------------------page setup-----------------------------------------
%\usepackage[left=4cm, right=2.5cm, top=2.5cm, bottom=2.5cm]{geometry}
%
%%---------------------define command in the title page--------------------
\newcommand
{\submittext}{A Dissertation Submitted in Partial Fulfilment of the
  Requirements\\ for the Degree of}
\newcommand{\thesisnote}{by}
\newcommand{\gaunote}{in the Graduate Academic Unit of }
\newcommand{\acceptnote}{This dissertation is accepted by the}
\newcommand{\dean}{Dean of Graduate Studies}
\newcommand{\school}{THE UNIVERSITY OF NEW BRUNSWICK}
%
%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.
%
% candidate's previous degree
\def\predegree#1{\gdef\@predegree{#1}}
%
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
%
% The name of your Graduate Academic Unit(eg. Computer Science, Maths, Physics)
\def\gau#1{\gdef\@gau{#1}}
%
%your supervisor including name, degree department or field
\def\supervisor#1{\gdef\@supervisor{#1}}
%
%examining board including name, degree department or field starting from Chair
\def\examboard#1{\gdef\@examboard{#1}}
%
%external examiner including name, degree, department or field and Institution
\def\externalexam#1{\gdef\@externalexam{#1}}
%
%copyright including name of candiate and year of graduation
\def\copyrightyear#1{\gdef\@copyrightyear{#1}}
%define title page layout
%
\newcommand{\unbtitlepage}{%
\thispagestyle{empty}%
\begin{center}
\normalfont\Large\bfseries\@title\\
\vskip 2em
\normalfont\normalsize\thesisnote\\
\vskip 3em
\normalfont\normalsize\@author\\
\vskip 2em
\normalfont\normalsize\bfseries\@predegree\\
\vskip 3em
\normalfont\normalsize\bfseries\submittext\\
\vskip 3em
\normalfont\normalsize\bfseries\@degree\\
\vskip 2em
\normalfont\normalsize\gaunote \@gau\\
\vskip 2em
\end{center}
\begin{table}[!h]
\begin{tabular}{l l}
Supervisors: & \@supervisor \\
&\\
Examining Board: & \@examboard \\
&\\
\textbf{External Examiner:} & \@externalexam
%\@externalexam
\end{tabular}
\end{table}
\begin{center}
\vskip 3em
\normalfont\normalsize\acceptnote\\
%\vskip 3em
\normalfont\normalsize\dean\\
\vskip 2em
\normalfont\normalsize\bfseries\school\\
\vskip 1em
\normalfont\normalsize\bfseries\@date\\
\vskip 1em
\normalfont\normalsize\copyright \@author, \@copyrightyear
\end{center}}
%-----------end of Title page--------------------

