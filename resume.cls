%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Vignesh Iyer                                 %
% MS CSE ASU                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2023/03/18 v0.1 Resume class]

\LoadClass[10pt,letterpaper]{article} % Font size and paper type

% set document margins
\usepackage[left=0.4in,top=0.3in,right=0.4in,bottom=0.3in]{geometry}
\usepackage[parfill]{parskip} % Remove paragraph indentation

\usepackage{keycommand}
\usepackage{xstring}
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=black,
}

% Load the fontspec package to set the font
\usepackage[scaled]{helvet} % Load the Helvetica font
\renewcommand\familydefault{\sfdefault} % Set the default font family to sans-serif
\usepackage[T1]{fontenc} % Use the T1 font encoding to ensure proper character rendering

\pagestyle{empty}

\def \separator {\textbf{\Large\textbullet}}

\newcommand\printNameTitle[1]{%
    \begingroup
    \hfill{\MakeUppercase{\Huge\bfseries #1}}\hfill
    \break
    \vspace{-1.5em}
    % \hrule
    \endgroup
}

\newcommand{\printContactInformation}{%
  \vspace{-0.3em} % remove vertical space above
  \begin{center}
    \ifcommandkey{phone}{%
        \commandkey{phone}%
        \ifcommandkey{email}{ \separator\ }%
            {\ifcommandkey{linkedin}{ \separator\ }%
                {\ifcommandkey{github}{ \separator\ }%
                    {}}}%
    }{}%
    % \ifcommandkey{site}{%
    %     % TODO 
    % }
    \ifcommandkey{email}{%
        \email{\commandkey{email}}%
            \ifcommandkey{linkedin}{ \separator\ }%
                {\ifcommandkey{github}{ \separator\ }}%
    }{}%
    \ifcommandkey{linkedin}{%
            \profilelink{\commandkey{linkedin}}%
            \ifcommandkey{github}{ \separator\ }{}%
    }{}%
    \ifcommandkey{github}{%
        \profilelink{\commandkey{github}}%
    }{}%
  \end{center}
}

\newcommand{\email}[1]{\href{mailto:#1}{#1}}
\newcommand{\profilelink}[1]{\href{https://#1}{#1}}

\newkeycommand{\introduction}[fullname,email,phone,linkedin,github,]{
    \printNameTitle{\commandkey{fullname}}
    \printContactInformation
}

\newcommand{\summary}[1]{
    \textbf{\MakeUppercase{Summary}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
    #1
}

\newcommand{\education}{
    \textbf{\MakeUppercase{Education}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
}

% note: this is such a useless annoying component I'd rather just not have it.
% \newkeycommand{\educationItem}[
% 	university,college,program,graduation,
%     % grade,
%     majorgrade,
% %	honors,
% 	coursework % TOGGLE FOR COURSEWORK
% ]{
%     \commandkey{program} \hfill {Graduating \commandkey{graduation}} \\
%     % {\commandkey{university}} \hfill \ifcommandkey{grade}{GPA: \commandkey{grade}}{} \\
%     %% vv nasty hack to make my 4.0 major GPA bold
%     {\commandkey{university}} \hfill \ifcommandkey{majorgrade}{\textbf{Major GPA: \commandkey{majorgrade}}}{} \\
%     % \ifcommandkey{majorgrade}{\rightline{Major GPA: \commandkey{majorgrade}}}{} % \\
%     % \vspace{-12pt} % ugly hack to get rid of the newline created by "\rightline" % TOGGLE FOR COURSEWORK
%     % \ifcommandkey{college}{\commandkey{college}}{} \\
%     \ifcommandkey{coursework}{Relevant coursework: \commandkey{coursework}}{} %\\ % TOGGLE FOR COURSEWORK
% %    \ifcommandkey{honors}{Honors \& Activities: \commandkey{honors}}{}
% }

\newcommand{\skills}{
    \textbf{\MakeUppercase{Skills}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
}

\newkeycommand{\skillItem}[category, skills]{
    {\bf \commandkey{category}:} {\commandkey{skills}}
}

\newenvironment{workSection}[1]{
  \textbf{\MakeUppercase{#1}}
  \vspace{0.4em}
  \hrule
  \vspace{-0.3em}
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{0em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

\newkeycommand{\experienceItem}[company, position, location, duration]{
    % \textbf{\commandkey{company}, \commandkey{location}: \commandkey{position}} \hfill {\commandkey{duration}}
    % \textbf{\commandkey{position}: \commandkey{company}, \commandkey{location}} \hfill {\commandkey{duration}}
    \textbf{\commandkey{company}: \commandkey{position}} \hfill {\commandkey{duration} | \commandkey{location}}
}

\newkeycommand{\customItem}[title, duration, keyHighlight]{
    \textbf{\commandkey{title}} \hfill {\commandkey{duration}} % //
    % \ifcommandkey{keyHighlight}{\commandkey{keyHighlight}}{}
}