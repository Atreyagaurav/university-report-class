%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Submission (Lab Report/Assignemnts) format for University of Cincinnati
% Class file
% Version 0.1
% 09/06/2021
% Original author:
% Gaurav Atreya (atreyagv@mail.uc.edu)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unisubmission}[10/10/2021, v1.2]
\RequirePackage{ifthen}
\RequirePackage{calc}
\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
\LoadClass{article}
\RequirePackage{ifpdf}      % Needed to pick between latex and pdflatex

%----------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------


\RequirePackage{times}      % Loads the Times-Roman Fonts
\RequirePackage{mathptmx}   % Loads the Times-Roman Math Fonts

%----------------------------------------------------------------------
%	VARIOUS USEFUL PACKAGES
%----------------------------------------------------------------------

\RequirePackage[fleqn]{amsmath}
\RequirePackage{amsfonts,amssymb}
\RequirePackage{graphicx,xcolor}
\RequirePackage[english]{babel}
\RequirePackage{booktabs}
\RequirePackage{parskip}
\RequirePackage{flushend}
\RequirePackage{tikz}
\RequirePackage{float}
\RequirePackage{wrapfig}
\RequirePackage{xspace}
\RequirePackage{csvsimple}
\RequirePackage{numprint}
\RequirePackage[mathletters]{ucs}
\RequirePackage[utf8x]{inputenc}
\RequirePackage{menukeys}       %needs to be loaded after inputenc according to docs
\RequirePackage{verbatim}
\RequirePackage{minted}

\RequirePackage[pdfusetitle]{hyperref} % Required for hyperlinks

\definecolor{color1}{RGB}{10,10,50} % Color of the article title and sections
\definecolor{color2}{RGB}{50,50,10} % Color of the boxes behind the abstract and headings	

%----------------------------------------------------------------------
%	MARGINS	
%----------------------------------------------------------------------
	  	  
\RequirePackage[left=0.75in,%
                right=0.75in,%
				top=1in,%
				bottom=1in,%
				headheight=11pt,%
				a4paper]{geometry}%

\setlength{\columnsep}{0.3in} % Distance between the two columns of text
\setlength{\fboxrule}{0.5pt} % Width of the border around the abstract

				
%----------------------------------------------------------------------
%	FIGURES AND TABLES CAPTIONS
%----------------------------------------------------------------------

\RequirePackage[labelfont={bf,sf,small},%
                labelsep=colon,	%
                justification=raggedright]{caption}
\setlength{\abovecaptionskip}{6pt}
\setlength{\belowcaptionskip}{0pt}

%----------------------------------------------------------------------
%	PAGE HEADER
%----------------------------------------------------------------------

\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers
% Headers
\chead{}%

\rhead{\small\sffamily\bfseries{\@SubmissionType}\xspace\@SubmissionNumber{:}\xspace\@SubmissionName}
\lhead{\small\sffamily\@ClassCode}
% Footers
\rfoot{\thepage}%
\cfoot{}%
\lfoot{\@Author\xspace(\@Mnumber)}%
\renewcommand{\headrulewidth}{0.5pt}% % thin header rule
\renewcommand{\footrulewidth}{0.5pt}% % thin footer rule

%----------------------------------------------------------------------
%	NUMBERS FORMATS AND SUCH
%----------------------------------------------------------------------

\npdecimalsign{.}
\nprounddigits{2}

