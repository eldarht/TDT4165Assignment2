functor
import 
  System
define
  \insert List.oz


  {System.showInfo "Length:   "#{Length [0 1 2 3]}}
  {System.showInfo "Take:     "#{ListToVirtualString {Take [0 1 2 3] 2}}}
  {System.showInfo "Drop:     "#{ListToVirtualString {Drop [0 1 2 3] 2}}}
  {System.showInfo "Append:   "#{ListToVirtualString {Append [0 1 2 3] [1 2 3]}}}
  %{System.showInfo {Member [0 1 2 3] 4}}
  {System.showInfo "Position: "#{Position [0 1 2 3] 3}}
  {System.showInfo "Convert:  "#{ListToVirtualString [0 1 2 3]}}
end