functor
import 
  System
define
  \insert List.oz 
  \insert Tokenizer.oz
  \insert Infix.oz

  {System.showInfo "\nTask 1:"}
  {System.showInfo "Length    (1.a): "#{Length [0 1 2 3]}}
  {System.showInfo "Take      (1.b): "#{ListToVirtualString {Take [0 1 2 3] 2}}}
  {System.showInfo "Drop      (1.c): "#{ListToVirtualString {Drop [0 1 2 3] 2}}}
  {System.showInfo "Append    (1.d): "#{ListToVirtualString {Append [0 1 2 3] [1 2 3]}}}
  {System.showInfo "Member    (1.e): "# if {Member [0 1 2 3] 4} then "true" else "false" end}
  {System.showInfo "Position: (1.f): "#{Position [0 1 2 3] 3}}
  {System.showInfo "Convert:  "#{ListToVirtualString [0 1 2 3]}}
  {System.showInfo "----------------------------- \n"}
  
  {System.showInfo "\nTask 2:"}
  {System.showInfo "Lex       (2.a): "#{ListToVirtualString {Lex "1 2 + 3 *"}}}
  {System.printInfo"Tokenize  (2.b): "}{System.show {Tokenize {Lex "1 2 + 3 *"}}}
  {System.printInfo"Interpret (2.c): "}{System.show {List.reverse{Interpret {Tokenize {Lex "1 2 3 +"}}}}}
  {System.printInfo"Interpret (2.d): "}{System.show {List.reverse{Interpret {Tokenize {Lex "1 2 3 p +"}}}}}
  {System.printInfo"Interpret (2.e): "}{System.show {List.reverse{Interpret {Tokenize {Lex "1 2 3 p + d"}}}}}
  {System.printInfo"Interpret (2.f): "}{System.show {List.reverse{Interpret {Tokenize {Lex "3 i"}}}}}
  {System.printInfo"Interpret (2.g): "}{System.show {List.reverse{Interpret {Tokenize {Lex "3 ^"}}}}}
  {System.showInfo "----------------------------- \n"}

  {System.showInfo "\nTask 3:"}
  {System.printInfo"Tokenize  (3.a): "}{System.showInfo {InfixInternal {Tokenize {Lex "3.0 10.0 9.0 * - 0.3 +"}} nil}.1}
  {System.printInfo"Tokenize  (3.b): "}{System.showInfo {Infix {Tokenize {Lex "3.0 10.0 9.0 * - 0.3 +"}}}.1}
end