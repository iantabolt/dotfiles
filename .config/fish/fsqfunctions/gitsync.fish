function gitsync
  rsync --progress --relative (git diff --name-only HEAD) dev-iantabolt:foursquare.web
end

