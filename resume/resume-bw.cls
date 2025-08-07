% R. Deville - Resume Template

% CLASS OPTIONS
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume-bw}
\def\classname{\string resume-bw}

% CLASS OPTIONS
% ------------------------------------------------------------------------------
% Option to have a single sided document, i.e. the highlight bar is always left
% or have a two sided document where the highlight bar is alternating, i.e.
% always on the same edge of the paper
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions*
\PassOptionsToClass{oneside}{scrartcl}
\LoadClass{scrartcl}

% REQUIRED PACKAGES
% ------------------------------------------------------------------------------
\RequirePackage{academicons}
\RequirePackage{enumitem}
\RequirePackage{fontawesome5}
\RequirePackage{fontspec}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage[bindingoffset=0cm, nomarginpar, noheadfoot]{geometry}
\RequirePackage{hyperref}
\RequirePackage{setspace}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{xcolor}
\RequirePackage{xpatch}
\RequirePackage{xstring}
% Configure hyperref colors
\hypersetup{
  colorlinks=true,
  linkcolor=neutral-800,
  filecolor=magenta,
  urlcolor=neutral-800,
}

% DEFINE GEOMETRY
% ------------------------------------------------------------------------------
\newlength\sidebarwidth
\newlength\headerheight
\newlength\sidebarinnerwidth
\setlength\sidebarwidth{5cm}
\setlength\sidebarinnerwidth{\dimexpr \sidebarwidth-1em}
\setlength\headerheight{3cm}

% Default sizes, margins, ...
\newlength\marginleft
\newlength\marginright
\newlength\margintop
\newlength\marginbottom

\setlength\marginleft{0cm}
\setlength\marginright{\marginleft}
\setlength\margintop{0cm}
\setlength\marginbottom{\margintop}

\geometry{
  left=\marginleft,
  right=\marginright,
  top=\margintop,
  bottom=\marginbottom
}

% Minipage has an annoying af indent that must be removed
\setlength{\parindent}{0pt}

% COLORS
% ------------------------------------------------------------------------------
% Define tailwind UI colors
\definecolor{blue-800}{HTML}{1e40af} % #1e40af
\definecolor{neutral-50}{HTML}{fafafa} % #fafafa
\definecolor{neutral-100}{HTML}{f5f5f5} % #f5f5f5
\definecolor{neutral-200}{HTML}{e5e5e5} % #e5e5e5
\definecolor{neutral-300}{HTML}{d4d4d4} % #d4d4d4
\definecolor{neutral-400}{HTML}{a3a3a3} % #a3a3a3
\definecolor{neutral-500}{HTML}{737373} % #737373
\definecolor{neutral-600}{HTML}{525252} % #525252
\definecolor{neutral-700}{HTML}{404040} % #404040
\definecolor{neutral-800}{HTML}{262626} % #262626
\definecolor{neutral-900}{HTML}{171717} % #171717
\definecolor{neutral-950}{HTML}{0a0a0a} % #0a0a0a
\definecolor{white}{HTML}{ffffff} % #ffffff
\definecolor{black}{HTML}{000000} % #000000

% Bar background and foreground
\colorlet{highlightbarcolor}{neutral-200}
\colorlet{header-bg}{neutral-300}
\colorlet{header-fg}{neutral-800}
\colorlet{sidebar-bg}{white}

% Basic colors
\colorlet{section-title}{neutral-800}
\colorlet{calendar}{neutral-700}
\colorlet{location}{neutral-900}
\colorlet{midrules}{neutral-300}
\colorlet{endrules}{neutral-500}

% Sidebar specific color
\colorlet{contact-icon}{neutral-900}
\colorlet{job-company}{neutral-800}
\colorlet{job-position}{neutral-900}

\colorlet{volunteer-organization}{neutral-800}
\colorlet{volunteer-position}{neutral-900}

\colorlet{school-diploma}{neutral-900}
\colorlet{school-name}{neutral-800}

\colorlet{skill-fg}{neutral-900}
\colorlet{skill-bg}{neutral-500}
\colorlet{skill-section}{neutral-800}

\colorlet{project-fg}{neutral-800}
\colorlet{interest-fg}{neutral-800}

