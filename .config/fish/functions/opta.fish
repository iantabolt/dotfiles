function opta
  set dir $argv[1]
  set headers (grep 'x-meta-\(game-id\|feed-type\)' $dir/headers | sed 's/^/ -H \'/' | sed 's/$/\'/')
  if test (count $argv) -gt 1 
	  set host $arv[2]
  else
	  set host 'localhost:8080' 
  end
  set cmd "curl $headers --data-binary @$dir/body $host/opta"
  echo $cmd
  eval $cmd
end

