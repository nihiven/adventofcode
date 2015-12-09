; Advent of Code - Day 7

alias -l _d return $mircdiradvent\7data_work.txt
alias -l _i return $iif($1 == $null, $false, $true)
alias -l rshift return $floor($calc($1 / 2^$2))
alias -l lshift return $floor($calc($1 * 2^$2))
alias -l _f return $chr(36) $+ $1 $+ ( $+ $2 $+ , $+ $3 $+ )
alias -l _r return $iif(($1 isalpha), $eval($+(%,a.,$1),2), $1)

alias m7 {
  unset %a.*
  var %c 1

  while (%c <= $lines($_d)) {
    tokenize 32 $read($_d, %c)

    if ($0 == 3) {
      var %in $_r($1)

      if ($_i(%in)) {
        set $+(%,a.,$3) %in
        write $+(-dl,%c) $_d | %c = 0
      }
    }
    elseif ($0 == 4) {
      var %in $_r($2)

      if ($_i(%in) && $1 == NOT) {
        set $+(%,a.,$4) $not(%in)
        write $+(-dl,%c) $_d | %c = 0
      }
    }
    elseif ($0 == 5) {
      var %v AND OR LSHIFT RSHIFT, %in1 $_r($1), %in2 $_r($3)

      if ($_i(%in1) && $_i(%in2) && $2 isin %v) {
        set $+(%,a.,$5) $eval($_f($2,%in1,%in2),2)
        write $+(-dl,%c) $_d
        %c = 0
      }
    }
    inc %c
  }
}