\colorlet{tag-border}{neutral-500}

% Font customization
\def\custommainfont{Carlito}
\def\customnerdfont{FiraCode Nerd Font}

% Convenience functions to use fontawesome5 icons
\renewcommand{\fa}[1]{
  \faIcon[solid]{#1}
}

% HEADER
% ------------------------------------------------------------------------------
% Variables for name, tag line and photo setup
\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\position}[1]{\def\@position{#1}}
\newcommand{\tagline}[1]{\def\@tagline{#1}}
\newcommand{\photo}[3][]{\def\@photo{#2}\def\@photodiameter{#3}\def\@photoformat{#1}}

% Assemble the header
\newcommand{\makeheader}{%
  % Header bar is a minipage
  \colorbox{header-bg}{
    \parbox[t][\dimexpr \headerheight][c]{\linewidth}{%
      \color{header-fg}\bfseries
      \parbox[c][\headerheight][c]{\sidebarwidth}{%
        \ifdef{\@photo}{%
          \begin{center}
            \includegraphics[width=\@photodiameter]{site/bw/\@photo}%
          \end{center}
        }{}
      }
      \parbox[c][\headerheight][c]{\dimexpr \linewidth-1.1\sidebarwidth-1em}{%
        \centering
        \vfill
        {\Huge\MakeUppercase{\@name}\par}
        \vfill
        {\Large\@position\par}
        \vfill
        {\small\@tagline\par}
        \vfill
      }
    }
  }
}

% Sidebar
% ------------------------------------------------------------------------------
\newcommand{\sidebar}[1]{%
  \def\insidebar{true}
  \colorbox{sidebar-bg}{
    \hspace{1em}%
    \parbox[t][][l]{\sidebarwidth}{%
      #1%
    }%
  }%
}

% Main bar
% ------------------------------------------------------------------------------
\newcommand{\mainbar}[1]{%
  \def\insidebar{false}
  \hspace{1em}
  \parbox[t]{\dimexpr \textwidth-1.1\sidebarwidth-3em}{%
    #1%
  }
}

% Sections, subsections, and more
% ------------------------------------------------------------------------------
% Redefine section in caps, bold and with rule below
\renewcommand{\section}[2][]{%
  \parbox[t]{\linewidth}{
    \vspace{0.5em}
    \ifstrequal{#1}{}{}{
      \color{section-title}
      {\large \makebox[5mm][c]{#1}\hspace{0.5em}}}
    {\large\bfseries\MakeUppercase{#2}}\\[-0.75em]
    \rule{\linewidth}{1.0pt}\par
    \medskip
  }%
}

\renewcommand{\subsection}[2][]{%
  \parbox[t]{\linewidth}{
    \vspace{0.5em}
    \ifstrequal{#1}{}{}{\color{section-title}\makebox[5mm][c]{#1}\hspace{0.5em}}
    {\color{section-title}\bfseries#2}\\[-0.75em]%
    \medskip
  }%
}

% Contact Info
% ------------------------------------------------------------------------------
\newcommand{\infofield}[2]{%
  \parbox[t][][t]{\sidebarinnerwidth}{%
    \small%
    \parbox[t][1em][c]{1em}{
      \centering
      \color{contact-icon}{#1}%
    }
    \parbox[t][1em][c]{\dimexpr \linewidth-2em}{
      \hspace{0.25em}#2
    }
    \vspace{.5em}
  }
}

\newcommand{\email}[1]{\infofield{\fa{envelope}}{\href{mailto:#1}{#1}}}
\newcommand{\location}[1]{\infofield{\fa{map-marker-alt}}{#1}}
\newcommand{\driver}[1]{\infofield{\fa{car}}{#1}}
\newcommand{\phone}[1]{\infofield{\fa{phone}}{#1}}
\newcommand{\link}[3]{\infofield{\fa{#1}}{\ifthenelse{\equal{#3}{}}{#2}{\href{#3}{#2}}}}

% Format job list
% ------------------------------------------------------------------------------
\newcommand{\jobcompany}[6]{%
  % #1: Name
  % #2: URL
  % #3: Location
  % #4: Start-End Date
  % #5: Total Duration
  % #6: Description
  \parbox[t][][c]{\dimexpr \linewidth-1em}{
    \parbox[t][][c]{0.65\linewidth}{%
      \color{job-company}%
      \vspace{.25em}
      \large
      \ifthenelse{\equal{#2}{}}{%
        \fa{building} \textbf{#1}%
      }{%
        \href{#2}{\fa{building} \textbf{#1}}%
      }

      \small
      \color{location}%
      \fa{map-marker-alt}#3
    }%
    \hfill
    \parbox[t][][c]{0.3\linewidth}{%
      \raggedleft
      \small
      \color{calendar}
      \fa{calendar-alt} #4

      #5
    }
    \parbox[t][][c]{\linewidth}{%
      \ifthenelse{\equal{#6}{}}{}{
        \vspace{1em}

        #6

      }
    }
    \vspace{1em}
  }
}

\newcommand{\jobposition}[5]{%
  % #1: Position
  % #2: Team or subtitle
  % #3: Date
  % #4: Duration
  % #5: Description
  \parbox[t][][c]{\dimexpr \linewidth-1em}{
    \parbox[t][2.5em][t]{.70\linewidth}{
      \color{job-position}%
      \textbf{#1}

      \ifthenelse{\equal{#2}{}}{}{%
        #2%
      }%
    }
    \parbox[t][2.5em][t]{.25\linewidth}{
      \raggedleft
      \footnotesize
      \color{calendar}
      \fa{calendar-alt} #3 \\
      #4
    }
    \parbox[t]{\linewidth}{
      \small#5
    }
    \vspace{1em}
  }
}

% Format Volunteer list
% ------------------------------------------------------------------------------
\newcommand{\volunteerorganization}[6]{%
  % #1: Name or Acronym
  % #2: URL
  % #3: Full name of the organisation
  % #4: Location
  % #5: Start-End Date
  % #6: Total Duration
  \ifthenelse{\equal{\insidebar}{true}}{
    \parbox[t][][t]{\sidebarinnerwidth}{%
      \color{volunteer-organization}%
      \vspace{.25em}
      \ifthenelse{\equal{#2}{}}{%
        \fa{building} #1%
      }{%
        \href{#2}{\fa{building} #1}%
      }

      \small
      #3

      \vspace{1em}
    }
  }{
    \parbox[t][][c]{\dimexpr \linewidth-1em}{
      \parbox[t][][c]{0.65\linewidth}{%
        \color{volunteer-organization}%
        \vspace{.25em}
        \large
        \ifthenelse{\equal{#2}{}}{%
          \fa{building} \textbf{#1}%
        }{%
          \href{#2}{\fa{building} \textbf{#1}}%
        }

        \normalsize
        #3

        \small
        \color{location}%
        \fa{map-marker-alt}#4
      }%
      \hfill
      \parbox[t][][c]{0.3\linewidth}{%
        \raggedleft
        \small
        \color{calendar}
        \fa{calendar-alt} #5

        #6
      }
      \vspace{1em}
    }
  }
}

\newcommand{\volunteerposition}[4]{%
  % #1: Position
  % #2: Date
  % #3: Duration
  % #4: Description
  \ifthenelse{\equal{\insidebar}{true}}{
    \parbox[t][][t]{\sidebarinnerwidth}{%
      \color{volunteer-position}#1

      \footnotesize
      \color{calendar}
      \fa{calendar-alt} #2

      #3
      \vspace{1em}
    }
  }{
    \parbox[t][][c]{\dimexpr \linewidth-1em}{
      \parbox[t][2.5em][t]{.70\linewidth}{
        \color{volunteer-position}%
        \textbf{#1}
      }
      \parbox[t][2.5em][t]{.25\linewidth}{
        \raggedleft
        \footnotesize
        \color{calendar}
        \fa{calendar-alt} #2 \\
        #3
      }
      \parbox[t]{\linewidth}{
        \small#4
      }
      \vspace{1em}
    }
  }
}

% Education
% ------------------------------------------------------------------------------
\newcommand{\schooldiploma}[4]{%
  % #1: Diploma
  % #2: Date
  % #3: School Name
  % #4: School URL
  \parbox{\sidebarinnerwidth}{%
    \small
    \vspace{-1em}
    \parbox[t]{.24\linewidth}{%
      \color{calendar}\flushleft%
      \fa{calendar-alt} #2
    }%
    \hfill%
    \parbox[t]{.75\linewidth}{%
      \flushright
      {\color{school-diploma}\textbf{#1}}

      \vspace{-0.25em}
      {\scriptsize\color{school-name}\fa{school} #3}
    }
    \vspace{1em}
  }
}

% Interests
% ------------------------------------------------------------------------------
\newcommand{\interest}[3]{%
  % #1: Name
  % #2: Desc
  % #3: Icon
  \parbox[t][][t]{\sidebarinnerwidth}{%
    \color{interest-fg}
    \parbox[t][][c]{\dimexpr \linewidth-3em}{%
      \small
      \ifthenelse{\equal{#3}{}}{}{%
        \includegraphics[height=.75em]{sections/interests/bw/#3}%
      }
      #1
      \vspace{.25em}
    }

    \scriptsize%
    \linespread{.75}\selectfont
    #2
    \normalsize
    \vspace{1em}
  }
}

% Projects
% ------------------------------------------------------------------------------
\newcommand{\project}[4]{%
  % #1 : Name
  % #2 : Desc
  % #3 : Path to icon
  % #4 : URL
  \parbox[t][][t]{\dimexpr \linewidth-1em}{%
    \color{project-fg}
    \parbox[t][][c]{\dimexpr \linewidth-3em}{%
      \small
      \ifthenelse{\equal{#3}{}}{}{%
        \includegraphics[height=.75em]{sections/projects/bw/#3}%
      }
      \ifthenelse{\equal{#4}{}}{
        #1
      }{%
        \href{#4}{#1}
      }
      \vspace{.25em}
    }

    \scriptsize%
    \linespread{.75}\selectfont
    #2
    \normalsize
    \vspace{1em}
  }
}

% Language
% ------------------------------------------------------------------------------
\newcommand{\lang}[3]{
  % #1: Name
  % #2: Level
  % #3: Path to image
  \parbox[t]{\sidebarinnerwidth}{%
    \ifthenelse{\equal{#3}{}}{}{
      \includegraphics[width=2em,height=1em]{flags/bw/#3}
    }
    \textbf{#1}\hfill#2
    \vspace{1em}
  }
}

% Skills
% ------------------------------------------------------------------------------
\newcommand{\skill}[3]{
  % #1: Width
  % #2: Title
  % #3: Content, useful to use subskill
  \parbox[t]{#1}{%
    \centering#2

    \raggedright#3
  }
}

\newcommand{\subskill}[3]{
  % #1: Font-awesome icon
  % #2: Image source
  % #3: Description
  \parbox[t][1em][c]{1.5em}{%
    \centering%
    \ifthenelse{\equal{#2}{}}{%
      \fa{#1}%
    }{%
      \includegraphics[width=1em]{sections/skills/bw/#2}%
    }
  }
  \parbox[t][1em][c]{\dimexpr \linewidth-4em}{
    #3
  }

}

% Tag (framed word or phrase)
% ------------------------------------------------------------------------------
% Adapted from AltaCV: https://github.com/liantze/AltaCV
\newcommand{\tag}[2]{%
  \fcolorbox{tag-border!30}{white}{%
    \scriptsize
    \parbox[t][1em][c]{1em}{
      \includegraphics[width=1em,height=1em]{#1}
    }
    \parbox[t][1em][c]{0.1\linewidth}{
      #2
    }
  }
}

\newcommand{\skilltag}[2]{%
  \fcolorbox{tag-border!30}{white}{%
    \scriptsize
    \parbox[t][1em][c]{1em}{
      \includegraphics[width=1em,height=1em]{sections/skills/bw/#1}
    }
    \parbox[t][1em][c]{0.1\linewidth}{
      #2
    }
  }
}

% FINAL FORMATTING
% ------------------------------------------------------------------------------
\setlist[itemize]{noitemsep, topsep=0pt, leftmargin=2em}
\pagestyle{empty}
\setmainfont{\custommainfont}
\newfontfamily\nerdfont{\customnerdfont}

% vim: ft=tex.latex
