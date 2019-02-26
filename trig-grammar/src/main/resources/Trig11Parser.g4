parser grammar Trig11Parser;

/* [1g] */
trigDoc
 	: (directive | block)*
 	;

/* [2g] */
block
    : triplesOrGraph
    | wrappedGraph
    | triples2
    | "GRAPH" labelOrSubject wrappedGraph
    ;

/* [3g] */
triplesOrGraph
    : labelOrSubject (wrappedGraph | predicateObjectList '.')

/* [4g] */
triples2
    : blankNodePropertyList predicateObjectList? '.'
    | collection predicateObjectList '.'
    ;

/* [5g] */
wrappedGraph
    : '{' triplesBlock? '}'
    ;

/* [6g] */
triplesBlock
    : triples ('.' triplesBlock?)?
    ;

/* [7g] */
labelOrSubject
    : iri
    | BlankNode
    ;

/* [3] */
directive
    : prefixID
    | base
    | sparqlPrefix
    | sparqlBase
    ;

/* [4] */
prefixID
    : '@prefix' PNAME_NS IRIREF '.'
    ;

/* [5] */
base
    : '@base' IRIREF '.'
    ;

/* [5s] */
sparqlPrefix
    : "PREFIX" PNAME_NS IRIREF
    ;

/* [6s] */
sparqlBase
    : "BASE" IRIREF
    ;

/* [6] */
triples
    : subject predicateObjectList
    | blankNodePropertyList predicateObjectList?
    ;

/* [7] */
predicateObjectList
    : verb objectList (';' (verb objectList)?)*
    ;

/* [8] */
objectList
    : object (',' object)*
    ;

/* [9] */
verb
    : predicate | 'a'
    ;

/* [10] */
subject
    : iri
    | blank
    ;

/* [11] */
predicate
    : iri
    ;

/* [12] */
object
    : iri
    | blank
    | blankNodePropertyList
    | literal
    ;

/* [13] */
literal
    : RDFLiteral
    | NumericLiteral
    | BooleanLiteral
    ;

/* [14] */
blank
    : BlankNode
    | collection
    ;

/* [15] */
blankNodePropertyList
    : '[' predicateObjectList ']'
    ;

/* [16] */
collection
    : '(' object* ')'
    ;

/* [17] */
NumericLiteral
    : INTEGER
    | DECIMAL
    | DOUBLE
    ;

/* [128s] */
RDFLiteral
    : String (LANGTAG | '^^' iri)?
    ;

/* [133s] */
BooleanLiteral
    : 'true'
    | 'false'
    ;

/* [18] */
String
    : STRING_LITERAL_QUOTE
    | STRING_LITERAL_SINGLE_QUOTE
    | STRING_LITERAL_LONG_SINGLE_QUOTE
    | STRING_LITERAL_LONG_QUOTE
    ;

/* [135s] */
iri
    : IRIREF
    | PrefixedName
    ;

/* [136s] */
PrefixedName
    : PNAME_LN
    | PNAME_NS
    ;

/* [137s] */
BlankNode
    : BLANK_NODE_LABEL
    | ANON
    ;
