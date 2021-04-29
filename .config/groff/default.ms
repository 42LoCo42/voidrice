.\" Make heading 1 and 2 larger
.nr GROWPS 3
.nr PSINCR 1.5p

.\" Easier bulleted list
.de LI
.IP \(bu 2
..

.\" Indexed numbered heading
.\" Automatically add .NH to index
.de INH
.ds HEADING-TEXT \\$1
.shift
.NH \\$@
\\*[HEADING-TEXT]
.XS
\\*[SN-STYLE] \\*[HEADING-TEXT]
.XE
..

.\" Default delimiters and some nicer symbols
.EQ
delim $$
define · %
~ \[md] ~
%
define / %\[di]%
.EN

.\" Text background color
.de TEXTBG
.nr @wd \w'\\$1'
\h'.2m'\
\h'-.2m'\v'(.2m - \\n[rsb]u)'\
\D'P 0 -(\\n[rst]u - \\n[rsb]u + .4m) (\\n[@wd]u + .4m) 0 0 (\\n[rst]u - \\n[rsb]u + .4m) -(\\n[@wd]u + .4m) 0'\
\h'.2m'\v'-(.2m - \\n[rsb]u)'\
\\$1\
\h'.2m'
..
