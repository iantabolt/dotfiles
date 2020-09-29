function rgsed
  set pattern $argv[1]
  set replace $argv[2]
  rg --context 2 $pattern --replace $replace $argv[3..99]
  read -l -P 'Do you want to continue? [y/N] ' confirm
  switch $confirm
    case Y y
      for rgout in (rg -n $pattern --replace $replace $argv[3..99])
        # echo "Rgout: $rgout"
        set matches (echo $rgout | string match -r '(.*?):(\d+):(.*)')
        # echo "Matches: $matches" 
        set replacement (string escape -n $matches[4])
        set cmd $matches[3]"s~.*~"$replacement"~"
        sed -i '' $cmd $matches[2]
      end
      return 0
    case '' N n
      return 1
  end
end
