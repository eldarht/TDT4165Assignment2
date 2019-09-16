# TDT4165Assignment2

Lexer, tokenizer, interpreter and Parser written in [oz](http://mozart.github.io/) for micro [dc](https://www.gnu.org/software/bc/manual/dc-1.05/html_mono/dc.html).

Task completion:

- task 1) a-f Are answered by [List.oz](List.oz)
- task 2) a-g Are answered by [Tokenizer.oz](Tokenizer.oz)
- task 3) a-b Are answered by [Infix.oz](Infix.oz)
- task 4) Is Answered by next section in the README.md

## Task 4

a) Formally describe the regular grammar of the lexemes in task 2.

```
<statement> ::=   ""
               |  <number> <number> <operator> <statement>
               |  <number> <topCmd> <statement>
               |  <stackCmd> <statement>

<operator>  ::=	  '+'
               |  '-'
               |  '*'
               |  '/'

<stackCmd>  ::=   'p'

<topCmd>  	::=   'i'
               |  '^'
               |  'd'

<number>    ::=   '0'
               |  <negativeNr>
               |  <positiveNr>

<negativeNr>::=   '~'<number>

<positiveNr>::=	^[1-9][0-9]*$

```
b) Describe the grammar of the infix notation in task 3 using (E)BNF. Beware of operator precedence. Is the grammar ambiguous? Explain why it is or is not ambiguous?

```
<statement> ::=   <number>
               |  (StatementH)
               |  <topCmd> <number>

<statementH>::=   <statement> <operatorH> <statement>
               |  <statementL>

<statementL>::=   <statement> <operatorL> <statement>

<operatorL>  ::=  '+'
               |  '-'

<operatorH>  ::=  '*'
               |  '/'

<topCmd>  	::=   'i'
               |  '^'

<number>    ::=   '0'
               |  <negativeNr>
               |  <positiveNr>

<negativeNr>::=   '~'<number>

<positiveNr>::=	^[1-9][0-9]*$


The grammar should not be ambigouse as each statement is either a number or encapsulated in
brackets and statementH can generate statementL but statementL can not generate statementH.
The grammar should not be able to generate two parstrees with the same result.
```

c) What is the difference between a context-sensitive and a context-free grammar?

```
Context sensitive grammars have rules where the variable changes depending on previous or following statements (context/setting). 
Rules in context-free grammrs only act on the variable itself.
```

d) You may have gotten float-int errors in task 2. If you haven’t, try running1+1.0.  Why does this happen?Why is this a useful error?

```
Float and int are not of the same type. This provides some type safety and can help locate bugs in ones code. 
In terms of grammar, it allows greater flexibility when formally defining usage rules and precedence. 
```