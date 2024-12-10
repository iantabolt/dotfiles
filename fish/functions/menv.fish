function menv
  cp .env ~/Develop/.env.last
  cp ~/Develop/.env.$argv[1] .env
  echo "Switched to env "$argv[1]
  bat .env
end
