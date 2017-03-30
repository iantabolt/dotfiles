git fetch -p
for br in (git branch -vv | grep ': gone' | cut -f 3 -d' ')
  git branch -D $br
end
