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
