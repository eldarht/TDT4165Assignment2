functor
import 
  System
define
  \insert List.oz 
  \insert Tokenizer.oz


  {System.showInfo "Length:   "#{Length [0 1 2 3]}}
  {System.showInfo "Take:     "#{ListToVirtualString {Take [0 1 2 3] 2}}}
  {System.showInfo "Drop:     "#{ListToVirtualString {Drop [0 1 2 3] 2}}}
  {System.showInfo "Append:   "#{ListToVirtualString {Append [0 1 2 3] [1 2 3]}}}
  {System.show {Member [0 1 2 3] 4}}
  {System.showInfo "Position: "#{Position [0 1 2 3] 3}}
  {System.showInfo "Convert:  "#{ListToVirtualString [0 1 2 3]}}
  {System.showInfo "Lex:      "#{ListToVirtualString {Lex "1 2 3 + -d"}}}
  {System.showInfo "Lex:      "#{Length {Lex "1 2 3 + -d"}}}
  {System.show {Tokenize {Lex "1 2 3 + /"}}}
  {System.show {Interpret {Tokenize {Lex "1 2 3 + /"}}}}
  {System.show {Interpret {Tokenize {Lex "1 2 3 p +"}}}}
  {System.show {Interpret {Tokenize {Lex "1 2 3 + d"}}}}
  {System.show {Interpret {Tokenize {Lex "1 1 2 3 + i"}}}}
  {System.show {Interpret {Tokenize {Lex "1 2 3 + ^"}}}}
end