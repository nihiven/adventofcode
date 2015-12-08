; Advent of Code
; Day 7

alias _o return $mircdiradvent\7data.txt
alias _d return $mircdiradvent\7data_work.txt
alias _i return $iif($1 == $null, $false, $true)
alias _g return $gettok($2-,$1,32)
alias -l _rs return $floor($calc($1 / 2^$2))
alias -l _ls return $floor($calc($1 * 2^$2))

alias m7 {
  .remove $_d
  .copy $_o $_d
  unset %a.*
  var %c 1
  while (%c <= $lines($_d)) {
    var %d $read($_d, %c)
    var %t $numtok(%d, 32)

    if (%t == 3) {
      var %ev $_g(1,%d)
      var %in $iif((%ev isalpha), $eval($+(%,a.,%ev),2), %ev) 
      var %to $_g(3,%d)

      if ($_i(%in)) {
        set $+(%,a.,%to) %in
        write $+(-dl,%c) $_d
        %c = 1
        continue
      }
    }
    elseif (%t == 4) {
      var %v $gettok(%d,1,32)
      var %to $gettok(%d,4,32)
      var %ev $gettok(%d,2,32)
      var %in $iif((%ev isalpha), $eval($+(%,a.,%ev),2), %ev) 

      if ($_i(%in)) {
        if (%v == NOT) {
          set $+(%,a.,%to) $not(%in)
          write $+(-dl,%c) $_d | %c = 1 | continue
        } 
      }
    }
    elseif (%t == 5) {
      var %ev1 $_g(1,%d)
      var %in1 $iif((%ev1 isalpha), $eval($+(%,a.,%ev1),2), %ev1)
      var %ev2 $_g(3,%d)
      var %in2 $iif((%ev2 isalpha), $eval($+(%,a.,%ev2),2), %ev2)
      var %v $_g(2,%d)
      var %to $_g(5,%d)

      if ($_i(%in1) && $_i(%in2)) {
        if (%v == AND) {
          set $+(%,a.,%to) $and(%in1, %in2)
          write $+(-dl,%c) $_d | %c = 1 | continue
        } 
        elseif (%v == OR)  {
          set $+(%,a.,%to) $or(%in1, %in2)
          write $+(-dl,%c) $_d | %c = 1 | continue
        }
        elseif (%v == LSHIFT) {
          set $+(%,a.,%to) $_ls(%in1, %in2)
          write $+(-dl,%c) $_d | %c = 1 continue
        }
        elseif (%v == RSHIFT) {
          set $+(%,a.,%to) $_rs(%in1, %in2)
          write $+(-dl,%c) $_d | %c = 1 | continue
        }
      }
    }

    inc %c
  }

  echo Answer: a = %a.a
}
