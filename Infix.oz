/**
 * @brief       Task 3.a solution. Transforms a list of tokens to infix
 *
 * @param      Tokens           The tokens
 * @param      ExpressionStack  The expression stack
 *
 * @return     Stack of virtual strings representing infix
 */
fun {InfixInternal Tokens ExpressionStack}
  case Tokens of nil then
    ExpressionStack
  [] number(Number)|Rest then
    {InfixInternal Rest Number|ExpressionStack}
  [] operator(type:Operator)|Rest then
    A|B|NewStack = ExpressionStack in
    {InfixInternal Rest {Enclose Operator A B}|NewStack}
  [] command(Command)|Rest then
    A|NewStack = ExpressionStack in
    {InfixInternal Rest {Enclose Command A nil}|NewStack}
  end
end


/**
 * @brief      Creates a virtual string surounded by "()" for infix notation
 *
 * @param      Operator  The operator
 * @param      A         Top of stack
 * @param      B         Second item on stack
 *
 * @return     Virtual string of infix notation
 */
fun {Enclose Operator A B}
  if Operator == plus then
    "("#B#"+"#A#")"
  elseif Operator == minus then
    "("#B#"-"#A#")"
  elseif Operator == multiply then
    "("#B#"*"#A#")"
  elseif Operator == devide then
    "("#B#"/"#A#")"
  elseif Operator == {String.toAtom "i"} then
    "(~"#A#")"
  elseif Operator == {String.toAtom "^"} then
    "("#1#"/"#A#")"
  else 
    raise "InvalidTokenException" end
  end
end

/**
 * @brief      Task 3.b solution. Wrapper for InfixInternal, calling it with new expression stack.
 *
 * @param      Tokens  The tokens
 *
 * @return     A stack of virtual strings
 */
fun {Infix Tokens}
  {InfixInternal Tokens nil}
end