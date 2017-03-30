function stubhub
    set params (echo $argv | sed "s/&/' --data-urlencode '/g")
    set cmd "curl -vLi -G -H 'Authorization: Bearer OE_Ah_QFXfwwavWUB740cbeGcRUa' -H 'Accept: application/json' 'https://api.stubhub.com/search/catalog/events/v3' --data-urlencode '"$params"'";
    echo $cmd
    eval $cmd > o0; and open -a Vivaldi o0
end
