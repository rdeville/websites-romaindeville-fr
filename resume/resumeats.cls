% ==============================================================================
% R. Deville - Resume Template ATS Friendly
% Based on Rover : https://github.com/subidit/rover-resume
% ==============================================================================

% CLASS OPTIONS
% ------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resumeats}
\LoadClass{article}

% REQUIRED PACKAGES
% ------------------------------------------------------------------------------
\RequirePackage{fontspec}
\RequirePackage[utf8]{inputenc}
\RequirePackage{ifthen}
% \RequirePackage{tikz}
% \usetikzlibrary{arrows}
% \RequirePackage[skins]{tcolorbox}       % somehow required for tikz to work at all
% \RequirePackage{graphicx}
% \RequirePackage{xcolor}
% \RequirePackage{xstring}
\RequirePackage{fontawesome5}
% \RequirePackage{academicons}
% \RequirePackage{xpatch}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=blue-800,
  filecolor=magenta,
  urlcolor=blue-800,
}

\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
% Default sizes, margins, ...
\newlength\marginleft
\newlength\marginright
\newlength\margintop
\newlength\marginbottom

\RequirePackage{geometry}
\setlength\marginleft{1cm}
\setlength\marginright{\marginleft}
\setlength\margintop{1cm}
\setlength\marginbottom{\margintop}

\geometry{
  a4paper,
  margin=1in,
  left=\marginleft,
  right=\marginright,
  top=\margintop,
  bottom=\marginbottom
}

% Font customization
\def\custommainfont{Carlito}
\def\customnerdfont{FiraCode Nerd Font}

