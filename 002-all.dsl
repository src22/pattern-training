#47 Adaptive Model
Arrange blocks of code
in a data structure
to implement an alternative computational model.

#Alternative Tokenization
Alter the lexing behavior
from within the parser.

#42 Annotation
Data about program elements,
such as classes and methods,
which can be processed during
compilation or execution.

#BNF
Formally define the syntax
of a programming language.

#44 Class Symbol Table
Use a class and its fields
to implement a symbol table
in order to support
type-aware autocompletion
in a statically typed language.

#37 Closure
A block of code that can be represented
as an object (or first-class data structure)
and placed seamlessly into the flow of code
by allowing it to reference its lexical scope.

#Construction Builder
Incrementally create an immutable object with a builder that stores constructor arguments in fields.

#Context Variable
Use a variable to hold context required during a parse.

#48 Decision Table
Represent a combination of conditional statements
in a tabular form.

#Delimiter-Directed Translation
Translate source text by breaking it up into chunks (usually lines) and then parsing each chunk.

#49 Dependency Network
A list of tasks
linked by dependency relationships.
To run a task,
you invoke its dependencies,
running those tasks as prerequisites.

#41 Dynamic Reception
Handle messages without defining them
in the receiving class.

#Embedded Interpretation
Embed interpreter actions into the grammar, so that executing the parser causes the text to be directly interpreted to produce the response.

#Embedded Translation
Embed output production code into the parser, so that the output is produced gradually as the parse runs.

#Embedment Helper
An object that minimizes code in a templating system by providing all needed functions to that

#32 Expression Builder
An object, or family of objects,
that provides a fluent interface
over a normal command-query API.

#Foreign Code
Embed some foreign code into an external DSL to provide more elaborate behavior than can be specified in the DSL.

#33 Function Sequence
A combination of function calls
as a sequence of statements.

#Generation Gap
Separate generated code from non-generated code by inheritance.

#46 Literal Extension
Add methods to program literals.

#39 Literal List
Represent language expression
with a literal list.

#40 Literal Map
Represent an expression
as a literal map.

#Macro
Transform input text into a different text before language processing using Templated Generation .

#35 Method Chaining
Make modifier methods
return the host object,
so that multiple modifiers
can be invoked
in a single expression.

#Model Ignorant Generation
Hardcode all logic into the generated code so that there's no explicit representation of the Semantic Model .

#Model-Aware Generation
Generate code with an explicit simulacrum of the semantic model of the DSL, so that the generated code has generic-specific separation.

#38 Nested Closure
Express statement subelements
of a function call
by putting them into
a closure in an argument.

#34 Nested Function
Compose functions
by nesting function calls
as arguments of other calls.

#Nested Operator Expression
An operator expression that can recursively contain the same form of expression (for example, arithmetic and Boolean expressions).

#30 Newline Separators
Use newlines
as statement separators.

#Notification
Collects errors and other messages to report back to the caller.

#36 Object Scoping
Place the DSL script so that
bare references
will resolve to a single object.

#43 Parse Tree Manipulation
Capture the parse tree of a code fragment
to manipulate it
with DSL processing code.

#Parser Combinator
Create a top-down parser by a composition of parser objects.

#Parser Generator
Build a parser driven by a grammar file as a DSL.

#50 Production Rule System
Organize logic
through a set of production rules,
each having a condition and an action.

#Recursive Descent Parser
Create a top-down parser using control flow for grammar operators and recursive functions for nonterminal recognizers.

#Regex Table Lexer
Implement a lexical analyzer using a list of regular expressions.

#Semantic Model
The model that's populated by a DSL.

#51 State Machine
Model a system
as a set of explicit states
with transitions between them.

#Symbol Table
A location to store all identifiable objects during a parse to resolve references.

#Syntax-Directed Translation
Translate source text by defining a grammar and using that grammar to structure translation.

#Templated Generation
Generate output by handwriting an output file and placing template callouts to generate variable portions.

#45 Textual Polishing
Perform simple textual substitutions
before more serious processing.

#Transformer Generation
Generate code by writing a transformer that navigates the input model and produces output.

#Tree Construction
The parser creates and returns a syntax tree representation of the source text that is manipulated later by tree-walking code.
