/**
 * @brief      Task 1.a solution. Counts the elements in the list.
 *
 * @param      List  The list
 *
 * @return     The number of elements in the list (excluding nil)
 */
fun {Length List}
  case List of _|T then
    1+{Length T}
  else
    0
  end
end

/**
 * @brief      Task 1.b solution. Makes a list of the first elements of given list.
 *
 * @param      List The list
 * @param      Count The number of elements to create the list from
 *             
 * @return     The created list.
 */
fun {Take List Count}
  if {And Count > 0 List \=nil}  then
    List.1|{Take List.2 Count-1}
  else
    nil
  end
end

/**
 * @brief      Task 1.c solution. Removes elements from given list.
 *
 * @param      List   The list
 * @param      Count  The number of elements to be removed
 *
 * @return     The new list after removals.
 */
fun {Drop List Count}
  if {And Count > 0 List \=nil}  then
    {Drop List.2 Count-1}
  else
    List
  end
end

/**
 * @brief      Task 1.d solution. Appends a list to the end of an other
 *
 * @param      ListBase       The list to append on
 * @param      ListExtention  The list to append with
 *
 * @return     List with ListBase followed by ListExtention
 */
fun {Append ListBase ListExtention}
  case ListBase of H|T then
    if {And H \=nil T == nil} then  % If at the end of the base list
      H|ListExtention               % preceed the extention with the base end
    else
      H|{Append T ListExtention}    % preceed the constructed list with current element 
    end
  end
end

/**
 * @brief      Task 1.e. Checks if element is part of list
 *
 * @param      List     The list
 * @param      Element  The element
 *
 * @return     True if element is present False if not
 */
fun {Member List Element}
  case List of H|T then
    if H == Element then
      true
    else
      {Member T Element}
    end
  else
    false
  end
end

/**
 * @brief      Task 1.f solution. Searches the given list for given element.
 *
 * @param      List     The list
 * @param      Element  The element
 *
 * @return     Index of first occurence of element (starting at index 1) or nil if not found
 */
fun {Position List Element}
  if List.1 == Element then % Found the element
    1 % Position of element in this List 
  else % Search the tail for the element
    if List.2 \= nil then % If there is somthing to search
      local RelativePosition = {Position List.2 Element} in % Position of element in tail
        if RelativePosition \=nil then  % Check that element was found
          1+RelativePosition  % Translate position from tail list to current list
        else
          nil % Did not find element in tail
        end
      end
    else
      nil % Tail is empty and can't contain element
    end
  end
end

/**
 * @brief      Converts the list to virtual string. Can be input to System.showInfo.
 *
 * @param      List  The list
 *
 * @return     Virtual string with each element seperated by space.
 */
fun {ListToVirtualString List}
  case List of H|T then
    H#" "#{ListToVirtualString T}
  else
    ""
  end
end