\newcommand\ifPositivef[1]{
  \begingroup
  \pgfmathsetmacro{\var}{#1}
  \pgfmathparse{ifthenelse(\var>=0,1,0)}
  \ifdim\pgfmathresult pt= 1 pt
  \numprint{+#1}
  \else
  \numprint{#1}
  \fi
  \endgroup
}

\newcommand{\vecvalue}[3]{\numprint{#1}\hat{i}\ifPositivef{#2}\hat{j}\ifPositivef{#3}\hat{k}}
\newcommand{\vechz}[2]{\numprint{#1}\hat{i}\ifPositivef{#2}\hat{j}}
\newcommand{\vecijk}[3]{#1\hat{i}+#2\hat{j}+#3\hat{k}}
\newcommand{\vecany}[2]{#1\hat{#2}}



%----------------------------------------------------------------------
%	SECTION/SUBSECTION/PARAGRAPH SET-UP
%----------------------------------------------------------------------

\RequirePackage[explicit]{titlesec}

\titleformat{\section}
  {\color{color1}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\arabic{section}. #1}}}
  []
\titleformat{name=\section,numberless}
  {\color{color1}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering#1}}}
  []  
\titleformat{\subsection}
  {\color{color1}\sffamily\bfseries}
  {\thesubsection}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}
  {\sffamily\small\bfseries}
  {\thesubsubsection}
  {0.5em}
  {#1}
  []    
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1} 
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}


%----------------------------------------------------------------------
%  SPECIAL MARKDOWNS
%----------------------------------------------------------------------  
\newcommand\backt[1]{\underline{\texttt{#1}}}


%----------------------------------------------------------------------
%	LIST CONTROL
%----------------------------------------------------------------------  

\RequirePackage{enumitem}
%\setlist{nolistsep} % Uncomment to remove spacing between items in lists (enumerate, itemize)

%----------------------------------------------------------------------
%	TITLE PAGE
%----------------------------------------------------------------------  

\newcommand{\UniversityName}[1]{\def\@UniversityName{#1}}
\newcommand{\UniversityLogoImageFile}[1]{\def\@UniversityLogoImageFile{#1}}
\newcommand{\ClassCode}[1]{\def\@ClassCode{#1}}
\newcommand{\ClassName}[1]{\def\@ClassName{#1}}
\newcommand{\SubmissionType}[1]{\def\@SubmissionType{#1}}
\newcommand{\ActivityType}[1]{\def\@ActivityType{#1}}
\newcommand{\SubmissionNumber}[1]{\def\@SubmissionNumber{#1}}
\newcommand{\SubmissionName}[1]{\def\@SubmissionName{#1}}
\newcommand{\Author}[1]{\def\@Author{#1}}
\newcommand{\Mnumber}[1]{\def\@Mnumber{#1}}
\newcommand{\Keywords}[1]{\def\@Keywords{#1}}

% ---------------------------------------------------------------------
\usetikzlibrary{calc}
\renewcommand{\maketitle}{%
  \begin{titlepage}
    \begin{tikzpicture}[remember picture, overlay]
      \draw[line width = 3pt] ($(current page.north west) + (1.5cm,-1.5cm)$) rectangle ($(current page.south east) + (-1.5cm,1.5cm)$);
      \draw[line width = 1pt] ($(current page.north west) + (1.6cm,-1.6cm)$) rectangle ($(current page.south east) + (-1.6cm,1.6cm)$);
    \end{tikzpicture}
    
    \begin{center}
      \vspace{.5cm}
      {\huge \@UniversityName}
      % TODO put this as a variable and give its value at the end of this document for others to modify easily.

      \vspace{.5cm}
      \includegraphics[height=2.5cm]{\@UniversityLogoImageFile}

      \vspace{2cm}
      {\large \@ClassCode : \@ClassName}
      
      \vspace{.6cm}
      % {\Huge \@ActivityType\xspace \@SubmissionNumber: \@SubmissionName}
      {\Huge \@SubmissionName}

      \vspace{.4cm}
      {\huge \@ActivityType\xspace \@SubmissionType}
      
      \vfill
      {\small \underline{Submitted By}}

      \vspace{0.1cm}
      {\Large\bf \@Author}
      
      \vspace{.2cm}
      {\large\bf \@Mnumber}

      \vspace{.2cm}
      {\@date}
    \end{center}
  \end{titlepage}
}%

%----------------------------------------------------------------------
%	REFERENCES
%----------------------------------------------------------------------  

% Remove brackets from numbering in List of References
%\renewcommand{\@biblabel}[1]{\bfseries\color{color1}\textsuperscript{[#1]}}
\renewcommand{\@biblabel}[1]{\color{color1}[#1]}
%\setlength{\bibitemsep}{0cm}
\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
\addcontentsline{toc}{section}{\refname}%
\oldbibliography{#1}%
\setlength\itemsep{0pt}%
\fontsize{10}{10.5}\selectfont%
}


\graphicspath{{./graphics/}{./images/}} %Folder Containing the graphics files for /includegraphics{...}





% Draft Watermark

\newtoggle{draft}
\togglefalse{draft}

\iftoggle{draft}{
  \RequirePackage[printwatermark]{xwatermark}
  \newsavebox\mybox
  \savebox\mybox{\tikz[color=red,opacity=0.3]\node{DRAFT};}
  \newwatermark*[
  allpages,
  angle=45,
  scale=8,
  xpos=-20,
  ypos=15
  ]{\usebox\mybox}
}{}

%\newwatermark*[allpages,color=red!50,angle=45,scale=4,xpos=0,ypos=0]{DRAFT}


% For writing codes
\definecolor{codebg}{rgb}{0.90,1,0.90}
\definecolor{shellbg}{rgb}{1,.9,0.9}
\definecolor{outputbg}{rgb}{0.88,0.88,1}

\setminted[bash]{
  bgcolor=shellbg,
  breaklines=true,
  linenos,
  frame         = single                   ,
  framesep      = 1mm                      ,
  label         = \textrm{\textbf{command: shell}} ,
  labelposition = topline}

\setminted[python]{
  bgcolor=codebg,
  breaklines=true,
  linenos,
  texcl,
  frame         = single                   ,
  framesep      = 1mm                      ,
  label         = \textrm{\textbf{code: python}} ,
  labelposition = topline}

\setminted[r]{
  bgcolor=codebg,
  breaklines=true,
  linenos,
  frame         = single                   ,
  framesep      = 1mm                      ,
  label         = \textrm{\textbf{code: r}},
  labelposition = topline}

\setminted[common-lisp]{
  bgcolor=codebg,
  breaklines=true,
  linenos,
  frame         = single                   ,
  framesep      = 1mm                      ,
  label         = \textrm{\textbf{code: lisp}},
  labelposition = topline}

\setminted[text]{
  bgcolor=outputbg,
  breaklines=true,
  frame         = single                   ,
  framesep      = 1mm                      ,
  label         = \textrm{\textbf{output}} ,
  labelposition = topline
}



\setminted[julia]{
  bgcolor=codebg,
  breaklines=true,
  linenos,
  frame         = single                   ,
  framesep      = 1mm                      ,
  label         = \textrm{\textbf{code: julia}},
  labelposition = topline}

% newminted makes an alias of julia code as an environment juliacode,
% you can use org babel to wrap the output in juliaout and the output
% will use this environment instead. I think it might be better than
% using text src.
\newminted[juliaout]{julia}{
  bgcolor=outputbg,
  breaklines=true,
  frame         = single                   ,
  framesep      = 1mm                      ,
  linenos,
  label         = \textrm{\textbf{output: julia}} ,
  labelposition = topline
}

\usemintedstyle{emacs}


\hypersetup{hidelinks,colorlinks,breaklinks=true,urlcolor=color2,citecolor=color1,linkcolor=color1,bookmarksopen=false}
% Defining these as defaults for myself. Change it for other universities.
\UniversityName{University of Cincinnati}
\UniversityLogoImageFile{uc-logo.png}


%----------------------------------------------------------------------
%	MISC. Settings
%----------------------------------------------------------------------  
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000
