%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Submission (Lab Report/Assignemnts) format for University of Cincinnati
% Class file
% Version 0.1
% 09/06/2021
% Original author:
% Gaurav Atreya (atreyagv@mail.uc.edu)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unihw}[10/10/2021, v1.0]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{unisubmission}}
\ProcessOptions*
\LoadClass{unisubmission}
% Headers
\chead{}%

\rhead{\large\thepage}
\lhead{\@Author\xspace(\@Mnumber)}
% Footers
\rfoot{}%
\cfoot{\small\sffamily\bfseries{\@SubmissionType}\xspace\@SubmissionNumber{:}\xspace\@SubmissionName}%
\lfoot{}%

% ---------------------------------------------------------------------
\renewcommand{\maketitle}{%
  {\centering
  \colorbox{color2!10}{%
  \parbox{\textwidth-2\fboxsep-2\fboxrule}{%
    \centering
  {\small \@ClassCode : \@ClassName}

  
  {\Large \@ActivityType\xspace \@SubmissionNumber: \@SubmissionName}
  
  {\Huge \@ActivityType\xspace \@SubmissionType}
  
  {\small \@date}
}%
}}
}%