% Convenience functions to use fontawesome5 icons
\renewcommand{\fa}[1]{
  \faIcon[solid]{#1}
}

% CONFIGURATION
% ------------------------------------------------------------------------------
\titlespacing{\subsection}{0pt}{*0}{*0} % remove vertical spacing above and below
\titlespacing{\subsubsection}{0pt}{*0}{*0}
\titleformat{\section}{\large\bfseries\uppercase}{}{}{}[\titlerule]
\titleformat*{\subsubsection}{\large\itshape}
\setlist[itemize]{noitemsep}
\pagestyle{empty} % remove page number

% COLORS
% ------------------------------------------------------------------------------
% Define tailwind UI colors
\definecolor{slate-50}{HTML}{f8fafc} % #f8fafc
\definecolor{slate-100}{HTML}{f1f5f9} % #f1f5f9
\definecolor{slate-200}{HTML}{e2e8f0} % #e2e8f0
\definecolor{slate-300}{HTML}{cbd5e1} % #cbd5e1
\definecolor{slate-400}{HTML}{94a3b8} % #94a3b8
\definecolor{slate-500}{HTML}{64748b} % #64748b
\definecolor{slate-600}{HTML}{475569} % #475569
\definecolor{slate-700}{HTML}{334155} % #334155
\definecolor{slate-800}{HTML}{1e293b} % #1e293b
\definecolor{slate-900}{HTML}{0f172a} % #0f172a
\definecolor{slate-950}{HTML}{020617} % #020617
\definecolor{gray-50}{HTML}{f9fafb} % #f9fafb
\definecolor{gray-100}{HTML}{f3f4f6} % #f3f4f6
\definecolor{gray-200}{HTML}{e5e7eb} % #e5e7eb
\definecolor{gray-300}{HTML}{d1d5db} % #d1d5db
\definecolor{gray-400}{HTML}{9ca3af} % #9ca3af
\definecolor{gray-500}{HTML}{6b7280} % #6b7280
\definecolor{gray-600}{HTML}{4b5563} % #4b5563
\definecolor{gray-700}{HTML}{374151} % #374151
\definecolor{gray-800}{HTML}{1f2937} % #1f2937
\definecolor{gray-900}{HTML}{111827} % #111827
\definecolor{gray-950}{HTML}{030712} % #030712
\definecolor{zinc-50}{HTML}{fafafa} % #fafafa
\definecolor{zinc-100}{HTML}{f4f4f5} % #f4f4f5
\definecolor{zinc-200}{HTML}{e4e4e7} % #e4e4e7
\definecolor{zinc-300}{HTML}{d4d4d8} % #d4d4d8
\definecolor{zinc-400}{HTML}{a1a1aa} % #a1a1aa
\definecolor{zinc-500}{HTML}{71717a} % #71717a
\definecolor{zinc-600}{HTML}{52525b} % #52525b
\definecolor{zinc-700}{HTML}{3f3f46} % #3f3f46
\definecolor{zinc-800}{HTML}{27272a} % #27272a
\definecolor{zinc-900}{HTML}{18181b} % #18181b
\definecolor{zinc-950}{HTML}{09090b} % #09090b
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
\definecolor{stone-50}{HTML}{fafaf9} % #fafaf9
\definecolor{stone-100}{HTML}{f5f5f4} % #f5f5f4
\definecolor{stone-200}{HTML}{e7e5e4} % #e7e5e4
\definecolor{stone-300}{HTML}{d6d3d1} % #d6d3d1
\definecolor{stone-400}{HTML}{a8a29e} % #a8a29e
\definecolor{stone-500}{HTML}{78716c} % #78716c
\definecolor{stone-600}{HTML}{57534e} % #57534e
\definecolor{stone-700}{HTML}{44403c} % #44403c
\definecolor{stone-800}{HTML}{292524} % #292524
\definecolor{stone-900}{HTML}{1c1917} % #1c1917
\definecolor{stone-950}{HTML}{0c0a09} % #0c0a09
\definecolor{red-50}{HTML}{fef2f2} % #fef2f2
\definecolor{red-100}{HTML}{fee2e2} % #fee2e2
\definecolor{red-200}{HTML}{fecaca} % #fecaca
\definecolor{red-300}{HTML}{fca5a5} % #fca5a5
\definecolor{red-400}{HTML}{f87171} % #f87171
\definecolor{red-500}{HTML}{ef4444} % #ef4444
\definecolor{red-600}{HTML}{dc2626} % #dc2626
\definecolor{red-700}{HTML}{b91c1c} % #b91c1c
\definecolor{red-800}{HTML}{991b1b} % #991b1b
\definecolor{red-900}{HTML}{7f1d1d} % #7f1d1d
\definecolor{red-950}{HTML}{450a0a} % #450a0a
\definecolor{orange-50}{HTML}{fff7ed} % #fff7ed
\definecolor{orange-100}{HTML}{ffedd5} % #ffedd5
\definecolor{orange-200}{HTML}{fed7aa} % #fed7aa
\definecolor{orange-300}{HTML}{fdba74} % #fdba74
\definecolor{orange-400}{HTML}{fb923c} % #fb923c
\definecolor{orange-500}{HTML}{f97316} % #f97316
\definecolor{orange-600}{HTML}{ea580c} % #ea580c
\definecolor{orange-700}{HTML}{c2410c} % #c2410c
\definecolor{orange-800}{HTML}{9a3412} % #9a3412
\definecolor{orange-900}{HTML}{7c2d12} % #7c2d12
\definecolor{orange-950}{HTML}{431407} % #431407
\definecolor{amber-50}{HTML}{fffbeb} % #fffbeb
\definecolor{amber-100}{HTML}{fef3c7} % #fef3c7
\definecolor{amber-200}{HTML}{fde68a} % #fde68a
\definecolor{amber-300}{HTML}{fcd34d} % #fcd34d
\definecolor{amber-400}{HTML}{fbbf24} % #fbbf24
\definecolor{amber-500}{HTML}{f59e0b} % #f59e0b
\definecolor{amber-600}{HTML}{d97706} % #d97706
\definecolor{amber-700}{HTML}{b45309} % #b45309
\definecolor{amber-800}{HTML}{92400e} % #92400e
\definecolor{amber-900}{HTML}{78350f} % #78350f
\definecolor{amber-950}{HTML}{451a03} % #451a03
\definecolor{yellow-50}{HTML}{fefce8} % #fefce8
\definecolor{yellow-100}{HTML}{fef9c3} % #fef9c3
\definecolor{yellow-200}{HTML}{fef08a} % #fef08a
\definecolor{yellow-300}{HTML}{fde047} % #fde047
\definecolor{yellow-400}{HTML}{facc15} % #facc15
\definecolor{yellow-500}{HTML}{eab308} % #eab308
\definecolor{yellow-600}{HTML}{ca8a04} % #ca8a04
\definecolor{yellow-700}{HTML}{a16207} % #a16207
\definecolor{yellow-800}{HTML}{854d0e} % #854d0e
\definecolor{yellow-900}{HTML}{713f12} % #713f12
\definecolor{yellow-950}{HTML}{422006} % #422006
\definecolor{lime-50}{HTML}{f7fee7} % #f7fee7
\definecolor{lime-100}{HTML}{ecfccb} % #ecfccb
\definecolor{lime-200}{HTML}{d9f99d} % #d9f99d
\definecolor{lime-300}{HTML}{bef264} % #bef264
\definecolor{lime-400}{HTML}{a3e635} % #a3e635
\definecolor{lime-500}{HTML}{84cc16} % #84cc16
\definecolor{lime-600}{HTML}{65a30d} % #65a30d
\definecolor{lime-700}{HTML}{4d7c0f} % #4d7c0f
\definecolor{lime-800}{HTML}{3f6212} % #3f6212
\definecolor{lime-900}{HTML}{365314} % #365314
\definecolor{lime-950}{HTML}{1a2e05} % #1a2e05
\definecolor{green-50}{HTML}{f0fdf4} % #f0fdf4
\definecolor{green-100}{HTML}{dcfce7} % #dcfce7
\definecolor{green-200}{HTML}{bbf7d0} % #bbf7d0
\definecolor{green-300}{HTML}{86efac} % #86efac
\definecolor{green-400}{HTML}{4ade80} % #4ade80
\definecolor{green-500}{HTML}{22c55e} % #22c55e
\definecolor{green-600}{HTML}{16a34a} % #16a34a
\definecolor{green-700}{HTML}{15803d} % #15803d
\definecolor{green-800}{HTML}{166534} % #166534
\definecolor{green-900}{HTML}{14532d} % #14532d
\definecolor{green-950}{HTML}{052e16} % #052e16
\definecolor{emerald-50}{HTML}{ecfdf5} % #ecfdf5
\definecolor{emerald-100}{HTML}{d1fae5} % #d1fae5
\definecolor{emerald-200}{HTML}{a7f3d0} % #a7f3d0
\definecolor{emerald-300}{HTML}{6ee7b7} % #6ee7b7
\definecolor{emerald-400}{HTML}{34d399} % #34d399
\definecolor{emerald-500}{HTML}{10b981} % #10b981
\definecolor{emerald-600}{HTML}{059669} % #059669
\definecolor{emerald-700}{HTML}{047857} % #047857
\definecolor{emerald-800}{HTML}{065f46} % #065f46
\definecolor{emerald-900}{HTML}{064e3b} % #064e3b
\definecolor{emerald-950}{HTML}{022c22} % #022c22
\definecolor{teal-50}{HTML}{f0fdfa} % #f0fdfa
\definecolor{teal-100}{HTML}{ccfbf1} % #ccfbf1
\definecolor{teal-200}{HTML}{99f6e4} % #99f6e4
\definecolor{teal-300}{HTML}{5eead4} % #5eead4
\definecolor{teal-400}{HTML}{2dd4bf} % #2dd4bf
\definecolor{teal-500}{HTML}{14b8a6} % #14b8a6
\definecolor{teal-600}{HTML}{0d9488} % #0d9488
\definecolor{teal-700}{HTML}{0f766e} % #0f766e
\definecolor{teal-800}{HTML}{115e59} % #115e59
\definecolor{teal-900}{HTML}{134e4a} % #134e4a
\definecolor{teal-950}{HTML}{042f2e} % #042f2e
\definecolor{cyan-50}{HTML}{ecfeff} % #ecfeff
\definecolor{cyan-100}{HTML}{cffafe} % #cffafe
\definecolor{cyan-200}{HTML}{a5f3fc} % #a5f3fc
\definecolor{cyan-300}{HTML}{67e8f9} % #67e8f9
\definecolor{cyan-400}{HTML}{22d3ee} % #22d3ee
\definecolor{cyan-500}{HTML}{06b6d4} % #06b6d4
\definecolor{cyan-600}{HTML}{0891b2} % #0891b2
\definecolor{cyan-700}{HTML}{0e7490} % #0e7490
\definecolor{cyan-800}{HTML}{155e75} % #155e75
\definecolor{cyan-900}{HTML}{164e63} % #164e63
\definecolor{cyan-950}{HTML}{083344} % #083344
\definecolor{sky-50}{HTML}{f0f9ff} % #f0f9ff
\definecolor{sky-100}{HTML}{e0f2fe} % #e0f2fe
\definecolor{sky-200}{HTML}{bae6fd} % #bae6fd
\definecolor{sky-300}{HTML}{7dd3fc} % #7dd3fc
\definecolor{sky-400}{HTML}{38bdf8} % #38bdf8
\definecolor{sky-500}{HTML}{0ea5e9} % #0ea5e9
\definecolor{sky-600}{HTML}{0284c7} % #0284c7
\definecolor{sky-700}{HTML}{0369a1} % #0369a1
\definecolor{sky-800}{HTML}{075985} % #075985
\definecolor{sky-900}{HTML}{0c4a6e} % #0c4a6e
\definecolor{sky-950}{HTML}{082f49} % #082f49
\definecolor{blue-50}{HTML}{eff6ff} % #eff6ff
\definecolor{blue-100}{HTML}{dbeafe} % #dbeafe
\definecolor{blue-200}{HTML}{bfdbfe} % #bfdbfe
\definecolor{blue-300}{HTML}{93c5fd} % #93c5fd
\definecolor{blue-400}{HTML}{60a5fa} % #60a5fa
\definecolor{blue-500}{HTML}{3b82f6} % #3b82f6
\definecolor{blue-600}{HTML}{2563eb} % #2563eb
\definecolor{blue-700}{HTML}{1d4ed8} % #1d4ed8
\definecolor{blue-800}{HTML}{1e40af} % #1e40af
\definecolor{blue-900}{HTML}{1e3a8a} % #1e3a8a
\definecolor{blue-950}{HTML}{172554} % #172554
\definecolor{indigo-50}{HTML}{eef2ff} % #eef2ff
\definecolor{indigo-100}{HTML}{e0e7ff} % #e0e7ff
\definecolor{indigo-200}{HTML}{c7d2fe} % #c7d2fe
\definecolor{indigo-300}{HTML}{a5b4fc} % #a5b4fc
\definecolor{indigo-400}{HTML}{818cf8} % #818cf8
\definecolor{indigo-500}{HTML}{6366f1} % #6366f1
\definecolor{indigo-600}{HTML}{4f46e5} % #4f46e5
\definecolor{indigo-700}{HTML}{4338ca} % #4338ca
\definecolor{indigo-800}{HTML}{3730a3} % #3730a3
\definecolor{indigo-900}{HTML}{312e81} % #312e81
\definecolor{indigo-950}{HTML}{1e1b4b} % #1e1b4b
\definecolor{violet-50}{HTML}{f5f3ff} % #f5f3ff
\definecolor{violet-100}{HTML}{ede9fe} % #ede9fe
\definecolor{violet-200}{HTML}{ddd6fe} % #ddd6fe
\definecolor{violet-300}{HTML}{c4b5fd} % #c4b5fd
\definecolor{violet-400}{HTML}{a78bfa} % #a78bfa
\definecolor{violet-500}{HTML}{8b5cf6} % #8b5cf6
\definecolor{violet-600}{HTML}{7c3aed} % #7c3aed
\definecolor{violet-700}{HTML}{6d28d9} % #6d28d9
\definecolor{violet-800}{HTML}{5b21b6} % #5b21b6
\definecolor{violet-900}{HTML}{4c1d95} % #4c1d95
\definecolor{violet-950}{HTML}{2e1065} % #2e1065
\definecolor{purple-50}{HTML}{faf5ff} % #faf5ff
\definecolor{purple-100}{HTML}{f3e8ff} % #f3e8ff
\definecolor{purple-200}{HTML}{e9d5ff} % #e9d5ff
\definecolor{purple-300}{HTML}{d8b4fe} % #d8b4fe
\definecolor{purple-400}{HTML}{c084fc} % #c084fc
\definecolor{purple-500}{HTML}{a855f7} % #a855f7
\definecolor{purple-600}{HTML}{9333ea} % #9333ea
\definecolor{purple-700}{HTML}{7e22ce} % #7e22ce
\definecolor{purple-800}{HTML}{6b21a8} % #6b21a8
\definecolor{purple-900}{HTML}{581c87} % #581c87
\definecolor{purple-950}{HTML}{3b0764} % #3b0764
\definecolor{fuchsia-50}{HTML}{fdf4ff} % #fdf4ff
\definecolor{fuchsia-100}{HTML}{fae8ff} % #fae8ff
\definecolor{fuchsia-200}{HTML}{f5d0fe} % #f5d0fe
\definecolor{fuchsia-300}{HTML}{f0abfc} % #f0abfc
\definecolor{fuchsia-400}{HTML}{e879f9} % #e879f9
\definecolor{fuchsia-500}{HTML}{d946ef} % #d946ef
\definecolor{fuchsia-600}{HTML}{c026d3} % #c026d3
\definecolor{fuchsia-700}{HTML}{a21caf} % #a21caf
\definecolor{fuchsia-800}{HTML}{86198f} % #86198f
\definecolor{fuchsia-900}{HTML}{701a75} % #701a75
\definecolor{fuchsia-950}{HTML}{4a044e} % #4a044e
\definecolor{pink-50}{HTML}{fdf2f8} % #fdf2f8
\definecolor{pink-100}{HTML}{fce7f3} % #fce7f3
\definecolor{pink-200}{HTML}{fbcfe8} % #fbcfe8
\definecolor{pink-300}{HTML}{f9a8d4} % #f9a8d4
\definecolor{pink-400}{HTML}{f472b6} % #f472b6
\definecolor{pink-500}{HTML}{ec4899} % #ec4899
\definecolor{pink-600}{HTML}{db2777} % #db2777
\definecolor{pink-700}{HTML}{be185d} % #be185d
\definecolor{pink-800}{HTML}{9d174d} % #9d174d
\definecolor{pink-900}{HTML}{831843} % #831843
\definecolor{pink-950}{HTML}{500724} % #500724
\definecolor{rose-50}{HTML}{fff1f2} % #fff1f2
\definecolor{rose-100}{HTML}{ffe4e6} % #ffe4e6
\definecolor{rose-200}{HTML}{fecdd3} % #fecdd3
\definecolor{rose-300}{HTML}{fda4af} % #fda4af
\definecolor{rose-400}{HTML}{fb7185} % #fb7185
\definecolor{rose-500}{HTML}{f43f5e} % #f43f5e
\definecolor{rose-600}{HTML}{e11d48} % #e11d48
\definecolor{rose-700}{HTML}{be123c} % #be123c
\definecolor{rose-800}{HTML}{9f1239} % #9f1239
\definecolor{rose-900}{HTML}{881337} % #881337
\definecolor{rose-950}{HTML}{4c0519} % #4c0519
\definecolor{white}{HTML}{ffffff} % #ffffff
\definecolor{black}{HTML}{000000} % #000000

% Basic colors
\colorlet{section-title}{slate-800}
\colorlet{calendar}{slate-700}
\colorlet{location}{stone-900}
\colorlet{midrules}{gray-300}
\colorlet{endrules}{gray-500}

% Sidebar specific color
\colorlet{contact-icon}{red-900}
\colorlet{job-company}{slate-800}
\colorlet{job-position}{lime-900}

\colorlet{volunteer-organization}{slate-800}
\colorlet{volunteer-position}{lime-900}

\colorlet{school-diploma}{lime-900}
\colorlet{school-name}{slate-800}

\colorlet{skill-fg}{red-900}
\colorlet{skill-bg}{gray-500}
\colorlet{skill-section}{green-800}

\colorlet{project-fg}{slate-800}
\colorlet{interest-fg}{slate-800}

\colorlet{tag-border}{green-500}

% HEADER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables for name, tag line and photo setup
\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\position}[1]{\def\@position{#1}}
\newcommand{\tagline}[1]{\def\@tagline{#1}}
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\phone}[1]{\def\@phone{#1}}
\newcommand{\location}[1]{\def\@location{#1}}
\newcommand{\driver}[1]{\def\@driver{#1}}
\newcommand{\link}[3]{
  \ifthenelse{\equal{#1}{home}}{\def\@home{#2}}{}
  \ifthenelse{\equal{#1}{gitlab}}{\def\@gitlab{#2}}{}
  \ifthenelse{\equal{#1}{github}}{\def\@github{#2}}{}
  \ifthenelse{\equal{#1}{linkedin}}{\def\@linkedin{#2}}{}
}
% NOT USED IN ATS BUT REQUIRED TO SHARE SAME HEADER !
\newcommand{\photo}[3][]{}

% Assemble the header
\newcommand{\makeheader}{% header bar is a minipage
  \begin{minipage}{\textwidth}
    \center
    {\Huge\bfseries\MakeUppercase{\@name}\par}
    \medskip
    \@tagline

    \medskip
    \fa{envelope} {\href{mailto:\@email}{\@email}} | \fa{phone} {\href{tel:\@phone}{\@phone}}

    \medskip
    \fa{linkedin} {\href{https://\@linkedin}{\@linkedin}}
    \fa{github} {\href{https://\@github}{\@github}}
    \fa{gitlab} {\href{https://\@gitlab}{\@gitlab}}
    \fa{home} {\href{https://\@home}{\@home}}

    \bigskip
  \end{minipage}
}

% ------------------------------------------------------------------------------
% Contact Info
% ------------------------------------------------------------------------------
\newcommand{\infofield}[2]{
  \textcolor{contact_icon}{#1} #2
}

% SECTIONS, SUBSECTIONS, AND MORE
% ------------------------------------------------------------------------------
% Redefine section in caps, bold and with rule below
\renewcommand{\section}[2][]{%
  {
    \Large\bfseries
    \color{section-title}
    \MakeUppercase{#2}
  }\\[-0.75em]
  \rule{\linewidth}{1.0pt}\par
  \medskip
}

\renewcommand{\subsection}[2][]{%
  {
    \large\bfseries
    \color{section-title}
    #2
  }\\[-0.75em]%
  \medskip
}

% Skills
% ------------------------------------------------------------------------------
\newcommand{\skill}[3]{
  % #1: Width
  % #2: Title
  % #3: Content, useful to use subskill
  \parbox[t]{0.15\linewidth}{%
    \textbf{#2}:
  }%
  \parbox[t]{0.80\linewidth}{%
    \vbox{#3}
  }%

}

\newcommand{\subskill}[3]{
  % #1: Font-awesome icon
  % #2: Image source
  % #3: Description
  #3,
}

\newcommand{\tag}[2]{}
\newcommand{\skilltag}[2]{}

  %
% % Format job list
% % ------------------------------------------------------------------------------
\newcommand{\jobcompany}[5]{%
  % #1: Name
  % #2: URL
  % #3: Location
  % #4: Date
  % #5: Duration
  \vbox{
    {%
      \large\bfseries\color{job-company}%
      \ifthenelse{\equal{#2}{}}{#1}{\href{#2}{#1}}%
    }\hfill #3
  }
  \smallskip
}

\newcommand{\jobposition}[5]{%
  % #1: Position
  % #2: Date
  % #3: Duration
  % #4: Description
  \vbox{
    {%
      \bfseries\color{job-position}#1
    } \hfill #3, #4
  }
  \smallskip

  \parbox[t]{.95\linewidth}{#5}

}
%
% % Format Volunteer list
% % ------------------------------------------------------------------------------
\newcommand{\volunteerorganization}[6]{%
  % #1: Image
  % #2: Name
  % #3: URL
  % #4: Organization Details
  % #5: Description
  % #6: Location
  % #7: Date
  % #8: Extra content (mainly to call \volunteerposition)
  \vbox{
    {%
      \large\bfseries\color{job-company}%
      \ifthenelse{\equal{#2}{}}{#1}{\href{#2}{#1}}%
    }\hfill #4
  }

  \smallskip
}

\newcommand{\volunteerposition}[4]{%
  % #1: Position
  % #2: Date
  % #3: Duration
  % #4: Description
  \vbox{
    {%
      \bfseries\color{job-position}#1
    } \hfill #2, #3
  }
  \smallskip

  \vbox{#4}

}
%
% % Format education list
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\schooldiploma}[4]{%
  % #1: Not Handled ??? DO NOT KNOW WHY
  % #2: Diploma
  % #3: Date
  % #5: Description
  \vbox{
    \textbf{#1}, #3 \hfill \textbf{#2}
  }
}

\newcommand{\interest}[3]{%
  \parbox{0.9\linewidth}{
    \textbf{#1}, #2
    \smallskip
  }

}

\newcommand{\project}[4]{%
  \vbox{
    \href{#4}{\textbf{#1}}, #2
  }

}

\newcommand{\lang}[3]{
  \textbf{#1}: #2

}

% % tag (framed word or phrase)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% % adapted from AltaCV: https://github.com/liantze/AltaCV
% \newcommand{\tag}[1]{%
%   \tikz[baseline]\node[anchor=base,draw=body!30,rounded corners,inner
%   xsep=1ex,inner ysep =0.75ex,text height=1.5ex,text depth=.25ex]{#1};
% }
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  THE END
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% vim: ft=tex.latex
