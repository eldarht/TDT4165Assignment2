/**
 * @brief      Task 2.a solution. Transforms a string into a list of lexemes
 *
 * @param      Input  The string of lexems to transform
 *
 * @return     List of lexemes
 */
fun {Lex Input} 
  {String.tokens Input & }
end

/**
 * @brief      Task 2.b solution. Transforms a list of lexemes to records
 *
 * @param      Lexemes  The lexemes
 *
 * @return     A list of records
 */
fun {Tokenize Lexemes}
  Operators = ["+" "-" "*" "/"]         % Values lexeme might have to be an operator
  Commands = ["p" "d" "i" "^"]              % Values lexeme might have to be a command
in
  {Map Lexemes % check all elements with anonymus function
    fun {$ Lexeme}
      if {Member Operators Lexeme}  then % Check if lexeme is an operator
        operator(type: {String.toAtom Lexeme})
      
      elseif {Member Commands Lexeme} then
        command({String.toAtom Lexeme})

      elseif {Or {String.isFloat Lexeme} {String.isInt Lexeme}} then % Is a number
        number({String.toFloat Lexeme})
      
      else % not part of the language 
        raise "InvalidTokenException" end
      end
    end
  }
end

/**
 * @brief      Task 2.c solution. Interprets the input as functions on a stack
 *
 * @param      Tokens  The tokens
 * @param      Stack   The stack
 *
 * @return     A stack with only numbers or nothing
 */
fun {Interpret Tokens}
  fun {Iterate Stack Tokens}
    case Tokens of nil then
      Stack
    [] number(Number)|Rest then
      {Iterate Number|Stack Rest}
    [] operator(type:Operator)|Rest then
      A|B|NewStack = Stack in
      {Iterate {Operate Operator A B}|NewStack Rest}
    [] command(Command)|Rest then
        {Iterate {Do Command Stack} Rest}
    end
  end in
  {Iterate nil Tokens}
end

/**
 * @brief      Executes an operation given two arguments
 *
 * @param      Operator  The operator
 * @param      A         The first value
 * @param      B         The second value
 *
 * @return     The result of the operation
 */
fun {Operate Operator A B}
  if Operator == {String.toAtom "+"} then
    A + B
  elseif Operator == {String.toAtom "-"} then
    B - A
  elseif Operator == {String.toAtom "*"} then
    A * B
  elseif Operator == {String.toAtom "/"} then
    B / A
  end
end

/**
 * @brief      Task 2.d solution. Executes a command given the stack
 *
 * @param      Command  The command
 * @param      Stack    The stack
 *
 */
fun {Do Command Stack}
  if Command == {String.toAtom "p"} then
    {System.show {List.reverse Stack}}
    Stack

  elseif Command == {String.toAtom "d"} then % Task 2.e solution.
    Stack.1|Stack

  elseif Command == {String.toAtom "i"} then % Task 2.f solution.
    case Stack of H|T then
      ~H|T
    end

  elseif Command == {String.toAtom "^"} then % Task 2.g solution.
    case Stack of H|T then
      1.0/H|T
    end
  end
end