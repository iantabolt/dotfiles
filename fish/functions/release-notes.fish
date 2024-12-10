# Usage: notes site-api live 3.205.39-rc
function notes
  set service $argv[1]
  set from_tag $service/$argv[2]
  set to_tag $service/$argv[3]

  git fetch --tags origin --force -q
  set commits (git log --format=format:%H $from_tag..$to_tag)
  set start_date (git log -1 --date=format:%Y-%m-%d --format=%cd $from_tag)
  set service_prs (gh pr list --limit 1000 --label @service/$service --state 'merged' --search 'merged:>'$start_date \
                    --json mergeCommit,labels,title,author,number,mergedAt)

  for commit in $commits
    set pr (echo $service_prs | jq '.[] | select(.mergeCommit.oid == "'$commit'")')
    if test -n "$pr"
      set pr_number (echo $pr | jq -r '.number')
      set author (echo $pr | jq -r '.author | .name // .login')
      set login (echo $pr | jq -r '.author.login')
      set title (echo $pr | jq -r '.title')
      set slack (jq -r '.[] | select(.github == "'$login'") | "@\(.email)"' '.github/scripts/python/release/metropolis-engineers.json')
      set slack (string replace '@metropolis.io' '' $slack)
      echo "$slack *$author*: $title"
    end
  end
end
