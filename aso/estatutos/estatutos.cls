\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{estatutos}[2026/10/16 by arf20 based on 2020/05/17 by G. Baker]

\LoadClass[12pt]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Optional arguments

% draft argument to create a draft watermark
\RequirePackage{draftwatermark}
\DeclareOption{draft}{
  \SetWatermarkText{BORRADOR}
}

%% Use the report class as a base. All options passed to this file get
%% passed to  the report class
%%%%%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Margins

\RequirePackage[
  left=1.2in,
  right=1.2in,
  top=1.2in,
  bottom=1.2in,
  ]{geometry}

\RequirePackage{setspace}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Typefaces

\RequirePackage[T1]{fontenc}
\RequirePackage[osf]{libertinus-type1}
\RequirePackage{microtype}
\SetTracking{encoding=T1, shape=sc}{60}
\SetTracking{encoding=T1, family=*}{10}

% Title typeface: Display variant, spaced for all-caps titles
\newcommand{\TitleFont}{%
  \libertinusDisplay
  \spaceskip=1.3\fontdimen2\font
    plus 1.3\fontdimen3\font
    minus 1.3\fontdimen4\font
  \lsstyle
}

% General-purpose display typeface, without added tracking
\newcommand{\DisplayFont}{\libertinusDisplay}

% Standard Libertinus Serif, spaced for all-caps headings
\newcommand{\CAPS}{%
  \spaceskip=1.05\fontdimen2\font
    plus 1.05\fontdimen3\font
    minus 1.05\fontdimen4\font
  \lsstyle
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Spacing

% Enable single space after a period.
\frenchspacing
% Increase spacing between lines a bit
\linespread{1.1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Format document title

% The usual \title command produces a cover sheet. I recommend using
% this only when multiple documents (such as a constitution and bylaws)
% are combined into one document

\renewcommand{\maketitle}{
  \begin{titlepage}
    \begin{center}
      \vspace*{13\baselineskip}
      {\LARGE \TitleFont \MakeUppercase{\@title}\par}
      \vspace{1.5em}
      {\LARGE \DisplayFont \@date \par}
    \end{center}
  \end{titlepage}
}

% The \doctitle command produces a title heading at the start of a page
% and can be used multiple times in a file
%\newcounter{chaptergroup}
\newcommand{\doctitle}[2][]{
  % reset the article (chapter) counter and page counter
  \setcounter{chapter}{0}
  %\renewcommand*{\theHhapter}{chX.\the\value{chapter}}
  %\newcounter{articlegroup}
  %\renewcommand*{\theHchapter}{group\arabic{articlegroup}.\arabic{chapter}}
  %\renewcommand*{\theHchapter}{group\arabic{chaptergroup}.\arabic{chapter}}
  \counterwithout*{section}{chapter}
  \setcounter{page}{2}
  % format the title
  \centerline{\large \TitleFont
      \MakeUppercase{#2}}
  \centerline{{\large \DisplayFont #1}}
  \vspace{\baselineskip}
  }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up article and section formats

\RequirePackage[explicit]{titlesec}
\RequirePackage{etoolbox}  % Don't remember why this is needed
% Required for conditional statements for headings with optional titles
\RequirePackage{xifthen}
% changes formatting or Article heading so as to not take an entire page
\makeatletter
\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}
\makeatother

%% Restyle the report class's chapter heading as an Article heading
\renewcommand{\thechapter}{\Roman{chapter}}
\titleformat{\chapter}[display]
{\CAPS\fillast\scshape}
{\uppercase{Capítulo} \thechapter}{0pt}{\uppercase{#1}\\}[]
\titlespacing{\chapter}
{0pt}{0pt}{0pt}

%% Create an article command that both calls the report chapter command
%% and creates a label for cross-referencing
\newcommand{\article}[1]{\chapter{#1}\label{#1}}
%% Define the preamble command (just makes an unnumbered article)
\newcommand{\preamble}{\chapter*{Preamble}}

%% Restyle the section heading
\renewcommand{\thesection}{\arabic{section}}
\titleformat{\section}[runin]
{\normalfont\bfseries}
{Art. \textbf{\thesection.-}}{.3em}
{\ifthenelse{\equal{#1}{}}{}{\textbf{#1.}}}
\titlespacing{\section}
{0pt}{0pt}{0.7em}

%% Restyle the enumerate environment for subsections
\RequirePackage{paralist}
\RequirePackage{enumitem}

% Removes the vertical white space between subsections
\setlist{nolistsep}
% Changes the indent of the subsections
\setdefaultleftmargin{4em}{3.17em}{1.7em}{1.7em}{1em}{1em}
% Changes the numbering styles for subsections and sections
\renewcommand{\labelenumi}{\theenumi\textbf{.-}}
\renewcommand{\theenumi}{\textbf{\thesection.\arabic{enumi}}}
\renewcommand{\labelenumii}{\theenumii\textbf{.-}}
\renewcommand{\theenumii}{\textbf{\theenumi.\arabic{enumii}}}
\renewcommand{\theenumiii}{\textbf{\Alph{enumiii}}}

%% The \sub command augments the \item command, allowing for a title
\newcommand{\sub}[1][]{
  \ifthenelse{\equal{#1}{}}{\item}{\item\textbf{#1.}}
  }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Other stuff

% For automatic reference links
\RequirePackage{hyperref}
%\hypersetup{hypertexnames=false}
% automatically format article cross-reference
\newcommand{\artref}[1]{Art. \ref{#1}}

% For optional line numbers
\RequirePackage{lineno}
