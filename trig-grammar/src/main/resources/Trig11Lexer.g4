lexer grammar Trig11Lexer;

/* [19] */
IRIREF
    : '<' ( ~('\u0000'..'\u0020' | '<' | '>' | '"' | '{' | '}' | '|' | '^' | '`' | '\\') | UCHAR)* '>'
    ;

/* [139s] */
PNAME_NS
    : PN_PREFIX? ':'
    ;

/* [140s] */
PNAME_LN
    : PNAME_NS PN_LOCAL
    ;

/* [141s] */
BLANK_NODE_LABEL
    : '_:' (PN_CHARS_U | ('0'..'9') ) ((PN_CHARS | DOT)* PN_CHARS)?
    ;

fragment
DOT
    : '.'
    ;

/* [144s] */
LANGTAG
    : '@' [a-zA-Z]+ ('-' [a-zA-Z0-9]+)*
    ;

/* [20] */
INTEGER
    : [+-]? [0-9]+
    ;

/* [21] */
DECIMAL
    : [+-]? ([0-9]* '.' [0-9]+)
    ;

/* [22] */
DOUBLE
    : [+-]? ([0-9]+ '.' [0-9]* EXPONENT | '.' [0-9]+ EXPONENT | [0-9]+ EXPONENT)
    ;

/* [154s] */
EXPONENT
    : [eE] [+-]? [0-9]+
    ;

/* [23] */
STRING_LITERAL_QUOTE
    : '"' ([^#x22#x5C#xA#xD] | ECHAR | UCHAR)* '"'
    ;

/* [24] */
STRING_LITERAL_SINGLE_QUOTE
    : '\'' ([^#x27#x5C#xA#xD] | ECHAR | UCHAR)* '\''
    ;

/* [25] */
STRING_LITERAL_LONG_SINGLE_QUOTE
    : '\'\'\'' (('\'' | '\'\'')? (~('\'' | '\\') | ECHAR | UCHAR))* '\'\'\''
    ;

/* [26] */
STRING_LITERAL_LONG_QUOTE
    : '"""' (('"' | '""')? (~('"' | '\\') | ECHAR | UCHAR))* '"""'
    ;

/* [27] */
UCHAR
    : '\u' HEX HEX HEX HEX
    | '\U' HEX HEX HEX HEX HEX HEX HEX HEX
    ;

/* [159s] */
ECHAR
    : '\' [tbnrf"'\]
    ;

/* [160s] */
NIL
    : '(' WS* ')'
    ;

/* [161s] */
WS
    : '\u0020'
    | '\u0009'
    | '\u000D'
    | '\u000A'
    ;

/* [162s] */
ANON
    : '[' WS* ']'
    ;

/* [163s] */
PN_CHARS_BASE
    : [A-Z]
    | [a-z]
    | [#00C0-#00D6]
    | [#00D8-#00F6]
    | [#00F8-#02FF]
    | [#0370-#037D]
    | [#037F-#1FFF]
    | [#200C-#200D]
    | [#2070-#218F]
    | [#2C00-#2FEF]
    | [#3001-#D7FF]
    | [#F900-#FDCF]
    | [#FDF0-#FFFD]
    | [#10000-#EFFFF]
    ;

/* [164s] */
PN_CHARS_U
    : PN_CHARS_BASE
    | '_'
    ;

/* [166s] */
PN_CHARS
    : PN_CHARS_U
    | '-'
    | [0-9]
    | #00B7
    | [#0300-#036F]
    | [#203F-#2040]
    ;

/* [167s] */
PN_PREFIX
    : PN_CHARS_BASE ((PN_CHARS | '.')* PN_CHARS)?
    ;

/* [168s] */
PN_LOCAL
    : (PN_CHARS_U | ':' | [0-9] | PLX) ((PN_CHARS | '.' | ':' | PLX)* (PN_CHARS | ':' | PLX))?
    ;

/* [169s] */
PLX
    : PERCENT
    | PN_LOCAL_ESC
    ;

/* [170s] */
PERCENT
    : '%' HEX HEX
    ;

/* [171s] */
HEX
    : [0-9]
    | [A-F]
    | [a-f]
    ;

/* [172s] */
PN_LOCAL_ESC
    : '\' ('_' | '~' | '.' | '-' | '!' | '$' | '&' | "'" | '(' | ')' | '*' | '+' | ',' | ';' | '=' | '/' | '?' | '#' | '@' | '%')
    ;
