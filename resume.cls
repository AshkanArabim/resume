\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2023/03/18 v0.1 Resume class]

\LoadClass[12pt,letterpaper]{article} % Font size and paper type

% set document margins
\usepackage[left=0.4in,top=0.3in,right=0.4in,bottom=0.2in]{geometry}
\usepackage[parfill]{parskip} % Remove paragraph indentation

\usepackage{keycommand}
\usepackage{changepage}
\usepackage{xstring}
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=black,
}

% Load the fontspec package to set the font
% \usepackage[scaled]{helvet} % Load the Helvetica font
\usepackage{fourier}
% \renewcommand\familydefault{\sfdefault} % Set the default font family to sans-serif
\usepackage[T1]{fontenc} % Use the T1 font encoding to ensure proper character rendering

\pagestyle{empty}

\def \separator {\textbf{\Large\textbullet}}

\newcommand\printNameTitle[1]{%
    \begingroup
    \hfill{\Huge\bfseries #1}\hfill
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
    \printNameTitle{\textrm{\commandkey{fullname}}}
    \printContactInformation
}

\newcommand{\summary}[1]{
    \textbf{\MakeUppercase{Summary}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
    #1
}

\newkeycommand{\skillItem}[category, skills]{
    {\small {\bf \commandkey{category}:} {\commandkey{skills}}}
}

\newenvironment{workSection}[1]{%
    % \vspace{-0.2em}\par
    \textbf{\MakeUppercase{#1}}
    \vspace{0.2em}\par
    \hrule
    \vspace{-0.3em}%
    \begin{adjustwidth}{1em}{1em} % <-- add indent here
        \begin{list}{}{%
            \setlength{\leftmargin}{0em} % section content margin
        }%
        \item[]%
}{%
        \end{list}%
    \end{adjustwidth}%
}

\newkeycommand{\experienceItem}[company, position, location, duration]{
    % \textbf{\commandkey{company}, \commandkey{location}: \commandkey{position}} \hfill {\commandkey{duration}}
    % \textbf{\commandkey{position}: \commandkey{company}, \commandkey{location}} \hfill {\commandkey{duration}}
    \textbf{\commandkey{company}: \commandkey{position}} \hfill {\commandkey{duration} | \commandkey{location}}
    % \textbf{\commandkey{company}: \commandkey{position}} \hfill {\commandkey{duration}}
}

\newkeycommand{\customItem}[title, duration, keyHighlight, technologies]{
    \textbf{\commandkey{title}}%
    \ifcommandkey{technologies}{\commandkey{technologies}}{}%
    \hfill {\commandkey{duration}} % //
    % \ifcommandkey{keyHighlight}{\commandkey{keyHighlight}}{}
}
