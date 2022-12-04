(open input01.txt | split row "\n\n" | str trim | each { |it| echo $it | lines | into int | math sum } | sort -r).0
