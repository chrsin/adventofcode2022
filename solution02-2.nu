def rps_calculate [] {
  let pair = ($in | split column " " | rename i u)

  $pair | each { |it| rps_calculate_score $it.i $it.u } | math sum
}

def rps_calculate_score [i, u] {
  if $i == "A" {
    if $u == "X" {
    	0 + 3
    } else if $u == "Y" {
	3 + 1
    } else if $u == "Z" {
	6 + 2
    }
  } else if $i == "B" {
    if $u == "X" {
      0 + 1
    } else if $u == "Y" {
      3 + 2
    } else if $u == "Z" {
      6 + 3
    }
  } else if $i == "C" {
      if $u == "X" {
        0 + 2
      } else if $u == "Y" {
	3 + 3
      } else if $u == "Z" {
	6 + 1
      }
  }
}

open input02.txt --raw | lines | rps_calculate
